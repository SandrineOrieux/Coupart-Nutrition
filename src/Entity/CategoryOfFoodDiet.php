<?php

namespace App\Entity;

use App\Repository\CategoryOfFoodDietRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CategoryOfFoodDietRepository::class)]
class CategoryOfFoodDiet
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column]
    private ?bool $isAuthorized = null;

    #[ORM\Column(nullable: true)]
    private ?bool $isRestricted = null;


    #[ORM\ManyToOne(inversedBy: 'CategoryOfFoodDiet')]
    private ?CategoryOfFood $categoryOfFood = null;

    #[ORM\ManyToOne(inversedBy: 'categoryOfFood')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Diet $diet = null;

    public function __construct()
    {
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function isIsAuthorized(): ?bool
    {
        return $this->isAuthorized;
    }

    public function setIsAuthorized(bool $isAuthorized): static
    {
        $this->isAuthorized = $isAuthorized;

        return $this;
    }

    public function isIsRestricted(): ?bool
    {
        return $this->isRestricted;
    }

    public function setIsRestricted(?bool $isRestricted): static
    {
        $this->isRestricted = $isRestricted;

        return $this;
    }



    public function getCategoryOfFood(): ?CategoryOfFood
    {
        return $this->categoryOfFood;
    }

    public function setCategoryOfFood(?CategoryOfFood $categoryOfFood): static
    {
        $this->categoryOfFood = $categoryOfFood;

        return $this;
    }

    public function getDiet(): ?Diet
    {
        return $this->diet;
    }

    public function setDiet(?Diet $diet): static
    {
        $this->diet = $diet;

        return $this;
    }
}
