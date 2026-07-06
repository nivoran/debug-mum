-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 06 juil. 2026 à 10:15
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
(8, 8, '<p>Soit la suite (u_n) définie par :</p><p>u₀ &gt; 0</p><p>et pour tout n ≥ 0 :</p><p>u(n+1) = 1/2 ( u(n) + 2/u(n) )</p><p>On va démontrer que cette suite converge vers √2.</p><p><br></p><h3>1) Montrons que tous les termes sont positifs</h3><p>On sait que u₀ &gt; 0.</p><p>Supposons que u(n) &gt; 0.</p><p>Alors 2/u(n) est positif, donc :</p><p>u(n) + 2/u(n) &gt; 0</p><p>Comme on divise par 2, on obtient :</p><p>u(n+1) &gt; 0</p><p>Donc par récurrence :</p><p>Pour tout n ≥ 0, u(n) &gt; 0.</p><h3>2) Montrons que la suite est minorée par √2</h3><p>Calculons :</p><p>u(n+1) - √2</p><p>= 1/2 (u(n) + 2/u(n)) - √2</p><p>On met au même dénominateur :</p><p>= (u(n)² - 2√2 u(n) + 2) / (2u(n))</p><p>Or :</p><p>u(n)² - 2√2 u(n) + 2</p><p>est une identité remarquable :</p><p>= (u(n) - √2)²</p><p>Donc :</p><p>u(n+1) - √2 = (u(n) - √2)² / (2u(n))</p><p>Le numérateur est un carré donc il est positif, et le dénominateur est positif car u(n) &gt; 0.</p><p>Donc :</p><p>u(n+1) - √2 ≥ 0</p><p>Ainsi :</p><p>u(n+1) ≥ √2</p><p>La suite est donc minorée par √2 à partir du rang 1.</p><h3>3) Montrons que la suite est décroissante</h3><p>Calculons :</p><p>u(n+1) - u(n)</p><p>= 1/2(u(n) + 2/u(n)) - u(n)</p><p>= 1/2(2/u(n) - u(n))</p><p>= (2 - u(n)²)/(2u(n))</p><p>Or, pour n ≥ 1 :</p><p>u(n) ≥ √2</p><p>donc :</p><p>u(n)² ≥ 2</p><p>Ainsi :</p><p>2 - u(n)² ≤ 0</p><p>Comme 2u(n) &gt; 0 :</p><p>u(n+1) - u(n) ≤ 0</p><p>Donc :</p><p>u(n+1) ≤ u(n)</p><p>La suite est décroissante.</p><h3>4) Conclusion sur la convergence</h3><p>À partir du rang 1, la suite est :</p><p><br></p><ul><li>décroissante ;</li><li>minorée par √2.</li></ul><p>D\'après le théorème des suites monotones, la suite converge.</p><h3>5) Calcul de la limite</h3><p>On note :</p><p>lim u(n) = L</p><p>Comme la suite converge, on peut passer à la limite dans la relation :</p><p>L = 1/2(L + 2/L)</p><p>Donc :</p><p>2L = L + 2/L</p><p>Donc :</p><p>L = 2/L</p><p>D\'où :</p><p>L² = 2</p><p>Donc :</p><p>L = √2 ou L = -√2</p><p>Mais tous les termes de la suite sont positifs, donc la limite est positive.</p><p>Ainsi :</p><p><strong>L = √2</strong></p><p>Conclusion :</p><p>La suite (u_n) converge et sa limite est √2.</p><p><br></p>', 1, '2026-06-25 17:46:40'),
(13, 14, '<p>Très bon sujet de test. Voici une démonstration complète qu\'un bon étudiant de Licence pourrait soumettre à ProofCoach AI.</p><h1>Démonstration</h1><p>Soit (X) une variable aléatoire réelle telle que (\\mathbb{E}[X]) existe et que (\\mathrm{Var}(X)) soit finie.</p><p>Nous voulons démontrer que, pour tout (\\varepsilon&gt;0),</p><p>[</p><p>P\\left(|X-\\mathbb{E}[X]|\\ge\\varepsilon\\right)</p><p>\\le</p><p>\\frac{\\mathrm{Var}(X)}{\\varepsilon^{2}}.</p><p>]</p><p>Pour cela, nous allons utiliser l\'inégalité de Markov.</p><p>Considérons la variable aléatoire</p><p>[</p><p>Y=(X-\\mathbb{E}[X])^{2}.</p><p>]</p><p>Cette variable est toujours positive ou nulle, c\'est-à-dire</p><p>[</p><p>Y\\ge0.</p><p>]</p><p>Son espérance vaut</p><p><br></p><h1>[</h1><h1>\\mathbb{E}[Y]</h1><h1>\\mathbb{E}\\left[(X-\\mathbb{E}[X])^{2}\\right]</h1><p>\\mathrm{Var}(X).</p><p>]</p><p>Nous pouvons donc appliquer l\'inégalité de Markov à la variable (Y).</p><p>Pour tout (a&gt;0),</p><p>[</p><p>P(Y\\ge a)</p><p>\\le</p><p>\\frac{\\mathbb{E}[Y]}{a}.</p><p>]</p><p>Choisissons</p><p>[</p><p>a=\\varepsilon^{2}.</p><p>]</p><p>Alors</p><p>[</p><p>P!\\left((X-\\mathbb{E}[X])^{2}\\ge\\varepsilon^{2}\\right)</p><p>\\le</p><p>\\frac{\\mathrm{Var}(X)}{\\varepsilon^{2}}.</p><p>]</p><p>Or,</p><p>[</p><p>(X-\\mathbb{E}[X])^{2}\\ge\\varepsilon^{2}</p><p>\\quad\\Longleftrightarrow\\quad</p><p>|X-\\mathbb{E}[X]|\\ge\\varepsilon.</p><p>]</p><p>En remplaçant cet événement dans l\'inégalité précédente, on obtient</p><p>[</p><p>P!\\left(|X-\\mathbb{E}[X]|\\ge\\varepsilon\\right)</p><p>\\le</p><p>\\frac{\\mathrm{Var}(X)}{\\varepsilon^{2}}.</p><p>]</p><p>Nous avons ainsi démontré l\'inégalité de Chebyshev.</p><p>[</p><p>\\boxed{</p><p>P!\\left(|X-\\mathbb{E}[X]|\\ge\\varepsilon\\right)</p><p>\\le</p><p>\\frac{\\mathrm{Var}(X)}{\\varepsilon^{2}}</p><p>}</p><p>]</p><h3><br></h3>', 1, '2026-07-04 16:35:33'),
(14, 12, '<p>Voici une démonstration complète, rédigée dans un style adapté à un étudiant de Licence.</p><h1>Démonstration</h1><p>Soit la suite ((u_n)) définie par</p><p>[</p><p>u_0=0,\\qquad</p><p>u_{n+1}=\\sqrt{u_n+2}.</p><p>]</p><p>Nous allons répondre successivement aux trois questions.</p><h2>1. Montrer par récurrence que (0\\le u_n&lt;2)</h2><h3>Initialisation</h3><p>Pour (n=0),</p><p>[</p><p>u_0=0.</p><p>]</p><p>On a donc</p><p>[</p><p>0\\le u_0&lt;2.</p><p>]</p><p>La propriété est vraie au rang 0.</p><h3>Hérédité</h3><p>Supposons qu\'à un certain rang (n),</p><p>[</p><p>0\\le u_n&lt;2.</p><p>]</p><p>Montrons qu\'alors</p><p>[</p><p>0\\le u_{n+1}&lt;2.</p><p>]</p><p>Comme</p><p>[</p><p>u_{n+1}=\\sqrt{u_n+2},</p><p>]</p><p>et que</p><p>[</p><p>u_n\\ge0,</p><p>]</p><p>on obtient</p><p>[</p><p>u_n+2\\ge2,</p><p>]</p><p>donc</p><p>[</p><p>u_{n+1}\\ge0.</p><p>]</p><p>Par ailleurs,</p><p>[</p><p>u_n&lt;2</p><p>]</p><p>implique</p><p>[</p><p>u_n+2&lt;4.</p><p>]</p><p>La fonction racine carrée étant croissante,</p><p><br></p><h1>[</h1><h1>u_{n+1}</h1><h1>\\sqrt{u_n+2}</h1><h1>&lt;</h1><h1>\\sqrt4</h1><ol><li><br></li></ol><p>]</p><p>Ainsi,</p><p>[</p><p>0\\le u_{n+1}&lt;2.</p><p>]</p><p>La propriété est donc héréditaire.</p><h3>Conclusion</h3><p>Par le principe de récurrence,</p><p>[</p><p>\\boxed{0\\le u_n&lt;2</p><p>\\qquad\\text{pour tout }n\\in\\mathbb N.}</p><p>]</p><h1>2. Montrer que la suite est strictement croissante</h1><p>Calculons</p><p>[</p><p>u_{n+1}-u_n.</p><p>]</p><p>Comme</p><p>[</p><p>u_{n+1}=\\sqrt{u_n+2},</p><p>]</p><p>on étudie le signe de</p><p>[</p><p>\\sqrt{u_n+2}-u_n.</p><p>]</p><p>Les deux termes étant positifs, on peut comparer leurs carrés.</p><p>On a</p><p>[</p><p>\\sqrt{u_n+2}&gt;u_n</p><p>]</p><p>si et seulement si</p><p>[</p><p>u_n+2&gt;u_n^2.</p><p>]</p><p>Or</p><p><br></p><h1>[</h1><h1>u_n^2-u_n-2</h1><p>(u_n-2)(u_n+1).</p><p>]</p><p>D\'après la première question,</p><p>[</p><p>0\\le u_n&lt;2.</p><p>]</p><p>Ainsi,</p><p>[</p><p>u_n-2&lt;0</p><p>]</p><p>et</p><p>[</p><p>u_n+1&gt;0.</p><p>]</p><p>Le produit est donc négatif :</p><p>[</p><p>(u_n-2)(u_n+1)&lt;0,</p><p>]</p><p>c\'est-à-dire</p><p>[</p><p>u_n^2-u_n-2&lt;0.</p><p>]</p><p>Donc</p><p>[</p><p>u_n^2&lt;u_n+2,</p><p>]</p><p>ce qui entraîne</p><p>[</p><p>\\sqrt{u_n+2}&gt;u_n.</p><p>]</p><p>Ainsi,</p><p>[</p><p>u_{n+1}&gt;u_n.</p><p>]</p><p>La suite est donc strictement croissante.</p><p>[</p><p>\\boxed{(u_n)\\text{ est strictement croissante.}}</p><p>]</p><h1>3. En déduire que la suite converge</h1><p>Nous avons montré que</p><p><br></p><ul><li>la suite est croissante ;</li><li>elle est majorée par 2.</li></ul><p>Or toute suite croissante et majorée est convergente.</p><p>Il existe donc un réel (L) tel que</p><p>[</p><p>u_n\\longrightarrow L.</p><p>]</p><p>En passant à la limite dans la relation de récurrence,</p><p>[</p><p>L=\\sqrt{L+2}.</p><p>]</p><p>En élevant au carré,</p><p>[</p><p>L^2=L+2,</p><p>]</p><p>c\'est-à-dire</p><p>[</p><p>L^2-L-2=0.</p><p>]</p><p>On factorise :</p><p>[</p><p>(L-2)(L+1)=0.</p><p>]</p><p>Les solutions sont</p><p>[</p><p>L=2</p><p>\\quad\\text{ou}\\quad</p><p>L=-1.</p><p>]</p><p>Comme tous les termes de la suite sont positifs,</p><p>[</p><p>L\\ge0.</p><p>]</p><p>La seule valeur possible est donc</p><p>[</p><p>\\boxed{L=2.}</p><p>]</p><h1>Conclusion</h1><p>La suite ((u_n))</p><p><br></p><ul><li>vérifie (0\\le u_n&lt;2) pour tout (n),</li><li>est strictement croissante,</li><li>est majorée par (2),</li><li>converge vers</li></ul><p>[</p><p>\\boxed{2.}</p><p>]</p><p><br></p>', 1, '2026-07-04 16:44:11'),
(15, 11, '<p>Voici une démonstration complète, rédigée dans un style qu\'un étudiant pourrait saisir dans ProofCoach AI.</p><h1>Démonstration</h1><p>On considère la fonction</p><p>[</p><p>f(x)=\\frac{\\cos(x)}{x}, \\qquad x\\neq0.</p><p>]</p><p>Nous voulons démontrer que</p><p>[</p><p>\\lim_{x\\to+\\infty}\\frac{\\cos(x)}{x}=0</p><p>]</p><p>en utilisant le théorème des gendarmes.</p><p><br></p><h2>1. Encadrement de (\\cos(x))</h2><p>On sait que, pour tout réel (x),</p><p>[</p><p>-1\\le \\cos(x)\\le 1.</p><p>]</p><p>Comme (x\\to+\\infty), on a (x&gt;0) à partir d\'un certain rang. On peut donc diviser chaque membre de cette inégalité par (x) sans changer le sens des inégalités :</p><p>[</p><p>-\\frac1x</p><p>\\le</p><p>\\frac{\\cos(x)}{x}</p><p>\\le</p><p>\\frac1x.</p><p>]</p><p>Nous obtenons ainsi un encadrement de la fonction (f(x)).</p><h2>2. Calcul des limites des fonctions d\'encadrement</h2><p>Lorsque (x) tend vers (+\\infty),</p><p>[</p><p>\\lim_{x\\to+\\infty}\\frac1x=0</p><p>]</p><p>et</p><p>[</p><p>\\lim_{x\\to+\\infty}-\\frac1x=0.</p><p>]</p><p>Les deux fonctions qui encadrent (f(x)) ont donc la même limite.</p><h2>3. Application du théorème des gendarmes</h2><p>Nous avons montré que, pour tout (x&gt;0),</p><p>[</p><p>-\\frac1x</p><p>\\le</p><p>\\frac{\\cos(x)}{x}</p><p>\\le</p><p>\\frac1x.</p><p>]</p><p>Or,</p><p><br></p><h1>[</h1><h1>\\lim_{x\\to+\\infty}-\\frac1x</h1><h1>\\lim_{x\\to+\\infty}\\frac1x</h1><ol><li><br></li></ol><p>]</p><p>D\'après le théorème des gendarmes, il en résulte que</p><p>[</p><p>\\lim_{x\\to+\\infty}\\frac{\\cos(x)}{x}=0.</p><p>]</p><h1>Conclusion</h1><p>Ainsi,</p><p>[</p><p>\\boxed{</p><p>\\lim_{x\\to+\\infty}\\frac{\\cos(x)}{x}=0.</p><p>}</p><p>]</p><p><br></p><p><br></p>', 1, '2026-07-04 17:00:42');

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
(8, 'Démonstration de la convergence d\'une suite de Héron', 'Soit la suite numérique $(u_n)_{n \\ge 0}$ définie par son premier terme $u_0 > 0$ et la relation de récurrence :\n$$ u_{n+1} = \\frac{1}{2} \\left( u_n + \\frac{2}{u_n} \\right) \\quad \\text{pour tout } n \\ge 0 $$ \nCet algorithme est connu sous le nom de méthode de Héron pour le calcul de $\\sqrt{2}$.\n\n**Votre tâche est de démontrer rigoureusement que cette suite converge et de déterminer sa limite.**\n\nPour cela, vous pouvez suivre les étapes suivantes :\n\n1.  Démontrez que pour tout $n \\ge 0$, $u_n > 0$.\n2.  Démontrez que pour tout $n \\ge 1$, $u_n \\ge \\sqrt{2}$. (Indication : Étudiez le signe de $u_{n+1} - \\sqrt{2}$).\n3.  Démontrez que pour tout $n \\ge 1$, la suite est décroissante, c\'est-à-dire $u_{n+1} \\le u_n$. (Indication : Étudiez le signe de $u_{n+1} - u_n$).\n4.  Déduisez des questions précédentes que la suite $(u_n)$ converge.\n5.  Déterminez la valeur de sa limite.', 'Analyse réelle', NULL, 'Licence', NULL, '1.  **Démontrons que pour tout $n \\ge 0$, $u_n > 0$ par récurrence.**\n    *   **Initialisation :** Par hypothèse, $u_0 > 0$.\n    *   **Hérédité :** Supposons que pour un certain $n \\ge 0$, $u_n > 0$. Alors $u_n + \\frac{2}{u_n}$ est une somme de deux nombres strictement positifs, donc $u_n + \\frac{2}{u_n} > 0$. Par conséquent, $u_{n+1} = \\frac{1}{2} \\left( u_n + \\frac{2}{u_n} \\right) > 0$.\n    *   **Conclusion :** Par le principe d\'induction, $u_n > 0$ pour tout $n \\ge 0$.\n\n2.  **Démontrons que pour tout $n \\ge 1$, $u_n \\ge \\sqrt{2}$.**\n    Calculons la différence $u_{n+1} - \\sqrt{2}$ :\n    $$ u_{n+1} - \\sqrt{2} = \\frac{1}{2} \\left( u_n + \\frac{2}{u_n} \\right) - \\sqrt{2} = \\frac{u_n^2 + 2 - 2\\sqrt{2}u_n}{2u_n} = \\frac{(u_n - \\sqrt{2})^2}{2u_n} $$\n    Puisque $u_n > 0$ (d\'après la question 1) et $(u_n - \\sqrt{2})^2 \\ge 0$, il en résulte que $u_{n+1} - \\sqrt{2} \\ge 0$, soit $u_{n+1} \\ge \\sqrt{2}$ pour tout $n \\ge 0$. Cela signifie que tous les termes de la suite à partir de $u_1$ (c\'est-à-dire $u_n$ pour $n \\ge 1$) sont supérieurs ou égaux à $\\sqrt{2}$.\n\n3.  **Démontrons que pour tout $n \\ge 1$, la suite est décroissante, c\'est-à-dire $u_{n+1} \\le u_n$.**\n    Calculons la différence $u_{n+1} - u_n$ :\n    $$ u_{n+1} - u_n = \\frac{1}{2} \\left( u_n + \\frac{2}{u_n} \\right) - u_n = \\frac{1}{2} \\left( \\frac{2}{u_n} - u_n \\right) = \\frac{2 - u_n^2}{2u_n} $$\n    D\'après la question 2, pour tout $n \\ge 1$, $u_n \\ge \\sqrt{2}$. Cela implique $u_n^2 \\ge (\\sqrt{2})^2 = 2$. Par conséquent, $2 - u_n^2 \\le 0$. \n    Puisque $2u_n > 0$ (d\'après la question 1), le quotient $\\frac{2 - u_n^2}{2u_n}$ est négatif ou nul. \n    Donc, $u_{n+1} - u_n \\le 0$, ce qui signifie $u_{n+1} \\le u_n$ pour tout $n \\ge 1$. La suite $(u_n)_{n \\ge 1}$ est donc décroissante.\n\n4.  **Déduisons que la suite $(u_n)$ converge.**\n    La sous-suite $(u_n)_{n \\ge 1}$ est décroissante (d\'après la question 3) et minorée par $\\sqrt{2}$ (d\'après la question 2). D\'après le théorème de convergence monotone, toute suite décroissante et minorée converge. Par conséquent, la suite $(u_n)_{n \\ge 1}$ converge vers une limite $L$. \n    Comme l\'ajout d\'un terme initial unique ($u_0$) ne change pas la nature de la convergence, la suite $(u_n)_{n \\ge 0}$ converge également.\n\n5.  **Déterminons la valeur de sa limite.**\n    Soit $L$ la limite de la suite $(u_n)$. Puisque $u_n > 0$ pour tout $n$ et $u_n \\ge \\sqrt{2}$ pour $n \\ge 1$, la limite $L$ doit être positive et $L \\ge \\sqrt{2}$.\n    Puisque la suite converge, nous pouvons passer à la limite dans la relation de récurrence :\n    $$ \\lim_{n \\to \\infty} u_{n+1} = \\lim_{n \\to \\infty} \\frac{1}{2} \\left( u_n + \\frac{2}{u_n} \\right) $$\n    $$ L = \\frac{1}{2} \\left( L + \\frac{2}{L} \\right) $$\n    Multiplions par $2L$ (ce qui est valide car $L \\neq 0$) :\n    $$ 2L^2 = L^2 + 2 $$\n    $$ L^2 = 2 $$\n    $$ L = \\pm \\sqrt{2} $$\n    Comme nous avons établi que $L \\ge \\sqrt{2}$, nous devons choisir la valeur positive. Donc, $L = \\sqrt{2}$.\n\n    La suite $(u_n)$ converge et sa limite est $\\sqrt{2}$. ', NULL, '2026-06-24 16:24:25'),
(10, 'Démonstration de limite par le théorème des gendarmes', 'Démontrez que la limite de la suite $(u_n)$ définie pour tout entier naturel $n \\ge 1$ par $u_n = \\frac{\\sin(n)}{n}$ est égale à 0.', 'Analyse (Limites de suites)', NULL, 'Lycée (Terminale Générale, Spécialité Mathématique', NULL, 'Pour démontrer que $\\lim_{n \\to +\\infty} u_n = 0$ avec $u_n = \\frac{\\sin(n)}{n}$, nous allons utiliser le théorème des gendarmes (aussi appelé théorème d\'encadrement).\n\n**Étape 1 : Encadrement de la fonction sinus**\nNous savons que pour tout nombre réel $x$, la fonction sinus est bornée entre -1 et 1. C\'est-à-dire :\n$-1 \\le \\sin(x) \\le 1$.\nAppliquons cette propriété à $x=n$ (où $n$ est un entier naturel) :\n$-1 \\le \\sin(n) \\le 1$.\n\n**Étape 2 : Division par $n$**\nPuisque nous travaillons avec $n \\ge 1$, $n$ est un nombre strictement positif. Nous pouvons donc diviser les trois membres de l\'inégalité par $n$ sans changer le sens des inégalités :\n$\\frac{-1}{n} \\le \\frac{\\sin(n)}{n} \\le \\frac{1}{n}$.\nAinsi, nous avons encadré la suite $u_n$ :\n$\\frac{-1}{n} \\le u_n \\le \\frac{1}{n}$.\n\n**Étape 3 : Calcul des limites des suites encadrantes**\nConsidérons les deux suites encadrantes :\n- La suite $v_n = \\frac{-1}{n}$. Nous savons que $\\lim_{n \\to +\\infty} \\frac{1}{n} = 0$. Par conséquent, $\\lim_{n \\to +\\infty} \\frac{-1}{n} = 0$.\n- La suite $w_n = \\frac{1}{n}$. Nous savons que $\\lim_{n \\to +\\infty} \\frac{1}{n} = 0$.\n\n**Étape 4 : Application du théorème des gendarmes**\nNous avons établi que :\n- $v_n \\le u_n \\le w_n$ pour tout $n \\ge 1$.\n- $\\lim_{n \\to +\\infty} v_n = 0$.\n- $\\lim_{n \\to +\\infty} w_n = 0$.\nSelon le théorème des gendarmes, si une suite est encadrée par deux suites qui convergent vers la même limite $L$, alors la suite encadrée converge également vers $L$. Ici, $L=0$.\n\n**Conclusion :**\nPar le théorème des gendarmes, nous pouvons conclure que :\n$\\lim_{n \\to +\\infty} \\frac{\\sin(n)}{n} = 0$.', NULL, '2026-07-04 10:39:41'),
(11, 'Démonstration d\'une limite par le théorème d\'encadrement', 'Soit la fonction $f$ définie pour tout $x \\neq 0$ par $f(x) = \\frac{\\cos(x)}{x}$.\n\nDémontrez rigoureusement, en vous appuyant sur le théorème des gendarmes (aussi appelé théorème d\'encadrement ou \"squeeze theorem\"), que la limite de la fonction $f$ lorsque $x$ tend vers $+\\infty$ est égale à 0.', 'Analyse - Limites de fonctions', NULL, 'Lycée (Classe de Terminale)', NULL, 'Pour démontrer que $\\lim_{x \\to +\\infty} \\frac{\\cos(x)}{x} = 0$, nous allons utiliser le théorème d\'encadrement (théorème des gendarmes).\n\n1.  **Propriété fondamentale de la fonction cosinus** :\n    Nous savons que pour tout nombre réel $x$, la fonction cosinus est bornée entre -1 et 1. C\'est-à-dire :\n    $-1 \\le \\cos(x) \\le 1$\n\n2.  **Construction de l\'encadrement de la fonction $f(x)$** :\n    L\'objectif est d\'obtenir une expression pour $\\frac{\\cos(x)}{x}$. Puisque nous étudions la limite lorsque $x$ tend vers $+\\infty$, nous pouvons considérer que $x$ est un nombre réel strictement positif ($x > 0$). Dans ce cas, diviser les trois membres de l\'inégalité par $x$ ne change pas le sens des inégalités. En effectuant cette division, nous obtenons :\n    $\\frac{-1}{x} \\le \\frac{\\cos(x)}{x} \\le \\frac{1}{x}$\n    Ainsi, la fonction $f(x) = \\frac{\\cos(x)}{x}$ est encadrée par les fonctions $g(x) = \\frac{-1}{x}$ et $h(x) = \\frac{1}{x}$.\n\n3.  **Calcul des limites des fonctions encadrantes** :\n    Nous allons maintenant calculer les limites des deux fonctions $g(x)$ et $h(x)$ qui encadrent $f(x)$ lorsque $x$ tend vers $+\\infty$ :\n    *   Pour la borne inférieure, $g(x) = \\frac{-1}{x}$ :\n        $\\lim_{x \\to +\\infty} \\frac{-1}{x} = 0$\n    *   Pour la borne supérieure, $h(x) = \\frac{1}{x}$ :\n        $\\lim_{x \\to +\\infty} \\frac{1}{x} = 0$\n\n4.  **Application du théorème des gendarmes** :\n    Nous avons établi un encadrement pour $f(x)$ :\n    $\\frac{-1}{x} \\le f(x) \\le \\frac{1}{x}$ pour $x > 0$.\n    Et nous avons montré que les limites des fonctions encadrantes sont égales :\n    $\\lim_{x \\to +\\infty} \\frac{-1}{x} = 0$ et $\\lim_{x \\to +\\infty} \\frac{1}{x} = 0$\n\n    Le théorème des gendarmes stipule que si une fonction $f(x)$ est encadrée par deux fonctions $g(x)$ et $h(x)$ (c\'est-à-dire $g(x) \\le f(x) \\le h(x)$) et que ces deux fonctions encadrantes tendent vers la même limite $L$ lorsque $x$ tend vers une valeur finie ou l\'infini, alors $f(x)$ tend également vers cette même limite $L$.\n\n    En appliquant ce théorème, nous pouvons conclure que :\n    $\\lim_{x \\to +\\infty} f(x) = \\lim_{x \\to +\\infty} \\frac{\\cos(x)}{x} = 0$\n\nLa démonstration est ainsi complète.', NULL, '2026-07-04 10:39:54'),
(12, 'Exercice de Démonstration : Propriétés d\'une suite définie par récurrence', 'Soit la suite $(u_n)$ définie par $u_0 = 0$ et, pour tout entier naturel $n$, $u_{n+1} = \\sqrt{u_n + 2}$.\n\n1.  Démontrer par récurrence que, pour tout entier naturel $n$, $0 \\le u_n < 2$.\n2.  Démontrer que la suite $(u_n)$ est strictement croissante.\n3.  En déduire que la suite $(u_n)$ est convergente.', 'Mathématiques', NULL, 'Lycée (Terminale Générale, spécialité Mathématique', NULL, '**1. Démonstration par récurrence que $0 \\le u_n < 2$ pour tout $n \\in \\mathbb{N}$.**\n\n*   **Initialisation :** Pour $n=0$, $u_0 = 0$. On a bien $0 \\le 0 < 2$. La propriété est vraie pour $n=0$.\n\n*   **Hérédité :** Supposons que pour un certain entier naturel $k \\ge 0$, la propriété $0 \\le u_k < 2$ est vraie (hypothèse de récurrence).\n    Nous voulons montrer que $0 \\le u_{k+1} < 2$.\n    D\'après l\'hypothèse de récurrence :\n    $0 \\le u_k < 2$\n    Ajoutons 2 à chaque partie de l\'inégalité :\n    $0 + 2 \\le u_k + 2 < 2 + 2$\n    $2 \\le u_k + 2 < 4$\n    Comme la fonction racine carrée est strictement croissante sur $[0, +\\infty[$ et que $u_k+2 \\ge 2 > 0$, on peut prendre la racine carrée :\n    $\\sqrt{2} \\le \\sqrt{u_k + 2} < \\sqrt{4}$\n    Or, $u_{k+1} = \\sqrt{u_k + 2}$. Donc :\n    $\\sqrt{2} \\le u_{k+1} < 2$\n    Puisque $\\sqrt{2} \\approx 1,414 \\ge 0$, on a bien $0 \\le u_{k+1} < 2$.\n    La propriété est donc héréditaire.\n\n*   **Conclusion :** D\'après le principe de récurrence, la propriété $0 \\le u_n < 2$ est vraie pour tout entier naturel $n$.\n\n**2. Démonstration que la suite $(u_n)$ est strictement croissante.**\n\nIl faut étudier le signe de la différence $u_{n+1} - u_n$.\n$u_{n+1} - u_n = \\sqrt{u_n + 2} - u_n$.\n\nPour étudier le signe de cette expression, on peut utiliser la méthode du conjugué :\n$u_{n+1} - u_n = \\frac{(\\sqrt{u_n + 2} - u_n)(\\sqrt{u_n + 2} + u_n)}{\\sqrt{u_n + 2} + u_n}$\n$u_{n+1} - u_n = \\frac{(u_n + 2) - u_n^2}{\\sqrt{u_n + 2} + u_n}$\n$u_{n+1} - u_n = \\frac{-u_n^2 + u_n + 2}{\\sqrt{u_n + 2} + u_n}$\n\nLe dénominateur $\\sqrt{u_n + 2} + u_n$ est strictement positif, car $u_n \\ge 0$ (d\'après la question 1) et $\\sqrt{u_n+2} \\ge \\sqrt{2} > 0$.\nIl faut donc étudier le signe du numérateur : $P(x) = -x^2 + x + 2$, avec $x = u_n$.\n\nC\'est un trinôme du second degré. Cherchons ses racines en résolvant $-x^2 + x + 2 = 0$ :\nLe discriminant est $\\Delta = b^2 - 4ac = 1^2 - 4(-1)(2) = 1 + 8 = 9$.\nLes racines sont $x_1 = \\frac{-1 - \\sqrt{9}}{2(-1)} = \\frac{-1 - 3}{-2} = \\frac{-4}{-2} = 2$ et $x_2 = \\frac{-1 + \\sqrt{9}}{2(-1)} = \\frac{-1 + 3}{-2} = \\frac{2}{-2} = -1$.\n\nComme le coefficient de $x^2$ est négatif ($-1$), le trinôme $P(x)$ est positif entre ses racines $x_2 = -1$ et $x_1 = 2$. C\'est-à-dire $P(x) > 0$ pour $x \\in (-1, 2)$.\n\nD\'après la question 1, nous avons démontré que pour tout $n \\in \\mathbb{N}$, $0 \\le u_n < 2$.\nDonc, $u_n$ appartient à l\'intervalle $[0, 2[$, qui est inclus dans l\'intervalle $]-1, 2[$.\nPour $u_n \\in [0, 2[$, le numérateur $-u_n^2 + u_n + 2$ est strictement positif.\n\nPar conséquent, $u_{n+1} - u_n > 0$.\nLa suite $(u_n)$ est donc strictement croissante.\n\n**3. Déduction de la convergence de la suite $(u_n)$.**\n\nD\'après la question 1, la suite $(u_n)$ est majorée par 2 (car $u_n < 2$ pour tout $n$).\nD\'après la question 2, la suite $(u_n)$ est strictement croissante.\n\nSelon le théorème de convergence des suites monotones, toute suite croissante et majorée est convergente.\nPar conséquent, la suite $(u_n)$ est convergente.', NULL, '2026-07-04 11:05:05'),
(14, 'Inégalité de Chebyshev', 'Soit $X$ une variable aléatoire réelle avec une espérance $\\mathbb{E}[X]$ finie et une variance $\\text{Var}(X)$ finie et non nulle. Démontrez l\'inégalité de Chebyshev pour tout $\\epsilon > 0$ :\n$$P(|X - \\mathbb{E}[X]| \\ge \\epsilon) \\le \\frac{\\text{Var}(X)}{\\epsilon^2}$$\nVous êtes libre d\'utiliser le fait que si $Y$ est une variable aléatoire non négative avec une espérance finie, alors pour tout $a > 0$, $P(Y \\ge a) \\le \\frac{\\mathbb{E}[Y]}{a}$ (Inégalité de Markov).', 'Probabilités', NULL, 'Licence', NULL, 'Soient $\\mu = \\mathbb{E}[X]$ et $\\sigma^2 = \\text{Var}(X)$.\nNous voulons démontrer $P(|X - \\mu| \\ge \\epsilon) \\le \\frac{\\sigma^2}{\\epsilon^2}$.\n\nL\'événement $|X - \\mu| \\ge \\epsilon$ est équivalent à l\'événement $(X - \\mu)^2 \\ge \\epsilon^2$. En effet, si $|X - \\mu| \\ge \\epsilon$, alors en élevant au carré (les deux membres étant positifs), on obtient $(X - \\mu)^2 \\ge \\epsilon^2$. Réciproquement, si $(X - \\mu)^2 \\ge \\epsilon^2$, alors en prenant la racine carrée positive, $\\sqrt{(X - \\mu)^2} \\ge \\sqrt{\\epsilon^2}$, ce qui donne $|X - \\mu| \\ge \\epsilon$ (car $\\epsilon > 0$).\n\nConsidérons la variable aléatoire $Y = (X - \\mu)^2$.\nÉtant donné que $X$ est une variable aléatoire réelle, $Y = (X - \\mu)^2$ est une variable aléatoire non négative (puisqu\'un carré est toujours non négatif). Son espérance est finie car la variance de $X$ est supposée finie.\nL\'espérance de $Y$ est $\\mathbb{E}[Y] = \\mathbb{E}[(X - \\mu)^2]$. Par définition de la variance, nous avons $\\mathbb{E}[(X - \\mu)^2] = \\text{Var}(X) = \\sigma^2$.\n\nNous pouvons maintenant appliquer l\'Inégalité de Markov à la variable aléatoire non négative $Y$.\nL\'Inégalité de Markov stipule que pour toute variable aléatoire $Y \\ge 0$ avec une espérance finie et pour tout $a > 0$, nous avons $P(Y \\ge a) \\le \\frac{\\mathbb{E}[Y]}{a}$.\n\nDans notre cas, nous posons :\n- La variable aléatoire $Y = (X - \\mu)^2$.\n- La valeur $a = \\epsilon^2$. Puisque $\\epsilon > 0$, alors $a = \\epsilon^2 > 0$.\n\nEn appliquant l\'Inégalité de Markov :\n$$P((X - \\mu)^2 \\ge \\epsilon^2) \\le \\frac{\\mathbb{E}[(X - \\mu)^2]}{\\epsilon^2}$$\n\nEn utilisant l\'équivalence des événements démontrée précédemment et la définition de la variance :\n- L\'événement $(X - \\mu)^2 \\ge \\epsilon^2$ est équivalent à $|X - \\mu| \\ge \\epsilon$.\n- Nous savons que $\\mathbb{E}[(X - \\mu)^2] = \\text{Var}(X) = \\sigma^2$.\n\nEn substituant ces éléments dans l\'inégalité :\n$$P(|X - \\mu| \\ge \\epsilon) \\le \\frac{\\text{Var}(X)}{\\epsilon^2}$$\n\nCeci conclut la démonstration de l\'Inégalité de Chebyshev.', NULL, '2026-07-04 16:32:18');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `demonstrations`
--
ALTER TABLE `demonstrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `erreurs`
--
ALTER TABLE `erreurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `exercices`
--
ALTER TABLE `exercices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
