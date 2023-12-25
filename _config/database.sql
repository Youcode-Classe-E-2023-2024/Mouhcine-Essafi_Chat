-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 25 déc. 2023 à 12:15
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `chat-room`
--

-- --------------------------------------------------------

--
-- Structure de la table `friend_list`
--

CREATE TABLE `friend_list` (
                               `me` int(11) DEFAULT NULL,
                               `myfriend` int(11) DEFAULT NULL,
                               `block_checker` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `friend_request`
--

CREATE TABLE `friend_request` (
                                  `invitation_id` int(11) NOT NULL,
                                  `sender` int(11) DEFAULT NULL,
                                  `receiver` int(11) DEFAULT NULL,
                                  `checker` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
                           `message_id` int(11) NOT NULL,
                           `message` text DEFAULT NULL,
                           `room_id` int(11) DEFAULT NULL,
                           `user_id` int(11) DEFAULT NULL,
                           `date` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `room`
--

CREATE TABLE `room` (
                        `room_id` int(11) NOT NULL,
                        `room_name` varchar(255) NOT NULL,
                        `creator` int(11) DEFAULT NULL,
                        `is_deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `room_invitation`
--

CREATE TABLE `room_invitation` (
                                   `invitation_id` int(11) NOT NULL,
                                   `room_id` int(11) DEFAULT NULL,
                                   `sender` int(11) DEFAULT NULL,
                                   `receiver` int(11) DEFAULT NULL,
                                   `checker` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `room_member`
--

CREATE TABLE `room_member` (
                               `room_id` int(11) DEFAULT NULL,
                               `user_id` int(11) DEFAULT NULL,
                               `banned` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
                               `user_id` int(11) NOT NULL,
                               `email` varchar(255) NOT NULL,
                               `password` text NOT NULL,
                               `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `friend_list`
--
ALTER TABLE `friend_list`
    ADD KEY `me` (`me`),
  ADD KEY `myfriend` (`myfriend`);

--
-- Index pour la table `friend_request`
--
ALTER TABLE `friend_request`
    ADD PRIMARY KEY (`invitation_id`),
  ADD KEY `sender` (`sender`),
  ADD KEY `receiver` (`receiver`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
    ADD PRIMARY KEY (`message_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `room`
--
ALTER TABLE `room`
    ADD PRIMARY KEY (`room_id`),
  ADD KEY `creator` (`creator`);

--
-- Index pour la table `room_invitation`
--
ALTER TABLE `room_invitation`
    ADD PRIMARY KEY (`invitation_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `sender` (`sender`),
  ADD KEY `receiver` (`receiver`);

--
-- Index pour la table `room_member`
--
ALTER TABLE `room_member`
    ADD KEY `room_id` (`room_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
    ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `friend_request`
--
ALTER TABLE `friend_request`
    MODIFY `invitation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
    MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `room`
--
ALTER TABLE `room`
    MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `room_invitation`
--
ALTER TABLE `room_invitation`
    MODIFY `invitation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
    MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `friend_list`
--
ALTER TABLE `friend_list`
    ADD CONSTRAINT `friend_list_ibfk_1` FOREIGN KEY (`me`) REFERENCES `utilisateur` (`user_id`),
  ADD CONSTRAINT `friend_list_ibfk_2` FOREIGN KEY (`myfriend`) REFERENCES `utilisateur` (`user_id`);

--
-- Contraintes pour la table `friend_request`
--
ALTER TABLE `friend_request`
    ADD CONSTRAINT `friend_request_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `utilisateur` (`user_id`),
  ADD CONSTRAINT `friend_request_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `utilisateur` (`user_id`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
    ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `utilisateur` (`user_id`);

--
-- Contraintes pour la table `room`
--
ALTER TABLE `room`
    ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `utilisateur` (`user_id`);

--
-- Contraintes pour la table `room_invitation`
--
ALTER TABLE `room_invitation`
    ADD CONSTRAINT `room_invitation_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  ADD CONSTRAINT `room_invitation_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `utilisateur` (`user_id`),
  ADD CONSTRAINT `room_invitation_ibfk_3` FOREIGN KEY (`receiver`) REFERENCES `utilisateur` (`user_id`);

--
-- Contraintes pour la table `room_member`
--
ALTER TABLE `room_member`
    ADD CONSTRAINT `room_member_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  ADD CONSTRAINT `room_member_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `utilisateur` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
