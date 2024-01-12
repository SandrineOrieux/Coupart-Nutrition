<?php

namespace App\Controller\Admin;

use App\Entity\Recipe;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use Vich\UploaderBundle\Form\Type\VichImageType;

class RecipeCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Recipe::class;
    }


    public function configureFields(string $pageName): iterable
    {
        $mappingsParams = $this->getParameter('vich_uploader.mappings');
        $recipeImagePath = $mappingsParams['caron']['uri_prefix'];

        yield TextField::new('title', 'Titre de la recette');

        //image's view form
        yield TextareaField::new('imageFile')
            ->setFormType(VichImageType::class)
            ->hideOnIndex();
        //image's view list
        yield ImageField::new('imageName')
            ->setBasePath($recipeImagePath)
            ->hideOnForm();

        yield TextEditorField::new('decription', 'Description')->hideOnIndex();
        yield IntegerField::new('preparationTime', 'Temps de préparation en min')->hideOnIndex();
        yield IntegerField::new('restingTime', 'Temps de repos en min')->hideOnIndex();
        yield IntegerField::new('cookingTime', 'Temps de cuisson en min')->hideOnIndex();
        yield AssociationField::new('ingredients', 'Ingrédients')->setFormTypeOptionIfNotSet('by_reference', false)->hideOnIndex();
        yield AssociationField::new('TypeOfRecipe', 'Type de recette')->hideOnIndex();
        yield AssociationField::new('diets', 'Régimes alimentaires compatibles')->hideOnIndex();
        yield TextEditorField::new('steps', 'Les étapes')->hideOnIndex();
        yield BooleanField::new('isPublic', 'Rendre visible aux visiteurs')->hideOnIndex();
    }
}
