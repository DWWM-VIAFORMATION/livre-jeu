CREATE TABLE `alternative` (
  `id` int(11) NOT NULL,
  `etape_precedente_id` int(11) DEFAULT NULL,
  `etape_suivante_id` int(11) NOT NULL,
  `texte_ambiance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `avatar`
--

CREATE TABLE `avatar` (
  `id` int(11) NOT NULL,
  `nom_fichier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `aventure`
--

CREATE TABLE `aventure` (
  `id` int(11) NOT NULL,
  `premiere_etape_id` int(11) DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230301104951', '2023-03-01 11:50:22', 430),
('DoctrineMigrations\\Version20230301133521', '2023-03-01 14:35:27', 14);

-- --------------------------------------------------------

--
-- Structure de la table `etape`
--

CREATE TABLE `etape` (
  `id` int(11) NOT NULL,
  `aventure_id` int(11) DEFAULT NULL,
  `fin_aventure_id` int(11) DEFAULT NULL,
  `texte_ambiance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personnage`
--

CREATE TABLE `personnage` (
  `id` int(11) NOT NULL,
  `avatar_id` int(11) DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personnage_aventure`
--

CREATE TABLE `personnage_aventure` (
  `personnage_id` int(11) NOT NULL,
  `aventure_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `alternative`
--
ALTER TABLE `alternative`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_EFF5DFA3F94EAC8` (`etape_precedente_id`),
  ADD KEY `IDX_EFF5DFA62A0957E` (`etape_suivante_id`);

--
-- Index pour la table `avatar`
--
ALTER TABLE `avatar`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `aventure`
--
ALTER TABLE `aventure`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1E56DE4B9551B165` (`premiere_etape_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `etape`
--
ALTER TABLE `etape`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_285F75DD873DBB5F` (`aventure_id`),
  ADD KEY `IDX_285F75DDC3DCFBBF` (`fin_aventure_id`);

--
-- Index pour la table `personnage`
--
ALTER TABLE `personnage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6AEA486D86383B10` (`avatar_id`);

--
-- Index pour la table `personnage_aventure`
--
ALTER TABLE `personnage_aventure`
  ADD PRIMARY KEY (`personnage_id`,`aventure_id`),
  ADD KEY `IDX_697DF1E55E315342` (`personnage_id`),
  ADD KEY `IDX_697DF1E5873DBB5F` (`aventure_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `alternative`
--
ALTER TABLE `alternative`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `avatar`
--
ALTER TABLE `avatar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `aventure`
--
ALTER TABLE `aventure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `etape`
--
ALTER TABLE `etape`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `personnage`
--
ALTER TABLE `personnage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `alternative`
--
ALTER TABLE `alternative`
  ADD CONSTRAINT `FK_EFF5DFA3F94EAC8` FOREIGN KEY (`etape_precedente_id`) REFERENCES `etape` (`id`),
  ADD CONSTRAINT `FK_EFF5DFA62A0957E` FOREIGN KEY (`etape_suivante_id`) REFERENCES `etape` (`id`);

--
-- Contraintes pour la table `aventure`
--
ALTER TABLE `aventure`
  ADD CONSTRAINT `FK_1E56DE4B9551B165` FOREIGN KEY (`premiere_etape_id`) REFERENCES `etape` (`id`);

--
-- Contraintes pour la table `etape`
--
ALTER TABLE `etape`
  ADD CONSTRAINT `FK_285F75DD873DBB5F` FOREIGN KEY (`aventure_id`) REFERENCES `aventure` (`id`),
  ADD CONSTRAINT `FK_285F75DDC3DCFBBF` FOREIGN KEY (`fin_aventure_id`) REFERENCES `aventure` (`id`);

--
-- Contraintes pour la table `personnage`
--
ALTER TABLE `personnage`
  ADD CONSTRAINT `FK_6AEA486D86383B10` FOREIGN KEY (`avatar_id`) REFERENCES `avatar` (`id`);

--
-- Contraintes pour la table `personnage_aventure`
--
ALTER TABLE `personnage_aventure`
  ADD CONSTRAINT `FK_697DF1E55E315342` FOREIGN KEY (`personnage_id`) REFERENCES `personnage` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_697DF1E5873DBB5F` FOREIGN KEY (`aventure_id`) REFERENCES `aventure` (`id`) ON DELETE CASCADE;
COMMIT;
