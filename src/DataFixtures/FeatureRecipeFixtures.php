<?php

namespace App\DataFixtures;

use App\Entity\Allergen;
use App\Entity\Diet;
use App\Entity\Ingredient;
use App\Entity\Quantity;
use App\Entity\TypeOfRecipe;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker;


class FeatureRecipeFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $faker = Faker\Factory::create('fr_FR');

        //type of recipe
        $typeOfRecipes = ['plat','dessert','boisson','petit-déjeuner','entrée'];
        foreach ($typeOfRecipes as $key => $typeOfRecipe ){
            $newTypeOfRecipe = new TypeOfRecipe();
            $newTypeOfRecipe->setName($typeOfRecipe);
            $this->addReference('Type_'.$key, $newTypeOfRecipe);
            $manager->persist($newTypeOfRecipe);
        };

        //allergen
        $allergens = ['Gluten','Oeuf','Poisson','Lactose','Fruit à coque','Anhydride sulfureux et sulfites', 'Arachide', 'Crustacé', 'Soja','Céleri', 'Moutarde','Graines de sésame'];
        foreach ($allergens as $key =>$allergen){
            $newAllergen = new Allergen();
            $newAllergen->setName($allergen);
            $this->addReference('allergen_'.$key, $newAllergen);
            $manager->persist($newAllergen);
        };

        //diet
        for($i = 1; $i <= 30; $i++){
            $diet = new Diet();
            $diet->setName($faker->sentence($faker->numberBetween(2, 5)));
            $diet->setDescription($faker->paragraph($faker->numberBetween(3, 5)));
            $this->addReference('diet_'.$i, $diet);
            $manager->persist($diet);
        };

        //quantity
        $quantities = [1,2,3,4,5,200,300,400,500,10,20,30,40,50];
        foreach($quantities as $key => $quantity){
            $newQuantity = new Quantity();
            $newQuantity->setNumber($quantity);
            if ($key < 5){
                $newQuantity->setUnity(null);
            } elseif ($key < 9){
                $newQuantity->setUnity('g');
            }else{
                $newQuantity->setUnity('cl');
            };
            $this->addReference('quantity_'.$key, $newQuantity);
            $manager->persist($newQuantity);
        };
        
        //ingredient
        for($i = 1; $i<= 50; $i++){
            $quantity = $this->getReference('quantity_' . $faker->numberBetween(0, 13));
            $allergen = $this->getReference('allergen_' . $faker->numberBetween(0,11));

            $ingredient = new Ingredient();
            $ingredient->setName($faker->word());
            $ingredient->setQuantity($quantity);
            
            $this->addReference('ingredient_'.$i, $ingredient);
            $manager->persist($ingredient);
            if ($i%2 == 1){
                $ingredient->setAllergen($allergen);
            };
        }

        $manager->flush();
    }
    
}
