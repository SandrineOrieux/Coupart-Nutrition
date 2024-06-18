<?php

namespace App\DataFixtures;

use App\Entity\Review;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker;

class ReviewFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $faker = Faker\Factory::create('fr_FR');
       

        for($i = 1; $i < 90; $i++){
             //reference
            $user = $this->getReference('user_' . $faker->numberBetween(2, 15));
            $recipe = $this->getReference('recipe_' . $faker->numberBetween(1, 30));
            $review = new Review();
            $review->setComment($faker->sentence($faker->numberBetween(3,10)));
            $review->setRate($faker->numberBetween(1,5));
            $review->setIsValidated($faker->numberBetween(0,1));
            $review->setRecipe($recipe);
            $review->setUser($user);
            $manager->persist($review);
        }
        

        $manager->flush();
    }
    public function getDependencies()
  {
    return [
      AppUserFixtures::class,
      RecipeFixtures::class
    ];
  }
    
}
