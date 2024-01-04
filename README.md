# Coupart-nutrition

Ce projet est une application Symfony conçue pour une nutritionniste dans le cadre d'une évaluation d'entrainement au titre graduate developpeur web.
Il comprend un front et un back. 

## Installation

### Prérequis

Avant de commencer, assurez-vous d'avoir installé :
- PHP (version 8.2.4)
- Composer
- symfony CLI
- une base de données relationnelles (ex: mariaDB)
- faire la commande symfony check:requirement et si besoin modifier le fichier php.ini


### Étapes d'installation

1. Clonez ce dépôt : `git clone https://github.com/SandrineOrieux/Coupart-nutrition.git`
2. Rendez-vous dans le répertoire du projet : `cd Coupart-nutrition`
3. Installez les dépendances via Composer : `composer install`
4. Configurer le fichier .env pour la base de données et le mail
5. Générez la clé d'application : `php bin/console app:generate-key`
6. générer les autoloads : `composer require symfony/runtime`
6. Créez la base de données : `php bin/console doctrine:database:create`
7. Exécutez les migrations pour créer les tables : `php bin/console doctrine:migrations:migrate`
8. Lancez le serveur local : `symfony serve` ou utilisez votre serveur web habituel.

## Utilisation

Seul l'administrateur peut créer un nouveau profil utilisateur de type patient depuis son espace.
Seul l'administrateur et les patients enregistrés peuvent se connecter via le formulaire sur la page : mon espace.
Seul les patients peuvent noter et laisser un commentaire. Les visiteurs peuvent voir les recettes publiques, la note et les commentaires des patients (les commentaires sont affichés sans le nom du patient). 
Le formulaire de contact envoie un mail à l'administrateur. Les commentaires sont soumis à validation de l'administrateur avant d'être publiés.

## Contribuer

Si vous souhaitez contribuer à ce projet, veuillez suivre ces étapes :
1. Forker le projet
2. Créer une nouvelle branche (`git checkout -b feature/nom-de-la-fonctionnalite`)
3. Faire des modifications et commit (`git commit -am 'Ajouter une nouvelle fonctionnalité'`)
4. Push vers la branche (`git push origin feature/nom-de-la-fonctionnalite`)
5. Créer une Pull Request

## Auteurs

Orieux Sandrine.

## Licence

Pas de licence.

