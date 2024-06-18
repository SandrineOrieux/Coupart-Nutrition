<?php

namespace App\DataFixtures;

use App\Entity\Recipe;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker;
class RecipeFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
      $faker = Faker\Factory::create('fr_FR');
      for ($nbRecipe = 1; $nbRecipe <= 30; $nbRecipe++){
        $recipe = new Recipe();
        //references
        $type = $this->getReference('Type_' . $faker->numberBetween(0, 4));


        //add properties
        $recipe->setTypeOfRecipe($type);
        $recipe->setTitle($faker->sentence($faker->numberBetween(3, 10)));
        $recipe->setDecription($faker->paragraph($faker->numberBetween(2, 4)));
        $recipe->setCookingTime($faker->numberBetween(0, 60));
        $recipe->setRestingTime($faker->numberBetween(0, 60));
        $recipe->setPreparationTime($faker->numberBetween(10, 120));
        $recipe->setSteps($faker->paragraphs($faker->numberBetween(3, 12), true));
        $recipe->setIsPublic($faker->numberBetween(0, 1));


        //add collection
        for ($i = 1; $i <= $faker->numberBetween(3, 15); $i++) {
          $ingredient = $this->getReference('ingredient_' . $faker->numberBetween(1, 50));
          $recipe->addIngredient($ingredient);
        }
        
        for ($i = 1; $i <= $faker->numberBetween(3, 30); $i++) {
          $diet = $this->getReference('diet_' . $faker->numberBetween(1, 30));
          $recipe->addDiet($diet);
        }
        $this->addReference('recipe_' . $nbRecipe, $recipe);
        $manager->persist($recipe);
      }

        $manager->flush();
    }
    public function getDependencies()
  {
    return [
      HUserFixtures::class,
      FeatureRecipeFixtures::class
    ];
  }
    
}
