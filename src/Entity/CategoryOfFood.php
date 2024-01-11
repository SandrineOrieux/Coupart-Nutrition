<?php

namespace App\Entity;

use App\Repository\CategoryOfFoodRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CategoryOfFoodRepository::class)]
class CategoryOfFood
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\OneToMany(mappedBy: 'categoryOfFood', targetEntity: CategoryOfFoodDiet::class)]
    private Collection $CategoryOfFoodDiet;

    #[ORM\OneToMany(mappedBy: 'category', targetEntity: Ingredient::class)]
    private Collection $ingredients;

    public function __construct()
    {
        $this->CategoryOfFoodDiet = new ArrayCollection();
        $this->ingredients = new ArrayCollection();
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

    /**
     * @return Collection<int, CategoryOfFoodDiet>
     */
    public function getCategoryOfFoodDiet(): Collection
    {
        return $this->CategoryOfFoodDiet;
    }

    public function addCategoryOfFoodDiet(CategoryOfFoodDiet $categoryOfFoodDiet): static
    {
        if (!$this->CategoryOfFoodDiet->contains($categoryOfFoodDiet)) {
            $this->CategoryOfFoodDiet->add($categoryOfFoodDiet);
            $categoryOfFoodDiet->setCategoryOfFood($this);
        }

        return $this;
    }

    public function removeCategoryOfFoodDiet(CategoryOfFoodDiet $categoryOfFoodDiet): static
    {
        if ($this->CategoryOfFoodDiet->removeElement($categoryOfFoodDiet)) {
            // set the owning side to null (unless already changed)
            if ($categoryOfFoodDiet->getCategoryOfFood() === $this) {
                $categoryOfFoodDiet->setCategoryOfFood(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Ingredient>
     */
    public function getIngredients(): Collection
    {
        return $this->ingredients;
    }

    public function addIngredient(Ingredient $ingredient): static
    {
        if (!$this->ingredients->contains($ingredient)) {
            $this->ingredients->add($ingredient);
            $ingredient->setCategory($this);
        }

        return $this;
    }

    public function removeIngredient(Ingredient $ingredient): static
    {
        if ($this->ingredients->removeElement($ingredient)) {
            // set the owning side to null (unless already changed)
            if ($ingredient->getCategory() === $this) {
                $ingredient->setCategory(null);
            }
        }

        return $this;
    }
}
