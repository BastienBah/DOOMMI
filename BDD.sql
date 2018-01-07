-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:8889
-- Généré le :  Dim 07 Janvier 2018 à 11:30
-- Version du serveur :  5.6.35
-- Version de PHP :  7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `DOOMMI`
--

-- --------------------------------------------------------

--
-- Structure de la table `CLASSE`
--

CREATE TABLE `CLASSE` (
  `CdClas` char(6) NOT NULL,
  `LibClas` char(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `DETAILPROJ`
--

CREATE TABLE `DETAILPROJ` (
  `NumDetail` int(11) NOT NULL,
  `LibDetail` text NOT NULL,
  `NumProj` int(11) NOT NULL,
  `NumEtu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ETUDIANT`
--

CREATE TABLE `ETUDIANT` (
  `NumEtu` int(11) NOT NULL,
  `PseudoEtu` char(20) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `CdClas` char(6) DEFAULT NULL,
  `CdLang` char(6) DEFAULT NULL,
  `NomEtu` char(30) DEFAULT NULL,
  `PrenomEtu` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ETUDIANT`
--

INSERT INTO `ETUDIANT` (`NumEtu`, `PseudoEtu`, `Password`, `Email`, `CdClas`, `CdLang`, `NomEtu`, `PrenomEtu`) VALUES
(1, 'Bastos', 'azerty', 'test@test.fr', NULL, NULL, NULL, NULL),
(4, 'test', 'fF^IhGY25ncVXijA', 'azerty@azerty.fr', NULL, NULL, NULL, NULL),
(5, 'root', 'fF^IhGY25ncVXijA', '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `GROUPETU`
--

CREATE TABLE `GROUPETU` (
  `CdGroup` char(4) NOT NULL,
  `NumEtu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `GROUPPROJ`
--

CREATE TABLE `GROUPPROJ` (
  `CdGroup` char(4) NOT NULL,
  `NumProj` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `GROUPTRAVAIL`
--

CREATE TABLE `GROUPTRAVAIL` (
  `CdGroup` char(4) NOT NULL,
  `LibGroup` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `LANGUE`
--

CREATE TABLE `LANGUE` (
  `CdLang` char(10) NOT NULL,
  `LibLang` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `MATIERE`
--

CREATE TABLE `MATIERE` (
  `CdMat` char(6) NOT NULL,
  `LibMat` char(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ORGANISATION`
--

CREATE TABLE `ORGANISATION` (
  `CdOrga` char(4) NOT NULL,
  `LibOrga` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `PROJET`
--

CREATE TABLE `PROJET` (
  `NumProj` int(11) NOT NULL,
  `DtDebProj` datetime NOT NULL,
  `DtFinProj` datetime NOT NULL,
  `NumEtu` int(11) NOT NULL,
  `CdMat` char(6) NOT NULL,
  `CdCours` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `REALDETAILPROJ`
--

CREATE TABLE `REALDETAILPROJ` (
  `NumEtu` int(11) NOT NULL,
  `NumDetail` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `REALPROJ`
--

CREATE TABLE `REALPROJ` (
  `NumEtu` int(11) NOT NULL,
  `NumProj` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `REPARTITION`
--

CREATE TABLE `REPARTITION` (
  `NumEtu` int(11) NOT NULL,
  `CdOrga` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `TYPECOURS`
--

CREATE TABLE `TYPECOURS` (
  `CdCours` char(3) NOT NULL,
  `LibCours` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `CLASSE`
--
ALTER TABLE `CLASSE`
  ADD PRIMARY KEY (`CdClas`);

--
-- Index pour la table `DETAILPROJ`
--
ALTER TABLE `DETAILPROJ`
  ADD PRIMARY KEY (`NumDetail`),
  ADD KEY `DETAILPROJET_1_FK` (`NumProj`),
  ADD KEY `DETAILPROJET_2_FK` (`NumEtu`);

--
-- Index pour la table `ETUDIANT`
--
ALTER TABLE `ETUDIANT`
  ADD PRIMARY KEY (`NumEtu`),
  ADD UNIQUE KEY `PseudoEtu` (`PseudoEtu`),
  ADD KEY `ETUDIANT_1_FK` (`CdClas`),
  ADD KEY `ETUDIANT_2_FK` (`CdLang`);

--
-- Index pour la table `GROUPETU`
--
ALTER TABLE `GROUPETU`
  ADD PRIMARY KEY (`CdGroup`,`NumEtu`),
  ADD KEY `GROUPETU_1_FK` (`CdGroup`),
  ADD KEY `GROUPETU_2_FK` (`NumEtu`);

--
-- Index pour la table `GROUPPROJ`
--
ALTER TABLE `GROUPPROJ`
  ADD PRIMARY KEY (`CdGroup`,`NumProj`),
  ADD KEY `GROUPPROJ_1_FK` (`CdGroup`),
  ADD KEY `GROUPPROJ_2_FK` (`NumProj`);

--
-- Index pour la table `GROUPTRAVAIL`
--
ALTER TABLE `GROUPTRAVAIL`
  ADD PRIMARY KEY (`CdGroup`);

--
-- Index pour la table `LANGUE`
--
ALTER TABLE `LANGUE`
  ADD PRIMARY KEY (`CdLang`);

--
-- Index pour la table `MATIERE`
--
ALTER TABLE `MATIERE`
  ADD PRIMARY KEY (`CdMat`);

--
-- Index pour la table `ORGANISATION`
--
ALTER TABLE `ORGANISATION`
  ADD PRIMARY KEY (`CdOrga`);

--
-- Index pour la table `PROJET`
--
ALTER TABLE `PROJET`
  ADD PRIMARY KEY (`NumProj`),
  ADD KEY `PROJET_1_FK` (`NumEtu`),
  ADD KEY `PROJET_2_FK` (`CdMat`),
  ADD KEY `PROJET_3_FK` (`CdCours`);

--
-- Index pour la table `REALDETAILPROJ`
--
ALTER TABLE `REALDETAILPROJ`
  ADD PRIMARY KEY (`NumEtu`,`NumDetail`),
  ADD KEY `REALDETAILPROJET_1_FK` (`NumEtu`),
  ADD KEY `REALDETAILPROJET_2_FK` (`NumDetail`);

--
-- Index pour la table `REALPROJ`
--
ALTER TABLE `REALPROJ`
  ADD PRIMARY KEY (`NumEtu`,`NumProj`),
  ADD KEY `REALPROJ_1_FK` (`NumEtu`),
  ADD KEY `REALPROJ_2_FK` (`NumProj`);

--
-- Index pour la table `REPARTITION`
--
ALTER TABLE `REPARTITION`
  ADD PRIMARY KEY (`NumEtu`,`CdOrga`),
  ADD KEY `REPARTITION_1_FK` (`NumEtu`),
  ADD KEY `REPARTITION_2_FK` (`CdOrga`);

--
-- Index pour la table `TYPECOURS`
--
ALTER TABLE `TYPECOURS`
  ADD PRIMARY KEY (`CdCours`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `DETAILPROJ`
--
ALTER TABLE `DETAILPROJ`
  MODIFY `NumDetail` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `ETUDIANT`
--
ALTER TABLE `ETUDIANT`
  MODIFY `NumEtu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `PROJET`
--
ALTER TABLE `PROJET`
  MODIFY `NumProj` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `DETAILPROJ`
--
ALTER TABLE `DETAILPROJ`
  ADD CONSTRAINT `DETAILPROJ_1_FK` FOREIGN KEY (`NumProj`) REFERENCES `PROJET` (`NumProj`) ON DELETE CASCADE,
  ADD CONSTRAINT `DETAILPROJ_2_FK` FOREIGN KEY (`NumEtu`) REFERENCES `ETUDIANT` (`NumEtu`);

--
-- Contraintes pour la table `ETUDIANT`
--
ALTER TABLE `ETUDIANT`
  ADD CONSTRAINT `ETUDIANT_1_FK` FOREIGN KEY (`CdClas`) REFERENCES `CLASSE` (`CdClas`),
  ADD CONSTRAINT `ETUDIANT_2_FK` FOREIGN KEY (`CdLang`) REFERENCES `LANGUE` (`CdLang`);

--
-- Contraintes pour la table `GROUPETU`
--
ALTER TABLE `GROUPETU`
  ADD CONSTRAINT `GROUPETU_1_FK` FOREIGN KEY (`CdGroup`) REFERENCES `GROUPTRAVAIL` (`CdGroup`),
  ADD CONSTRAINT `GROUPETU_2_FK` FOREIGN KEY (`NumEtu`) REFERENCES `ETUDIANT` (`NumEtu`);

--
-- Contraintes pour la table `GROUPPROJ`
--
ALTER TABLE `GROUPPROJ`
  ADD CONSTRAINT `GROUPPROJ_1_FK` FOREIGN KEY (`CdGroup`) REFERENCES `GROUPTRAVAIL` (`CdGroup`),
  ADD CONSTRAINT `GROUPPROJ_2_FK` FOREIGN KEY (`NumProj`) REFERENCES `PROJET` (`NumProj`);

--
-- Contraintes pour la table `PROJET`
--
ALTER TABLE `PROJET`
  ADD CONSTRAINT `PROJET_1_FK` FOREIGN KEY (`NumEtu`) REFERENCES `ETUDIANT` (`NumEtu`),
  ADD CONSTRAINT `PROJET_2_FK` FOREIGN KEY (`CdMat`) REFERENCES `MATIERE` (`CdMat`),
  ADD CONSTRAINT `PROJET_3_FK` FOREIGN KEY (`CdCours`) REFERENCES `TYPECOURS` (`CdCours`);

--
-- Contraintes pour la table `REALDETAILPROJ`
--
ALTER TABLE `REALDETAILPROJ`
  ADD CONSTRAINT `REALDETAILPROJ_1_FK` FOREIGN KEY (`NumEtu`) REFERENCES `ETUDIANT` (`NumEtu`),
  ADD CONSTRAINT `REALDETAILPROJ_2_FK` FOREIGN KEY (`NumDetail`) REFERENCES `DETAILPROJ` (`NumDetail`) ON DELETE CASCADE;

--
-- Contraintes pour la table `REALPROJ`
--
ALTER TABLE `REALPROJ`
  ADD CONSTRAINT `REALPROJ_1_FK` FOREIGN KEY (`NumEtu`) REFERENCES `ETUDIANT` (`NumEtu`),
  ADD CONSTRAINT `REALPROJ_2_FK` FOREIGN KEY (`NumProj`) REFERENCES `PROJET` (`NumProj`) ON DELETE CASCADE;

--
-- Contraintes pour la table `REPARTITION`
--
ALTER TABLE `REPARTITION`
  ADD CONSTRAINT `REPARTITION_1_FK` FOREIGN KEY (`NumEtu`) REFERENCES `ETUDIANT` (`NumEtu`),
  ADD CONSTRAINT `REPARTITION_2_FK` FOREIGN KEY (`CdOrga`) REFERENCES `ORGANISATION` (`CdOrga`);
