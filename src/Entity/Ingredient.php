<?php

namespace App\Entity;

use App\Repository\IngredientRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: IngredientRepository::class)]
class Ingredient
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\ManyToOne]
    private ?quantity $quantity = null;

    #[ORM\ManyToOne(inversedBy: 'ingredients')]
    private ?Allergen $allergen = null;

    #[ORM\ManyToMany(targetEntity: recipe::class, inversedBy: 'ingredients')]
    private Collection $recipes;

    public function __construct()
    {
        $this->recipes = new ArrayCollection();
    }
    public function __toString()
    {
        $IsAllergen = null;
        if ($this->allergen) {
            $IsAllergen =  " !attention allegène : " . $this->getAllergen();
        }

        return $this->getQuantity() . " " . $this->getName() . $IsAllergen;
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

    public function getQuantity(): ?quantity
    {
        return $this->quantity;
    }

    public function setQuantity(?quantity $quantity): static
    {
        $this->quantity = $quantity;

        return $this;
    }

    public function getAllergen(): ?Allergen
    {
        return $this->allergen;
    }

    public function setAllergen(?Allergen $allergen): static
    {
        $this->allergen = $allergen;

        return $this;
    }

    /**
     * @return Collection<int, recipe>
     */
    public function getRecipes(): Collection
    {
        return $this->recipes;
    }

    public function addRecipe(recipe $recipe): static
    {
        if (!$this->recipes->contains($recipe)) {
            $this->recipes->add($recipe);
        }

        return $this;
    }

    public function removeRecipe(recipe $recipe): static
    {
        $this->recipes->removeElement($recipe);

        return $this;
    }
}
