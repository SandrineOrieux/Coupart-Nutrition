-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 21 mai 2024 à 14:57
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `coupart_nutrition`
--
CREATE DATABASE IF NOT EXISTS `coupart_nutrition` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `coupart_nutrition`;

-- --------------------------------------------------------

--
-- Structure de la table `allergen`
--

CREATE TABLE `allergen` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `allergen`
--

INSERT INTO `allergen` (`id`, `name`) VALUES
(1, 'gluten'),
(2, 'Œufs'),
(3, 'Poissons'),
(4, 'Lactose'),
(5, 'Fruits à coques'),
(6, 'Anhydride sulfureux et sulfites'),
(7, 'Arachide'),
(8, 'Crustacé'),
(9, 'Soja'),
(10, 'Céleri'),
(11, 'Moutarde'),
(12, 'Graines de sésame');

-- --------------------------------------------------------

--
-- Structure de la table `diet`
--

CREATE TABLE `diet` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `diet`
--

INSERT INTO `diet` (`id`, `name`, `description`) VALUES
(1, 'régime sans sel', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mollis et augue sit amet dictum. Donec eu maximus odio, eu semper augue. Aliquam erat volutpat. Sed quis odio nec mi faucibus semper a eget ipsum. Cras vel est vitae ex maximus venenatis vel imperdiet ipsum. Nulla facilisi. Nunc pulvinar pellentesque nisi ac fermentum.'),
(2, 'régime hyperproteinée', 'Etiam sit amet urna pellentesque, lobortis nunc vel, vestibulum lectus. Vivamus bibendum, nunc sed blandit aliquam, risus tellus ultrices ipsum, nec cursus justo justo id nulla. Pellentesque pellentesque pellentesque vulputate. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nullam ut ex at sem congue gravida eu eu justo. Phasellus pulvinar urna eget ligula finibus, ac convallis turpis luctus.'),
(3, 'Lorem ipsum dolor', 'Mauris euismod non elit et porta. Sed semper sem id dui sodales, ut suscipit orci suscipit. In vitae nibh eu velit consectetur molestie. Vestibulum vulputate ultrices facilisis. Proin sit amet feugiat diam, ac vulputate turpis. Nam massa lorem, bibendum non laoreet sit amet, venenatis at nibh.');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240111153707', '2024-01-17 18:07:22', 743),
('DoctrineMigrations\\Version20240112084726', '2024-01-17 18:07:22', 8);

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `quantity_id` int(11) DEFAULT NULL,
  `allergen_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id`, `quantity_id`, `allergen_id`, `name`) VALUES
(1, 9, 1, 'pâte plate'),
(2, 6, NULL, 'épinard'),
(3, 6, 3, 'Saumon'),
(4, 14, 4, 'Lait'),
(5, 6, 1, 'farine'),
(6, 7, NULL, 'Emmental Rapé'),
(7, 6, 1, 'chapelure');

-- --------------------------------------------------------

--
-- Structure de la table `ingredient_recipe`
--

CREATE TABLE `ingredient_recipe` (
  `ingredient_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ingredient_recipe`
--

INSERT INTO `ingredient_recipe` (`ingredient_id`, `recipe_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 2),
(7, 1),
(7, 2);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `quantity`
--

CREATE TABLE `quantity` (
  `id` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `unity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `quantity`
--

INSERT INTO `quantity` (`id`, `number`, `unity`) VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, 3, NULL),
(4, 4, NULL),
(5, 5, NULL),
(6, 200, 'g'),
(7, 300, 'g'),
(8, 400, 'g'),
(9, 500, 'g'),
(10, 10, 'cl'),
(11, 20, 'cl'),
(12, 30, 'cl'),
(13, 40, 'cl'),
(14, 50, 'cl');

-- --------------------------------------------------------

--
-- Structure de la table `recipe`
--

CREATE TABLE `recipe` (
  `id` int(11) NOT NULL,
  `type_of_recipe_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `decription` longtext NOT NULL,
  `preparation_time` int(11) NOT NULL,
  `resting_time` int(11) DEFAULT NULL,
  `cooking_time` int(11) DEFAULT NULL,
  `steps` longtext NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipe`
--

INSERT INTO `recipe` (`id`, `type_of_recipe_id`, `title`, `decription`, `preparation_time`, `resting_time`, `cooking_time`, `steps`, `is_public`, `image_name`, `image_size`, `updated_at`) VALUES
(1, 1, 'lasagne au saumon', '<div>&nbsp;In tempus quis risus a faucibus. Maecenas iaculis quam sed efficitur lacinia. Pellentesque vulputate consectetur condimentum. Curabitur bibendum molestie pretium. Maecenas ornare, dui ut sagittis malesuada, arcu libero placerat sem, id congue augue elit vel mi. In a orci sed nunc congue lacinia eu nec eros.&nbsp;</div>', 30, NULL, 30, '<div>&nbsp;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mollis et augue sit amet dictum. Donec eu maximus odio, eu semper augue. Aliquam erat volutpat. Sed quis odio nec mi faucibus semper a eget ipsum. Cras vel est vitae ex maximus venenatis vel imperdiet ipsum. Nulla facilisi. Nunc pulvinar pellentesque nisi ac fermentum.&nbsp;<br><br></div><div>&nbsp;Etiam sit amet urna pellentesque, lobortis nunc vel, vestibulum lectus. Vivamus bibendum, nunc sed blandit aliquam, risus tellus ultrices ipsum, nec cursus justo justo id nulla. Pellentesque pellentesque pellentesque vulputate. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nullam ut ex at sem congue gravida eu eu justo. Phasellus pulvinar urna eget ligula finibus, ac convallis turpis luctus. Duis venenatis, risus eget iaculis malesuada, ipsum arcu eleifend augue, ut eleifend magna arcu at libero. Fusce sollicitudin urna a auctor mattis. In porta pulvinar tortor sed congue. Aenean vitae est odio. Sed vitae magna aliquet, rhoncus ipsum sed, tincidunt ante. Morbi hendrerit condimentum magna quis fringilla.&nbsp;<br><br></div><div>&nbsp;Praesent mollis eros nec orci finibus pretium. Proin convallis dapibus purus accumsan accumsan. Suspendisse at diam lectus. Fusce ornare felis urna, in facilisis lorem luctus ac. Fusce enim nisl, commodo sed viverra non, tempus non purus. Nam pellentesque vulputate ligula non bibendum. Etiam finibus dolor id justo elementum tempus. Vivamus lobortis felis in erat gravida, quis pulvinar dui rhoncus. Cras auctor tellus felis, quis ornare est ultricies id. Proin aliquam eget tellus eu facilisis. Duis vestibulum, urna in vestibulum egestas, augue velit mattis mauris, nec porta libero est nec lacus. Duis eget elit aliquet, pellentesque orci luctus, sagittis urna. Proin aliquam, lorem vehicula dictum malesuada, enim diam varius tellus, a placerat ligula leo vel ligula. Pellentesque ornare venenatis odio, ut iaculis orci tincidunt vel.&nbsp;<br><br></div><div>&nbsp;In tempus quis risus a faucibus. Maecenas iaculis quam sed efficitur lacinia. Pellentesque vulputate consectetur condimentum. Curabitur bibendum molestie pretium. Maecenas ornare, dui ut sagittis malesuada, arcu libero placerat sem, id congue augue elit vel mi. In a orci sed nunc congue lacinia eu nec eros. In viverra luctus varius. Vivamus id lacus gravida, convallis odio nec, pulvinar purus. Fusce pharetra dolor malesuada risus commodo, et bibendum nisl malesuada. Curabitur faucibus sed risus sed suscipit. Cras sit amet ultricies nisi, ac eleifend nibh.&nbsp;<br><br></div><div>&nbsp;Mauris euismod non elit et porta. Sed semper sem id dui sodales, ut suscipit orci suscipit. In vitae nibh eu velit consectetur molestie. Vestibulum vulputate ultrices facilisis. Proin sit amet feugiat diam, ac vulputate turpis. Nam massa lorem, bibendum non laoreet sit amet, venenatis at nibh. Ut placerat ante nunc, eu pellentesque erat convallis vitae. Suspendisse metus nisi, pretium dignissim viverra at, lacinia eget ligula. Maecenas eget leo accumsan, malesuada arcu fringilla, porta velit. In placerat tempor mi, at dictum nisi. Morbi id porttitor ante, vitae ullamcorper velit.&nbsp;<br><br></div>', 1, 'lasagneepinardsaumon-65a8156547f7a172715802.png', 2195230, '2024-01-17 18:59:01'),
(2, 1, 'Lorem Ipsum', '<div>&nbsp;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mollis et augue sit amet dictum. Donec eu maximus odio, eu semper augue. Aliquam erat volutpat. Sed quis odio nec mi faucibus semper a eget ipsum. Cras vel est vitae ex maximus venenatis vel imperdiet ipsum. Nulla facilisi. Nunc pulvinar pellentesque nisi ac fermentum.&nbsp;</div>', 20, 60, 10, '<div>tiam sit amet urna pellentesque, lobortis nunc vel, vestibulum lectus. Vivamus bibendum, nunc sed blandit aliquam, risus tellus ultrices ipsum, nec cursus justo justo id nulla. Pellentesque pellentesque pellentesque vulputate. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nullam ut ex at sem congue gravida eu eu justo. Phasellus pulvinar urna eget ligula finibus, ac convallis turpis luctus. Duis venenatis, risus eget iaculis malesuada, ipsum arcu eleifend augue, ut eleifend magna arcu at libero. Fusce sollicitudin urna a auctor mattis. In porta pulvinar tortor sed congue. Aenean vitae est odio. Sed vitae magna aliquet, rhoncus ipsum sed, tincidunt ante. Morbi hendrerit condimentum magna quis fringilla.&nbsp;<br><br></div><div>&nbsp;Praesent mollis eros nec orci finibus pretium. Proin convallis dapibus purus accumsan accumsan. Suspendisse at diam lectus. Fusce ornare felis urna, in facilisis lorem luctus ac. Fusce enim nisl, commodo sed viverra non, tempus non purus. Nam pellentesque vulputate ligula non bibendum. Etiam finibus dolor id justo elementum tempus. Vivamus lobortis felis in erat gravida, quis pulvinar dui rhoncus. Cras auctor tellus felis, quis ornare est ultricies id. Proin aliquam eget tellus eu facilisis. Duis vestibulum, urna in vestibulum egestas, augue velit mattis mauris, nec porta libero est nec lacus. Duis eget elit aliquet, pellentesque orci luctus, sagittis urna. Proin aliquam, lorem vehicula dictum malesuada, enim diam varius tellus, a placerat ligula leo vel ligula. Pellentesque ornare venenatis odio, ut iaculis orci tincidunt vel.&nbsp;<br><br></div><div>&nbsp;In tempus quis risus a faucibus. Maecenas iaculis quam sed efficitur lacinia. Pellentesque vulputate consectetur condimentum. Curabitur bibendum molestie pretium. Maecenas ornare, dui ut sagittis malesuada, arcu libero placerat sem, id congue augue elit vel mi. In a orci sed nunc congue lacinia eu nec eros. In viverra luctus varius. Vivamus id lacus gravida, convallis odio nec, pulvinar purus. Fusce pharetra dolor malesuada risus commodo, et bibendum nisl malesuada. Curabitur faucibus sed risus sed suscipit. Cras sit amet ultricies nisi, ac eleifend nibh.&nbsp;<br><br></div><div>&nbsp;Mauris euismod non elit et porta. Sed semper sem id dui sodales, ut suscipit orci suscipit. In vitae nibh eu velit consectetur molestie. Vestibulum vulputate ultrices facilisis. Proin sit amet feugiat diam, ac vulputate turpis. Nam massa lorem, bibendum non laoreet sit amet, venenatis at nibh. Ut placerat ante nunc, eu pellentesque erat convallis vitae. Suspendisse metus nisi, pretium dignissim viverra at, lacinia eget ligula. Maecenas eget leo accumsan, malesuada arcu fringilla, porta velit. In placerat tempor mi, at dictum nisi. Morbi id porttitor ante, vitae ullamcorper velit.&nbsp;<br><br></div>', 0, NULL, NULL, NULL),
(3, 1, 'Mauris euismod', '<div>&nbsp;In tempus quis risus a faucibus. Maecenas iaculis quam sed efficitur lacinia. Pellentesque vulputate consectetur condimentum. Curabitur bibendum molestie pretium. Maecenas ornare, dui ut sagittis malesuada, arcu libero placerat sem, id congue augue elit vel mi.</div>', 40, NULL, 28, '<div>&nbsp;Etiam sit amet urna pellentesque, lobortis nunc vel, vestibulum lectus. Vivamus bibendum, nunc sed blandit aliquam, risus tellus ultrices ipsum, nec cursus justo justo id nulla. Pellentesque pellentesque pellentesque vulputate. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nullam ut ex at sem congue gravida eu eu justo. Phasellus pulvinar urna eget ligula finibus, ac convallis turpis luctus. Duis venenatis, risus eget iaculis malesuada, ipsum arcu eleifend augue, ut eleifend magna arcu at libero. Fusce sollicitudin urna a auctor mattis. In porta pulvinar tortor sed congue. Aenean vitae est odio. Sed vitae magna aliquet, rhoncus ipsum sed, tincidunt ante. Morbi hendrerit condimentum magna quis fringilla.&nbsp;<br><br></div><div>&nbsp;Praesent mollis eros nec orci finibus pretium. Proin convallis dapibus purus accumsan accumsan. Suspendisse at diam lectus. Fusce ornare felis urna, in facilisis lorem luctus ac. Fusce enim nisl, commodo sed viverra non, tempus non purus. Nam pellentesque vulputate ligula non bibendum. Etiam finibus dolor id justo elementum tempus. Vivamus lobortis felis in erat gravida, quis pulvinar dui rhoncus. Cras auctor tellus felis, quis ornare est ultricies id. Proin aliquam eget tellus eu facilisis. Duis vestibulum, urna in vestibulum egestas, augue velit mattis mauris, nec porta libero est nec lacus. Duis eget elit aliquet, pellentesque orci luctus, sagittis urna. Proin aliquam, lorem vehicula dictum malesuada, enim diam varius tellus, a placerat ligula leo vel ligula. Pellentesque ornare venenatis odio, ut iaculis orci tincidunt vel.&nbsp;<br><br></div><div>&nbsp;In tempus quis risus a faucibus. Maecenas iaculis quam sed efficitur lacinia. Pellentesque vulputate consectetur condimentum. Curabitur bibendum molestie pretium. Maecenas ornare, dui ut sagittis malesuada, arcu libero placerat sem, id congue augue elit vel mi. In a orci sed nunc congue lacinia eu nec eros. In viverra luctus varius. Vivamus id lacus gravida, convallis odio nec, pulvinar purus. Fusce pharetra dolor malesuada risus commodo, et bibendum nisl malesuada. Curabitur faucibus sed risus sed suscipit. Cras sit amet ultricies nisi, ac eleifend nibh.&nbsp;<br><br></div><div>&nbsp;Mauris euismod non elit et porta. Sed semper sem id dui sodales, ut suscipit orci suscipit. In vitae nibh eu velit consectetur molestie. Vestibulum vulputate ultrices facilisis. Proin sit amet feugiat diam, ac vulputate turpis. Nam massa lorem, bibendum non laoreet sit amet, venenatis at nibh. Ut placerat ante nunc, eu pellentesque erat convallis vitae. Suspendisse metus nisi, pretium dignissim viverra at, lacinia eget ligula. Maecenas eget leo accumsan, malesuada arcu fringilla, porta velit. In placerat tempor mi, at dictum nisi. Morbi id porttitor ante, vitae ullamcorper velit.&nbsp;<br><br></div>', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `recipe_diet`
--

CREATE TABLE `recipe_diet` (
  `recipe_id` int(11) NOT NULL,
  `diet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipe_diet`
--

INSERT INTO `recipe_diet` (`recipe_id`, `diet_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(2, 3),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `rate` smallint(6) NOT NULL,
  `comment` longtext DEFAULT NULL,
  `is_validated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `review`
--

INSERT INTO `review` (`id`, `user_id`, `recipe_id`, `rate`, `comment`, `is_validated`) VALUES
(4, 2, 1, 5, 'test 3', 1);

-- --------------------------------------------------------

--
-- Structure de la table `type_of_recipe`
--

CREATE TABLE `type_of_recipe` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_of_recipe`
--

INSERT INTO `type_of_recipe` (`id`, `name`) VALUES
(1, 'plat'),
(2, 'dessert'),
(3, 'boisson'),
(4, 'petit-déjeuner'),
(5, 'entrée');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `birthday` date NOT NULL COMMENT '(DC2Type:date_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`, `birthday`) VALUES
(1, 'admin@test.com', '[\"ROLE_ADMIN\"]', '$2y$13$WspjMl0Lwnhli1xe0lm2/uemUvzFjGCoSamPFK1XEuzbqJ1MD9TSu', 'sandrine', 'coupart', '1988-05-03'),
(2, 'user@test.com', '[]', '$2y$13$2cy2ZJ3vxnn9.Nee9Obb.uPBQUJ2WzZZF3hiKDYj.adw/9azSng7K', 'user1', 'user1', '1962-08-02');

-- --------------------------------------------------------

--
-- Structure de la table `user_allergen`
--

CREATE TABLE `user_allergen` (
  `user_id` int(11) NOT NULL,
  `allergen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_allergen`
--

INSERT INTO `user_allergen` (`user_id`, `allergen_id`) VALUES
(2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `user_diet`
--

CREATE TABLE `user_diet` (
  `user_id` int(11) NOT NULL,
  `diet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_diet`
--

INSERT INTO `user_diet` (`user_id`, `diet_id`) VALUES
(2, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `allergen`
--
ALTER TABLE `allergen`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `diet`
--
ALTER TABLE `diet`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6BAF78707E8B4AFC` (`quantity_id`),
  ADD KEY `IDX_6BAF78706E775A4A` (`allergen_id`);

--
-- Index pour la table `ingredient_recipe`
--
ALTER TABLE `ingredient_recipe`
  ADD PRIMARY KEY (`ingredient_id`,`recipe_id`),
  ADD KEY `IDX_36F27176933FE08C` (`ingredient_id`),
  ADD KEY `IDX_36F2717659D8A214` (`recipe_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `quantity`
--
ALTER TABLE `quantity`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DA88B137E9FFB817` (`type_of_recipe_id`);

--
-- Index pour la table `recipe_diet`
--
ALTER TABLE `recipe_diet`
  ADD PRIMARY KEY (`recipe_id`,`diet_id`),
  ADD KEY `IDX_E2FF3FFF59D8A214` (`recipe_id`),
  ADD KEY `IDX_E2FF3FFFE1E13ACE` (`diet_id`);

--
-- Index pour la table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_794381C6A76ED395` (`user_id`),
  ADD KEY `IDX_794381C659D8A214` (`recipe_id`);

--
-- Index pour la table `type_of_recipe`
--
ALTER TABLE `type_of_recipe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_allergen`
--
ALTER TABLE `user_allergen`
  ADD PRIMARY KEY (`user_id`,`allergen_id`),
  ADD KEY `IDX_C532ECCEA76ED395` (`user_id`),
  ADD KEY `IDX_C532ECCE6E775A4A` (`allergen_id`);

--
-- Index pour la table `user_diet`
--
ALTER TABLE `user_diet`
  ADD PRIMARY KEY (`user_id`,`diet_id`),
  ADD KEY `IDX_E76529E9A76ED395` (`user_id`),
  ADD KEY `IDX_E76529E9E1E13ACE` (`diet_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `allergen`
--
ALTER TABLE `allergen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `diet`
--
ALTER TABLE `diet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `quantity`
--
ALTER TABLE `quantity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `type_of_recipe`
--
ALTER TABLE `type_of_recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `FK_6BAF78706E775A4A` FOREIGN KEY (`allergen_id`) REFERENCES `allergen` (`id`),
  ADD CONSTRAINT `FK_6BAF78707E8B4AFC` FOREIGN KEY (`quantity_id`) REFERENCES `quantity` (`id`);

--
-- Contraintes pour la table `ingredient_recipe`
--
ALTER TABLE `ingredient_recipe`
  ADD CONSTRAINT `FK_36F2717659D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_36F27176933FE08C` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `FK_DA88B137E9FFB817` FOREIGN KEY (`type_of_recipe_id`) REFERENCES `type_of_recipe` (`id`);

--
-- Contraintes pour la table `recipe_diet`
--
ALTER TABLE `recipe_diet`
  ADD CONSTRAINT `FK_E2FF3FFF59D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E2FF3FFFE1E13ACE` FOREIGN KEY (`diet_id`) REFERENCES `diet` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_794381C659D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`),
  ADD CONSTRAINT `FK_794381C6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user_allergen`
--
ALTER TABLE `user_allergen`
  ADD CONSTRAINT `FK_C532ECCE6E775A4A` FOREIGN KEY (`allergen_id`) REFERENCES `allergen` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C532ECCEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_diet`
--
ALTER TABLE `user_diet`
  ADD CONSTRAINT `FK_E76529E9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E76529E9E1E13ACE` FOREIGN KEY (`diet_id`) REFERENCES `diet` (`id`) ON DELETE CASCADE;
--
-- Base de données : `garage-v-parrot`
--
CREATE DATABASE IF NOT EXISTS `garage-v-parrot` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `garage-v-parrot`;

-- --------------------------------------------------------

--
-- Structure de la table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(1, 'Peugeot'),
(2, 'Renault'),
(3, 'Citroën'),
(4, 'Dacia'),
(5, 'Volkswagen'),
(6, 'Toyota'),
(7, 'Mercedes'),
(8, 'Audi'),
(9, 'BMW'),
(10, 'Hyundai');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_contacted` tinyint(1) NOT NULL,
  `object` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240205105707', '2024-02-13 11:08:12', 1061),
('DoctrineMigrations\\Version20240205130555', '2024-02-13 11:08:14', 6),
('DoctrineMigrations\\Version20240206163634', '2024-02-13 11:08:14', 50),
('DoctrineMigrations\\Version20240206215222', '2024-02-13 11:08:14', 4),
('DoctrineMigrations\\Version20240209152104', '2024-02-13 11:08:14', 5);

-- --------------------------------------------------------

--
-- Structure de la table `energy`
--

CREATE TABLE `energy` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `energy`
--

INSERT INTO `energy` (`id`, `name`) VALUES
(1, 'Diesel'),
(2, 'Hybride'),
(3, 'Essence'),
(4, 'Electrique');

-- --------------------------------------------------------

--
-- Structure de la table `fiscal_power`
--

CREATE TABLE `fiscal_power` (
  `id` int(11) NOT NULL,
  `number` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fiscal_power`
--

INSERT INTO `fiscal_power` (`id`, `number`) VALUES
(1, 4),
(2, 5),
(3, 6),
(4, 7),
(5, 8),
(6, 9),
(7, 10),
(8, 11),
(9, 12);

-- --------------------------------------------------------

--
-- Structure de la table `images_vehicle`
--

CREATE TABLE `images_vehicle` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `images_vehicle`
--

INSERT INTO `images_vehicle` (`id`, `vehicle_id`, `image_name`, `image_size`, `updated_at`) VALUES
(1, 1, 'voiture.jpg', NULL, NULL),
(2, 1, 'voiture.jpg', NULL, NULL),
(3, 1, 'voiture.jpg', NULL, NULL),
(4, 1, 'voiture.jpg', NULL, NULL),
(5, 2, 'voiture.jpg', NULL, NULL),
(6, 2, 'voiture.jpg', NULL, NULL),
(7, 2, 'voiture.jpg', NULL, NULL),
(8, 2, 'voiture.jpg', NULL, NULL),
(9, 3, 'voiture.jpg', NULL, NULL),
(10, 3, 'voiture.jpg', NULL, NULL),
(11, 3, 'voiture.jpg', NULL, NULL),
(12, 3, 'voiture.jpg', NULL, NULL),
(13, 4, 'voiture.jpg', NULL, NULL),
(14, 4, 'voiture.jpg', NULL, NULL),
(15, 4, 'voiture.jpg', NULL, NULL),
(16, 4, 'voiture.jpg', NULL, NULL),
(17, 5, 'voiture.jpg', NULL, NULL),
(18, 5, 'voiture.jpg', NULL, NULL),
(19, 5, 'voiture.jpg', NULL, NULL),
(20, 5, 'voiture.jpg', NULL, NULL),
(21, 6, 'voiture.jpg', NULL, NULL),
(22, 6, 'voiture.jpg', NULL, NULL),
(23, 6, 'voiture.jpg', NULL, NULL),
(24, 6, 'voiture.jpg', NULL, NULL),
(25, 7, 'voiture.jpg', NULL, NULL),
(26, 7, 'voiture.jpg', NULL, NULL),
(27, 7, 'voiture.jpg', NULL, NULL),
(28, 7, 'voiture.jpg', NULL, NULL),
(29, 8, 'voiture.jpg', NULL, NULL),
(30, 8, 'voiture.jpg', NULL, NULL),
(31, 8, 'voiture.jpg', NULL, NULL),
(32, 8, 'voiture.jpg', NULL, NULL),
(33, 9, 'voiture.jpg', NULL, NULL),
(34, 9, 'voiture.jpg', NULL, NULL),
(35, 9, 'voiture.jpg', NULL, NULL),
(36, 9, 'voiture.jpg', NULL, NULL),
(37, 10, 'voiture.jpg', NULL, NULL),
(38, 10, 'voiture.jpg', NULL, NULL),
(39, 10, 'voiture.jpg', NULL, NULL),
(40, 10, 'voiture.jpg', NULL, NULL),
(41, 11, 'voiture.jpg', NULL, NULL),
(42, 11, 'voiture.jpg', NULL, NULL),
(43, 11, 'voiture.jpg', NULL, NULL),
(44, 11, 'voiture.jpg', NULL, NULL),
(45, 12, 'voiture.jpg', NULL, NULL),
(46, 12, 'voiture.jpg', NULL, NULL),
(47, 12, 'voiture.jpg', NULL, NULL),
(48, 12, 'voiture.jpg', NULL, NULL),
(49, 13, 'voiture.jpg', NULL, NULL),
(50, 13, 'voiture.jpg', NULL, NULL),
(51, 13, 'voiture.jpg', NULL, NULL),
(52, 13, 'voiture.jpg', NULL, NULL),
(53, 14, 'voiture.jpg', NULL, NULL),
(54, 14, 'voiture.jpg', NULL, NULL),
(55, 14, 'voiture.jpg', NULL, NULL),
(56, 14, 'voiture.jpg', NULL, NULL),
(57, 15, 'voiture.jpg', NULL, NULL),
(58, 15, 'voiture.jpg', NULL, NULL),
(59, 15, 'voiture.jpg', NULL, NULL),
(60, 15, 'voiture.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `model`
--

CREATE TABLE `model` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `brand_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `model`
--

INSERT INTO `model` (`id`, `name`, `brand_id`) VALUES
(1, '2008', 1),
(2, '208', 1),
(3, '3008', 1),
(4, '308', 1),
(5, '408', 1),
(6, '5008', 1),
(7, '508', 1),
(8, 'Boxer', 1),
(9, 'Arkana', 2),
(10, 'Austral', 2),
(11, 'Captur', 2),
(12, 'Clio', 2),
(13, 'D10', 2),
(14, 'Espace', 2),
(15, 'Express Van', 2),
(16, 'Grand Kangoo', 2),
(17, 'Ami', 3),
(18, 'Berlingo', 3),
(19, 'C3', 3),
(20, 'C3 Aircross', 3),
(21, 'C4', 3),
(22, 'C5 Aircross', 3),
(23, 'C5 X', 3),
(24, 'Grand C4 Spacetourer', 3),
(25, 'Spring', 4),
(26, 'Sandero', 4),
(27, 'Sandero Stepway', 4),
(28, 'Duster', 4),
(29, 'Jogger', 4),
(30, 'Polo', 5),
(31, 'Golf', 5),
(32, 'Taigo', 5),
(33, 'T-Cross', 5),
(34, 'ID.3', 5),
(35, 'T-Roc', 5),
(36, 'Tiguan', 5),
(37, 'Touran', 5),
(38, 'Passat', 5),
(39, 'Aygo X Air Limited', 6),
(40, 'Aygo X Dynamic', 6),
(41, 'Yaris', 6),
(42, 'Yaris Cross Hybride', 6),
(43, 'Corolla', 6),
(44, 'Corolla Touring Sports', 6),
(45, 'BZ4X', 6),
(46, 'Camry', 6),
(47, '709', 7),
(48, 'Antos', 7),
(49, 'Atego', 7),
(50, 'Citan', 7),
(51, 'Cla', 7),
(52, 'Classe A', 7),
(53, 'Classe B', 7),
(54, 'Classe C', 7),
(55, 'Q4 e-tron', 8),
(56, 'Q8 e-tron', 8),
(57, 'e-tron', 8),
(58, 'e-tron GT', 8),
(59, 'A1', 8),
(60, 'A3', 8),
(61, 'A4', 8),
(62, 'A5', 8),
(63, 'I3', 9),
(64, 'I4', 9),
(65, 'I5', 9),
(66, 'I7', 9),
(67, 'I8', 9),
(68, 'Ix', 9),
(69, 'Ix2', 9),
(70, 'Ix3', 9),
(71, 'IONIQ 5', 10),
(72, 'IONIQ 6', 10),
(73, 'KONA Electric', 10),
(74, 'KONA Hybrid', 10),
(75, 'TUCSON Hybrid', 10),
(76, 'TUCSON Plug-in', 10),
(77, 'SANTA FE Hybrid', 10),
(78, 'SANTA FE Plug-in', 10);

-- --------------------------------------------------------

--
-- Structure de la table `number_of_doors`
--

CREATE TABLE `number_of_doors` (
  `id` int(11) NOT NULL,
  `number` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `number_of_doors`
--

INSERT INTO `number_of_doors` (`id`, `number`) VALUES
(1, 3),
(2, 5);

-- --------------------------------------------------------

--
-- Structure de la table `number_of_seats`
--

CREATE TABLE `number_of_seats` (
  `id` int(11) NOT NULL,
  `number` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `number_of_seats`
--

INSERT INTO `number_of_seats` (`id`, `number`) VALUES
(1, 2),
(2, 3),
(3, 5),
(4, 7);

-- --------------------------------------------------------

--
-- Structure de la table `opening_hour`
--

CREATE TABLE `opening_hour` (
  `id` int(11) NOT NULL,
  `am_id` int(11) DEFAULT NULL,
  `pm_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  `day` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `opening_hour`
--

INSERT INTO `opening_hour` (`id`, `am_id`, `pm_id`, `created_by_id`, `day`) VALUES
(1, 1, 2, 1, 'Lundi'),
(2, 1, 2, 1, 'Mardi'),
(3, 1, NULL, 1, 'Mercredi'),
(4, 1, 2, 1, 'Jeudi'),
(5, 1, 2, 1, 'Vendredi'),
(6, NULL, NULL, 1, 'Samedi'),
(7, NULL, NULL, 1, 'Dimanche');

-- --------------------------------------------------------

--
-- Structure de la table `option`
--

CREATE TABLE `option` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `option`
--

INSERT INTO `option` (`id`, `name`) VALUES
(1, 'Cupiditate accusamus velit nemo praesentium ipsa.'),
(2, 'Enim sed sequi officiis eos qui ea.'),
(3, 'Ut qui delectus et aut nihil debitis temporibus.'),
(4, 'Cupiditate porro eum quia aliquid veritatis.'),
(5, 'Aut nihil eum vel.'),
(6, 'Tempore ea.'),
(7, 'Sapiente dolores consequatur assumenda expedita molestiae.'),
(8, 'Amet ipsa praesentium eos quam.'),
(9, 'Corrupti rerum excepturi illum quo excepturi.'),
(10, 'Rem saepe odio tempora.'),
(11, 'Nemo dolor quia ipsa autem sed doloremque.'),
(12, 'Voluptatem asperiores qui.'),
(13, 'Velit quas.'),
(14, 'Et explicabo cupiditate praesentium ut non.'),
(15, 'Natus at asperiores adipisci.'),
(16, 'Ullam unde molestiae molestiae beatae.'),
(17, 'Sint est.'),
(18, 'Vel dolore ipsam totam.'),
(19, 'Nihil aut est.'),
(20, 'Cumque eum voluptatibus.');

-- --------------------------------------------------------

--
-- Structure de la table `power`
--

CREATE TABLE `power` (
  `id` int(11) NOT NULL,
  `number` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `power`
--

INSERT INTO `power` (`id`, `number`) VALUES
(1, 90),
(2, 91),
(3, 92),
(4, 93),
(5, 94),
(6, 95),
(7, 96),
(8, 97),
(9, 98),
(10, 99),
(11, 100),
(12, 101),
(13, 102),
(14, 103),
(15, 104),
(16, 105),
(17, 106),
(18, 107),
(19, 108),
(20, 109),
(21, 110),
(22, 111),
(23, 112),
(24, 113),
(25, 114),
(26, 115),
(27, 116),
(28, 117),
(29, 118),
(30, 119),
(31, 120),
(32, 121),
(33, 122),
(34, 123),
(35, 124),
(36, 125),
(37, 126),
(38, 127),
(39, 128),
(40, 129),
(41, 130),
(42, 131),
(43, 132),
(44, 133),
(45, 134),
(46, 135),
(47, 136),
(48, 137),
(49, 138),
(50, 139),
(51, 140),
(52, 141),
(53, 142),
(54, 143),
(55, 144),
(56, 145),
(57, 146),
(58, 147),
(59, 148),
(60, 149),
(61, 150);

-- --------------------------------------------------------

--
-- Structure de la table `repair_service`
--

CREATE TABLE `repair_service` (
  `id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `repair_service`
--

INSERT INTO `repair_service` (`id`, `created_by_id`, `name`, `description`) VALUES
(1, 1, 'Maiores rerum animi sed atque nemo commodi sunt consequatur voluptate itaque.', 'Dignissimos saepe dicta rerum. Facere odit nobis ea quasi.'),
(2, 1, 'Molestiae ratione voluptatem aliquid error dolores.', 'Error molestias cumque omnis omnis tenetur sit. Aut et cum amet eum minus. Laborum laborum mollitia quia quibusdam et. Molestiae accusamus deserunt porro beatae impedit similique. Doloribus voluptas vel qui fuga.'),
(3, 1, 'Odit mollitia voluptas quidem iste.', 'Aperiam enim fuga debitis provident. Tempora veniam et quis et.'),
(4, 1, 'Et est at vel sit vel.', 'Praesentium dolor deserunt assumenda. Unde cumque reiciendis iusto. Tempora ipsum in quas explicabo.'),
(5, 1, 'Consequatur quod qui et eius numquam.', 'Porro veniam aut possimus voluptatem. Laboriosam laudantium odit soluta. Qui itaque est blanditiis et quasi ducimus. Amet molestiae omnis velit dolorem eum.');

-- --------------------------------------------------------

--
-- Structure de la table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `comment` longtext NOT NULL,
  `rate` smallint(6) NOT NULL,
  `isvalidated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `review`
--

INSERT INTO `review` (`id`, `employee_id`, `name`, `comment`, `rate`, `isvalidated`) VALUES
(1, NULL, 'smarques', 'Odio ut delectus aliquid nostrum non aut. In est suscipit qui sapiente consequatur dolor vel natus. Quidem aut quos corrupti labore quis. Ratione rem nobis fugit voluptatem voluptatum dolor dolorum.', 3, 0),
(2, NULL, 'hvallet', 'Ducimus eos aut occaecati velit et. Tenetur iusto et ut delectus praesentium earum. Ratione dolorem et minus ipsa quisquam. Cumque tempora laborum esse tempora officiis esse qui quia. Non culpa vero laudantium molestiae corrupti reprehenderit deleniti autem. Consequuntur magnam illum odio quidem totam eos corporis.', 2, 0),
(3, NULL, 'timothee45', 'Eum illum deserunt minus qui ut molestiae. Optio provident quam voluptas rerum in est ut. Mollitia officiis ad pariatur cumque.', 3, 0),
(4, NULL, 'dumas.matthieu', 'Eveniet odio optio et non animi quia. Voluptatem quo quae qui molestias. Eos quasi magnam quis et. Labore consectetur cumque sapiente eos tempore. Non et ut minus iste animi voluptate est.', 3, 0),
(5, NULL, 'qloiseau', 'Ea facere odit provident minima temporibus.', 2, 0),
(6, NULL, 'louis.georges', 'Ratione et magnam adipisci ut sit adipisci excepturi.', 2, 0),
(7, NULL, 'celina99', 'Repellat consectetur explicabo in deserunt excepturi quas totam. Accusantium odit ea ut ipsa. Velit facere suscipit fugiat libero sint est. Ut dolore consequatur et. Adipisci sunt dignissimos ipsa magni architecto dolore. Et tenetur est autem quos asperiores non architecto quia.', 2, 0),
(8, NULL, 'jeannine.brun', 'Porro enim voluptatem autem veritatis itaque. Libero voluptas similique nam et facilis ut aperiam.', 2, 1),
(9, NULL, 'zloiseau', 'Atque ea enim ratione nemo iure. Dolore in magnam quibusdam fugit velit. Et ad culpa aut sunt harum. Voluptatem aut laboriosam molestiae maiores.', 1, 0),
(10, NULL, 'morvan.paul', 'Accusamus distinctio mollitia dignissimos vero. Blanditiis est in sint. Distinctio labore sint voluptatem modi. Ipsam soluta hic consequatur numquam id in consequatur enim. Fuga culpa sunt eum sequi aut. Voluptates consequatur nam aliquid maiores. Voluptas similique quos et autem eaque tempore ea. Repudiandae voluptatem ipsam qui magni corrupti rerum.', 3, 1),
(11, NULL, 'emarchand', 'Molestias placeat aut unde numquam beatae. Inventore explicabo iusto non aut ab maxime iusto. Cupiditate ratione sed quis animi consequatur molestias iusto. Consequatur quia omnis delectus delectus consequatur.', 5, 0),
(12, NULL, 'navarro.arthur', 'Ut officia officiis culpa itaque vitae quo. Enim saepe non est mollitia. Eaque voluptate voluptas deleniti qui.', 1, 1),
(13, NULL, 'klefevre', 'Aliquid harum nemo ut cupiditate laborum aliquam ea. Possimus dicta harum doloremque sed ex natus.', 3, 0),
(14, NULL, 'antoinette.garcia', 'Dolor molestiae reprehenderit qui officiis nisi. Ut est consectetur maxime in illo ratione nulla eum.', 3, 1),
(15, NULL, 'etienne.adrienne', 'Perferendis sint voluptatibus laudantium temporibus est qui molestiae. Id eligendi quo quia similique voluptatem aliquid. Omnis et omnis omnis facilis ipsa et. Harum nam sed sed nemo aut. Laudantium quia sit reiciendis quia.', 2, 0),
(16, NULL, 'legrand.pauline', 'Fugiat dolorem eaque porro itaque dolorum occaecati nihil esse. Vero ea vel corrupti. Saepe et quia architecto consequatur sequi ea sequi et. Ad voluptatum exercitationem consequatur. Molestias sint deleniti nihil optio. Saepe reiciendis eum et ut ut voluptatum.', 5, 1),
(17, NULL, 'ycoulon', 'Laborum dignissimos excepturi consequatur qui ducimus.', 3, 0),
(18, NULL, 'martin.lebreton', 'Eum est unde fugiat dignissimos. Et quisquam reiciendis quae sint. Sed eligendi ut sit numquam dolor dolorem beatae facere. Consequatur quam nobis possimus molestias et qui. Rerum molestiae est hic assumenda in consequuntur dolores.', 3, 1),
(19, NULL, 'ohamel', 'Quas et ipsa et voluptas quod ex ea. Delectus ex dicta necessitatibus illo voluptatem occaecati et. Autem et enim atque maxime iste molestias. Voluptates quam in placeat autem. Autem dolorem ipsa esse voluptatem. Fugit repellat et omnis et libero minima excepturi.', 4, 0),
(20, NULL, 'ugomes', 'Enim ducimus aut quia velit animi sunt. Non laboriosam quaerat repudiandae et.', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `time_slot`
--

CREATE TABLE `time_slot` (
  `id` int(11) NOT NULL,
  `start` varchar(5) NOT NULL,
  `end` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `time_slot`
--

INSERT INTO `time_slot` (`id`, `start`, `end`) VALUES
(1, '08H00', '12H00'),
(2, '13H00', '17H30');

-- --------------------------------------------------------

--
-- Structure de la table `transmission`
--

CREATE TABLE `transmission` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `transmission`
--

INSERT INTO `transmission` (`id`, `name`) VALUES
(1, 'automatique'),
(2, 'manuel');

-- --------------------------------------------------------

--
-- Structure de la table `type_of_vehicles`
--

CREATE TABLE `type_of_vehicles` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_of_vehicles`
--

INSERT INTO `type_of_vehicles` (`id`, `name`) VALUES
(1, 'Citadines'),
(2, 'Compactes'),
(3, 'Breaks'),
(4, 'Berlines'),
(5, 'Coupés'),
(6, 'Monospaces'),
(7, 'Ludospace'),
(8, 'SUV');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(1, 'vincent.parrot@garage-v-parrot.com', '[\"ROLE_ADMIN\"]', '$2y$13$hJfiLjqmS5MFn5Ttekq.qeXCNhlzCEP24FP4vYabz09vOW0mZHA3q', 'Vincent', 'Parrot'),
(2, 'anastasie.lagarde@perez.fr', '[\"ROLE_USER\"]', '$2y$13$BsNj7cp.o3awFSuj7lcyB.SiintdIfM3VAf8TS7Hw6lA83RhbB94G', 'Yves', 'Bodin'),
(3, 'william45@sfr.fr', '[\"ROLE_USER\"]', '$2y$13$a1zWhqguRTgSqIQP0YHXg.eoYfcnZi7WlVvXVTnairrX5nHABuFuq', 'Océane', 'Lucas'),
(4, 'simone.vaillant@vasseur.fr', '[\"ROLE_USER\"]', '$2y$13$81nyJyb7wYNQQwd2w5MSHeFTAe3uLK8poMUVYcHDj913UkBBXylFu', 'Françoise', 'Alexandre'),
(5, 'dorothee.lemaire@briand.com', '[\"ROLE_USER\"]', '$2y$13$aY8mM.S4BGm/u8F/AwRriOW/4W1Rp0Cv5szI7aok09msiSGpHPQny', 'Marcelle', 'Faure'),
(6, 'qrodrigues@tele2.fr', '[\"ROLE_USER\"]', '$2y$13$p6IwFgNPL5aulopOI/dDveUvxn29yEQjT8f9zqBb18Oro41xX9b0C', 'Martine', 'Lagarde'),
(7, 'carre.bertrand@laposte.net', '[\"ROLE_USER\"]', '$2y$13$co79iQwX86cAH/ZEzMg50O1aaxQk6KVnRzPKKOSCcLC1UyphyU.pO', 'Franck', 'Gautier'),
(8, 'sdupuis@wanadoo.fr', '[\"ROLE_USER\"]', '$2y$13$VoadNVkweC3qyyIRYIzXoOLe0ZMNCSUIYQi7P0aG8ICsSuMgzutWG', 'François', 'Techer'),
(9, 'chauveau.aime@perrot.fr', '[\"ROLE_USER\"]', '$2y$13$XGtHXAe.34cYI8CBHlI1F.3ZZCb8U8uhcUYfxAOiiGY9MJ8v5swti', 'Nath', 'Monnier'),
(10, 'lucas.margaret@roger.com', '[\"ROLE_USER\"]', '$2y$13$HAHrAOAUKbm/VGTr08ZInOO7Vd/dDm2iNh0OGVj5rKKuo4yHvTicW', 'Maryse', 'Toussaint'),
(11, 'mathilde.clerc@lagarde.com', '[\"ROLE_USER\"]', '$2y$13$rOhLtHAEHaE0Yq7/mJmUlui5MOMh6KdYO81vKr0vJTNldLH6un/De', 'Roland', 'Roussel'),
(12, 'baudry.agnes@masse.fr', '[\"ROLE_USER\"]', '$2y$13$wMRitJdBcEKev0CClREzq.Q2xR5I25t46Z3lvi5qFORAixkO1ROBS', 'Zacharie', 'Bertin'),
(13, 'fdelaunay@club-internet.fr', '[\"ROLE_USER\"]', '$2y$13$m162XIb.9L2mzEf7Eu/mruWUqHvDszLyYOvqlNNW4QrbF62WBkwiW', 'Victoire', 'Gomez'),
(14, 'anne.bouvier@charles.fr', '[\"ROLE_USER\"]', '$2y$13$f/da8r7z590wjVlskzuVdOAjrjeH2.jY5LY8eM81UyO.i5jIEPHQi', 'Bertrand', 'Aubry'),
(15, 'alexandre.marcelle@lemoine.net', '[\"ROLE_USER\"]', '$2y$13$hHpu3FrIGaFemDcr2BioBeexG2dXd2aVwygWzToqrrlqbgsJoj8Mu', 'Julien', 'Arnaud');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `energy_id` int(11) NOT NULL,
  `transmission_id` int(11) NOT NULL,
  `number_of_doors_id` int(11) NOT NULL,
  `number_of_seats_id` int(11) NOT NULL,
  `power_id` int(11) NOT NULL,
  `fiscal_power_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `year` date NOT NULL,
  `kilometer` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vehicle`
--

INSERT INTO `vehicle` (`id`, `created_by_id`, `type_id`, `brand_id`, `model_id`, `energy_id`, `transmission_id`, `number_of_doors_id`, `number_of_seats_id`, `power_id`, `fiscal_power_id`, `title`, `year`, `kilometer`, `price`, `description`) VALUES
(1, 7, 8, 2, 71, 4, 2, 2, 4, 25, 5, 'Nihil animi laborum exercitationem ab eum a.', '2010-04-05', 17484, 34405, 'Voluptatum est sequi molestias ut. Quaerat laudantium ad doloribus itaque. Nihil eveniet nam rerum. Ea optio ratione error.'),
(2, 15, 8, 3, 72, 3, 2, 2, 1, 57, 1, 'Quis aut dolor quam ipsum.', '1984-05-30', 66028, 35939, 'Quos eaque non reprehenderit eum quia. Officia enim similique est quibusdam eligendi blanditiis inventore. Molestiae a nihil ipsa qui quo voluptatem. Necessitatibus quos eaque expedita et.'),
(3, 2, 7, 1, 75, 4, 2, 1, 1, 49, 8, 'Necessitatibus id sit doloremque facilis non dolor atque qui.', '1971-09-21', 129919, 30536, 'Et repudiandae dicta distinctio totam qui. Sunt voluptas nemo suscipit accusantium quod nesciunt ut eum. Nam ipsa dolorem in qui omnis ut numquam eaque. Aliquid est eaque voluptatem inventore commodi et. Facilis cum rerum nihil asperiores consequatur. Pariatur aut eveniet tempore.'),
(4, 6, 2, 4, 72, 4, 2, 1, 3, 15, 1, 'Ipsum est itaque laudantium architecto.', '2016-02-29', 39117, 24076, 'Eveniet molestias ducimus officia in id. Praesentium aliquid asperiores ut dolor qui illum sapiente. Excepturi consequuntur ut possimus accusamus qui consequatur velit optio.'),
(5, 14, 1, 1, 73, 2, 1, 2, 3, 57, 8, 'A consequuntur eligendi non asperiores est.', '1983-03-02', 75297, 42972, 'Maiores nemo magnam voluptatibus praesentium exercitationem. Voluptatum consequatur officia autem aliquam sed soluta praesentium. Autem unde error similique sequi.'),
(6, 14, 3, 10, 73, 2, 2, 1, 1, 25, 7, 'Voluptatem et id incidunt.', '1980-01-23', 70825, 17701, 'Ut sint aut in cumque qui aut. Omnis quos natus ea nihil eum tempora.'),
(7, 11, 7, 10, 73, 4, 1, 1, 2, 20, 3, 'Voluptatem eos eum odio temporibus provident animi qui soluta distinctio.', '1979-05-28', 153288, 46096, 'Quos veritatis repellat et earum saepe ducimus error. Saepe sit minus velit tempora. Eius autem autem et quidem possimus accusamus quia error.'),
(8, 3, 5, 8, 71, 2, 1, 1, 2, 27, 7, 'Modi recusandae ea a minus aperiam.', '2005-03-26', 91775, 39209, 'Expedita et quo facere earum architecto iure itaque. Doloremque quae assumenda perspiciatis est quas quidem eveniet. Sit sit ut ipsum reprehenderit reiciendis omnis sit in. Harum qui numquam est autem dolorem eos. Est ut voluptatem inventore vero.'),
(9, 13, 4, 5, 71, 1, 2, 2, 1, 33, 5, 'Sint eveniet iste dolor omnis odit dolorem.', '2021-03-06', 168164, 15351, 'Recusandae quia totam ea omnis sunt sit dolores numquam. Dolores eveniet beatae ut ut dolore. Ipsa nulla soluta et iste architecto.'),
(10, 5, 5, 3, 71, 2, 2, 1, 1, 15, 7, 'Ipsum in aut iste nihil architecto.', '2018-07-21', 96441, 17089, 'Incidunt architecto et aut laborum temporibus. Qui officiis dolores autem voluptate. Porro at mollitia tenetur consequatur dolores excepturi totam. Deserunt et quis ipsa ut debitis rerum sit. Error dolor dicta corporis optio ut tempora modi. Laborum est voluptatem dolorem adipisci expedita.'),
(11, 5, 6, 10, 74, 4, 2, 2, 4, 28, 3, 'Tempora est sed impedit non dolor voluptatibus aut.', '2015-09-05', 54568, 31180, 'Ipsum sunt velit possimus sequi aliquam. Ea animi aut dolores debitis quasi error doloribus. Optio eveniet corporis et quod aliquid et expedita. Autem neque debitis perspiciatis.'),
(12, 10, 4, 9, 74, 2, 2, 2, 4, 15, 7, 'Laudantium quos qui doloribus sapiente.', '1997-09-25', 137806, 47005, 'Voluptatem dolor quia facere aut nobis itaque accusamus quidem. Quasi officiis ad velit corrupti consequatur deserunt nisi. Beatae dolores rerum quia aut ex autem. In consectetur eos dolores sunt est natus.'),
(13, 5, 8, 2, 72, 3, 2, 1, 4, 50, 2, 'Quis voluptatem dolores voluptatum rem ipsa enim reprehenderit ut.', '1985-01-09', 46117, 51871, 'Quod at sit et iusto architecto illum. Voluptas qui porro aut fugiat qui. Libero dolorem esse repellendus officia.'),
(14, 15, 5, 6, 71, 4, 1, 1, 4, 35, 3, 'Et qui et placeat nam non.', '2010-08-11', 127836, 39927, 'Voluptas sint praesentium alias est id. Tenetur et veritatis consequatur ea itaque. Natus in nihil qui. Totam et dolores odio velit et voluptatem aperiam.'),
(15, 4, 1, 10, 73, 1, 1, 2, 2, 1, 1, 'Aspernatur cumque omnis ex aut ea fugit optio aut eius saepe.', '2005-05-19', 35949, 30115, 'Id aut quia quibusdam illum. Dolor ut voluptatibus quaerat eius id. Eos ducimus ut voluptatem nulla est et.');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_option`
--

CREATE TABLE `vehicle_option` (
  `vehicle_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vehicle_option`
--

INSERT INTO `vehicle_option` (`vehicle_id`, `option_id`) VALUES
(1, 3),
(1, 5),
(2, 5),
(2, 11),
(2, 16),
(3, 1),
(3, 9),
(3, 12),
(4, 3),
(4, 5),
(4, 6),
(4, 10),
(4, 11),
(4, 18),
(5, 3),
(5, 5),
(5, 7),
(5, 9),
(5, 16),
(6, 10),
(6, 12),
(6, 18),
(7, 1),
(7, 3),
(7, 12),
(7, 15),
(7, 19),
(8, 10),
(8, 13),
(8, 14),
(9, 6),
(9, 10),
(9, 16),
(10, 1),
(10, 10),
(10, 11),
(11, 8),
(11, 9),
(11, 15),
(11, 16),
(12, 1),
(12, 2),
(12, 4),
(12, 9),
(12, 10),
(12, 14),
(13, 7),
(13, 8),
(13, 13),
(13, 14),
(13, 16),
(13, 20),
(14, 3),
(14, 10),
(14, 12),
(14, 20),
(15, 10),
(15, 11),
(15, 17),
(15, 18),
(15, 19);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4C62E6388C03F15C` (`employee_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `energy`
--
ALTER TABLE `energy`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fiscal_power`
--
ALTER TABLE `fiscal_power`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `images_vehicle`
--
ALTER TABLE `images_vehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_84FDFAE4545317D1` (`vehicle_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D79572D944F5D008` (`brand_id`);

--
-- Index pour la table `number_of_doors`
--
ALTER TABLE `number_of_doors`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `number_of_seats`
--
ALTER TABLE `number_of_seats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `opening_hour`
--
ALTER TABLE `opening_hour`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_969BD765323C9A1C` (`am_id`),
  ADD KEY `IDX_969BD7656FBC242E` (`pm_id`),
  ADD KEY `IDX_969BD765B03A8386` (`created_by_id`);

--
-- Index pour la table `option`
--
ALTER TABLE `option`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `power`
--
ALTER TABLE `power`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `repair_service`
--
ALTER TABLE `repair_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7F26CF41B03A8386` (`created_by_id`);

--
-- Index pour la table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_794381C68C03F15C` (`employee_id`);

--
-- Index pour la table `time_slot`
--
ALTER TABLE `time_slot`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transmission`
--
ALTER TABLE `transmission`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_of_vehicles`
--
ALTER TABLE `type_of_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1B80E486B03A8386` (`created_by_id`),
  ADD KEY `IDX_1B80E486C54C8C93` (`type_id`),
  ADD KEY `IDX_1B80E48644F5D008` (`brand_id`),
  ADD KEY `IDX_1B80E4867975B7E7` (`model_id`),
  ADD KEY `IDX_1B80E486EDDF52D` (`energy_id`),
  ADD KEY `IDX_1B80E48678D28519` (`transmission_id`),
  ADD KEY `IDX_1B80E4864E36F662` (`number_of_doors_id`),
  ADD KEY `IDX_1B80E486297205CE` (`number_of_seats_id`),
  ADD KEY `IDX_1B80E486AB4FC384` (`power_id`),
  ADD KEY `IDX_1B80E486F4697361` (`fiscal_power_id`);

--
-- Index pour la table `vehicle_option`
--
ALTER TABLE `vehicle_option`
  ADD PRIMARY KEY (`vehicle_id`,`option_id`),
  ADD KEY `IDX_F3580163545317D1` (`vehicle_id`),
  ADD KEY `IDX_F3580163A7C41D6F` (`option_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `energy`
--
ALTER TABLE `energy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `fiscal_power`
--
ALTER TABLE `fiscal_power`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `images_vehicle`
--
ALTER TABLE `images_vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `model`
--
ALTER TABLE `model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT pour la table `number_of_doors`
--
ALTER TABLE `number_of_doors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `number_of_seats`
--
ALTER TABLE `number_of_seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `opening_hour`
--
ALTER TABLE `opening_hour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `option`
--
ALTER TABLE `option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `power`
--
ALTER TABLE `power`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT pour la table `repair_service`
--
ALTER TABLE `repair_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `time_slot`
--
ALTER TABLE `time_slot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `transmission`
--
ALTER TABLE `transmission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `type_of_vehicles`
--
ALTER TABLE `type_of_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK_4C62E6388C03F15C` FOREIGN KEY (`employee_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `images_vehicle`
--
ALTER TABLE `images_vehicle`
  ADD CONSTRAINT `FK_84FDFAE4545317D1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`);

--
-- Contraintes pour la table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `FK_D79572D944F5D008` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`);

--
-- Contraintes pour la table `opening_hour`
--
ALTER TABLE `opening_hour`
  ADD CONSTRAINT `FK_969BD765323C9A1C` FOREIGN KEY (`am_id`) REFERENCES `time_slot` (`id`),
  ADD CONSTRAINT `FK_969BD7656FBC242E` FOREIGN KEY (`pm_id`) REFERENCES `time_slot` (`id`),
  ADD CONSTRAINT `FK_969BD765B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `repair_service`
--
ALTER TABLE `repair_service`
  ADD CONSTRAINT `FK_7F26CF41B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_794381C68C03F15C` FOREIGN KEY (`employee_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `FK_1B80E486297205CE` FOREIGN KEY (`number_of_seats_id`) REFERENCES `number_of_seats` (`id`),
  ADD CONSTRAINT `FK_1B80E48644F5D008` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `FK_1B80E4864E36F662` FOREIGN KEY (`number_of_doors_id`) REFERENCES `number_of_doors` (`id`),
  ADD CONSTRAINT `FK_1B80E48678D28519` FOREIGN KEY (`transmission_id`) REFERENCES `transmission` (`id`),
  ADD CONSTRAINT `FK_1B80E4867975B7E7` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`),
  ADD CONSTRAINT `FK_1B80E486AB4FC384` FOREIGN KEY (`power_id`) REFERENCES `power` (`id`),
  ADD CONSTRAINT `FK_1B80E486B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_1B80E486C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type_of_vehicles` (`id`),
  ADD CONSTRAINT `FK_1B80E486EDDF52D` FOREIGN KEY (`energy_id`) REFERENCES `energy` (`id`),
  ADD CONSTRAINT `FK_1B80E486F4697361` FOREIGN KEY (`fiscal_power_id`) REFERENCES `fiscal_power` (`id`);

--
-- Contraintes pour la table `vehicle_option`
--
ALTER TABLE `vehicle_option`
  ADD CONSTRAINT `FK_F3580163545317D1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F3580163A7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `option` (`id`) ON DELETE CASCADE;
--
-- Base de données : `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Structure de la table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Structure de la table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Structure de la table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Structure de la table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Déchargement des données de la table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'sauvegardeBdd', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"coupart_nutrition\",\"garage-v-parrot\",\"phpmyadmin\",\"test\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure de la table @TABLE@\",\"latex_structure_continued_caption\":\"Structure de la table @TABLE@ (suite)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenu de la table @TABLE@\",\"latex_data_continued_caption\":\"Contenu de la table @TABLE@ (suite)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Structure de la table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Structure de la table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Structure de la table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Déchargement des données de la table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"coupart_nutrition\",\"table\":\"user\"},{\"db\":\"coupart_nutrition\",\"table\":\"user_diet\"},{\"db\":\"coupart_nutrition\",\"table\":\"user_allergen\"},{\"db\":\"coupart_nutrition\",\"table\":\"ingredient\"},{\"db\":\"coupart_nutrition\",\"table\":\"allergen\"},{\"db\":\"coupart_nutrition\",\"table\":\"recipe\"},{\"db\":\"coupart_nutrition\",\"table\":\"ingredient_recipe\"},{\"db\":\"coupart_nutrition\",\"table\":\"diet\"},{\"db\":\"coupart_nutrition\",\"table\":\"review\"},{\"db\":\"coupart_nutrition\",\"table\":\"recipe_diet\"}]');

-- --------------------------------------------------------

--
-- Structure de la table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Structure de la table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Structure de la table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Déchargement des données de la table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-05-21 12:56:30', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"fr\"}');

-- --------------------------------------------------------

--
-- Structure de la table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Structure de la table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Index pour la table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Index pour la table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Index pour la table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Index pour la table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Index pour la table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Index pour la table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Index pour la table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Index pour la table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Index pour la table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Index pour la table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Index pour la table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Index pour la table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Index pour la table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de données : `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
