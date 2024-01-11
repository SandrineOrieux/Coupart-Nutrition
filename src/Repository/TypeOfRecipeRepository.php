<?php

namespace App\Repository;

use App\Entity\TypeOfRecipe;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<TypeOfRecipe>
 *
 * @method TypeOfRecipe|null find($id, $lockMode = null, $lockVersion = null)
 * @method TypeOfRecipe|null findOneBy(array $criteria, array $orderBy = null)
 * @method TypeOfRecipe[]    findAll()
 * @method TypeOfRecipe[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TypeOfRecipeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TypeOfRecipe::class);
    }

//    /**
//     * @return TypeOfRecipe[] Returns an array of TypeOfRecipe objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('t')
//            ->andWhere('t.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('t.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?TypeOfRecipe
//    {
//        return $this->createQueryBuilder('t')
//            ->andWhere('t.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
