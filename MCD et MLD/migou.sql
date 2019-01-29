-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost
-- Généré le :  Jeu 24 Janvier 2019 à 15:34
-- Version du serveur :  5.7.24-0ubuntu0.18.04.1
-- Version de PHP :  7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `migou`
--

-- --------------------------------------------------------

--
-- Structure de la table `achat_direct`
--

CREATE TABLE `achat_direct` (
  `id_achat` int(11) NOT NULL,
  `public_ht` float NOT NULL,
  `public_ttc` float NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_total` int(11) NOT NULL,
  `date` date NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_vente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id_article` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `tome` int(11) DEFAULT NULL,
  `isbn` int(11) DEFAULT NULL,
  `date_parution` date DEFAULT NULL,
  `auteur` varchar(255) DEFAULT NULL,
  `editeur` varchar(255) DEFAULT NULL,
  `distributeur` varchar(255) DEFAULT NULL,
  `diffuseur` varchar(255) DEFAULT NULL,
  `secteur` varchar(255) DEFAULT NULL,
  `rayon` varchar(255) DEFAULT NULL,
  `prix_achat` float DEFAULT NULL,
  `remise_achat` int(11) DEFAULT NULL,
  `public_ht` float DEFAULT NULL,
  `public_ttc` float DEFAULT NULL,
  `quantite_stock` int(11) DEFAULT NULL,
  `quantite_disponible` int(11) DEFAULT NULL,
  `quantite_depot_ext` int(11) DEFAULT NULL,
  `quantite_reservation` int(11) DEFAULT NULL,
  `id_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Avoir`
--

CREATE TABLE `Avoir` (
  `id_achat` int(11) NOT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `boisson`
--

CREATE TABLE `boisson` (
  `id_boisson` int(11) NOT NULL,
  `nom_boisson` varchar(50) NOT NULL,
  `prix_boisson` float NOT NULL,
  `quantite_boisson_vente` int(11) NOT NULL,
  `id_vente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `manga` tinyint(1) DEFAULT NULL,
  `comics` tinyint(1) DEFAULT NULL,
  `franco_belge` tinyint(1) DEFAULT NULL,
  `roman_graphique` tinyint(1) DEFAULT NULL,
  `alternatif` tinyint(1) DEFAULT NULL,
  `docu_bd` tinyint(1) DEFAULT NULL,
  `album` tinyint(1) DEFAULT NULL,
  `activitee` tinyint(1) DEFAULT NULL,
  `divers` tinyint(1) NOT NULL,
  `roman` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `sexe` varchar(50) DEFAULT NULL,
  `rue` varchar(250) DEFAULT NULL,
  `code_postall` int(11) DEFAULT NULL,
  `ville` varchar(250) DEFAULT NULL,
  `mail` varchar(250) DEFAULT NULL,
  `tel_fixe` int(11) DEFAULT NULL,
  `tel_mobile` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL,
  `date` date NOT NULL,
  `prix_total` int(11) NOT NULL,
  `date_vente_commande` date NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_vente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `contient`
--

CREATE TABLE `contient` (
  `id_article` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `depot_exterieur`
--

CREATE TABLE `depot_exterieur` (
  `id_depot` int(11) NOT NULL,
  `emprunteur` varchar(250) NOT NULL,
  `titre` varchar(250) NOT NULL,
  `date_depot` date NOT NULL,
  `date_rappel` date NOT NULL,
  `etat_depot` varchar(250) NOT NULL,
  `id_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `dessert_divers`
--

CREATE TABLE `dessert_divers` (
  `id_dessert_divers` int(11) NOT NULL,
  `nom_dessert_divers` varchar(50) NOT NULL,
  `prix_dessert_divers` float NOT NULL,
  `quantite` int(11) NOT NULL,
  `id_vente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `historique_client`
--

CREATE TABLE `historique_client` (
  `id_historique` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `tome` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `chiffre_affaire` int(11) NOT NULL,
  `remise_fidelitee` int(11) NOT NULL,
  `retour_client` date DEFAULT NULL,
  `depot` varchar(250) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `mode_paiement`
--

CREATE TABLE `mode_paiement` (
  `id_paiement` int(11) NOT NULL,
  `especes` float DEFAULT NULL,
  `carte_bleu` float DEFAULT NULL,
  `cheques` float DEFAULT NULL,
  `ticket_lire` float DEFAULT NULL,
  `ticket_resto` float NOT NULL,
  `arrhes` float DEFAULT NULL,
  `virement` float DEFAULT NULL,
  `remise_forfaitaire` float DEFAULT NULL,
  `avoir` float DEFAULT NULL,
  `bon_achat` float NOT NULL,
  `paiement_multiple` varchar(250) DEFAULT NULL,
  `id_vente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id_panier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reception_commande`
--

CREATE TABLE `reception_commande` (
  `id_reception` int(11) NOT NULL,
  `date_reception` date NOT NULL,
  `id_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `relation_categorie`
--

CREATE TABLE `relation_categorie` (
  `id_categorie` int(11) NOT NULL,
  `id_secteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `repas`
--

CREATE TABLE `repas` (
  `id_repas` int(11) NOT NULL,
  `nom_repas` varchar(255) NOT NULL,
  `prix_repas` float NOT NULL,
  `quantite` int(11) NOT NULL,
  `id_vente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

CREATE TABLE `secteur` (
  `id_secteur` int(11) NOT NULL,
  `bd` tinyint(1) DEFAULT NULL,
  `jeunesse` tinyint(1) DEFAULT NULL,
  `roman` tinyint(1) DEFAULT NULL,
  `occasion` tinyint(1) DEFAULT NULL,
  `id_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `id_stock` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `tome` int(11) DEFAULT NULL,
  `quantite` int(11) NOT NULL,
  `auteur` varchar(255) DEFAULT NULL,
  `editeur` varchar(255) DEFAULT NULL,
  `isbn` int(11) DEFAULT NULL,
  `prix_achat` float DEFAULT NULL,
  `chiffre_affaire_stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE `vente` (
  `id_vente` int(11) NOT NULL,
  `prix_ht` float NOT NULL,
  `taux_tva` float NOT NULL,
  `total_tva` float NOT NULL,
  `prix_ttc` float NOT NULL,
  `quantite` int(11) NOT NULL,
  `quantite_boisson_vente` int(11) NOT NULL,
  `quantite_dessert_divers_vente` int(11) NOT NULL,
  `date` date NOT NULL,
  `date_vente_commande` date NOT NULL,
  `id_repas` int(11) NOT NULL,
  `id_boisson` int(11) NOT NULL,
  `id_dessert_divers` int(11) NOT NULL,
  `id_achat` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `achat_direct`
--
ALTER TABLE `achat_direct`
  ADD PRIMARY KEY (`id_achat`),
  ADD UNIQUE KEY `achat_direct_vente0_AK` (`id_vente`),
  ADD KEY `achat_direct_client0_FK` (`id_client`);

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `article_stock0_FK` (`id_stock`);

--
-- Index pour la table `Avoir`
--
ALTER TABLE `Avoir`
  ADD PRIMARY KEY (`id_achat`,`id_article`),
  ADD KEY `Avoir_article1_FK` (`id_article`);

--
-- Index pour la table `boisson`
--
ALTER TABLE `boisson`
  ADD PRIMARY KEY (`id_boisson`),
  ADD UNIQUE KEY `boisson_vente0_AK` (`id_vente`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD UNIQUE KEY `commande_client_vente0_AK` (`id_vente`),
  ADD KEY `commande_client_client0_FK` (`id_client`);

--
-- Index pour la table `contient`
--
ALTER TABLE `contient`
  ADD PRIMARY KEY (`id_article`,`id_commande`),
  ADD KEY `contient_commande_client1_FK` (`id_commande`);

--
-- Index pour la table `depot_exterieur`
--
ALTER TABLE `depot_exterieur`
  ADD PRIMARY KEY (`id_depot`),
  ADD KEY `depot_exterieur_stock0_FK` (`id_stock`);

--
-- Index pour la table `dessert_divers`
--
ALTER TABLE `dessert_divers`
  ADD PRIMARY KEY (`id_dessert_divers`),
  ADD UNIQUE KEY `dessert_divers_vente0_AK` (`id_vente`);

--
-- Index pour la table `historique_client`
--
ALTER TABLE `historique_client`
  ADD PRIMARY KEY (`id_historique`),
  ADD UNIQUE KEY `historique_client_client0_AK` (`id_client`);

--
-- Index pour la table `mode_paiement`
--
ALTER TABLE `mode_paiement`
  ADD PRIMARY KEY (`id_paiement`),
  ADD KEY `mode_paiement_vente0_FK` (`id_vente`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id_panier`);

--
-- Index pour la table `reception_commande`
--
ALTER TABLE `reception_commande`
  ADD PRIMARY KEY (`id_reception`),
  ADD KEY `reception_commande_stock0_FK` (`id_stock`);

--
-- Index pour la table `relation_categorie`
--
ALTER TABLE `relation_categorie`
  ADD PRIMARY KEY (`id_categorie`,`id_secteur`),
  ADD KEY `relation_categorie_secteur1_FK` (`id_secteur`);

--
-- Index pour la table `repas`
--
ALTER TABLE `repas`
  ADD PRIMARY KEY (`id_repas`),
  ADD UNIQUE KEY `repas_vente0_AK` (`id_vente`);

--
-- Index pour la table `secteur`
--
ALTER TABLE `secteur`
  ADD PRIMARY KEY (`id_secteur`),
  ADD KEY `secteur_stock0_FK` (`id_stock`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id_stock`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`id_vente`),
  ADD UNIQUE KEY `vente_repas0_AK` (`id_repas`),
  ADD UNIQUE KEY `vente_boisson1_AK` (`id_boisson`),
  ADD UNIQUE KEY `vente_dessert_divers2_AK` (`id_dessert_divers`),
  ADD UNIQUE KEY `vente_achat_direct3_AK` (`id_achat`),
  ADD UNIQUE KEY `vente_commande_client4_AK` (`id_commande`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `achat_direct`
--
ALTER TABLE `achat_direct`
  MODIFY `id_achat` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `boisson`
--
ALTER TABLE `boisson`
  MODIFY `id_boisson` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `depot_exterieur`
--
ALTER TABLE `depot_exterieur`
  MODIFY `id_depot` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `dessert_divers`
--
ALTER TABLE `dessert_divers`
  MODIFY `id_dessert_divers` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `historique_client`
--
ALTER TABLE `historique_client`
  MODIFY `id_historique` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `mode_paiement`
--
ALTER TABLE `mode_paiement`
  MODIFY `id_paiement` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `id_panier` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `reception_commande`
--
ALTER TABLE `reception_commande`
  MODIFY `id_reception` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `repas`
--
ALTER TABLE `repas`
  MODIFY `id_repas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `secteur`
--
ALTER TABLE `secteur`
  MODIFY `id_secteur` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `stock`
--
ALTER TABLE `stock`
  MODIFY `id_stock` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `vente`
--
ALTER TABLE `vente`
  MODIFY `id_vente` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `achat_direct`
--
ALTER TABLE `achat_direct`
  ADD CONSTRAINT `achat_direct_client0_FK` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `achat_direct_vente1_FK` FOREIGN KEY (`id_vente`) REFERENCES `vente` (`id_vente`);

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_stock0_FK` FOREIGN KEY (`id_stock`) REFERENCES `stock` (`id_stock`);

--
-- Contraintes pour la table `Avoir`
--
ALTER TABLE `Avoir`
  ADD CONSTRAINT `Avoir_achat_direct0_FK` FOREIGN KEY (`id_achat`) REFERENCES `achat_direct` (`id_achat`),
  ADD CONSTRAINT `Avoir_article1_FK` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`);

--
-- Contraintes pour la table `boisson`
--
ALTER TABLE `boisson`
  ADD CONSTRAINT `boisson_vente0_FK` FOREIGN KEY (`id_vente`) REFERENCES `vente` (`id_vente`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_client_client0_FK` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `commande_client_vente1_FK` FOREIGN KEY (`id_vente`) REFERENCES `vente` (`id_vente`);

--
-- Contraintes pour la table `contient`
--
ALTER TABLE `contient`
  ADD CONSTRAINT `contient_article0_FK` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`),
  ADD CONSTRAINT `contient_commande_client1_FK` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`);

--
-- Contraintes pour la table `depot_exterieur`
--
ALTER TABLE `depot_exterieur`
  ADD CONSTRAINT `depot_exterieur_stock0_FK` FOREIGN KEY (`id_stock`) REFERENCES `stock` (`id_stock`);

--
-- Contraintes pour la table `dessert_divers`
--
ALTER TABLE `dessert_divers`
  ADD CONSTRAINT `dessert_divers_vente0_FK` FOREIGN KEY (`id_vente`) REFERENCES `vente` (`id_vente`);

--
-- Contraintes pour la table `historique_client`
--
ALTER TABLE `historique_client`
  ADD CONSTRAINT `historique_client_client0_FK` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `mode_paiement`
--
ALTER TABLE `mode_paiement`
  ADD CONSTRAINT `mode_paiement_vente0_FK` FOREIGN KEY (`id_vente`) REFERENCES `vente` (`id_vente`);

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`id_panier`) REFERENCES `commande` (`id_commande`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reception_commande`
--
ALTER TABLE `reception_commande`
  ADD CONSTRAINT `reception_commande_stock0_FK` FOREIGN KEY (`id_stock`) REFERENCES `stock` (`id_stock`);

--
-- Contraintes pour la table `relation_categorie`
--
ALTER TABLE `relation_categorie`
  ADD CONSTRAINT `relation_categorie_categorie0_FK` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`),
  ADD CONSTRAINT `relation_categorie_secteur1_FK` FOREIGN KEY (`id_secteur`) REFERENCES `secteur` (`id_secteur`);

--
-- Contraintes pour la table `repas`
--
ALTER TABLE `repas`
  ADD CONSTRAINT `repas_vente0_FK` FOREIGN KEY (`id_vente`) REFERENCES `vente` (`id_vente`);

--
-- Contraintes pour la table `secteur`
--
ALTER TABLE `secteur`
  ADD CONSTRAINT `secteur_stock0_FK` FOREIGN KEY (`id_stock`) REFERENCES `stock` (`id_stock`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `vente_achat_direct3_FK` FOREIGN KEY (`id_achat`) REFERENCES `achat_direct` (`id_achat`),
  ADD CONSTRAINT `vente_boisson1_FK` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`),
  ADD CONSTRAINT `vente_commande_client4_FK` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `vente_dessert_divers2_FK` FOREIGN KEY (`id_dessert_divers`) REFERENCES `dessert_divers` (`id_dessert_divers`),
  ADD CONSTRAINT `vente_repas0_FK` FOREIGN KEY (`id_repas`) REFERENCES `repas` (`id_repas`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
