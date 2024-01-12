<?php

namespace App\Controller\Admin;

use App\Entity\Allergen;
use App\Entity\Diet;
use App\Entity\Ingredient;
use App\Entity\Quantity;
use App\Entity\Recipe;
use App\Entity\Review;
use App\Entity\TypeOfRecipe;
use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        //return parent::index();

        // Option 1. You can make your dashboard redirect to some common page of your backend
        //
        // $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);
        // return $this->redirect($adminUrlGenerator->setController(OneOfYourCrudController::class)->generateUrl());

        // Option 2. You can make your dashboard redirect to different pages depending on the user
        //
        // if ('jane' === $this->getUser()->getUsername()) {
        //     return $this->redirect('...');
        // }

        // Option 3. You can render some custom template to display a proper dashboard with widgets, etc.
        // (tip: it's easier if your template extends from @EasyAdmin/page/content.html.twig)
        //
        return $this->render('admin/dashboard.html.twig');
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Eval 4 Coupart');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToDashboard('Dashboard', 'fa fa-home');
        yield MenuItem::linkToCrud('Patients', 'fa-solid fa-hospital-user', User::class);
        yield MenuItem::linkToCrud('Commentaires', 'fa-solid fa-comment', Review::class);
        yield MenuItem::linkToCrud('Recettes', 'fa-solid fa-plate-wheat', Recipe::class);
        yield MenuItem::linkToCrud('Régimes alimentaires', 'fa-solid fa-weight-scale', Diet::class);
        yield MenuItem::linkToCrud('Types de recettes', 'fa-solid fa-utensils', TypeOfRecipe::class);
        yield MenuItem::linkToCrud('Ingrédients', 'fa-solid fa-carrot', Ingredient::class);
        yield MenuItem::linkToCrud('Allergènes', 'fa-solid fa-shrimp', Allergen::class);
        yield MenuItem::linkToCrud('Quantités', 'fa-solid fa-scale-balanced', Quantity::class);
    }
}
