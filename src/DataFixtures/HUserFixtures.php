<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Faker;

class HUserFixtures extends Fixture
{
  private $encoder;

  public function __construct(UserPasswordHasherInterface $encoder)
  {
    $this->encoder = $encoder;
  }
  public function load(ObjectManager $manager): void
  {
    $faker = Faker\Factory::create('fr_FR');

    for ($nbUsers = 1; $nbUsers <= 15; $nbUsers++) {
      
      $user = new User();
      if ($nbUsers === 1) {
        $user->setEmail('sandrine.coupart@coupart-nutrition.com');
        $user->setPassword($this->encoder->hashPassword($user, 'azerty'));
        $user->setFirstname('Sandrine');
        $user->setLastname('Coupart');
        $user->setRoles(['ROLE_ADMIN']);
        $user->setBirthday(new \DateTimeImmutable(($faker->date())));
      } else {
        $user->setEmail($faker->email);
        $user->setPassword($this->encoder->hashPassword($user, 'azerty'));
        $user->setFirstname($faker->firstName);
        $user->setLastname($faker->lastName);
        $user->setRoles(['ROLE_USER']);
        $user->setBirthday(new \DateTimeImmutable(($faker->date())));
        for ($i = 1; $i <= $faker->numberBetween(1, 10); $i++) {
          $diet = $this->getReference('diet_' . $faker->numberBetween(1, 30));
          $user->addDiet($diet);
        }
        if($nbUsers%2 == 1){
          for ($i = 1; $i <= $faker->numberBetween(1, 11); $i++) {
            $allergen = $this->getReference('allergen_' . $faker->numberBetween(0,11));
            $user->addAllergen($allergen);
          }
        }
        

      }
      //add reference 
      $this->addReference('user_' . $nbUsers, $user);

      $manager->persist($user);
    }
    $manager->flush();
  }
  public function getDependencies()
  {
    return [
      FeatureRecipeFixtures::class
    ];
  }
}