<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240108161838 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE diet DROP FOREIGN KEY FK_9DE4652016A2DF89');
        $this->addSql('DROP INDEX IDX_9DE4652016A2DF89 ON diet');
        $this->addSql('ALTER TABLE diet DROP category_of_food_diet_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE diet ADD category_of_food_diet_id INT NOT NULL');
        $this->addSql('ALTER TABLE diet ADD CONSTRAINT FK_9DE4652016A2DF89 FOREIGN KEY (category_of_food_diet_id) REFERENCES category_of_food (id)');
        $this->addSql('CREATE INDEX IDX_9DE4652016A2DF89 ON diet (category_of_food_diet_id)');
    }
}
