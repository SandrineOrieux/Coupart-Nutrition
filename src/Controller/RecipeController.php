<?php

namespace App\Controller;

use App\Entity\Recipe;
use App\Entity\User;
use App\Repository\DietRepository;
use App\Repository\RecipeRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class RecipeController extends AbstractController
{
    #[Route('/recipe', name: 'app_recipe')]
    public function index(RecipeRepository $recipeRepository, Security $security, UserRepository $userRepository): Response
    {
        $user = $security->getUser();


        if ($user) {

            $recipes = $recipeRepository->findRecipesByUserDietsAndAllergens($user);
            return $this->render('recipe/index.html.twig', [
                'recipes' => $recipes,
            ]);
        } else {
            $recipes = $recipeRepository->findRecipesPublic();

            return $this->render('recipe/index.html.twig', [
                'recipes' => $recipes,
            ]);
        }
    }

    #[Route('/recipe/{id}', name: 'app_recipe_show')]
    public function show($id, RecipeRepository $recipeRepository): Response
    {
        $recipe = $recipeRepository->findOneBy(['id' => $id]);
        return $this->render('recipe/showRecipe.html.twig', [
            'recipe' => $recipe,
        ]);
    }
}
