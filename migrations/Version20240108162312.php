<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240108162312 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE category_of_food_diet ADD diet_id INT NOT NULL');
        $this->addSql('ALTER TABLE category_of_food_diet ADD CONSTRAINT FK_C5704E65E1E13ACE FOREIGN KEY (diet_id) REFERENCES diet (id)');
        $this->addSql('CREATE INDEX IDX_C5704E65E1E13ACE ON category_of_food_diet (diet_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE category_of_food_diet DROP FOREIGN KEY FK_C5704E65E1E13ACE');
        $this->addSql('DROP INDEX IDX_C5704E65E1E13ACE ON category_of_food_diet');
        $this->addSql('ALTER TABLE category_of_food_diet DROP diet_id');
    }
}
