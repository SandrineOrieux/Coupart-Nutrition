<?php

namespace App\Entity;

use App\Repository\DietRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: DietRepository::class)]
class Diet
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $description = null;

    #[ORM\ManyToMany(targetEntity: User::class, inversedBy: 'diets')]
    private Collection $userDiet;

    #[ORM\OneToMany(mappedBy: 'diet', targetEntity: CategoryOfFoodDiet::class)]
    private Collection $categoryOfFood;


    public function __construct()
    {
        $this->userDiet = new ArrayCollection();
        $this->categoryOfFood = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): static
    {
        $this->description = $description;

        return $this;
    }

    /**
     * @return Collection<int, User>
     */
    public function getUserDiet(): Collection
    {
        return $this->userDiet;
    }

    public function addUserDiet(User $userDiet): static
    {
        if (!$this->userDiet->contains($userDiet)) {
            $this->userDiet->add($userDiet);
        }

        return $this;
    }

    public function removeUserDiet(User $userDiet): static
    {
        $this->userDiet->removeElement($userDiet);

        return $this;
    }

    /**
     * @return Collection<int, CategoryOfFoodDiet>
     */
    public function getCategoryOfFood(): Collection
    {
        return $this->categoryOfFood;
    }

    public function addCategoryOfFood(CategoryOfFoodDiet $categoryOfFood): static
    {
        if (!$this->categoryOfFood->contains($categoryOfFood)) {
            $this->categoryOfFood->add($categoryOfFood);
            $categoryOfFood->setDiet($this);
        }

        return $this;
    }

    public function removeCategoryOfFood(CategoryOfFoodDiet $categoryOfFood): static
    {
        if ($this->categoryOfFood->removeElement($categoryOfFood)) {
            // set the owning side to null (unless already changed)
            if ($categoryOfFood->getDiet() === $this) {
                $categoryOfFood->setDiet(null);
            }
        }

        return $this;
    }
}
