-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 08 juil. 2026 à 08:25
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
-- Base de données : `dictee_ai`
--

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `dictees`
--

CREATE TABLE `dictees` (
  `id` int(11) NOT NULL,
  `theme` varchar(100) DEFAULT NULL,
  `texte` text DEFAULT NULL,
  `date_creation` datetime DEFAULT current_timestamp(),
  `niveau` varchar(10) NOT NULL,
  `origine` enum('IA','manuel') DEFAULT 'IA',
  `titre` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `dictees`
--

INSERT INTO `dictees` (`id`, `theme`, `texte`, `date_creation`, `niveau`, `origine`, `titre`) VALUES
(49, 'Comment se présenter', 'Bonjour !\n\nPour se présenter, c\'est facile. On commence par dire son nom. Par exemple : Je m\'appelle Marie. Ensuite, on peut dire son âge : J\'ai trente ans. On parle de sa nationalité : Je suis espagnole, je viens d\'Espagne.\n\nPuis, on indique où on habite : J\'habite à Lyon. Si on travaille, on dit : Je suis professeur d\'anglais. Si on est étudiant, on dit : Je suis étudiante en économie.\n\nOn peut aussi parler de ce qu\'on aime : J\'aime le cinéma, le sport et la lecture. Ou de ce qu\'on n\'aime pas : Je n\'aime pas la pluie. On peut mentionner sa famille : J\'ai un frère et une sœur.\n\nPour finir, on dit : Enchanté(e) de vous rencontrer ! C\'est à vous maintenant !', '2026-06-01 21:16:21', 'A1', 'IA', NULL),
(53, 'La bourse de New York', 'La Bourse de New York est un endroit très célèbre. Elle est à New York, sur Wall Street. C\'est un grand bâtiment, toujours plein d\'activité. Beaucoup de personnes, appelées traders, y travaillent. Ils achètent et vendent des actions.\n\nUne action est une petite partie d\'une entreprise. Quand les entreprises vont bien, le prix des actions monte. Quand elles vont moins bien, le prix descend. C\'est très important pour l\'économie du monde entier.\n\nLa Bourse est ouverte du lundi au vendredi. Le week-end, elle est fermée. Les traders travaillent vite. Ils regardent beaucoup d\'écrans. Wall Street est un symbole d\'argent et de commerce.', '2026-06-15 16:35:06', 'A1', 'IA', NULL),
(54, 'L\'anthropocène', 'La Terre est notre maison. Les humains font beaucoup de choses. Nous construisons des villes et des maisons. Nous faisons des usines. Nous utilisons des voitures et des avions.\n\nCes activités changent la Terre. Il y a des déchets partout. L\'eau et l\'air ne sont pas toujours propres. Beaucoup d\'arbres sont coupés. Certains animaux n\'ont plus leur maison. Des plantes disparaissent. C\'est un problème.\n\nNous devons penser à la Terre. Nous pouvons trier nos déchets. Nous pouvons marcher ou faire du vélo. Nous pouvons aussi planter des arbres. Il faut protéger la nature. C\'est important pour le futur.', '2026-06-15 16:49:32', 'A1', 'IA', NULL),
(55, 'Les chutes du Niagara', 'Les chutes du Niagara sont très célèbres. Elles sont en Amérique du Nord. Il y a beaucoup d\'eau qui tombe. L\'eau vient d\'un grand lac. C\'est très impressionnant à voir. On peut entendre le bruit de l\'eau. Le bruit est fort.\r\n\r\nBeaucoup de touristes viennent visiter cet endroit chaque année. Ils regardent les chutes. Ils prennent des photos. C\'est une belle vue. Il y a souvent des arc-en-ciel près de l\'eau. C\'est magique ! On peut faire des promenades en bateau. Les bateaux vont près des chutes. C\'est une expérience unique.\r\n\r\nL\'eau est très puissante. Les chutes sont un symbole de la force de la nature. C\'est un voyage mémorable pour tous. Tout le monde devrait voir les chutes de Niagara un jour. C\'est magnifique !', '2026-06-15 16:59:14', 'A1', 'IA', NULL),
(59, 'Les lémuriens de Madagascar', 'Les lémuriens sont des animaux uniques. Ils vivent seulement à Madagascar, une grande île près de l\'Afrique. Ces mammifères ont souvent de grands yeux et une longue queue. Ils aiment sauter d\'arbre en arbre dans la forêt tropicale. Ils mangent des fruits, des feuilles et parfois des insectes.\n\nIl existe différentes espèces de lémuriens. Certains sont petits, d\'autres sont plus grands. Le lémur catta, par exemple, est célèbre avec sa queue rayée. Beaucoup de touristes viennent à Madagascar pour les voir. Il est très important de les protéger. Leur habitat est en danger, mais ils sont essentiels pour l\'équilibre de leur île.', '2026-06-15 17:54:22', 'A2', 'IA', NULL),
(60, 'Qu\'est-ce-qu\'un tribunal', 'Un tribunal est un lieu important. C\'est une grande salle. Beaucoup de personnes vont au tribunal. Elles y vont pour résoudre des problèmes.\n\nDans un tribunal, il y a un juge. Le juge écoute tout le monde attentivement. Il connaît les lois de notre pays. Il prend des décisions justes. Le but est de trouver la justice pour tous.\n\nIl y a souvent aussi des avocats. Les avocats aident les personnes. Ils parlent pour elles et expliquent la situation. On discute des règles et des lois. C\'est un endroit où l\'on cherche la vérité. Le tribunal est très important pour la société.', '2026-06-15 17:56:31', 'A1', 'IA', NULL),
(63, 'Le travail d\'un avocat', 'Le travail d\'un avocat est très important. Un avocat aide les personnes qui ont des problèmes légaux. Pour cela, il doit d\'abord bien étudier le droit. Il lit beaucoup de lois et de documents juridiques chaque jour.\n\nL\'avocat rencontre ses clients. Il les écoute attentivement et leur donne des conseils. Son rôle est de les informer et de les défendre. Il peut représenter ses clients au tribunal, devant un juge. Là, il parle pour eux et explique leur situation. Il cherche toujours la meilleure solution.\n\nCe métier demande beaucoup de concentration et de logique. Un bon avocat est organisé et doit savoir bien communiquer. C\'est un travail exigeant mais très utile pour la justice.', '2026-06-15 18:12:55', 'A2', 'IA', NULL),
(64, 'Je me présente', 'Bonjour ! Je m\'appelle Léa. J\'ai vingt-cinq ans. Je suis française et j\'habite à Paris. Je suis étudiante. J\'étudie le français à l\'université tous les jours. C\'est intéressant. J\'aime beaucoup le chocolat et lire des livres. J\'aime aussi faire du sport, comme la natation le mardi et le jeudi. Je n\'aime pas le café. J\'ai un petit frère, il s\'appelle Thomas. Il a dix-huit ans. Nos parents habitent à Lyon. Pendant le week-end, j\'aime écouter de la musique et regarder des films. J\'aime aussi me promener dans le parc avec mes amis. Ma couleur préférée est le bleu. J\'ai un chat qui s\'appelle Minou. Il est très mignon et j\'aime jouer avec lui. Voilà ma présentation ! Merci beaucoup.', '2026-06-16 17:37:56', 'A1', 'IA', NULL),
(68, 'La vie d\'un étudiant en Chine', 'Erreur Gemini : file_get_contents(https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=AQ.Ab8RN6JAn3QjUZcds-lyka9GTZVORNAiX1lh8nomuBHcwef9IQ): Failed to open stream: HTTP request failed! HTTP/1.1 429 Too Many Requests\r\n', '2026-07-01 17:47:20', 'A2', 'IA', NULL),
(69, 'La guerre en Iran', 'Des délégations américaines et iraniennes se déploient cette semaine à Doha pour des discussions cruciales par l’intermédiaire de médiateurs qataris. L’objectif est de consolider le protocole d’accord du 17 juin visant à mettre fin à la guerre.\r\nUne trêve sur le fil du rasoir. Pour sauver les accords déjà signés, le Qatar redevient l’intermédiaire clé pour les discussions indirectes entre les États-Unis et l’Iran.\r\nArrivés mardi à Doha, les émissaires américains Steve Witkoff et Jared Kushner, \"hommes de confiance du président Donald Trump\", ont entamé des échanges avec les responsables qataris. De son côté, la diplomatie iranienne dépêche ce mercredi une \"délégation d’experts\" menée par le vice-ministre des Affaires étrangères, Kazem Gharibabadi. Cependant, Téhéran reste ferme sur sa ligne de conduite politique : \"Dans les prochains jours, nous ne négocierons pas avec la partie américaine, à aucun niveau\", a martelé le porte-parole iranien Esmaïl Baghaï, balayant l’idée d’une rencontre directe. Article rédigé par Philippe Salvador dans la Dépêche du Midi du 01/07/2026', '2026-07-01 17:47:50', 'B1', 'IA', NULL),
(70, 'La guerre en Ukraine', 'Erreur Gemini : file_get_contents(https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=AQ.Ab8RN6JAn3QjUZcds-lyka9GTZVORNAiX1lh8nomuBHcwef9IQ): Failed to open stream: HTTP request failed! HTTP/1.1 429 Too Many Requests\r\n', '2026-07-01 17:50:41', 'B1', 'IA', NULL),
(71, 'Histoire de la Chine', 'Erreur Gemini : file_get_contents(https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=AQ.Ab8RN6JAn3QjUZcds-lyka9GTZVORNAiX1lh8nomuBHcwef9IQ): Failed to open stream: HTTP request failed! HTTP/1.1 429 Too Many Requests\r\n', '2026-07-01 18:04:52', 'B1', 'IA', NULL),
(72, 'Culture japonais', 'La culture japonaise est un mélange intéressant de traditions et de modernité. Les Japonais sont connus pour leur politesse et leur respect. Au Japon, on peut voir de beaux temples et des jardins zen calmes. La nature est très importante, surtout les cerisiers en fleurs, appelés sakura, au printemps. Beaucoup de gens vont les admirer.\n\nLa cuisine japonaise est très célèbre. Le sushi et le ramen sont des plats connus dans le monde entier. Pour les loisirs, les mangas et les animes sont très populaires, même à l\'étranger. Le sumo est un sport traditionnel important. La culture japonaise est unique. Elle combine d\'anciennes coutumes avec de nouvelles idées.', '2026-07-02 09:24:58', 'A2', 'IA', NULL),
(73, 'Culture japonaise', 'Erreur Gemini : file_get_contents(https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=AQ.Ab8RN6JAn3QjUZcds-lyka9GTZVORNAiX1lh8nomuBHcwef9IQ): Failed to open stream: HTTP request failed! HTTP/1.1 429 Too Many Requests\r\n', '2026-07-02 09:25:00', 'A2', 'IA', NULL),
(74, 'La vie d\'un étudiant en informatique', 'La vie d\'un étudiant en informatique est souvent synonyme de défis, mais aussi de passion. Chaque matin, le réveil sonne tôt pour assister aux cours magistraux où les bases théoriques sont posées. Ensuite, les après-midis sont consacrées aux travaux pratiques (TP) devant l\'ordinateur. C\'est là qu\'il apprend à coder, à débugger et à concevoir des algorithmes complexes.\n\nLes projets de groupe occupent une grande partie de son temps. Il faut collaborer, partager des idées et résoudre des problèmes ensemble, parfois jusque tard dans la nuit. La bibliothèque devient un lieu familier pour les révisions, souvent accompagné de tasses de café.\n\nMalgré la fatigue, cette vie est stimulante. La satisfaction de voir un programme fonctionner ou de trouver une solution à un bug est immense. Ce jeune passionné rêve de développer des applications innovantes et de contribuer au monde numérique. Son parcours demande rigueur et persévérance, mais la récompense est prometteuse.', '2026-07-08 09:20:54', 'B1', 'IA', NULL),
(75, 'Que faire après les études?', 'La fin des études marque toujours une étape majeure dans la vie. De nombreux jeunes se posent alors la question cruciale : \"Que faire après ?\" Pour beaucoup, la première étape consiste à chercher un emploi. Il s\'agit d\'acquérir une première expérience dans le monde professionnel, souvent à travers des stages ou des contrats temporaires qui mènent à un poste stable.\n\nD\'autres préfèrent poursuivre leurs études pour se spécialiser davantage ou acquérir de nouvelles compétences. Un master, une formation complémentaire, ou même une réorientation, peut ouvrir de nouvelles portes. Certains choisissent également de prendre une année sabbatique, de voyager ou de faire du bénévolat. Ces expériences permettent de mûrir, de découvrir d\'autres cultures et d\'affiner ses projets.\n\nIl est essentiel de prendre le temps de réfléchir à ses aspirations personnelles et professionnelles. Chaque parcours est unique, et le plus important est de trouver le chemin qui correspond le mieux à ses envies et à ses compétences.', '2026-07-08 09:23:16', 'B1', 'IA', NULL),
(76, 'Voyager à travers le monde', 'Voyager à travers le monde représente une aspiration profonde pour beaucoup. C\'est l\'opportunité de s\'immerger dans des cultures différentes, de contempler des paysages à couper le souffle et de goûter à des saveurs exotiques. Imaginez-vous flâner dans les rues animées de Marrakech, explorer les vestiges antiques de Rome ou vous émerveiller devant les glaciers immenses de Patagonie.\n\nChaque étape de ce périple unique enrichit l\'esprit et élargit nos perspectives. On y apprend la tolérance, la curiosité et l\'adaptabilité. Rencontrer des habitants, échanger quelques mots dans leur langue et partager un repas local sont des moments qui forgent des souvenirs impérissables. Même si une telle aventure demande préparation et parfois un certain budget, les récompenses personnelles sont inestimables. Voyager, c\'est avant tout se découvrir soi-même à travers le regard de l\'autre et la beauté du monde.', '2026-07-08 09:24:54', 'B1', 'IA', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `dictionnaire`
--

CREATE TABLE `dictionnaire` (
  `id` int(11) NOT NULL,
  `mot` varchar(100) DEFAULT NULL,
  `definition` text DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `niveau` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `dictionnaire`
--

INSERT INTO `dictionnaire` (`id`, `mot`, `definition`, `date_creation`, `niveau`) VALUES
(656, 'bonjour', 'Salutation utilisée le matin ou pendant la journée.', '2026-06-01 18:16:34', 'A1'),
(657, 'présenter', 'Montrer ou faire connaître quelqu\'un ou quelque chose.', '2026-06-01 18:16:34', 'A1'),
(658, 'cest', 'Forme courte de \'c\'est\', pour identifier ou décrire.', '2026-06-01 18:16:34', 'A1'),
(659, 'facile', 'Qui n\'est pas difficile, simple à faire ou à comprendre.', '2026-06-01 18:16:34', 'A1'),
(660, 'commence', 'Débuter, démarrer une action ou une période.', '2026-06-01 18:16:34', 'A1'),
(661, 'par', 'Préposition indiquant le moyen ou l\'agent.', '2026-06-01 18:16:34', 'A1'),
(662, 'dire', 'Exprimer avec des mots, parler.', '2026-06-01 18:16:34', 'A1'),
(663, 'son', 'Déterminant possessif (à lui/elle).', '2026-06-01 18:16:34', 'A1'),
(664, 'nom', 'Le mot qui identifie une personne ou une chose.', '2026-06-01 18:16:34', 'A1'),
(665, 'exemple', 'Un cas typique pour expliquer ou illustrer.', '2026-06-01 18:16:34', 'A1'),
(666, 'mappelle', 'Je m\'appelle, pour donner son nom.', '2026-06-01 18:16:34', 'A1'),
(667, 'marie', 'Un prénom féminin courant.', '2026-06-01 18:16:34', 'A1'),
(668, 'ensuite', 'Après cela, après un événement.', '2026-06-01 18:16:34', 'A1'),
(669, 'peut', 'Forme du verbe \'pouvoir\', avoir la capacité de faire quelque chose.', '2026-06-01 18:16:34', 'A1'),
(670, 'âge', 'Le nombre d\'années vécues par une personne.', '2026-06-01 18:16:34', 'A1'),
(671, 'jai', 'Forme de \'j\'ai\', pour indiquer la possession ou l\'âge.', '2026-06-01 18:16:34', 'A1'),
(672, 'trente', 'Le nombre 30.', '2026-06-01 18:16:34', 'A1'),
(673, 'ans', 'Unité de temps, une période de douze mois.', '2026-06-01 18:16:34', 'A1'),
(674, 'parle', 'Forme du verbe \'parler\', communiquer oralement.', '2026-06-01 18:16:34', 'A1'),
(675, 'nationalité', 'Le pays d\'origine d\'une personne.', '2026-06-01 18:16:34', 'A1'),
(676, 'espagnole', 'Qui vient d\'Espagne (féminin).', '2026-06-01 18:16:34', 'A1'),
(677, 'viens', 'Forme du verbe \'venir\', arriver d\'un lieu.', '2026-06-01 18:16:34', 'A1'),
(678, 'despagne', 'De l\'Espagne, indique l\'origine.', '2026-06-01 18:16:34', 'A1'),
(679, 'puis', 'Ensuite, après cela.', '2026-06-01 18:16:34', 'A1'),
(680, 'indique', 'Montrer, signaler ou désigner quelque chose.', '2026-06-01 18:16:34', 'A1'),
(681, 'où', 'Questionne le lieu, l\'endroit.', '2026-06-01 18:16:34', 'A1'),
(682, 'habite', 'Forme du verbe \'habiter\', vivre dans un lieu.', '2026-06-01 18:16:34', 'A1'),
(683, 'jhabite', 'J\'habite, pour dire où l\'on vit.', '2026-06-01 18:16:34', 'A1'),
(684, 'lyon', 'Une grande ville en France.', '2026-06-01 18:16:34', 'A1'),
(685, 'travaille', 'Forme du verbe \'travailler\', faire une activité professionnelle.', '2026-06-01 18:16:34', 'A1'),
(686, 'dit', 'Forme du verbe \'dire\' (il/elle/on dit) ou \'parler\'.', '2026-06-01 18:16:34', 'A1'),
(687, 'professeur', 'Personne qui enseigne dans une école ou une université.', '2026-06-01 18:16:34', 'A1'),
(688, 'danglais', 'D\'anglais, relatif à la langue anglaise.', '2026-06-01 18:16:34', 'A1'),
(689, 'étudiant', 'Personne qui étudie à l\'université ou dans une école supérieure.', '2026-06-01 18:16:34', 'A1'),
(690, 'étudiante', 'Femme qui étudie à l\'université ou dans une école supérieure.', '2026-06-01 18:16:34', 'A1'),
(691, 'économie', 'Science qui étudie la production et la distribution des richesses.', '2026-06-01 18:16:34', 'A1'),
(692, 'on', 'Pronom personnel indéfini, signifie \'nous\' ou \'les gens\'.', '2026-06-01 18:16:34', 'A1'),
(693, 'aussi', 'Également, de la même manière.', '2026-06-01 18:16:34', 'A1'),
(694, 'parler', 'Communiquer oralement avec des mots.', '2026-06-01 18:16:34', 'A1'),
(695, 'quon', 'Que l\'on, pronom relatif suivi de \'on\'.', '2026-06-01 18:16:34', 'A1'),
(696, 'aime', 'Forme du verbe \'aimer\', avoir de l\'affection ou une préférence.', '2026-06-01 18:16:34', 'A1'),
(697, 'jaime', 'J\'aime, pour exprimer une préférence ou un sentiment positif.', '2026-06-01 18:16:34', 'A1'),
(698, 'cinéma', 'Lieu où l\'on regarde des films.', '2026-06-01 18:16:34', 'A1'),
(699, 'sport', 'Activité physique pratiquée pour le plaisir ou en compétition.', '2026-06-01 18:16:34', 'A1'),
(700, 'lecture', 'L\'action de lire des livres ou d\'autres textes.', '2026-06-01 18:16:34', 'A1'),
(701, 'naime', 'N\'aime, ne pas aimer.', '2026-06-01 18:16:34', 'A1'),
(702, 'pas', 'Mot utilisé pour la négation (avec \'ne\').', '2026-06-01 18:16:34', 'A1'),
(703, 'pluie', 'Eau qui tombe du ciel.', '2026-06-01 18:16:34', 'A1'),
(704, 'mentionner', 'Parler de quelque chose, citer.', '2026-06-01 18:16:34', 'A1'),
(705, 'famille', 'Groupe de personnes liées par le sang ou le mariage.', '2026-06-01 18:16:34', 'A1'),
(706, 'frère', 'Garçon qui a les mêmes parents qu\'une autre personne.', '2026-06-01 18:16:34', 'A1'),
(707, 'sœur', 'Fille qui a les mêmes parents qu\'une autre personne.', '2026-06-01 18:16:34', 'A1'),
(708, 'pour', 'Préposition indiquant le but ou la destination.', '2026-06-01 18:16:34', 'A1'),
(709, 'finir', 'Terminer, achever quelque chose.', '2026-06-01 18:16:34', 'A1'),
(710, 'enchantée', 'Formule de politesse, très contente de rencontrer quelqu\'un (féminin).', '2026-06-01 18:16:34', 'A1'),
(711, 'vous', 'Pronom personnel, pour la politesse ou plusieurs personnes.', '2026-06-01 18:16:34', 'A1'),
(712, 'rencontrer', 'Faire la connaissance de quelqu\'un.', '2026-06-01 18:16:34', 'A1'),
(713, 'maintenant', 'À ce moment précis, tout de suite.', '2026-06-01 18:16:34', 'A1'),
(716, 'marc', 'Un prénom pour un garçon.', '2026-06-06 06:56:56', 'A1'),
(717, 'chaque', 'Tous les (jours, matins), sans exception.', '2026-06-06 06:56:56', 'A1'),
(718, 'matin', 'La première partie de la journée, après la nuit.', '2026-06-06 06:56:56', 'A1'),
(719, 'lève', 'Je me sors du lit.', '2026-06-06 06:56:56', 'A1'),
(720, 'sept', 'Le chiffre 7.', '2026-06-06 06:56:56', 'A1'),
(721, 'heures', 'Un moment précis de la journée (ex: 7 heures).', '2026-06-06 06:56:56', 'A1'),
(722, 'prends', 'Je mange ou je bois quelque chose.', '2026-06-06 06:56:56', 'A1'),
(723, 'mon', 'Possessif, ce qui est à moi (masculin singulier).', '2026-06-06 06:56:56', 'A1'),
(724, 'petitdéjeuner', 'Le premier repas du matin.', '2026-06-06 06:56:56', 'A1'),
(725, 'pain', 'Aliment fait avec de la farine, on le mange.', '2026-06-06 06:56:56', 'A1'),
(726, 'lait', 'Boisson blanche, souvent de la vache.', '2026-06-06 06:56:56', 'A1'),
(728, 'brosse', 'Action de nettoyer, par exemple ses dents.', '2026-06-06 06:56:56', 'A1'),
(729, 'dents', 'Petits os dans la bouche pour manger.', '2026-06-06 06:56:56', 'A1'),
(730, 'après', 'Plus tard, à la suite de.', '2026-06-06 06:56:56', 'A1'),
(731, 'vais', 'Je me déplace, je pars quelque part.', '2026-06-06 06:56:56', 'A1'),
(732, 'lécole', 'Le lieu où les enfants étudient.', '2026-06-06 06:56:56', 'A1'),
(733, 'jétudie', 'J\'apprends des choses à l\'école.', '2026-06-06 06:56:56', 'A1'),
(734, 'français', 'La langue parlée en France.', '2026-06-06 06:56:56', 'A1'),
(735, 'maths', 'Matière scolaire où l\'on fait des calculs.', '2026-06-06 06:56:56', 'A1'),
(736, 'à', 'Préposition qui indique un lieu ou un moment.', '2026-06-06 06:56:56', 'A1'),
(737, 'midi', 'Le milieu de la journée, 12h00.', '2026-06-06 06:56:56', 'A1'),
(738, 'déjeune', 'Je mange le repas de midi.', '2026-06-06 06:56:56', 'A1'),
(739, 'avec', 'En compagnie de.', '2026-06-06 06:56:56', 'A1'),
(740, 'mes', 'Possessif, ce qui est à moi (pluriel).', '2026-06-06 06:56:56', 'A1'),
(741, 'amis', 'Personnes qu\'on aime bien et qu\'on connaît.', '2026-06-06 06:56:56', 'A1'),
(742, 'laprèsmidi', 'La partie de la journée entre midi et le soir.', '2026-06-06 06:56:57', 'A1'),
(744, 'dautres', 'D\'autres choses, différentes.', '2026-06-06 06:56:57', 'A1'),
(745, 'leçons', 'Des cours pour apprendre des choses.', '2026-06-06 06:56:57', 'A1'),
(746, 'quatre', 'Le chiffre 4.', '2026-06-06 06:56:57', 'A1'),
(747, 'finie', 'Terminée, achevée (féminin).', '2026-06-06 06:56:57', 'A1'),
(748, 'rentre', 'Je retourne chez moi.', '2026-06-06 06:56:57', 'A1'),
(749, 'maison', 'L\'endroit où l\'on habite.', '2026-06-06 06:56:57', 'A1'),
(750, 'ma', 'Possessif, ce qui est à moi (féminin singulier).', '2026-06-06 06:56:57', 'A1'),
(751, 'mère', 'La maman.', '2026-06-06 06:56:57', 'A1'),
(752, 'prépare', 'Elle cuisine ou organise quelque chose.', '2026-06-06 06:56:57', 'A1'),
(753, 'dîner', 'Le repas du soir.', '2026-06-06 06:56:57', 'A1'),
(755, 'moi', 'La personne qui parle.', '2026-06-06 06:56:57', 'A1'),
(756, 'jouons', 'Nous faisons une activité amusante, un jeu.', '2026-06-06 06:56:57', 'A1'),
(757, 'le', 'Article défini masculin singulier.', '2026-06-06 06:56:57', 'A1'),
(758, 'soir', 'La fin de la journée, avant la nuit.', '2026-06-06 06:56:57', 'A1'),
(759, 'nous', 'Moi et d\'autres personnes.', '2026-06-06 06:56:57', 'A1'),
(760, 'dînons', 'Nous mangeons le repas du soir.', '2026-06-06 06:56:57', 'A1'),
(761, 'ensemble', 'Tous ensemble, avec d\'autres personnes.', '2026-06-06 06:56:57', 'A1'),
(762, 'fais', 'J\'accomplis une tâche ou une action.', '2026-06-06 06:56:57', 'A1'),
(763, 'devoirs', 'Travail scolaire à faire à la maison.', '2026-06-06 06:56:57', 'A1'),
(764, 'regarde', 'Je vois avec mes yeux.', '2026-06-06 06:56:57', 'A1'),
(765, 'télévision', 'Appareil pour regarder des programmes.', '2026-06-06 06:56:57', 'A1'),
(766, 'neuf', 'Le chiffre 9.', '2026-06-06 06:56:57', 'A1'),
(767, 'lit', 'Meuble sur lequel on dort.', '2026-06-06 06:56:57', 'A1'),
(768, 'fatigué', 'Quand on a besoin de repos ou de dormir.', '2026-06-06 06:56:57', 'A1'),
(769, 'erreur', 'Une faute, quelque chose qui n\'est pas correct.', '2026-06-15 13:27:37', 'A1'),
(770, 'gemini', 'Un nom de modèle d\'intelligence artificielle de Google.', '2026-06-15 13:27:37', 'A1'),
(771, 'filegetcontentshttpsgenerativelanguagegoogleapiscomvbetamodelsgeminiflashgeneratecontentkeyaizasydls', 'C\'est une longue adresse internet pour obtenir des informations.', '2026-06-15 13:27:37', 'A1'),
(772, 'failed', 'Ça n\'a pas marché, ça n\'a pas réussi.', '2026-06-15 13:27:37', 'A1'),
(773, 'open', 'Ouvrir, rendre accessible.', '2026-06-15 13:27:37', 'A1'),
(774, 'stream', 'Un flux continu de données ou de son/image.', '2026-06-15 13:27:37', 'A1'),
(775, 'http', 'C\'est un protocole pour communiquer sur internet.', '2026-06-15 13:27:37', 'A1'),
(776, 'request', 'Une demande, l\'action de demander quelque chose.', '2026-06-15 13:27:37', 'A1'),
(777, 'service', 'L\'aide ou le travail qu\'on offre.', '2026-06-15 13:27:37', 'A1'),
(778, 'unavailable', 'Pas disponible, on ne peut pas l\'utiliser ou l\'atteindre.', '2026-06-15 13:27:37', 'A1'),
(779, 'bourse', 'Un lieu où l\'on achète et vend des actions d\'entreprises.', '2026-06-15 13:35:22', 'A1'),
(780, 'new', '(anglais) nouveau.', '2026-06-15 13:35:22', 'A1'),
(781, 'york', 'Ville des États-Unis (avec \"New\").', '2026-06-15 13:35:22', 'A1'),
(782, 'endroit', 'Un lieu, une place.', '2026-06-15 13:35:22', 'A1'),
(783, 'très', 'Beaucoup, vraiment.', '2026-06-15 13:35:22', 'A1'),
(784, 'célèbre', 'Connu par beaucoup de monde.', '2026-06-15 13:35:22', 'A1'),
(785, 'elle', 'Pronom, pour une femme ou une chose féminine.', '2026-06-15 13:35:22', 'A1'),
(786, 'wall', '(anglais) un mur.', '2026-06-15 13:35:22', 'A1'),
(787, 'street', '(anglais) une rue.', '2026-06-15 13:35:22', 'A1'),
(789, 'grand', 'De grande taille.', '2026-06-15 13:35:22', 'A1'),
(790, 'bâtiment', 'Une construction, comme une maison haute.', '2026-06-15 13:35:22', 'A1'),
(791, 'toujours', 'Tout le temps.', '2026-06-15 13:35:22', 'A1'),
(792, 'plein', 'Rempli, complet.', '2026-06-15 13:35:22', 'A1'),
(793, 'dactivité', 'De l\'action, du travail.', '2026-06-15 13:35:22', 'A1'),
(794, 'beaucoup', 'En grande quantité.', '2026-06-15 13:35:22', 'A1'),
(795, 'personnes', 'Des êtres humains.', '2026-06-15 13:35:22', 'A1'),
(796, 'appelées', 'Qui ont un certain nom.', '2026-06-15 13:35:22', 'A1'),
(797, 'traders', 'Personnes qui achètent et vendent des actions à la bourse.', '2026-06-15 13:35:22', 'A1'),
(798, 'travaillent', 'Font un métier.', '2026-06-15 13:35:22', 'A1'),
(799, 'ils', 'Pronom, pour plusieurs hommes ou choses masculines.', '2026-06-15 13:35:22', 'A1'),
(800, 'achètent', 'Payent pour avoir quelque chose.', '2026-06-15 13:35:22', 'A1'),
(801, 'vendent', 'Donnent quelque chose contre de l\'argent.', '2026-06-15 13:35:22', 'A1'),
(802, 'actions', 'Petites parts d\'une entreprise qu\'on peut acheter.', '2026-06-15 13:35:22', 'A1'),
(803, 'une', 'Article indéfini féminin singulier.', '2026-06-15 13:35:22', 'A1'),
(804, 'action', 'Une petite part d\'une entreprise.', '2026-06-15 13:35:22', 'A1'),
(805, 'petite', 'De petite taille.', '2026-06-15 13:35:22', 'A1'),
(806, 'partie', 'Un morceau, une section.', '2026-06-15 13:35:22', 'A1'),
(807, 'dune', 'De une.', '2026-06-15 13:35:22', 'A1'),
(808, 'entreprise', 'Une société qui produit ou vend.', '2026-06-15 13:35:22', 'A1'),
(809, 'quand', 'Au moment où.', '2026-06-15 13:35:22', 'A1'),
(810, 'entreprises', 'Plusieurs sociétés.', '2026-06-15 13:35:22', 'A1'),
(811, 'vont', '(ici) Sont, se portent.', '2026-06-15 13:35:22', 'A1'),
(812, 'bien', 'De bonne manière, correctement.', '2026-06-15 13:35:22', 'A1'),
(813, 'prix', 'La valeur en argent de quelque chose.', '2026-06-15 13:35:22', 'A1'),
(814, 'monte', 'Va vers le haut, augmente.', '2026-06-15 13:35:22', 'A1'),
(815, 'elles', 'Pronom, pour plusieurs femmes ou choses féminines.', '2026-06-15 13:35:22', 'A1'),
(816, 'moins', 'Le contraire de plus.', '2026-06-15 13:35:22', 'A1'),
(817, 'descend', 'Va vers le bas, diminue.', '2026-06-15 13:35:22', 'A1'),
(818, 'important', 'Qui a beaucoup d\'influence, de valeur.', '2026-06-15 13:35:22', 'A1'),
(819, 'léconomie', 'Le système d\'argent et de commerce d\'un pays.', '2026-06-15 13:35:22', 'A1'),
(820, 'monde', 'La Terre, l\'ensemble des pays.', '2026-06-15 13:35:22', 'A1'),
(821, 'entier', 'Complet, tout.', '2026-06-15 13:35:22', 'A1'),
(822, 'la', 'Article défini féminin singulier.', '2026-06-15 13:35:22', 'A1'),
(823, 'ouverte', 'Non fermée, accessible.', '2026-06-15 13:35:22', 'A1'),
(824, 'lundi', 'Le premier jour de la semaine de travail.', '2026-06-15 13:35:22', 'A1'),
(825, 'vendredi', 'Le dernier jour de la semaine de travail.', '2026-06-15 13:35:22', 'A1'),
(826, 'weekend', 'Le samedi et le dimanche.', '2026-06-15 13:35:22', 'A1'),
(827, 'fermée', 'Non ouverte, inaccessible.', '2026-06-15 13:35:22', 'A1'),
(828, 'vite', 'Rapidement.', '2026-06-15 13:35:22', 'A1'),
(829, 'regardent', 'Fixent les yeux sur.', '2026-06-15 13:35:22', 'A1'),
(830, 'décrans', 'Surfaces d\'affichage (ordinateur, TV).', '2026-06-15 13:35:22', 'A1'),
(831, 'symbole', 'Un signe qui représente une idée.', '2026-06-15 13:35:22', 'A1'),
(832, 'dargent', 'De l\'argent, la monnaie.', '2026-06-15 13:35:22', 'A1'),
(833, 'commerce', 'L\'achat et la vente de produits.', '2026-06-15 13:35:22', 'A1'),
(834, 'terre', 'La planète où nous vivons.', '2026-06-15 13:49:48', 'A1'),
(835, 'notre', 'Qui nous appartient.', '2026-06-15 13:49:48', 'A1'),
(837, 'humains', 'Les personnes, les hommes et les femmes.', '2026-06-15 13:49:48', 'A1'),
(838, 'font', 'Ils font (verbe faire).', '2026-06-15 13:49:48', 'A1'),
(840, 'choses', 'Des objets ou des idées.', '2026-06-15 13:49:48', 'A1'),
(842, 'construisons', 'Nous construisons (faire une maison, un bâtiment).', '2026-06-15 13:49:48', 'A1'),
(843, 'villes', 'De grands endroits avec beaucoup de maisons et de gens.', '2026-06-15 13:49:48', 'A1'),
(844, 'maisons', 'Bâtiments pour vivre.', '2026-06-15 13:49:48', 'A1'),
(845, 'faisons', 'Nous faisons (verbe faire).', '2026-06-15 13:49:48', 'A1'),
(846, 'usines', 'Des lieux où l\'on fabrique des produits.', '2026-06-15 13:49:48', 'A1'),
(847, 'utilisons', 'Nous utilisons (se servir de quelque chose).', '2026-06-15 13:49:48', 'A1'),
(848, 'voitures', 'Véhicules pour rouler sur la route.', '2026-06-15 13:49:48', 'A1'),
(849, 'avions', 'Véhicules qui volent dans le ciel.', '2026-06-15 13:49:48', 'A1'),
(850, 'ces', 'Adjectif pour montrer plusieurs choses.', '2026-06-15 13:49:48', 'A1'),
(851, 'activités', 'Ce que l\'on fait.', '2026-06-15 13:49:48', 'A1'),
(852, 'changent', 'Ils changent (deviennent différents).', '2026-06-15 13:49:48', 'A1'),
(853, 'déchets', 'Ce qu\'on jette, ce qui n\'est plus utile.', '2026-06-15 13:49:48', 'A1'),
(854, 'partout', 'Dans tous les endroits.', '2026-06-15 13:49:48', 'A1'),
(855, 'leau', 'L\'eau, un liquide essentiel pour vivre.', '2026-06-15 13:49:48', 'A1'),
(856, 'lair', 'L\'air, ce que nous respirons.', '2026-06-15 13:49:48', 'A1'),
(859, 'propres', 'Qui n\'est pas sale.', '2026-06-15 13:49:48', 'A1'),
(860, 'darbres', 'D\'arbres, de grandes plantes avec un tronc.', '2026-06-15 13:49:48', 'A1'),
(861, 'coupés', 'Qui a été séparé ou abattu.', '2026-06-15 13:49:48', 'A1'),
(862, 'certains', 'Quelques-uns, pas tous.', '2026-06-15 13:49:48', 'A1'),
(863, 'animaux', 'Êtres vivants qui bougent (chiens, chats, oiseaux...).', '2026-06-15 13:49:48', 'A1'),
(864, 'nont', 'Ils n\'ont pas (négation du verbe avoir).', '2026-06-15 13:49:48', 'A1'),
(865, 'plus', 'Négation \'ne... plus\', il n\'y en a pas davantage.', '2026-06-15 13:49:48', 'A1'),
(866, 'leur', 'Appartient à eux ou à elles.', '2026-06-15 13:49:48', 'A1'),
(867, 'plantes', 'Des êtres vivants qui poussent (fleurs, arbres).', '2026-06-15 13:49:48', 'A1'),
(868, 'disparaissent', 'Ils disparaissent (ne sont plus là).', '2026-06-15 13:49:48', 'A1'),
(870, 'problème', 'Une difficulté à résoudre.', '2026-06-15 13:49:48', 'A1'),
(871, 'devons', 'Nous devons (il faut faire quelque chose).', '2026-06-15 13:49:48', 'A1'),
(872, 'penser', 'Utiliser son esprit, réfléchir.', '2026-06-15 13:49:48', 'A1'),
(873, 'pouvons', 'Nous pouvons (avoir la possibilité de faire).', '2026-06-15 13:49:48', 'A1'),
(874, 'trier', 'Séparer les choses par catégories.', '2026-06-15 13:49:48', 'A1'),
(875, 'nos', 'Qui nous appartient (pluriel).', '2026-06-15 13:49:48', 'A1'),
(876, 'marcher', 'Se déplacer à pied.', '2026-06-15 13:49:48', 'A1'),
(877, 'faire', 'Réaliser une action.', '2026-06-15 13:49:48', 'A1'),
(878, 'vélo', 'Une bicyclette.', '2026-06-15 13:49:48', 'A1'),
(880, 'planter', 'Mettre en terre pour que ça pousse.', '2026-06-15 13:49:48', 'A1'),
(881, 'arbres', 'Grandes plantes avec un tronc en bois.', '2026-06-15 13:49:48', 'A1'),
(882, 'faut', 'Il faut (c\'est nécessaire).', '2026-06-15 13:49:48', 'A1'),
(883, 'protéger', 'Garder en sécurité, défendre.', '2026-06-15 13:49:48', 'A1'),
(884, 'nature', 'L\'environnement avec les plantes et les animaux.', '2026-06-15 13:49:48', 'A1'),
(886, 'futur', 'Le temps qui vient après aujourd\'hui.', '2026-06-15 13:49:48', 'A1'),
(887, 'chutes', 'Quand l\'eau tombe d\'un endroit haut.', '2026-06-15 13:59:21', 'A1'),
(888, 'niagara', 'Nom de très grandes chutes d\'eau.', '2026-06-15 13:59:21', 'A1'),
(890, 'célèbres', 'Que beaucoup de gens connaissent.', '2026-06-15 13:59:21', 'A1'),
(892, 'amérique', 'Un grand continent.', '2026-06-15 13:59:21', 'A1'),
(893, 'nord', 'Le côté où le soleil est le plus bas en hiver.', '2026-06-15 13:59:21', 'A1'),
(895, 'deau', 'D\'eau, liquide que l\'on boit.', '2026-06-15 13:59:21', 'A1'),
(896, 'qui', 'Pronom pour parler d\'une personne ou d\'une chose.', '2026-06-15 13:59:21', 'A1'),
(897, 'tombe', 'Va vers le bas, chute.', '2026-06-15 13:59:21', 'A1'),
(899, 'vient', 'Arrive de quelque part.', '2026-06-15 13:59:21', 'A1'),
(900, 'dun', 'De un.', '2026-06-15 13:59:21', 'A1'),
(902, 'lac', 'Une grande étendue d\'eau, plus petite qu\'une mer.', '2026-06-15 13:59:21', 'A1'),
(904, 'impressionnant', 'Qui fait une forte impression, surprend beaucoup.', '2026-06-15 13:59:21', 'A1'),
(905, 'voir', 'Percevoir avec les yeux.', '2026-06-15 13:59:21', 'A1'),
(907, 'entendre', 'Percevoir avec les oreilles.', '2026-06-15 13:59:21', 'A1'),
(908, 'bruit', 'Son, quelque chose que l\'on entend.', '2026-06-15 13:59:21', 'A1'),
(909, 'fort', 'Puissant, intense.', '2026-06-15 13:59:21', 'A1'),
(910, 'touristes', 'Personnes qui visitent un nouvel endroit.', '2026-06-15 13:59:21', 'A1'),
(911, 'viennent', 'Arrivent.', '2026-06-15 13:59:21', 'A1'),
(912, 'visiter', 'Aller voir un endroit.', '2026-06-15 13:59:21', 'A1'),
(915, 'année', 'Période de douze mois.', '2026-06-15 13:59:21', 'A1'),
(918, 'prennent', 'Saisissent, captent (ici, des photos).', '2026-06-15 13:59:21', 'A1'),
(919, 'photos', 'Images prises avec un appareil.', '2026-06-15 13:59:21', 'A1'),
(920, 'belle', 'Jolie, agréable à regarder.', '2026-06-15 13:59:21', 'A1'),
(921, 'vue', 'Paysage que l\'on voit.', '2026-06-15 13:59:21', 'A1'),
(922, 'souvent', 'Plusieurs fois, fréquemment.', '2026-06-15 13:59:21', 'A1'),
(923, 'arcenciel', 'Bande de couleurs dans le ciel après la pluie.', '2026-06-15 13:59:21', 'A1'),
(924, 'près', 'Pas loin, à côté.', '2026-06-15 13:59:21', 'A1'),
(925, 'magique', 'Qui semble venir de la magie, merveilleux.', '2026-06-15 13:59:21', 'A1'),
(927, 'promenades', 'Balades, petites sorties.', '2026-06-15 13:59:21', 'A1'),
(928, 'bateau', 'Moyen de transport sur l\'eau.', '2026-06-15 13:59:21', 'A1'),
(929, 'bateaux', 'Plusieurs bateaux.', '2026-06-15 13:59:21', 'A1'),
(931, 'expérience', 'Ce que l\'on vit, une aventure.', '2026-06-15 13:59:21', 'A1'),
(932, 'unique', 'Le seul de son genre, spécial.', '2026-06-15 13:59:21', 'A1'),
(933, 'puissante', 'Très forte.', '2026-06-15 13:59:21', 'A1'),
(935, 'force', 'Puissance, énergie.', '2026-06-15 13:59:21', 'A1'),
(937, 'voyage', 'Déplacement pour découvrir de nouveaux lieux.', '2026-06-15 13:59:21', 'A1'),
(938, 'mémorable', 'Dont on se souvient longtemps.', '2026-06-15 13:59:21', 'A1'),
(939, 'tous', 'Chaque personne ou chaque chose.', '2026-06-15 13:59:21', 'A1'),
(940, 'tout', 'L\'ensemble, l\'intégralité.', '2026-06-15 13:59:21', 'A1'),
(942, 'devrait', 'Il serait bien de faire quelque chose.', '2026-06-15 13:59:21', 'A1'),
(943, 'jour', 'Période entre le lever et le coucher du soleil.', '2026-06-15 13:59:21', 'A1'),
(944, 'magnifique', 'Très beau, splendide.', '2026-06-15 13:59:21', 'A1'),
(965, 'lémuriens', 'Animaux de Madagascar qui ressemblent à des singes.', '2026-06-15 14:54:39', 'A2'),
(967, 'uniques', 'Qui est le seul de son genre, très spécial.', '2026-06-15 14:54:39', 'A2'),
(969, 'vivent', 'Existent, sont en vie ou habitent un lieu.', '2026-06-15 14:54:39', 'A2'),
(970, 'seulement', 'Juste ça, rien de plus.', '2026-06-15 14:54:39', 'A2'),
(971, 'madagascar', 'Une très grande île, un pays d\'Afrique.', '2026-06-15 14:54:39', 'A2'),
(972, 'grande', 'Qui a une taille importante, le contraire de petit.', '2026-06-15 14:54:39', 'A2'),
(973, 'île', 'Terre entourée d\'eau de tous les côtés.', '2026-06-15 14:54:39', 'A2'),
(975, 'lafrique', 'Un des plus grands continents du monde.', '2026-06-15 14:54:39', 'A2'),
(977, 'mammifères', 'Animaux qui nourrissent leurs bébés avec du lait.', '2026-06-15 14:54:39', 'A2'),
(979, 'grands', 'De grande taille.', '2026-06-15 14:54:39', 'A2'),
(980, 'yeux', 'Organes pour voir.', '2026-06-15 14:54:39', 'A2'),
(981, 'longue', 'Qui mesure beaucoup en longueur.', '2026-06-15 14:54:39', 'A2'),
(982, 'queue', 'Partie à l\'arrière du corps de certains animaux.', '2026-06-15 14:54:39', 'A2'),
(983, 'aiment', 'Apprécient beaucoup, ont de l\'affection.', '2026-06-15 14:54:39', 'A2'),
(984, 'sauter', 'Se propulser en l\'air, faire un bond.', '2026-06-15 14:54:39', 'A2'),
(985, 'darbre', 'De l\'arbre.', '2026-06-15 14:54:39', 'A2'),
(986, 'arbre', 'Grande plante avec un tronc et des branches.', '2026-06-15 14:54:39', 'A2'),
(987, 'forêt', 'Vaste zone couverte de beaucoup d\'arbres.', '2026-06-15 14:54:39', 'A2'),
(988, 'tropicale', 'Qui vient des régions très chaudes.', '2026-06-15 14:54:39', 'A2'),
(989, 'mangent', 'Prennent de la nourriture.', '2026-06-15 14:54:39', 'A2'),
(990, 'fruits', 'Parties des plantes que l\'on peut manger (comme une pomme).', '2026-06-15 14:54:39', 'A2'),
(991, 'feuilles', 'Parties vertes des arbres.', '2026-06-15 14:54:39', 'A2'),
(992, 'parfois', 'De temps en temps, pas toujours.', '2026-06-15 14:54:39', 'A2'),
(993, 'insectes', 'Petits animaux qui ont six pattes.', '2026-06-15 14:54:39', 'A2'),
(994, 'il', 'Pronom pour parler d\'une seule personne ou chose.', '2026-06-15 14:54:39', 'A2'),
(995, 'existe', 'Est présent, est réel.', '2026-06-15 14:54:39', 'A2'),
(996, 'différentes', 'Pas les mêmes, variées.', '2026-06-15 14:54:39', 'A2'),
(997, 'espèces', 'Groupes d\'animaux ou de plantes qui se ressemblent.', '2026-06-15 14:54:39', 'A2'),
(999, 'petits', 'De petite taille.', '2026-06-15 14:54:39', 'A2'),
(1002, 'lémur', 'Nom pour un lémurien.', '2026-06-15 14:54:39', 'A2'),
(1003, 'catta', 'Nom d\'une sorte de lémurien, le lémur à queue rayée.', '2026-06-15 14:54:39', 'A2'),
(1008, 'rayée', 'Qui a des bandes ou des lignes de couleurs.', '2026-06-15 14:54:39', 'A2'),
(1017, 'habitat', 'Le lieu de vie d\'un animal ou d\'une plante.', '2026-06-15 14:54:39', 'A2'),
(1018, 'danger', 'Situation risquée, où il y a un risque.', '2026-06-15 14:54:39', 'A2'),
(1019, 'mais', 'Pour opposer deux idées.', '2026-06-15 14:54:39', 'A2'),
(1020, 'essentiels', 'Très importants, absolument nécessaires.', '2026-06-15 14:54:39', 'A2'),
(1021, 'léquilibre', 'État où tout est stable et harmonieux.', '2026-06-15 14:54:39', 'A2'),
(1022, 'tribunal', 'Lieu où la justice est rendue.', '2026-06-15 14:56:44', 'A1'),
(1023, 'lieu', 'Endroit, place.', '2026-06-15 14:56:44', 'A1'),
(1027, 'salle', 'Grande pièce dans un bâtiment.', '2026-06-15 14:56:44', 'A1'),
(1032, 'résoudre', 'Trouver une solution à un problème.', '2026-06-15 14:56:44', 'A1'),
(1033, 'problèmes', 'Difficultés à résoudre.', '2026-06-15 14:56:44', 'A1'),
(1034, 'dans', 'Indique l\'intérieur d\'un espace ou un moment.', '2026-06-15 14:56:44', 'A1'),
(1035, 'juge', 'Personne qui décide lors d\'un procès.', '2026-06-15 14:56:44', 'A1'),
(1036, 'écoute', 'Fait attention aux sons avec ses oreilles (verbe écouter).', '2026-06-15 14:56:44', 'A1'),
(1039, 'attentivement', 'Avec beaucoup d\'attention.', '2026-06-15 14:56:44', 'A1'),
(1040, 'connaît', 'A des informations sur quelque chose ou quelqu\'un (verbe connaître).', '2026-06-15 14:56:44', 'A1'),
(1041, 'lois', 'Règles officielles d\'un pays.', '2026-06-15 14:56:44', 'A1'),
(1043, 'pays', 'Territoire d\'une nation.', '2026-06-15 14:56:44', 'A1'),
(1044, 'prend', 'Saisit ou fait un choix (verbe prendre).', '2026-06-15 14:56:44', 'A1'),
(1045, 'décisions', 'Choix faits après réflexion.', '2026-06-15 14:56:44', 'A1'),
(1046, 'justes', 'Qui respectent la justice, l\'équité.', '2026-06-15 14:56:44', 'A1'),
(1047, 'but', 'Objectif, ce qu\'on veut atteindre.', '2026-06-15 14:56:44', 'A1'),
(1048, 'trouver', 'Découvrir, localiser.', '2026-06-15 14:56:44', 'A1'),
(1049, 'justice', 'Institution qui applique la loi ; équité.', '2026-06-15 14:56:44', 'A1'),
(1054, 'avocats', 'Professionnels qui défendent les gens en justice.', '2026-06-15 14:56:44', 'A1'),
(1055, 'aident', 'Donnent de l\'aide, du soutien (verbe aider).', '2026-06-15 14:56:44', 'A1'),
(1057, 'parlent', 'Utilisent la voix pour communiquer (verbe parler).', '2026-06-15 14:56:44', 'A1'),
(1058, 'expliquent', 'Rendent quelque chose clair et compréhensible (verbe expliquer).', '2026-06-15 14:56:44', 'A1'),
(1059, 'situation', 'L\'état des choses à un moment donné.', '2026-06-15 14:56:44', 'A1'),
(1060, 'discute', 'Parle avec d\'autres personnes pour échanger des idées (verbe discuter).', '2026-06-15 14:56:44', 'A1'),
(1061, 'règles', 'Instructions ou principes à suivre.', '2026-06-15 14:56:44', 'A1'),
(1064, 'lon', 'Forme littéraire de « on ».', '2026-06-15 14:56:44', 'A1'),
(1065, 'cherche', 'Essaie de trouver (verbe chercher).', '2026-06-15 14:56:44', 'A1'),
(1066, 'vérité', 'Ce qui est réel et exact.', '2026-06-15 14:56:44', 'A1'),
(1068, 'société', 'Groupe de personnes qui vivent ensemble.', '2026-06-15 14:56:44', 'A1'),
(1090, 'm\'appelle', 'C\'est dire son nom (ex: Je m\'appelle Jean).', '2026-06-16 14:38:13', 'A1'),
(1091, 'léa', 'Un prénom, le nom d\'une personne.', '2026-06-16 14:38:13', 'A1'),
(1092, 'j\'ai', 'Posséder quelque chose ou avoir un certain âge.', '2026-06-16 14:38:13', 'A1'),
(1093, 'vingt-cinq', 'Un nombre, 20 + 5.', '2026-06-16 14:38:13', 'A1'),
(1095, 'française', 'Une personne qui vient de France.', '2026-06-16 14:38:13', 'A1'),
(1096, 'j\'habite', 'Vivre dans un endroit, une ville ou une maison.', '2026-06-16 14:38:13', 'A1'),
(1097, 'pari', 'La capitale de la France, une grande ville.', '2026-06-16 14:38:13', 'A1'),
(1099, 'j\'étudie', 'Apprendre des choses à l\'école ou à l\'université.', '2026-06-16 14:38:13', 'A1'),
(1100, 'françai', 'La langue parlée en France.', '2026-06-16 14:38:13', 'A1'),
(1101, 'l\'université', 'Une grande école où on étudie après le lycée.', '2026-06-16 14:38:13', 'A1'),
(1102, 'tou', 'Chaque, tout le monde.', '2026-06-16 14:38:13', 'A1'),
(1104, 'c\'est', 'Cela est, pour présenter ou décrire.', '2026-06-16 14:38:13', 'A1'),
(1105, 'intéressant', 'Quelque chose qui retient l\'attention, qui plaît.', '2026-06-16 14:38:13', 'A1'),
(1106, 'j\'aime', 'Avoir un sentiment positif pour quelque chose ou quelqu\'un.', '2026-06-16 14:38:13', 'A1'),
(1108, 'chocolat', 'Une confiserie sucrée, souvent marron.', '2026-06-16 14:38:13', 'A1'),
(1109, 'lire', 'Regarder des mots et comprendre leur sens.', '2026-06-16 14:38:13', 'A1'),
(1110, 'livre', 'Un objet avec des pages et des mots, pour lire.', '2026-06-16 14:38:13', 'A1'),
(1114, 'comme', 'Pour donner un exemple, similaire à.', '2026-06-16 14:38:13', 'A1'),
(1115, 'natation', 'Nager dans l\'eau.', '2026-06-16 14:38:13', 'A1'),
(1116, 'mardi', 'Le deuxième jour de la semaine.', '2026-06-16 14:38:13', 'A1'),
(1117, 'jeudi', 'Le quatrième jour de la semaine.', '2026-06-16 14:38:13', 'A1'),
(1118, 'n\'aime', 'Ne pas apprécier, ne pas vouloir.', '2026-06-16 14:38:13', 'A1'),
(1120, 'café', 'Une boisson chaude, souvent noire.', '2026-06-16 14:38:13', 'A1'),
(1121, 'petit', 'Le contraire de grand.', '2026-06-16 14:38:13', 'A1'),
(1123, 's\'appelle', 'Dire son nom ou le nom de quelqu\'un.', '2026-06-16 14:38:13', 'A1'),
(1124, 'thoma', 'Un prénom masculin.', '2026-06-16 14:38:13', 'A1'),
(1125, 'dix-huit', 'Un nombre, 10 + 8.', '2026-06-16 14:38:13', 'A1'),
(1127, 'parent', 'Un père ou une mère.', '2026-06-16 14:38:13', 'A1'),
(1128, 'habitent', 'Ils vivent dans un endroit.', '2026-06-16 14:38:13', 'A1'),
(1130, 'pendant', 'Durant, pendant une période de temps.', '2026-06-16 14:38:13', 'A1'),
(1131, 'week-end', 'Les jours de repos, le samedi et le dimanche.', '2026-06-16 14:38:13', 'A1'),
(1132, 'écouter', 'Utiliser ses oreilles pour entendre un son.', '2026-06-16 14:38:13', 'A1'),
(1133, 'musique', 'Des sons harmonieux pour le plaisir.', '2026-06-16 14:38:13', 'A1'),
(1134, 'regarder', 'Voir quelque chose avec les yeux.', '2026-06-16 14:38:13', 'A1'),
(1135, 'film', 'Une histoire racontée avec des images en mouvement.', '2026-06-16 14:38:13', 'A1'),
(1136, 'promener', 'Marcher pour le plaisir, se balader.', '2026-06-16 14:38:13', 'A1'),
(1137, 'parc', 'Un grand jardin public, un espace vert.', '2026-06-16 14:38:13', 'A1'),
(1140, 'ami', 'Une personne qu\'on aime et qu\'on connaît bien.', '2026-06-16 14:38:13', 'A1'),
(1141, 'couleur', 'Une caractéristique visuelle (rouge, bleu, vert...).', '2026-06-16 14:38:13', 'A1'),
(1142, 'préférée', 'Celle qu\'on aime le plus.', '2026-06-16 14:38:13', 'A1'),
(1143, 'bleu', 'Une couleur comme le ciel ou la mer.', '2026-06-16 14:38:13', 'A1'),
(1144, 'chat', 'Un petit animal de compagnie qui miaule.', '2026-06-16 14:38:13', 'A1'),
(1146, 'minou', 'Un petit nom affectueux pour un chat.', '2026-06-16 14:38:13', 'A1'),
(1147, 'trè', 'Très, beaucoup.', '2026-06-16 14:38:13', 'A1'),
(1148, 'mignon', 'Joli, charmant, adorable.', '2026-06-16 14:38:13', 'A1'),
(1149, 'jouer', 'S\'amuser, faire une activité pour le plaisir.', '2026-06-16 14:38:13', 'A1'),
(1150, 'lui', 'Pronom pour une personne ou un animal masculin.', '2026-06-16 14:38:13', 'A1'),
(1151, 'voilà', 'Pour présenter quelque chose ou quelqu\'un.', '2026-06-16 14:38:13', 'A1'),
(1152, 'présentation', 'Le fait de se montrer ou de décrire quelque chose.', '2026-06-16 14:38:13', 'A1'),
(1153, 'merci', 'Pour exprimer sa gratitude.', '2026-06-16 14:38:13', 'A1'),
(1156, 'file', 'Un document ou un dossier numérique.', '2026-07-02 06:25:09', 'A2'),
(1157, 'get', 'Obtenir, prendre.', '2026-07-02 06:25:09', 'A2'),
(1158, 'content', 'Les informations (texte, images) sur une page web.', '2026-07-02 06:25:09', 'A2'),
(1160, 'generativelanguage', 'Un système qui crée du texte avec l\'IA.', '2026-07-02 06:25:09', 'A2'),
(1161, 'googleapi', 'Des outils pour les développeurs de Google.', '2026-07-02 06:25:09', 'A2'),
(1162, 'com', 'Fin d\'une adresse de site web.', '2026-07-02 06:25:09', 'A2'),
(1163, 'beta', 'Une version de test d\'un logiciel.', '2026-07-02 06:25:09', 'A2'),
(1164, 'model', 'Un type d\'IA ou un exemple.', '2026-07-02 06:25:09', 'A2'),
(1165, 'gemini-', 'Début du nom d\'un modèle Gemini.', '2026-07-02 06:25:09', 'A2'),
(1166, '-flash', 'Indique quelque chose de rapide.', '2026-07-02 06:25:09', 'A2'),
(1167, 'generatecontent', 'Créer du contenu (texte, image) avec l\'IA.', '2026-07-02 06:25:09', 'A2'),
(1168, 'key', 'Un code secret pour accéder à un service.', '2026-07-02 06:25:09', 'A2'),
(1169, 'jan', 'Abréviation de Janvier.', '2026-07-02 06:25:09', 'A2'),
(1170, 'qjuzcds-lyka', 'Suite de lettres et chiffres aléatoires.', '2026-07-02 06:25:09', 'A2'),
(1171, 'gtzvornaix', 'Suite de lettres aléatoires.', '2026-07-02 06:25:09', 'A2'),
(1172, 'nomubhcwef', 'Suite de lettres aléatoires.', '2026-07-02 06:25:09', 'A2'),
(1177, 'too', 'Trop, plus que nécessaire.', '2026-07-02 06:25:09', 'A2'),
(1178, 'many', 'Beaucoup.', '2026-07-02 06:25:09', 'A2'),
(1179, 'vie', 'Exister, être en vie.', '2026-07-08 06:21:16', 'B1'),
(1180, 'd\'un', 'Partie de quelque chose ou quelqu\'un.', '2026-07-08 06:21:16', 'B1'),
(1182, 'informatique', 'La science des ordinateurs et de la programmation.', '2026-07-08 06:21:16', 'B1'),
(1184, 'synonyme', 'Mot qui a le même sens qu\'un autre.', '2026-07-08 06:21:16', 'B1'),
(1185, 'défi', 'Une chose difficile à faire, un challenge.', '2026-07-08 06:21:16', 'B1'),
(1186, 'mai', 'Le cinquième mois de l\'année.', '2026-07-08 06:21:16', 'B1'),
(1188, 'passion', 'Un grand intérêt pour quelque chose.', '2026-07-08 06:21:16', 'B1'),
(1191, 'réveil', 'Objet qui sonne pour nous sortir du sommeil.', '2026-07-08 06:21:16', 'B1'),
(1192, 'sonne', 'Faire un bruit (pour une alarme, un téléphone).', '2026-07-08 06:21:16', 'B1'),
(1193, 'tôt', 'Quand il n\'est pas tard, au début d\'une période.', '2026-07-08 06:21:16', 'B1'),
(1194, 'assister', 'Être présent à un événement, participer.', '2026-07-08 06:21:16', 'B1'),
(1195, 'aux', 'Pour plusieurs choses (à les).', '2026-07-08 06:21:16', 'B1'),
(1196, 'cour', 'Une leçon donnée à des étudiants.', '2026-07-08 06:21:16', 'B1'),
(1197, 'magistraux', 'Très important, fondamental (pour un cours).', '2026-07-08 06:21:16', 'B1'),
(1199, 'base', 'Le début, le fondement, l\'essentiel.', '2026-07-08 06:21:16', 'B1'),
(1200, 'théorique', 'Qui vient de la théorie, pas de la pratique.', '2026-07-08 06:21:16', 'B1'),
(1201, 'posée', 'Mise en place, établie.', '2026-07-08 06:21:16', 'B1'),
(1203, 'après-midi', 'La partie du jour entre midi et le soir.', '2026-07-08 06:21:16', 'B1'),
(1204, 'consacrée', 'Donnée entièrement à quelque chose.', '2026-07-08 06:21:16', 'B1'),
(1205, 'travaux', 'Des activités à faire, des exercices.', '2026-07-08 06:21:16', 'B1'),
(1206, 'pratique', 'Ce qui se fait concrètement, par l\'action.', '2026-07-08 06:21:16', 'B1'),
(1207, 'devant', 'En face de quelque chose ou quelqu\'un.', '2026-07-08 06:21:16', 'B1'),
(1208, 'l\'ordinateur', 'Une machine pour travailler, écrire, programmer.', '2026-07-08 06:21:16', 'B1'),
(1211, 'qu\'il', 'Qui concerne la personne \'il\'.', '2026-07-08 06:21:16', 'B1'),
(1212, 'apprend', 'Acquérir des connaissances, étudier.', '2026-07-08 06:21:16', 'B1'),
(1213, 'coder', 'Écrire des instructions pour un ordinateur.', '2026-07-08 06:21:16', 'B1'),
(1214, 'débugger', 'Chercher et corriger les erreurs dans un programme.', '2026-07-08 06:21:16', 'B1'),
(1215, 'concevoir', 'Imaginer et créer quelque chose.', '2026-07-08 06:21:16', 'B1'),
(1216, 'algorithme', 'Une suite d\'instructions pour résoudre un problème.', '2026-07-08 06:21:16', 'B1'),
(1217, 'complexe', 'Difficile à comprendre, compliqué.', '2026-07-08 06:21:16', 'B1'),
(1218, 'projet', 'Une idée ou un plan à réaliser.', '2026-07-08 06:21:16', 'B1'),
(1219, 'groupe', 'Plusieurs personnes ou choses ensemble.', '2026-07-08 06:21:16', 'B1'),
(1220, 'occupent', 'Prendre du temps ou de l\'espace.', '2026-07-08 06:21:16', 'B1'),
(1224, 'temp', 'La durée, les minutes et les heures.', '2026-07-08 06:21:16', 'B1'),
(1226, 'collaborer', 'Travailler ensemble avec d\'autres personnes.', '2026-07-08 06:21:16', 'B1'),
(1227, 'partager', 'Donner une partie à quelqu\'un, échanger.', '2026-07-08 06:21:16', 'B1'),
(1228, 'idée', 'Une pensée, une opinion.', '2026-07-08 06:21:16', 'B1'),
(1232, 'parfoi', 'De temps en temps, pas toujours.', '2026-07-08 06:21:16', 'B1'),
(1233, 'jusque', 'Indique une limite (jusqu\'à).', '2026-07-08 06:21:16', 'B1'),
(1234, 'tard', 'Quand l\'heure est avancée, pas tôt.', '2026-07-08 06:21:16', 'B1'),
(1235, 'nuit', 'La partie sombre du jour, quand on dort.', '2026-07-08 06:21:16', 'B1'),
(1236, 'bibliothèque', 'Endroit où on peut lire et emprunter des livres.', '2026-07-08 06:21:16', 'B1'),
(1237, 'devient', 'Changer d\'état, commencer à être.', '2026-07-08 06:21:16', 'B1'),
(1239, 'familier', 'Que l\'on connaît bien, habituel.', '2026-07-08 06:21:16', 'B1'),
(1240, 'révision', 'Le fait de revoir ce qu\'on a appris.', '2026-07-08 06:21:16', 'B1'),
(1241, 'accompagné', 'Être avec quelqu\'un ou quelque chose.', '2026-07-08 06:21:16', 'B1'),
(1242, 'tasse', 'Petit récipient pour boire du café ou du thé.', '2026-07-08 06:21:16', 'B1'),
(1244, 'malgré', 'Même si, en dépit de.', '2026-07-08 06:21:16', 'B1'),
(1246, 'stimulante', 'Qui donne de l\'énergie, qui encourage.', '2026-07-08 06:21:16', 'B1'),
(1247, 'satisfaction', 'Le plaisir d\'avoir bien fait quelque chose.', '2026-07-08 06:21:16', 'B1'),
(1249, 'programme', 'Ensemble d\'instructions pour un ordinateur.', '2026-07-08 06:21:16', 'B1'),
(1250, 'fonctionner', 'Marcher correctement, être en marche.', '2026-07-08 06:21:16', 'B1'),
(1252, 'solution', 'La réponse à un problème.', '2026-07-08 06:21:16', 'B1'),
(1253, 'bug', 'Une erreur dans un programme informatique.', '2026-07-08 06:21:16', 'B1'),
(1254, 'immense', 'Très grand, énorme.', '2026-07-08 06:21:16', 'B1'),
(1255, 'jeune', 'Qui n\'est pas vieux, à un âge peu avancé.', '2026-07-08 06:21:16', 'B1'),
(1256, 'passionné', 'Qui a une grande passion pour quelque chose.', '2026-07-08 06:21:16', 'B1'),
(1257, 'rêve', 'Imaginer des choses, un souhait fort.', '2026-07-08 06:21:16', 'B1'),
(1258, 'développer', 'Faire grandir, créer et améliorer.', '2026-07-08 06:21:16', 'B1'),
(1259, 'application', 'Un programme pour smartphone ou tablette.', '2026-07-08 06:21:16', 'B1'),
(1260, 'innovante', 'Qui apporte de nouvelles idées, créative.', '2026-07-08 06:21:16', 'B1'),
(1261, 'contribuer', 'Aider à faire quelque chose, participer.', '2026-07-08 06:21:16', 'B1'),
(1263, 'numérique', 'Qui utilise les chiffres et les ordinateurs.', '2026-07-08 06:21:16', 'B1'),
(1264, 'parcour', 'Un chemin à suivre, un itinéraire.', '2026-07-08 06:21:16', 'B1'),
(1265, 'demande', 'Exprimer un besoin, exiger.', '2026-07-08 06:21:16', 'B1'),
(1266, 'rigueur', 'Précision, respect des règles.', '2026-07-08 06:21:16', 'B1'),
(1267, 'persévérance', 'Continuer malgré les difficultés.', '2026-07-08 06:21:16', 'B1'),
(1268, 'récompense', 'Ce qu\'on obtient après un effort.', '2026-07-08 06:21:16', 'B1'),
(1269, 'prometteuse', 'Qui annonce un bon avenir, qui donne de l\'espoir.', '2026-07-08 06:21:16', 'B1'),
(1270, 'fin', 'Le moment où quelque chose s\'arrête.', '2026-07-08 06:23:45', 'B1'),
(1271, 'étude', 'Apprendre, étudier un sujet.', '2026-07-08 06:23:45', 'B1'),
(1272, 'marque', 'Un nom ou un signe pour identifier un produit.', '2026-07-08 06:23:45', 'B1'),
(1273, 'toujour', 'Sans arrêt, à tout moment.', '2026-07-08 06:23:45', 'B1'),
(1274, 'étape', 'Un moment important dans un processus.', '2026-07-08 06:23:45', 'B1'),
(1275, 'majeure', 'Très importante.', '2026-07-08 06:23:45', 'B1'),
(1277, 'nombreux', 'Beaucoup de personnes ou de choses.', '2026-07-08 06:23:45', 'B1'),
(1279, 'posent', 'Mettre une question, demander.', '2026-07-08 06:23:45', 'B1'),
(1280, 'alor', 'Donc, à ce moment.', '2026-07-08 06:23:45', 'B1'),
(1281, 'question', 'Une phrase pour demander une information.', '2026-07-08 06:23:45', 'B1'),
(1282, 'cruciale', 'Très importante, décisive.', '2026-07-08 06:23:45', 'B1'),
(1283, 'que', 'Mot pour introduire une information ou une question.', '2026-07-08 06:23:45', 'B1'),
(1285, 'aprè', 'Après : Plus tard, à la suite.', '2026-07-08 06:23:45', 'B1'),
(1287, 'première', 'Ce qui vient avant tout le reste.', '2026-07-08 06:23:45', 'B1'),
(1288, 'consiste', 'Avoir pour but, être fait de.', '2026-07-08 06:23:45', 'B1'),
(1289, 'chercher', 'Essayer de trouver quelque chose.', '2026-07-08 06:23:45', 'B1'),
(1290, 'emploi', 'Un travail, un poste pour gagner de l\'argent.', '2026-07-08 06:23:45', 'B1'),
(1291, 's\'agit', 'Cela concerne, il est question de.', '2026-07-08 06:23:45', 'B1'),
(1292, 'd\'acquérir', 'Obtenir, gagner quelque chose.', '2026-07-08 06:23:45', 'B1'),
(1295, 'professionnel', 'Relatif au travail, à la profession.', '2026-07-08 06:23:45', 'B1'),
(1297, 'traver', 'Par le moyen de, en passant par.', '2026-07-08 06:23:45', 'B1'),
(1298, 'stage', 'Période de travail pour apprendre dans une entreprise.', '2026-07-08 06:23:45', 'B1'),
(1299, 'contrat', 'Un accord écrit entre personnes.', '2026-07-08 06:23:45', 'B1'),
(1300, 'temporaire', 'Qui ne dure pas longtemps.', '2026-07-08 06:23:45', 'B1'),
(1302, 'mènent', 'Diriger, conduire vers un résultat.', '2026-07-08 06:23:45', 'B1'),
(1303, 'poste', 'Un emploi, une position de travail.', '2026-07-08 06:23:45', 'B1'),
(1304, 'stable', 'Fixe, qui ne bouge pas, durable.', '2026-07-08 06:23:45', 'B1'),
(1305, 'd\'autre', 'D\'autres personnes ou choses.', '2026-07-08 06:23:45', 'B1'),
(1306, 'préfèrent', 'Aimer mieux une chose qu\'une autre.', '2026-07-08 06:23:45', 'B1'),
(1307, 'poursuivre', 'Continuer une action, un chemin.', '2026-07-08 06:23:45', 'B1'),
(1309, 'spécialiser', 'Devenir expert dans un domaine précis.', '2026-07-08 06:23:45', 'B1'),
(1310, 'davantage', 'Plus, encore plus.', '2026-07-08 06:23:45', 'B1'),
(1311, 'acquérir', 'Obtenir, gagner quelque chose.', '2026-07-08 06:23:45', 'B1'),
(1312, 'nouvelle', 'Qui vient d\'arriver, qui n\'est pas ancienne.', '2026-07-08 06:23:45', 'B1'),
(1313, 'compétence', 'Un savoir-faire, une capacité à faire quelque chose.', '2026-07-08 06:23:45', 'B1'),
(1314, 'master', 'Diplôme universitaire après une licence.', '2026-07-08 06:23:45', 'B1'),
(1315, 'formation', 'L\'action d\'apprendre pour un métier.', '2026-07-08 06:23:45', 'B1'),
(1316, 'complémentaire', 'Qui ajoute quelque chose, qui complète.', '2026-07-08 06:23:45', 'B1'),
(1317, 'même', 'Identique, ou aussi/y compris.', '2026-07-08 06:23:45', 'B1'),
(1318, 'réorientation', 'Changer de direction, de domaine d\'étude ou de travail.', '2026-07-08 06:23:45', 'B1'),
(1320, 'ouvrir', 'Rendre quelque chose non fermé.', '2026-07-08 06:23:45', 'B1'),
(1321, 'porte', 'Une ouverture pour entrer ou sortir.', '2026-07-08 06:23:45', 'B1'),
(1322, 'certain', 'Sûr, ou quelques personnes/choses.', '2026-07-08 06:23:45', 'B1'),
(1323, 'choisissent', 'Prendre une décision entre plusieurs options.', '2026-07-08 06:23:45', 'B1'),
(1324, 'également', 'Aussi, de la même manière.', '2026-07-08 06:23:45', 'B1'),
(1325, 'prendre', 'Saisir, attraper quelque chose.', '2026-07-08 06:23:45', 'B1'),
(1327, 'sabbatique', 'Période de repos ou de pause dans le travail.', '2026-07-08 06:23:45', 'B1'),
(1328, 'voyager', 'Se déplacer d\'un lieu à un autre, souvent loin.', '2026-07-08 06:23:45', 'B1'),
(1329, 'bénévolat', 'Travailler gratuitement pour aider une cause.', '2026-07-08 06:23:45', 'B1'),
(1331, 'permettent', 'Donner la possibilité de faire quelque chose.', '2026-07-08 06:23:45', 'B1'),
(1332, 'mûrir', 'Devenir plus mature, plus sage.', '2026-07-08 06:23:45', 'B1'),
(1333, 'découvrir', 'Trouver quelque chose qu\'on ne connaissait pas.', '2026-07-08 06:23:45', 'B1'),
(1334, 'culture', 'Ensemble des traditions, arts, savoirs d\'un peuple.', '2026-07-08 06:23:45', 'B1'),
(1335, 'd\'affiner', 'Rendre plus précis, plus fin.', '2026-07-08 06:23:45', 'B1'),
(1336, 'ses', 'Possessif (à lui/elle).', '2026-07-08 06:23:45', 'B1'),
(1338, 'essentiel', 'Très important, nécessaire.', '2026-07-08 06:23:45', 'B1'),
(1340, 'réfléchir', 'Penser attentivement à quelque chose.', '2026-07-08 06:23:45', 'B1'),
(1341, 'aspiration', 'Un désir profond, un souhait.', '2026-07-08 06:23:45', 'B1'),
(1342, 'personnelle', 'Qui concerne une personne en particulier.', '2026-07-08 06:23:45', 'B1'),
(1343, 'professionnelle', 'Qui concerne le travail.', '2026-07-08 06:23:45', 'B1'),
(1347, 'plu', 'Plus : Davantage, en plus grande quantité.', '2026-07-08 06:23:45', 'B1'),
(1350, 'chemin', 'Une voie pour marcher, une direction.', '2026-07-08 06:23:45', 'B1'),
(1351, 'correspond', 'Être en accord avec, être similaire.', '2026-07-08 06:23:45', 'B1'),
(1352, 'mieux', 'De meilleure manière, plus bien.', '2026-07-08 06:23:45', 'B1'),
(1353, 'envie', 'Un désir, un souhait.', '2026-07-08 06:23:45', 'B1'),
(1357, 'représente', 'Montrer quelque chose, ou être le symbole de quelque chose.', '2026-07-08 06:25:14', 'B1'),
(1359, 'profonde', 'Très intense, très importante.', '2026-07-08 06:25:14', 'B1'),
(1362, 'l\'opportunité', 'Une bonne occasion de faire quelque chose.', '2026-07-08 06:25:14', 'B1'),
(1363, 's\'immerger', 'Plonger complètement dans quelque chose, s\'y intégrer.', '2026-07-08 06:25:14', 'B1'),
(1365, 'différente', 'Pas la même, autre.', '2026-07-08 06:25:14', 'B1'),
(1366, 'contempler', 'Regarder attentivement et admirer.', '2026-07-08 06:25:14', 'B1'),
(1367, 'paysage', 'Une vue de la nature (montagnes, forêts, etc.).', '2026-07-08 06:25:14', 'B1'),
(1368, 'couper', 'Séparer en deux ou plusieurs parties avec un outil.', '2026-07-08 06:25:14', 'B1'),
(1369, 'souffle', 'L\'air qui sort de la bouche quand on respire.', '2026-07-08 06:25:14', 'B1'),
(1370, 'goûter', 'Essayer la saveur d\'un aliment, manger un peu.', '2026-07-08 06:25:14', 'B1'),
(1371, 'saveur', 'Le goût d\'un aliment.', '2026-07-08 06:25:14', 'B1'),
(1372, 'exotique', 'Qui vient d\'un pays lointain, qui n\'est pas habituel.', '2026-07-08 06:25:14', 'B1'),
(1373, 'imaginez-vou', 'Penser à quelque chose qui n\'est pas réel (comme \'imaginez-vous\').', '2026-07-08 06:25:14', 'B1'),
(1374, 'flâner', 'Se promener sans but précis, lentement.', '2026-07-08 06:25:14', 'B1'),
(1375, 'rue', 'Un chemin dans une ville, entre les maisons.', '2026-07-08 06:25:14', 'B1'),
(1376, 'animée', 'Pleine de vie, avec beaucoup de mouvement et de bruit.', '2026-07-08 06:25:14', 'B1'),
(1377, 'marrakech', 'Une grande ville au Maroc.', '2026-07-08 06:25:14', 'B1'),
(1378, 'explorer', 'Découvrir un nouvel endroit, l\'étudier.', '2026-07-08 06:25:14', 'B1'),
(1379, 'vestige', 'Ce qui reste d\'une chose ancienne ou détruite.', '2026-07-08 06:25:14', 'B1'),
(1380, 'antique', 'Très vieux, qui vient de l\'Antiquité.', '2026-07-08 06:25:14', 'B1'),
(1381, 'rome', 'La capitale de l\'Italie.', '2026-07-08 06:25:14', 'B1'),
(1382, 'vou', 'Pronom personnel pour la 2ème personne (comme \'vous\').', '2026-07-08 06:25:14', 'B1'),
(1383, 'émerveiller', 'Rendre quelqu\'un très impressionné et heureux.', '2026-07-08 06:25:14', 'B1'),
(1385, 'glacier', 'Une grande masse de glace qui avance lentement.', '2026-07-08 06:25:14', 'B1'),
(1387, 'patagonie', 'Une région d\'Amérique du Sud, connue pour ses paysages.', '2026-07-08 06:25:14', 'B1'),
(1390, 'périple', 'Un long voyage, souvent aventureux.', '2026-07-08 06:25:14', 'B1'),
(1392, 'enrichit', 'Rendre plus riche, améliorer (vient de \'enrichir\').', '2026-07-08 06:25:14', 'B1'),
(1393, 'l\'esprit', 'La pensée, l\'intellect d\'une personne.', '2026-07-08 06:25:14', 'B1'),
(1394, 'élargit', 'Rendre plus large, augmenter (vient de \'élargir\').', '2026-07-08 06:25:14', 'B1'),
(1396, 'perspective', 'Une façon de voir les choses, un point de vue.', '2026-07-08 06:25:14', 'B1'),
(1398, 'tolérance', 'Accepter les différences des autres.', '2026-07-08 06:25:14', 'B1'),
(1399, 'curiosité', 'Le désir de savoir, de découvrir.', '2026-07-08 06:25:14', 'B1'),
(1400, 'l\'adaptabilité', 'La capacité de s\'habituer à de nouvelles situations.', '2026-07-08 06:25:14', 'B1'),
(1402, 'habitant', 'Une personne qui vit dans un endroit.', '2026-07-08 06:25:14', 'B1'),
(1403, 'échanger', 'Donner et recevoir en retour.', '2026-07-08 06:25:14', 'B1'),
(1404, 'quelque', 'Une petite quantité, certains.', '2026-07-08 06:25:14', 'B1'),
(1405, 'mot', 'Un son ou un signe qui a un sens.', '2026-07-08 06:25:14', 'B1'),
(1407, 'langue', 'Un système de communication verbal (français, anglais...).', '2026-07-08 06:25:14', 'B1'),
(1409, 'repa', 'L\'acte de manger, un moment où on mange (comme \'repas\').', '2026-07-08 06:25:14', 'B1'),
(1410, 'local', 'Qui appartient à un endroit précis, de la région.', '2026-07-08 06:25:14', 'B1'),
(1411, 'moment', 'Une courte durée de temps.', '2026-07-08 06:25:14', 'B1'),
(1413, 'forgent', 'Façonner, créer (vient de \'forger\').', '2026-07-08 06:25:14', 'B1'),
(1414, 'souvenir', 'Une chose que l\'on garde en mémoire.', '2026-07-08 06:25:14', 'B1'),
(1415, 'impérissable', 'Qui ne peut pas disparaître, éternel.', '2026-07-08 06:25:14', 'B1'),
(1417, 'telle', 'Semblable à, comme cela.', '2026-07-08 06:25:14', 'B1'),
(1418, 'aventure', 'Une expérience extraordinaire et risquée.', '2026-07-08 06:25:14', 'B1'),
(1420, 'préparation', 'L\'action de préparer quelque chose.', '2026-07-08 06:25:14', 'B1'),
(1423, 'budget', 'L\'argent disponible pour dépenser.', '2026-07-08 06:25:14', 'B1'),
(1426, 'inestimable', 'Qui a une valeur trop grande pour être calculée.', '2026-07-08 06:25:14', 'B1'),
(1427, 'avant', 'Devant dans l\'espace ou le temps.', '2026-07-08 06:25:14', 'B1'),
(1430, 'soi-même', 'Sa propre personne.', '2026-07-08 06:25:14', 'B1'),
(1431, 'regard', 'L\'action de regarder, l\'expression des yeux.', '2026-07-08 06:25:14', 'B1'),
(1432, 'l\'autre', 'Une autre personne ou chose.', '2026-07-08 06:25:14', 'B1'),
(1433, 'beauté', 'La qualité de ce qui est beau.', '2026-07-08 06:25:14', 'B1');

-- --------------------------------------------------------

--
-- Structure de la table `historiques_connexion`
--

CREATE TABLE `historiques_connexion` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_connexion` datetime DEFAULT NULL,
  `adresse_ip` varchar(50) DEFAULT NULL,
  `navigateur` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `journal`
--

CREATE TABLE `journal` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `date_action` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `parametres`
--

CREATE TABLE `parametres` (
  `cle` varchar(100) NOT NULL,
  `valeur` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `redactions`
--

CREATE TABLE `redactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `theme` varchar(200) DEFAULT NULL,
  `texte` longtext DEFAULT NULL,
  `correction` longtext DEFAULT NULL,
  `note` decimal(5,2) DEFAULT NULL,
  `date_creation` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `resultats`
--

CREATE TABLE `resultats` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `texte_id` int(11) DEFAULT NULL,
  `module` enum('dictee','lecture','comprehension','redaction','conversation') DEFAULT NULL,
  `score` decimal(5,2) DEFAULT NULL,
  `temps` int(11) DEFAULT NULL,
  `date_passage` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `resultats`
--

INSERT INTO `resultats` (`id`, `user_id`, `texte_id`, `module`, `score`, `temps`, `date_passage`) VALUES
(1, 1, 64, 'dictee', 100.00, NULL, '2026-07-07 21:40:06');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `niveau` varchar(5) DEFAULT NULL,
  `role` enum('admin','enseignant','eleve') DEFAULT NULL,
  `date_creation` datetime DEFAULT current_timestamp(),
  `actif` tinyint(1) DEFAULT 1,
  `dernier_acces` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `prenom`, `email`, `password`, `niveau`, `role`, `date_creation`, `actif`, `dernier_acces`) VALUES
(1, 'Michel', 'Nivo', 'admin@frboost.ai', '$2y$10$E/m6bY8vpxDYga2d5apdFedjuf/IiDISC0eRM1zprNC.fevhBlXWm', NULL, 'admin', '2026-07-06 17:59:17', 1, '2026-07-08 09:19:46');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs_classes`
--

CREATE TABLE `utilisateurs_classes` (
  `user_id` int(11) NOT NULL,
  `classe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `dictees`
--
ALTER TABLE `dictees`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `dictionnaire`
--
ALTER TABLE `dictionnaire`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mot` (`mot`);

--
-- Index pour la table `historiques_connexion`
--
ALTER TABLE `historiques_connexion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `parametres`
--
ALTER TABLE `parametres`
  ADD PRIMARY KEY (`cle`);

--
-- Index pour la table `redactions`
--
ALTER TABLE `redactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `resultats`
--
ALTER TABLE `resultats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `texte_id` (`texte_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `utilisateurs_classes`
--
ALTER TABLE `utilisateurs_classes`
  ADD PRIMARY KEY (`user_id`,`classe_id`),
  ADD KEY `classe_id` (`classe_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `dictees`
--
ALTER TABLE `dictees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT pour la table `dictionnaire`
--
ALTER TABLE `dictionnaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1434;

--
-- AUTO_INCREMENT pour la table `historiques_connexion`
--
ALTER TABLE `historiques_connexion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `journal`
--
ALTER TABLE `journal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `redactions`
--
ALTER TABLE `redactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `resultats`
--
ALTER TABLE `resultats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `historiques_connexion`
--
ALTER TABLE `historiques_connexion`
  ADD CONSTRAINT `historiques_connexion_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `redactions`
--
ALTER TABLE `redactions`
  ADD CONSTRAINT `redactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `resultats`
--
ALTER TABLE `resultats`
  ADD CONSTRAINT `resultats_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `resultats_ibfk_2` FOREIGN KEY (`texte_id`) REFERENCES `dictees` (`id`);

--
-- Contraintes pour la table `utilisateurs_classes`
--
ALTER TABLE `utilisateurs_classes`
  ADD CONSTRAINT `utilisateurs_classes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `utilisateurs_classes_ibfk_2` FOREIGN KEY (`classe_id`) REFERENCES `classes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
