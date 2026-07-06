-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 04 juil. 2026 à 08:22
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
-- Base de données : `proofcoach`
--

-- --------------------------------------------------------

--
-- Structure de la table `analyses_ia`
--

CREATE TABLE `analyses_ia` (
  `id` int(11) NOT NULL,
  `demonstration_id` int(11) DEFAULT NULL,
  `resume` text DEFAULT NULL,
  `score_logique` int(11) DEFAULT NULL,
  `score_redaction` int(11) DEFAULT NULL,
  `niveau_confiance` int(11) DEFAULT NULL,
  `analyse_complete` longtext DEFAULT NULL,
  `date_analyse` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `analyses_ia`
--

INSERT INTO `analyses_ia` (`id`, `demonstration_id`, `resume`, `score_logique`, `score_redaction`, `niveau_confiance`, `analyse_complete`, `date_analyse`) VALUES
(3, 8, 'Votre démonstration est globalement correcte. \r\nQuelques justifications doivent être précisées.', 80, 75, 1, 'Analyse automatique :\n\n\r\nPoints positifs :\r\n- Bonne compréhension du problème.\r\n\r\nPoints à améliorer :\r\n- Justifier davantage les étapes intermédiaires.\r\n', '2026-06-25 17:46:40');

-- --------------------------------------------------------

--
-- Structure de la table `demonstrations`
--

CREATE TABLE `demonstrations` (
  `id` int(11) NOT NULL,
  `exo_id` int(11) DEFAULT NULL,
  `contenu` longtext DEFAULT NULL,
  `version` int(11) DEFAULT 1,
  `date_envoi` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `demonstrations`
--

INSERT INTO `demonstrations` (`id`, `exo_id`, `contenu`, `version`, `date_envoi`) VALUES
(8, 8, '<p>Soit la suite (u_n) définie par :</p><p>u₀ &gt; 0</p><p>et pour tout n ≥ 0 :</p><p>u(n+1) = 1/2 ( u(n) + 2/u(n) )</p><p>On va démontrer que cette suite converge vers √2.</p><p><br></p><h3>1) Montrons que tous les termes sont positifs</h3><p>On sait que u₀ &gt; 0.</p><p>Supposons que u(n) &gt; 0.</p><p>Alors 2/u(n) est positif, donc :</p><p>u(n) + 2/u(n) &gt; 0</p><p>Comme on divise par 2, on obtient :</p><p>u(n+1) &gt; 0</p><p>Donc par récurrence :</p><p>Pour tout n ≥ 0, u(n) &gt; 0.</p><h3>2) Montrons que la suite est minorée par √2</h3><p>Calculons :</p><p>u(n+1) - √2</p><p>= 1/2 (u(n) + 2/u(n)) - √2</p><p>On met au même dénominateur :</p><p>= (u(n)² - 2√2 u(n) + 2) / (2u(n))</p><p>Or :</p><p>u(n)² - 2√2 u(n) + 2</p><p>est une identité remarquable :</p><p>= (u(n) - √2)²</p><p>Donc :</p><p>u(n+1) - √2 = (u(n) - √2)² / (2u(n))</p><p>Le numérateur est un carré donc il est positif, et le dénominateur est positif car u(n) &gt; 0.</p><p>Donc :</p><p>u(n+1) - √2 ≥ 0</p><p>Ainsi :</p><p>u(n+1) ≥ √2</p><p>La suite est donc minorée par √2 à partir du rang 1.</p><h3>3) Montrons que la suite est décroissante</h3><p>Calculons :</p><p>u(n+1) - u(n)</p><p>= 1/2(u(n) + 2/u(n)) - u(n)</p><p>= 1/2(2/u(n) - u(n))</p><p>= (2 - u(n)²)/(2u(n))</p><p>Or, pour n ≥ 1 :</p><p>u(n) ≥ √2</p><p>donc :</p><p>u(n)² ≥ 2</p><p>Ainsi :</p><p>2 - u(n)² ≤ 0</p><p>Comme 2u(n) &gt; 0 :</p><p>u(n+1) - u(n) ≤ 0</p><p>Donc :</p><p>u(n+1) ≤ u(n)</p><p>La suite est décroissante.</p><h3>4) Conclusion sur la convergence</h3><p>À partir du rang 1, la suite est :</p><p><br></p><ul><li>décroissante ;</li><li>minorée par √2.</li></ul><p>D\'après le théorème des suites monotones, la suite converge.</p><h3>5) Calcul de la limite</h3><p>On note :</p><p>lim u(n) = L</p><p>Comme la suite converge, on peut passer à la limite dans la relation :</p><p>L = 1/2(L + 2/L)</p><p>Donc :</p><p>2L = L + 2/L</p><p>Donc :</p><p>L = 2/L</p><p>D\'où :</p><p>L² = 2</p><p>Donc :</p><p>L = √2 ou L = -√2</p><p>Mais tous les termes de la suite sont positifs, donc la limite est positive.</p><p>Ainsi :</p><p><strong>L = √2</strong></p><p>Conclusion :</p><p>La suite (u_n) converge et sa limite est √2.</p><p><br></p>', 1, '2026-06-25 17:46:40');

-- --------------------------------------------------------

--
-- Structure de la table `erreurs`
--

CREATE TABLE `erreurs` (
  `id` int(11) NOT NULL,
  `analyse_id` int(11) DEFAULT NULL,
  `type_erreur` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `gravite` enum('faible','moyenne','forte') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `exercices`
--

CREATE TABLE `exercices` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `enonce` text DEFAULT NULL,
  `domaine` varchar(100) DEFAULT NULL,
  `theme` varchar(100) DEFAULT NULL,
  `niveau` varchar(50) DEFAULT NULL,
  `difficulte` int(11) DEFAULT NULL,
  `solution_modele` text DEFAULT NULL,
  `createur_id` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `exercices`
--

INSERT INTO `exercices` (`id`, `titre`, `enonce`, `domaine`, `theme`, `niveau`, `difficulte`, `solution_modele`, `createur_id`, `date_creation`) VALUES
(2, 'Fonction dérivable', 'Démontrer que toute fonction dérivable est continue.', 'Analyse', 'Fonctions', 'Licence 1', 2, 'La dérivabilité implique la continuité.', NULL, '2026-06-20 21:05:52'),
(3, 'Théorème de Pythagore', 'Démontrer la relation entre les côtés d’un triangle rectangle.', 'Géométrie', 'Triangle', 'Lycée', 2, 'Dans un triangle rectangle, le carré de l’hypoténuse est égal à la somme des carrés des deux autres côtés.', NULL, '2026-06-20 21:05:52'),
(7, 'Suite algébrique', 'Proposer une démonstration sur le thème Suite algébrique au niveau Lycée.', 'Suite algébrique', NULL, 'Lycée', NULL, NULL, NULL, '2026-06-24 15:37:36'),
(8, 'Démonstration de la convergence d\'une suite de Héron', 'Soit la suite numérique $(u_n)_{n \\ge 0}$ définie par son premier terme $u_0 > 0$ et la relation de récurrence :\n$$ u_{n+1} = \\frac{1}{2} \\left( u_n + \\frac{2}{u_n} \\right) \\quad \\text{pour tout } n \\ge 0 $$ \nCet algorithme est connu sous le nom de méthode de Héron pour le calcul de $\\sqrt{2}$.\n\n**Votre tâche est de démontrer rigoureusement que cette suite converge et de déterminer sa limite.**\n\nPour cela, vous pouvez suivre les étapes suivantes :\n\n1.  Démontrez que pour tout $n \\ge 0$, $u_n > 0$.\n2.  Démontrez que pour tout $n \\ge 1$, $u_n \\ge \\sqrt{2}$. (Indication : Étudiez le signe de $u_{n+1} - \\sqrt{2}$).\n3.  Démontrez que pour tout $n \\ge 1$, la suite est décroissante, c\'est-à-dire $u_{n+1} \\le u_n$. (Indication : Étudiez le signe de $u_{n+1} - u_n$).\n4.  Déduisez des questions précédentes que la suite $(u_n)$ converge.\n5.  Déterminez la valeur de sa limite.', 'Analyse réelle', NULL, 'Licence', NULL, '1.  **Démontrons que pour tout $n \\ge 0$, $u_n > 0$ par récurrence.**\n    *   **Initialisation :** Par hypothèse, $u_0 > 0$.\n    *   **Hérédité :** Supposons que pour un certain $n \\ge 0$, $u_n > 0$. Alors $u_n + \\frac{2}{u_n}$ est une somme de deux nombres strictement positifs, donc $u_n + \\frac{2}{u_n} > 0$. Par conséquent, $u_{n+1} = \\frac{1}{2} \\left( u_n + \\frac{2}{u_n} \\right) > 0$.\n    *   **Conclusion :** Par le principe d\'induction, $u_n > 0$ pour tout $n \\ge 0$.\n\n2.  **Démontrons que pour tout $n \\ge 1$, $u_n \\ge \\sqrt{2}$.**\n    Calculons la différence $u_{n+1} - \\sqrt{2}$ :\n    $$ u_{n+1} - \\sqrt{2} = \\frac{1}{2} \\left( u_n + \\frac{2}{u_n} \\right) - \\sqrt{2} = \\frac{u_n^2 + 2 - 2\\sqrt{2}u_n}{2u_n} = \\frac{(u_n - \\sqrt{2})^2}{2u_n} $$\n    Puisque $u_n > 0$ (d\'après la question 1) et $(u_n - \\sqrt{2})^2 \\ge 0$, il en résulte que $u_{n+1} - \\sqrt{2} \\ge 0$, soit $u_{n+1} \\ge \\sqrt{2}$ pour tout $n \\ge 0$. Cela signifie que tous les termes de la suite à partir de $u_1$ (c\'est-à-dire $u_n$ pour $n \\ge 1$) sont supérieurs ou égaux à $\\sqrt{2}$.\n\n3.  **Démontrons que pour tout $n \\ge 1$, la suite est décroissante, c\'est-à-dire $u_{n+1} \\le u_n$.**\n    Calculons la différence $u_{n+1} - u_n$ :\n    $$ u_{n+1} - u_n = \\frac{1}{2} \\left( u_n + \\frac{2}{u_n} \\right) - u_n = \\frac{1}{2} \\left( \\frac{2}{u_n} - u_n \\right) = \\frac{2 - u_n^2}{2u_n} $$\n    D\'après la question 2, pour tout $n \\ge 1$, $u_n \\ge \\sqrt{2}$. Cela implique $u_n^2 \\ge (\\sqrt{2})^2 = 2$. Par conséquent, $2 - u_n^2 \\le 0$. \n    Puisque $2u_n > 0$ (d\'après la question 1), le quotient $\\frac{2 - u_n^2}{2u_n}$ est négatif ou nul. \n    Donc, $u_{n+1} - u_n \\le 0$, ce qui signifie $u_{n+1} \\le u_n$ pour tout $n \\ge 1$. La suite $(u_n)_{n \\ge 1}$ est donc décroissante.\n\n4.  **Déduisons que la suite $(u_n)$ converge.**\n    La sous-suite $(u_n)_{n \\ge 1}$ est décroissante (d\'après la question 3) et minorée par $\\sqrt{2}$ (d\'après la question 2). D\'après le théorème de convergence monotone, toute suite décroissante et minorée converge. Par conséquent, la suite $(u_n)_{n \\ge 1}$ converge vers une limite $L$. \n    Comme l\'ajout d\'un terme initial unique ($u_0$) ne change pas la nature de la convergence, la suite $(u_n)_{n \\ge 0}$ converge également.\n\n5.  **Déterminons la valeur de sa limite.**\n    Soit $L$ la limite de la suite $(u_n)$. Puisque $u_n > 0$ pour tout $n$ et $u_n \\ge \\sqrt{2}$ pour $n \\ge 1$, la limite $L$ doit être positive et $L \\ge \\sqrt{2}$.\n    Puisque la suite converge, nous pouvons passer à la limite dans la relation de récurrence :\n    $$ \\lim_{n \\to \\infty} u_{n+1} = \\lim_{n \\to \\infty} \\frac{1}{2} \\left( u_n + \\frac{2}{u_n} \\right) $$\n    $$ L = \\frac{1}{2} \\left( L + \\frac{2}{L} \\right) $$\n    Multiplions par $2L$ (ce qui est valide car $L \\neq 0$) :\n    $$ 2L^2 = L^2 + 2 $$\n    $$ L^2 = 2 $$\n    $$ L = \\pm \\sqrt{2} $$\n    Comme nous avons établi que $L \\ge \\sqrt{2}$, nous devons choisir la valeur positive. Donc, $L = \\sqrt{2}$.\n\n    La suite $(u_n)$ converge et sa limite est $\\sqrt{2}$. ', NULL, '2026-06-24 16:24:25'),
(9, 'Démonstration de la propriété de la somme des limites de fonctions', 'Soient f et g deux fonctions définies sur un intervalle I (sauf peut-être en un point \'a\' de I).\n\nOn suppose que:\n1. La limite de f(x) lorsque x tend vers a est L (notation:  lim_{x->a} f(x) = L)\n2. La limite de g(x) lorsque x tend vers a est M (notation:  lim_{x->a} g(x) = M)\n\nEn utilisant la définition formelle (ou par intervalles/voisinages) de la limite, démontrez que la limite de la somme (f+g)(x) lorsque x tend vers a est L+M.\n\nC\'est-à-dire, démontrez que: lim_{x->a} (f(x) + g(x)) = L + M.', 'Analyse (Limites de fonctions)', NULL, 'Lycée (Classe de Terminale)', NULL, 'Pour démontrer cette propriété, nous nous basons sur la définition rigoureuse d\'une limite. Rappelons que:\n- Dire que `lim (x->a) f(x) = L` signifie que pour tout nombre réel `ε₁ > 0` (aussi petit que l\'on veut), il existe un nombre réel `δ₁ > 0` tel que si `0 < |x - a| < δ₁`, alors `|f(x) - L| < ε₁`.\n- Dire que `lim (x->a) g(x) = M` signifie que pour tout nombre réel `ε₂ > 0` (aussi petit que l\'on veut), il existe un nombre réel `δ₂ > 0` tel que si `0 < |x - a| < δ₂`, alors `|g(x) - M| < ε₂`.\n\nNotre objectif est de démontrer que `lim (x->a) (f(x) + g(x)) = L + M`.\nCela signifie que pour tout nombre réel `ε > 0` (aussi petit que l\'on veut), il existe un nombre réel `δ > 0` tel que si `0 < |x - a| < δ`, alors `|(f(x) + g(x)) - (L + M)| < ε`.\n\n**Démonstration :**\n\n1.  **Choisir un ε arbitraire :** Soit `ε` un nombre réel strictement positif donné. Nous voulons trouver un `δ` correspondant.\n\n2.  **Utiliser les hypothèses :**\n    *   Puisque `lim (x->a) f(x) = L`, pour la \"distance\" `ε/2` (qui est bien positive), il existe un `δ₁ > 0` tel que si `0 < |x - a| < δ₁`, alors `|f(x) - L| < ε/2`.\n    *   Puisque `lim (x->a) g(x) = M`, pour la \"distance\" `ε/2` (qui est aussi positive), il existe un `δ₂ > 0` tel que si `0 < |x - a| < δ₂`, alors `|g(x) - M| < ε/2`.\n\n3.  **Combiner les conditions :** Nous voulons que les deux inégalités (`|f(x) - L| < ε/2` et `|g(x) - M| < ε/2`) soient vraies simultanément. Pour cela, nous devons choisir `x` de sorte qu\'il soit suffisamment proche de `a` selon les deux conditions `δ₁` et `δ₂`.\n    Choisissons `δ = min(δ₁, δ₂)`. Ce `δ` est un nombre réel strictement positif.\n\n4.  **Vérifier la condition pour la somme :**\n    Si `0 < |x - a| < δ`, alors nécessairement :\n    *   `0 < |x - a| < δ₁` (puisque `δ ≤ δ₁`), ce qui implique `|f(x) - L| < ε/2`.\n    *   `0 < |x - a| < δ₂` (puisque `δ ≤ δ₂`), ce qui implique `|g(x) - M| < ε/2`.\n\n    Maintenant, considérons l\'expression `|(f(x) + g(x)) - (L + M)|` :\n    `|(f(x) + g(x)) - (L + M)| = |(f(x) - L) + (g(x) - M)|`\n\n    En utilisant l\'inégalité triangulaire (`|A + B| ≤ |A| + |B|`), nous avons :\n    `|(f(x) - L) + (g(x) - M)| ≤ |f(x) - L| + |g(x) - M|`\n\n    Puisque nous avons montré que `|f(x) - L| < ε/2` et `|g(x) - M| < ε/2` lorsque `0 < |x - a| < δ`, nous pouvons substituer ces inégalités :\n    `|f(x) - L| + |g(x) - M| < ε/2 + ε/2 = ε`\n\n    Donc, pour tout `ε > 0`, nous avons trouvé un `δ > 0` tel que si `0 < |x - a| < δ`, alors `|(f(x) + g(x)) - (L + M)| < ε`.\n\n**Conclusion :**\nCeci est précisément la définition de `lim (x->a) (f(x) + g(x)) = L + M`. La propriété est démontrée.', NULL, '2026-07-01 18:13:08');

-- --------------------------------------------------------

--
-- Structure de la table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL,
  `analyse_id` int(11) DEFAULT NULL,
  `niveau` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `profils_cognitifs`
--

CREATE TABLE `profils_cognitifs` (
  `id` int(11) NOT NULL,
  `etudiant_id` int(11) DEFAULT NULL,
  `erreur_frequente` varchar(255) DEFAULT NULL,
  `frequence` int(11) DEFAULT NULL,
  `recommandation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `profils_etudiants`
--

CREATE TABLE `profils_etudiants` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `niveau` varchar(50) DEFAULT NULL,
  `institution` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `progression`
--

CREATE TABLE `progression` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `niveau` enum('Débutant','Intermédiaire','Confirmé','Expert','Mathématicien') DEFAULT 'Débutant',
  `experience` int(11) DEFAULT 0,
  `score_global` decimal(5,2) DEFAULT 0.00,
  `score_logique` decimal(5,2) DEFAULT 0.00,
  `score_redaction` decimal(5,2) DEFAULT 0.00,
  `exercices_realises` int(11) DEFAULT 0,
  `demonstrations_realisees` int(11) DEFAULT 0,
  `corrections_ia` int(11) DEFAULT 0,
  `serie_reussite` int(11) DEFAULT 0,
  `meilleur_score` decimal(5,2) DEFAULT 0.00,
  `derniere_activite` datetime DEFAULT current_timestamp(),
  `date_creation` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `progression`
--

INSERT INTO `progression` (`id`, `user_id`, `niveau`, `experience`, `score_global`, `score_logique`, `score_redaction`, `exercices_realises`, `demonstrations_realisees`, `corrections_ia`, `serie_reussite`, `meilleur_score`, `derniere_activite`, `date_creation`) VALUES
(1, 1, 'Débutant', 0, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0.00, '2026-07-03 17:53:24', '2026-07-03 17:53:24');

-- --------------------------------------------------------

--
-- Structure de la table `tentatives`
--

CREATE TABLE `tentatives` (
  `id` int(11) NOT NULL,
  `exercice_id` int(11) DEFAULT NULL,
  `etudiant_id` int(11) DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `statut` enum('en_cours','envoye','corrige') DEFAULT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `role` enum('etudiant','enseignant','admin') DEFAULT NULL,
  `date_creation` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `prenom`, `email`, `mot_de_passe`, `role`, `date_creation`) VALUES
(1, 'Rakoto', 'Jean', 'jean@test.com', '123456', 'etudiant', '2026-06-20 06:22:54');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `analyses_ia`
--
ALTER TABLE `analyses_ia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_analyse_demo` (`demonstration_id`);

--
-- Index pour la table `demonstrations`
--
ALTER TABLE `demonstrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_demo_exercice` (`exo_id`);

--
-- Index pour la table `erreurs`
--
ALTER TABLE `erreurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `exercices`
--
ALTER TABLE `exercices`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `profils_cognitifs`
--
ALTER TABLE `profils_cognitifs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `profils_etudiants`
--
ALTER TABLE `profils_etudiants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `progression`
--
ALTER TABLE `progression`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `tentatives`
--
ALTER TABLE `tentatives`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `analyses_ia`
--
ALTER TABLE `analyses_ia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `demonstrations`
--
ALTER TABLE `demonstrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `erreurs`
--
ALTER TABLE `erreurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `exercices`
--
ALTER TABLE `exercices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `profils_cognitifs`
--
ALTER TABLE `profils_cognitifs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `profils_etudiants`
--
ALTER TABLE `profils_etudiants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `progression`
--
ALTER TABLE `progression`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `tentatives`
--
ALTER TABLE `tentatives`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `analyses_ia`
--
ALTER TABLE `analyses_ia`
  ADD CONSTRAINT `fk_analyse_demo` FOREIGN KEY (`demonstration_id`) REFERENCES `demonstrations` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `demonstrations`
--
ALTER TABLE `demonstrations`
  ADD CONSTRAINT `fk_demo_exercice` FOREIGN KEY (`exo_id`) REFERENCES `exercices` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `profils_etudiants`
--
ALTER TABLE `profils_etudiants`
  ADD CONSTRAINT `profils_etudiants_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `progression`
--
ALTER TABLE `progression`
  ADD CONSTRAINT `progression_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
