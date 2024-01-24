<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PageController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(Security $security): Response
    {
        $user = $security->getUser();

        return $this->render('page/index.html.twig', [
            'user' => $user
        ]);
    }
    #[Route('/contact', name: 'app_contact')]
    public function contact(Security $security): Response
    {
        $user = $security->getUser();
        return $this->render('page/contact.html.twig', [
            'user' => $user
        ]);
    }
    #[Route('/mentions-legales', name: 'app_legal')]
    public function legal(Security $security): Response
    {
        $user = $security->getUser();
        return $this->render('page/legal.html.twig', [
            'user' => $user
        ]);
    }
    #[Route('/politique-de-confidentialite', name: 'app_privacy')]
    public function privacy(Security $security): Response
    {
        $user = $security->getUser();
        return $this->render('page/privacy.html.twig', [
            'user' => $user
        ]);
    }
}
