<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230301104951 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE alternative (id INT AUTO_INCREMENT NOT NULL, etape_precedente_id INT DEFAULT NULL, etape_suivante_id INT NOT NULL, texte_ambiance VARCHAR(255) NOT NULL, libelle VARCHAR(255) NOT NULL, INDEX IDX_EFF5DFA3F94EAC8 (etape_precedente_id), INDEX IDX_EFF5DFA62A0957E (etape_suivante_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE avatar (id INT AUTO_INCREMENT NOT NULL, nom_fichier VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE aventure (id INT AUTO_INCREMENT NOT NULL, premiere_etape_id INT DEFAULT NULL, titre VARCHAR(255) NOT NULL, description VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_1E56DE4B9551B165 (premiere_etape_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE etape (id INT AUTO_INCREMENT NOT NULL, aventure_id INT DEFAULT NULL, fin_aventure_id INT DEFAULT NULL, texte_ambiance VARCHAR(255) NOT NULL, libelle VARCHAR(255) NOT NULL, INDEX IDX_285F75DD873DBB5F (aventure_id), INDEX IDX_285F75DDC3DCFBBF (fin_aventure_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE personnage (id INT AUTO_INCREMENT NOT NULL, avatar_id INT DEFAULT NULL, prenom VARCHAR(255) NOT NULL, INDEX IDX_6AEA486D86383B10 (avatar_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE personnage_aventure (personnage_id INT NOT NULL, aventure_id INT NOT NULL, INDEX IDX_697DF1E55E315342 (personnage_id), INDEX IDX_697DF1E5873DBB5F (aventure_id), PRIMARY KEY(personnage_id, aventure_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE alternative ADD CONSTRAINT FK_EFF5DFA3F94EAC8 FOREIGN KEY (etape_precedente_id) REFERENCES etape (id)');
        $this->addSql('ALTER TABLE alternative ADD CONSTRAINT FK_EFF5DFA62A0957E FOREIGN KEY (etape_suivante_id) REFERENCES etape (id)');
        $this->addSql('ALTER TABLE aventure ADD CONSTRAINT FK_1E56DE4B9551B165 FOREIGN KEY (premiere_etape_id) REFERENCES etape (id)');
        $this->addSql('ALTER TABLE etape ADD CONSTRAINT FK_285F75DD873DBB5F FOREIGN KEY (aventure_id) REFERENCES aventure (id)');
        $this->addSql('ALTER TABLE etape ADD CONSTRAINT FK_285F75DDC3DCFBBF FOREIGN KEY (fin_aventure_id) REFERENCES aventure (id)');
        $this->addSql('ALTER TABLE personnage ADD CONSTRAINT FK_6AEA486D86383B10 FOREIGN KEY (avatar_id) REFERENCES avatar (id)');
        $this->addSql('ALTER TABLE personnage_aventure ADD CONSTRAINT FK_697DF1E55E315342 FOREIGN KEY (personnage_id) REFERENCES personnage (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE personnage_aventure ADD CONSTRAINT FK_697DF1E5873DBB5F FOREIGN KEY (aventure_id) REFERENCES aventure (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE alternative DROP FOREIGN KEY FK_EFF5DFA3F94EAC8');
        $this->addSql('ALTER TABLE alternative DROP FOREIGN KEY FK_EFF5DFA62A0957E');
        $this->addSql('ALTER TABLE aventure DROP FOREIGN KEY FK_1E56DE4B9551B165');
        $this->addSql('ALTER TABLE etape DROP FOREIGN KEY FK_285F75DD873DBB5F');
        $this->addSql('ALTER TABLE etape DROP FOREIGN KEY FK_285F75DDC3DCFBBF');
        $this->addSql('ALTER TABLE personnage DROP FOREIGN KEY FK_6AEA486D86383B10');
        $this->addSql('ALTER TABLE personnage_aventure DROP FOREIGN KEY FK_697DF1E55E315342');
        $this->addSql('ALTER TABLE personnage_aventure DROP FOREIGN KEY FK_697DF1E5873DBB5F');
        $this->addSql('DROP TABLE alternative');
        $this->addSql('DROP TABLE avatar');
        $this->addSql('DROP TABLE aventure');
        $this->addSql('DROP TABLE etape');
        $this->addSql('DROP TABLE personnage');
        $this->addSql('DROP TABLE personnage_aventure');
    }
}
