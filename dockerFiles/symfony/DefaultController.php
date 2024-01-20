<?php
// src/Controller/DefaultController.php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;

class DefaultController extends AbstractController
{
    #[Route('/', name: 'default_index')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $con = $entityManager->getConnection();
        $sql = 'SELECT * FROM article';
        $stmt = $con->prepare($sql);
        $result = $stmt->executeQuery();

        return $this->render('default/index.html.twig', [
            'articles' => $result->fetchAllAssociative(),
        ]);
    }
}
