<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240108155144 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE allergen (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE allergen_user (allergen_id INT NOT NULL, user_id INT NOT NULL, INDEX IDX_65D6B1CD6E775A4A (allergen_id), INDEX IDX_65D6B1CDA76ED395 (user_id), PRIMARY KEY(allergen_id, user_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE category_of_food (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE category_of_food_diet (id INT AUTO_INCREMENT NOT NULL, category_of_food_id INT DEFAULT NULL, is_authorized TINYINT(1) NOT NULL, is_restricted TINYINT(1) DEFAULT NULL, INDEX IDX_C5704E6561E5260B (category_of_food_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE ingredient (id INT AUTO_INCREMENT NOT NULL, category_id INT NOT NULL, allergen_id INT DEFAULT NULL, name VARCHAR(255) NOT NULL, INDEX IDX_6BAF787012469DE2 (category_id), INDEX IDX_6BAF78706E775A4A (allergen_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE recipe (id INT AUTO_INCREMENT NOT NULL, type_of_recipe_id INT NOT NULL, title VARCHAR(255) NOT NULL, description LONGTEXT DEFAULT NULL, preparation_time INT NOT NULL, resting_time INT DEFAULT NULL, cooking_time INT DEFAULT NULL, steps LONGTEXT NOT NULL, is_public TINYINT(1) NOT NULL, INDEX IDX_DA88B137E9FFB817 (type_of_recipe_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE review (id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, recipe_id INT NOT NULL, rate SMALLINT NOT NULL, comment LONGTEXT DEFAULT NULL, is_validated TINYINT(1) NOT NULL, INDEX IDX_794381C6A76ED395 (user_id), INDEX IDX_794381C659D8A214 (recipe_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE type_of_recipe (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE allergen_user ADD CONSTRAINT FK_65D6B1CD6E775A4A FOREIGN KEY (allergen_id) REFERENCES allergen (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE allergen_user ADD CONSTRAINT FK_65D6B1CDA76ED395 FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE category_of_food_diet ADD CONSTRAINT FK_C5704E6561E5260B FOREIGN KEY (category_of_food_id) REFERENCES category_of_food (id)');
        $this->addSql('ALTER TABLE ingredient ADD CONSTRAINT FK_6BAF787012469DE2 FOREIGN KEY (category_id) REFERENCES category_of_food (id)');
        $this->addSql('ALTER TABLE ingredient ADD CONSTRAINT FK_6BAF78706E775A4A FOREIGN KEY (allergen_id) REFERENCES allergen (id)');
        $this->addSql('ALTER TABLE recipe ADD CONSTRAINT FK_DA88B137E9FFB817 FOREIGN KEY (type_of_recipe_id) REFERENCES type_of_recipe (id)');
        $this->addSql('ALTER TABLE review ADD CONSTRAINT FK_794381C6A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        $this->addSql('ALTER TABLE review ADD CONSTRAINT FK_794381C659D8A214 FOREIGN KEY (recipe_id) REFERENCES recipe (id)');
        $this->addSql('ALTER TABLE diet ADD category_of_food_diet_id INT NOT NULL');
        $this->addSql('ALTER TABLE diet ADD CONSTRAINT FK_9DE4652016A2DF89 FOREIGN KEY (category_of_food_diet_id) REFERENCES category_of_food_diet (id)');
        $this->addSql('CREATE INDEX IDX_9DE4652016A2DF89 ON diet (category_of_food_diet_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE diet DROP FOREIGN KEY FK_9DE4652016A2DF89');
        $this->addSql('ALTER TABLE allergen_user DROP FOREIGN KEY FK_65D6B1CD6E775A4A');
        $this->addSql('ALTER TABLE allergen_user DROP FOREIGN KEY FK_65D6B1CDA76ED395');
        $this->addSql('ALTER TABLE category_of_food_diet DROP FOREIGN KEY FK_C5704E6561E5260B');
        $this->addSql('ALTER TABLE ingredient DROP FOREIGN KEY FK_6BAF787012469DE2');
        $this->addSql('ALTER TABLE ingredient DROP FOREIGN KEY FK_6BAF78706E775A4A');
        $this->addSql('ALTER TABLE recipe DROP FOREIGN KEY FK_DA88B137E9FFB817');
        $this->addSql('ALTER TABLE review DROP FOREIGN KEY FK_794381C6A76ED395');
        $this->addSql('ALTER TABLE review DROP FOREIGN KEY FK_794381C659D8A214');
        $this->addSql('DROP TABLE allergen');
        $this->addSql('DROP TABLE allergen_user');
        $this->addSql('DROP TABLE category_of_food');
        $this->addSql('DROP TABLE category_of_food_diet');
        $this->addSql('DROP TABLE ingredient');
        $this->addSql('DROP TABLE recipe');
        $this->addSql('DROP TABLE review');
        $this->addSql('DROP TABLE type_of_recipe');
        $this->addSql('DROP INDEX IDX_9DE4652016A2DF89 ON diet');
        $this->addSql('ALTER TABLE diet DROP category_of_food_diet_id');
    }
}
