<?php

namespace App\Repository;

use App\Entity\CategoryOfFoodDiet;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<CategoryOfFoodDiet>
 *
 * @method CategoryOfFoodDiet|null find($id, $lockMode = null, $lockVersion = null)
 * @method CategoryOfFoodDiet|null findOneBy(array $criteria, array $orderBy = null)
 * @method CategoryOfFoodDiet[]    findAll()
 * @method CategoryOfFoodDiet[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CategoryOfFoodDietRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, CategoryOfFoodDiet::class);
    }

//    /**
//     * @return CategoryOfFoodDiet[] Returns an array of CategoryOfFoodDiet objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('c.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?CategoryOfFoodDiet
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
