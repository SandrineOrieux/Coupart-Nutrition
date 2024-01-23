<?php

namespace App\Controller;

use App\Entity\Recipe;
use App\Entity\Review;
use App\Form\ReviewRecipeType;
use App\Repository\UserRepository;
use App\Repository\RecipeRepository;
use App\Repository\ReviewRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\Request;
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
    public function show($id, RecipeRepository $recipeRepository, ReviewRepository $reviewRepository, Request $request, EntityManagerInterface $entityManagerInterface, Security $security): Response
    {

        $user = $security->getUser();

        $recipe = $recipeRepository->findOneBy(['id' => $id]);

        $reviewUser = $reviewRepository->findOneBy(['recipe' => $recipe, 'user' => $user]);
        $reviewRecipeValidated = $reviewRepository->findBy(['recipe' => $recipe, 'isValidated' => true]);
        if (!$reviewUser) {
            $review = new Review();
            $review->setRecipe($recipe);
            $review->setUser($user);
            $review->setIsValidated(False);
        }

        $averageRate = ROUND($reviewRepository->getAverageRaterecipeId($recipe->getId()), 2);

        $form = $this->createForm(ReviewRecipeType::class, $reviewUser);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManagerInterface->persist($review);
            $entityManagerInterface->flush();
        }

        return $this->render('recipe/showRecipe.html.twig', [
            'recipe' => $recipe,
            'form' => $form,
            'user' => $user,
            'averageRate' => $averageRate,
            'reviewsValidated' => $reviewRecipeValidated
        ]);
    }
    #[Route('/recipe/{id}/averageRate', name: 'app_recipe_review')]
    public function getAverage(ReviewRepository $reviewRepository, Recipe $recipe)
    {
        $averageRate = ROUND($reviewRepository->getAverageRaterecipeId($recipe->getId()), 2);

        return $this->json(['average' => $averageRate], 200);
    }
}
