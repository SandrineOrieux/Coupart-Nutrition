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


    public function findRecipesByUserDietsAndAllergens($user)
    {
        

        $requete1 = $this->createQueryBuilder('r')
        ->select('r.id')
        ->innerJoin('r.ingredients', 'i')
        ->innerJoin('i.allergen', 'a2')
        ->andwhere( 'a2.id = :userAllergens')
        ->setParameter('userAllergens', $user->getAllergens())
        ->getQuery()
        ->getResult();

        $requete2 = $this->createQueryBuilder('r')
        ->innerJoin('r.diets', 'd')
        ->innerJoin('d.users', 'u')
        ->andwhere('u.id = :userId')
        ->setParameter('userId', $user)
        ->getQuery()->getResult();

        $queryBuilder = $this->createQueryBuilder('r')
        ->where('r.id IN (:requete2)')
        ->andwhere('r.id NOT IN (:requete1)')
        
        ->setParameters(array('requete1'=> $requete1, 'requete2'=> $requete2));
        

        return $queryBuilder->getQuery()->getResult();

    }

    public function findRecipesWithoutUserAllergens($user)
    {
        $requete1 = $this->createQueryBuilder('r')
        ->select('r.id')
        ->innerJoin('r.ingredients', 'i')
        ->innerJoin('i.allergen', 'a2')
        ->where( 'a2.id = :userAllergens')
        ->setParameter('userAllergens', $user->getAllergens())
        ->getQuery()
        ->getResult();

        $queryBuilder = $this->createQueryBuilder('r')
        ->where('r.id NOT IN (:requete1)')
        ->setParameter('requete1', $requete1);
        

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
