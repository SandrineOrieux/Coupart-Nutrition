<?php

namespace App\Repository;

use App\Entity\Diet;
use App\Entity\Recipe;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Recipe>
 *
 * @method Recipe|null find($id, $lockMode = null, $lockVersion = null)
 * @method Recipe|null findOneBy(array $criteria, array $orderBy = null)
 * @method Recipe[]    findAll()
 * @method Recipe[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class RecipeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Recipe::class);
    }

    //    /**
    //     * @return Recipe[] Returns an array of Recipe objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('r')
    //            ->andWhere('r.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('r.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    // public function findOneBySomeField($value): ?Recipe
    // {
    //     return $this->createQueryBuilder('r')
    //         ->andWhere('r.exampleField = :val')
    //         ->setParameter('val', $value)
    //         ->getQuery()
    //         ->getOneOrNullResult();
    // }
    public function findRecipesPublic()
    {
        return $this->createQueryBuilder('r')
            ->where('r.isPublic = 1')
            ->getQuery()
            ->getResult();
    }


    // public function findRecipesByUserDietsAndAllergens($user)
    // {
    //     $queryBuilder = $this->createQueryBuilder('r')
    //         ->innerJoin('r.diets', 'd')
    //         ->innerJoin('d.users', 'u1')
    //         ->leftJoin('r.ingredients', 'i')
    //         ->leftJoin('i.allergen', 'a')
    //         ->leftJoin('a.users', 'u2')
    //         ->where('u1.id = :userId')
    //         ->where('u2.id = :userId')
    //         ->andWhere('a.id IS NULL OR a NOT IN (:userAllergens)')
    //         ->setParameter('userId', $user)
    //         ->setParameter('userAllergens', $user->getAllergens());

    //     return $queryBuilder->getQuery()->getResult();
    // }

    public function findRecipesWithoutUserAllergens($user)
    {
        $queryBuilder = $this->createQueryBuilder('r')
            ->innerJoin('r.ingredients', 'i')
            ->leftJoin('i.allergen', 'a')
            ->innerJoin('r.diets', 'd')
            ->innerJoin('d.users', 'u')
            ->where('u.id = :userId')
            ->andWhere('a.id != :userAllergens')
            ->setParameter('userId', $user)
            ->setParameter('userAllergens', $user->getAllergens());

        return $queryBuilder->getQuery()->getResult();
    }
    public function findRecipesByuserDiets($user)
    {
        $queryBuilder = $this->createQueryBuilder('r')
            ->innerJoin('r.diets', 'd')
            ->innerJoin('d.users', 'u')
            ->where('u.id = :userId')
            ->setParameter('userId', $user);

        return $queryBuilder->getQuery()->getResult();
    }

    public function findRecipesByType($typeOfRecipeId = null)
    {
        $queryBuilder = $this->createQueryBuilder('r')->leftJoin('r.TypeOfRecipe', 't');
        if ($typeOfRecipeId !== null) {
            $queryBuilder->where('t.id = :typeOfRecipeId')
                ->setParameter('typeOfRecipeId', $typeOfRecipeId);
        }
        return $queryBuilder->getQuery()->getResult();
    }
}
