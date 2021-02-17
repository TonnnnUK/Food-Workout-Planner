-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table fwp.custom_workouts
CREATE TABLE IF NOT EXISTS `custom_workouts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `routine` json DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custom_workouts_slug_unique` (`slug`),
  KEY `custom_workouts_user_id_foreign` (`user_id`),
  CONSTRAINT `custom_workouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.custom_workouts: ~0 rows (approximately)
/*!40000 ALTER TABLE `custom_workouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_workouts` ENABLE KEYS */;

-- Dumping structure for table fwp.custom_workout_exercises
CREATE TABLE IF NOT EXISTS `custom_workout_exercises` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `custom_workout_id` bigint(20) unsigned NOT NULL,
  `exercise_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_workout_exercises_custom_workout_id_foreign` (`custom_workout_id`),
  KEY `custom_workout_exercises_exercise_id_foreign` (`exercise_id`),
  CONSTRAINT `custom_workout_exercises_custom_workout_id_foreign` FOREIGN KEY (`custom_workout_id`) REFERENCES `custom_workouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `custom_workout_exercises_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.custom_workout_exercises: ~0 rows (approximately)
/*!40000 ALTER TABLE `custom_workout_exercises` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_workout_exercises` ENABLE KEYS */;

-- Dumping structure for table fwp.custom_workout_exercise_sets
CREATE TABLE IF NOT EXISTS `custom_workout_exercise_sets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `workout_exercise_id` bigint(20) unsigned NOT NULL,
  `reps` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_workout_exercise_sets_workout_exercise_id_foreign` (`workout_exercise_id`),
  CONSTRAINT `custom_workout_exercise_sets_workout_exercise_id_foreign` FOREIGN KEY (`workout_exercise_id`) REFERENCES `custom_workout_exercises` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.custom_workout_exercise_sets: ~0 rows (approximately)
/*!40000 ALTER TABLE `custom_workout_exercise_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_workout_exercise_sets` ENABLE KEYS */;

-- Dumping structure for table fwp.entries
CREATE TABLE IF NOT EXISTS `entries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `recipe_id` bigint(20) unsigned NOT NULL,
  `meal_id` bigint(20) unsigned NOT NULL,
  `workout_id` bigint(20) unsigned NOT NULL,
  `custom_workout_id` bigint(20) unsigned NOT NULL,
  `date_time` timestamp NOT NULL,
  `entry_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entry_data` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entries_user_id_foreign` (`user_id`),
  KEY `entries_recipe_id_foreign` (`recipe_id`),
  KEY `entries_meal_id_foreign` (`meal_id`),
  KEY `entries_workout_id_foreign` (`workout_id`),
  KEY `entries_custom_workout_id_foreign` (`custom_workout_id`),
  CONSTRAINT `entries_custom_workout_id_foreign` FOREIGN KEY (`custom_workout_id`) REFERENCES `custom_workouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_meal_id_foreign` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_workout_id_foreign` FOREIGN KEY (`workout_id`) REFERENCES `workouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.entries: ~0 rows (approximately)
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;

-- Dumping structure for table fwp.equipment
CREATE TABLE IF NOT EXISTS `equipment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `links` json DEFAULT NULL,
  `hide_from_index` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `equipment_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.equipment: ~16 rows (approximately)
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` (`id`, `name`, `slug`, `description`, `image`, `image_url`, `links`, `hide_from_index`, `created_at`, `updated_at`) VALUES
	(1, 'barbell', 'barbell', 'description', NULL, NULL, NULL, 0, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(2, 'dumbbells', 'dumbbells', 'description', NULL, NULL, NULL, 0, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(3, 'flat bench', 'flat-bench', 'description', NULL, NULL, NULL, 0, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(4, 'squat rack', 'squat-rack', 'description', NULL, NULL, NULL, 0, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(5, 'pull up bar', 'pull-up-bar', 'description', NULL, NULL, NULL, 0, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(6, 'dip bars / station', 'dip-bars-station', 'description', NULL, NULL, NULL, 0, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(7, 'suspension trainer', 'suspension-trainer', 'description', NULL, NULL, NULL, 0, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(8, 'incline bench', 'incline-bench', 'description', NULL, NULL, NULL, 0, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(9, 'decline bench', 'decline-bench', 'description', NULL, NULL, NULL, 0, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(10, 'ez curl bar', 'ez-curl-bar', 'description', NULL, NULL, NULL, 0, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(11, 'low pulley', 'low-pulley', 'description', NULL, NULL, NULL, 0, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(12, 'high pulley', 'high-pulley', 'description', NULL, NULL, NULL, 0, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(13, 'chair(s)', 'chairs', 'description', NULL, NULL, NULL, 0, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(14, 'stick / broom', 'stick-broom', 'description', NULL, NULL, NULL, 0, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(15, 'bodyweight', 'bodyweight', 'description', NULL, NULL, NULL, 0, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(16, 'step', 'step', 'description', NULL, NULL, NULL, 0, '2021-01-31 21:09:20', '2021-01-31 21:09:20');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;

-- Dumping structure for table fwp.exercises
CREATE TABLE IF NOT EXISTS `exercises` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exercises_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.exercises: ~138 rows (approximately)
/*!40000 ALTER TABLE `exercises` DISABLE KEYS */;
INSERT INTO `exercises` (`id`, `name`, `slug`, `description`, `excerpt`, `image`, `video_url`, `type_id`, `created_at`, `updated_at`) VALUES
	(1, 'Barbell Bench Press', 'barbell-bench-press', 'description of exercise', NULL, 'https://i.imgur.com/yGfG92N.jpg', 'https://i.imgur.com/AE50pxq.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:01:31'),
	(2, 'EZ Bar Bicep Curl', 'ez-bar-bicep-curl', 'description of exercise', NULL, 'https://i.imgur.com/pnbAueL.jpg', 'https://i.imgur.com/r2j6Y0y.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:03:27'),
	(3, 'Incline Barbell Bench Press', 'incline-barbell-bench-press', 'description of exercise', NULL, 'https://i.imgur.com/glZ8lTz.jpg', 'https://i.imgur.com/MNLhXzr.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:04:28'),
	(4, 'Dumbbell Curl', 'dumbbell-curl', 'description of exercise', NULL, 'https://i.imgur.com/LhL0G8D.jpg', 'https://i.imgur.com/2DU6GOS.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:05:25'),
	(5, 'Barbell Bicep Curl', 'barbell-bicep-curl', 'description of exercise', NULL, 'https://i.imgur.com/Q82PotV.jpg', 'https://i.imgur.com/YuONIz6.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:06:29'),
	(6, 'Reverse Grip Dumbbell Curl', 'reverse-grip-dumbbell-curl', 'description of exercise', NULL, 'https://i.imgur.com/0AEYKOa.jpg', 'https://i.imgur.com/j09TaO7.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:20:10'),
	(7, 'Standing Hammer Curl', 'standing-hammer-curl', 'description of exercise', NULL, 'https://i.imgur.com/PYHYv28.jpg', 'https://i.imgur.com/zubQ8YK.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 19:17:46'),
	(8, 'Standing Barbell Drag Curl', 'standing-barbell-drag-curl', 'description of exercise', NULL, 'https://i.imgur.com/wjmXKod.jpg', 'https://i.imgur.com/ZHP6aFr.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:21:27'),
	(9, 'Dumbbell Bench Press', 'dumbbell-bench-press', 'description of exercise', NULL, 'https://i.imgur.com/7DHiWen.jpg', 'https://i.imgur.com/QmCLMyR.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:27:52'),
	(10, 'Incline Dumbbell Bench Press', 'incline-dumbbell-bench-press', 'description of exercise', NULL, 'https://i.imgur.com/ykr7YVH.jpg', 'https://i.imgur.com/YY8hqcI.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:24:42'),
	(11, 'Seated Bicep Curl', 'seated-incline-bicep-curl', 'description of exercise', NULL, 'https://i.imgur.com/JHU7MOM.jpg', 'https://i.imgur.com/t2IEX5V.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:23:57'),
	(12, 'Decline Dumbbell Bench Press', 'decline-dumbbell-bench-press', 'description of exercise', NULL, 'https://i.imgur.com/d56QIyD.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-01-31 18:27:18'),
	(13, 'Concentration Curl', 'concentration-curl', 'description of exercise', NULL, 'https://i.imgur.com/g1vtN58.jpg', 'https://i.imgur.com/AqzFYuA.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 19:14:26'),
	(14, 'Seated Hammer Curl', 'seated-hammer-curl', 'description of exercise', NULL, 'https://i.imgur.com/IuOb7bb.jpg', 'https://i.imgur.com/t2IEX5V.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 19:19:57'),
	(15, 'Twisting Dumbbell Curl', 'twisting-dumbbell-curl', 'description of exercise', NULL, 'https://i.imgur.com/iomjwU5.jpg', 'https://i.imgur.com/RZQ3wyk.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 19:20:45'),
	(16, 'Incline Hammer Curl', 'incline-hammer-curl', 'description of exercise', NULL, 'https://i.imgur.com/JHU7MOM.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-01-31 20:25:47'),
	(17, 'Reverse grip EZ bar curl', 'reverse-grip-ez-bar-curl', 'description of exercise', NULL, 'https://i.imgur.com/RzunNYl.jpg', 'https://i.imgur.com/VZexOwT.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 17:52:29'),
	(18, 'Prone Dumbbell Spider Curl', 'prone-dumbbell-spider-curl', 'description of exercise', NULL, 'https://i.imgur.com/TVDyuL5.jpg', 'https://i.imgur.com/K6prrd2.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 17:52:54'),
	(19, 'Press Up', 'press-up', 'description of exercise', NULL, 'https://i.imgur.com/NVv8p8w.gif', 'https://i.imgur.com/LxOabXn.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 17:53:39'),
	(20, 'Diamond Press Up', 'diamond-press-up', 'description of exercise', NULL, 'https://i.imgur.com/AmlRcJV.jpg', 'https://i.imgur.com/sJv1Lv5.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 17:57:22'),
	(21, 'Clap Press Up', 'clap-press-up', 'description of exercise', NULL, 'https://i.imgur.com/MXeDmHO.jpg', 'https://i.imgur.com/7AqtcJu.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 17:55:33'),
	(22, 'Single Arm Medicine Ball Press Up', 'single-arm-medicine-ball-press-up', 'description of exercise', NULL, 'https://i.imgur.com/BFzXtbb.jpg', 'https://i.imgur.com/WNEQxCT.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 17:55:56'),
	(23, 'Close Grip Press Up', 'close-grip-press-up', 'description of exercise', NULL, 'https://i.imgur.com/kZdPqcM.jpg', 'https://i.imgur.com/5rrGfJH.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 17:57:03'),
	(24, 'Spiderman Press Up', 'spiderman-press-up', 'description of exercise', NULL, 'https://i.imgur.com/NR6GmCF.jpg', 'https://i.imgur.com/DDEJnG0.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 17:58:07'),
	(25, 'Decline Bench Press', 'decline-bench-press', 'description of exercise', NULL, 'https://i.imgur.com/wbkVUNL.jpg', 'https://i.imgur.com/mOfsDzz.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 17:58:37'),
	(26, 'Floor Dumbbell Press', 'floor-dumbbell-press', 'description of exercise', NULL, 'https://i.imgur.com/hBFPlZx.png', 'https://i.imgur.com/nYKJgh8.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 18:00:40'),
	(27, 'Dumbbell Fly', 'dumbbell-fly', 'description of exercise', NULL, 'https://i.imgur.com/UIUpLPi.jpg', 'https://i.imgur.com/B6qquSV.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 18:02:27'),
	(28, 'Incline Dumbbell Fly', 'incline-dumbbell-fly', 'description of exercise', NULL, 'https://i.imgur.com/E5M1quG.jpg', 'https://i.imgur.com/B6qquSV.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 18:02:52'),
	(29, 'Cable Tricep Push Down', 'cable-tricep-push-down', 'description of exercise', NULL, 'https://i.imgur.com/QMCQBph.png', 'https://i.imgur.com/n5wrZbQ.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:10:10'),
	(30, 'Dips', 'dips', 'description of exercise', NULL, 'https://i.imgur.com/m2uzGfY.jpg', 'https://i.imgur.com/GoxpQt5.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 19:13:54'),
	(31, 'Dumbbell Skullcrushers', 'dumbbell-skullcrushers', 'description of exercise', NULL, 'https://i.imgur.com/9btVf2v.jpg', 'https://i.imgur.com/gyLZxoV.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 19:05:18'),
	(32, 'Barbell Skullcrushers', 'barbell-skullcrushers', 'description of exercise', NULL, 'https://i.imgur.com/Z0faOaK.jpg', 'https://i.imgur.com/fpzSuZW.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 19:09:01'),
	(33, 'Overhead Barbell Tricep Extension', 'overhead-barbell-tricep-extension', 'description of exercise', NULL, 'https://i.imgur.com/pgmN5R6.jpg', 'https://i.imgur.com/6IvIj8V.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 19:09:24'),
	(34, 'Overhead Dumbbell Tricep Extension', 'overhead-dumbbell-tricep-extension', 'description of exercise', NULL, 'https://i.imgur.com/rbms3wo.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-02-01 19:11:13'),
	(35, 'Dumbbell Kick Back', 'dumbbell-kick-back', 'description of exercise', NULL, 'https://i.imgur.com/hojWxQC.jpg', 'https://i.imgur.com/nO3ASK9.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 19:20:44'),
	(36, 'Cable Overhead Tricep Extension', 'cable-overhead-tricep-extension', 'description of exercise', NULL, 'https://i.imgur.com/xCev2Hn.jpg', 'https://i.imgur.com/2uLokUa.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 19:21:25'),
	(37, 'Pull Ups', 'pull-ups', 'description of exercise', NULL, 'https://i.imgur.com/O1V2xDN.jpg', 'https://i.imgur.com/CVBKxEv.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 19:33:10'),
	(38, 'Chin Ups', 'chin-ups', 'description of exercise', NULL, 'https://i.imgur.com/lmUShG4.jpg', 'https://i.imgur.com/uHzbQyX.gif', NULL, '2021-01-31 09:25:41', '2021-02-01 19:35:29'),
	(39, 'Lat Pulldown', 'lat-pulldown', 'description of exercise', NULL, 'https://i.imgur.com/jFC5gQ0.jpg', 'https://i.imgur.com/3Mhj7jd.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 15:27:43'),
	(40, 'Straight Arm Pull Down', 'straight-arm-pull-down', 'description of exercise', NULL, 'https://i.imgur.com/54ORqsz.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-02-09 15:29:20'),
	(41, 'Barbell Row', 'barbell-row', 'description of exercise', NULL, 'https://i.imgur.com/1NM7axb.jpg', 'https://i.imgur.com/JslgczC.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 15:30:50'),
	(42, 'Dumbbell Row', 'dumbbell-row', 'description of exercise', NULL, 'https://i.imgur.com/S8pIi1V.jpg', 'https://i.imgur.com/nUwJTac.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 15:34:19'),
	(43, 'Seated Cable Row', 'seated-cable-row', 'description of exercise', NULL, 'https://i.imgur.com/uEb3n1Q.jpg', 'https://i.imgur.com/fumcldJ.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 15:35:03'),
	(44, 'Inverted Row', 'inverted-row', 'description of exercise', NULL, 'https://i.imgur.com/kDIeT3J.jpg', 'https://i.imgur.com/9YCIfAX.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 15:37:30'),
	(45, 'Inverted Underhand Row', 'inverted-underhand-row', 'description of exercise', NULL, 'https://i.imgur.com/XQrlhj4.jpg', 'https://i.imgur.com/5oVA3eH.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 15:37:12'),
	(46, 'Single Arm Dumbbell Row', 'single-arm-dumbbell-row', 'description of exercise', NULL, 'https://i.imgur.com/CGRywOj.jpg', 'https://i.imgur.com/iXSu045.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 15:38:14'),
	(47, 'Dumbbell Pullover', 'dumbbell-pullover', 'description of exercise', NULL, 'https://i.imgur.com/VLmsG9C.jpg', 'https://i.imgur.com/02P2gGq.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 15:51:09'),
	(48, 'Barbell Pullover', 'barbell-pullover', 'description of exercise', NULL, 'https://i.imgur.com/0gUADee.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-02-09 15:51:53'),
	(49, 'Underhand Lateral Pulldown', 'underhand-lateral-pulldown', 'description of exercise', NULL, 'https://i.imgur.com/9wCRg0A.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-02-09 15:53:36'),
	(50, 'Face Pulls', 'face-pulls', 'description of exercise', NULL, 'https://i.imgur.com/T5atTFd.jpg', 'https://i.imgur.com/2XPXtlp.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 15:54:19'),
	(51, 'Seated Bent Over Delt Fly', 'seated-bent-over-delt-fly', 'description of exercise', NULL, 'https://i.imgur.com/UG2MJWC.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-02-09 15:55:45'),
	(52, 'Lying Rear Delt Fly', 'lying-rear-delt-fly', 'description of exercise', NULL, 'https://i.imgur.com/0w7uRYx.jpg', 'https://i.imgur.com/RDz5yWs.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 15:58:47'),
	(53, 'Dumbbell Incline Rear Delt Fly', 'dumbbell-incline-rear-delt-fly', 'description of exercise', NULL, 'https://i.imgur.com/5Gm1cDf.jpg', 'https://i.imgur.com/RDz5yWs.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 15:58:03'),
	(54, 'One Arm Cable Crossover', 'one-arm-cable-crossover', 'description of exercise', NULL, NULL, NULL, NULL, '2021-01-31 09:25:41', '2021-01-31 09:25:41'),
	(55, 'Single Arm Cable Chest Press', 'single-arm-cable-chest-press', 'description of exercise', NULL, 'https://i.imgur.com/FIGw1PT.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-02-09 16:02:12'),
	(56, 'Military Press', 'military-press', 'description of exercise', NULL, 'https://i.imgur.com/HTQl1az.jpg', 'https://i.imgur.com/GFgfUDl.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:03:12'),
	(57, 'Dumbbell Military Press', 'dumbbell-military-press', 'description of exercise', NULL, 'https://i.imgur.com/4tPiezB.jpg', 'https://i.imgur.com/yoyIFK5.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:04:01'),
	(58, 'Lateral Side Raises', 'lateral-side-raises', 'description of exercise', NULL, 'https://i.imgur.com/JszeraH.jpg', 'https://i.imgur.com/fHuQF1D.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:04:31'),
	(59, 'Seated Dumbbell Shoulder Press', 'seated-dumbbell-shoulder-press', 'description of exercise', NULL, 'https://i.imgur.com/XRf9dzX.jpg', 'https://i.imgur.com/ACBe37l.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:05:05'),
	(60, 'Upright Dumbbell Rows', 'upright-dumbbell-rows', 'description of exercise', NULL, 'https://i.imgur.com/cIDUmdX.jpg', 'https://i.imgur.com/R6FVWIa.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:05:47'),
	(61, 'Upright Cable Rows', 'upright-cable-rows', 'description of exercise', NULL, 'https://i.imgur.com/UJhlebi.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-02-09 16:08:12'),
	(62, 'Dumbbell Lunge', 'dumbbell-lunge', 'description of exercise', NULL, 'https://i.imgur.com/OZgtTZn.jpg', 'https://i.imgur.com/zL6F1uR.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:09:22'),
	(63, 'Barbell Lunge', 'barbell-lunge', 'description of exercise', NULL, 'https://i.imgur.com/hgLfuhS.jpg', 'https://i.imgur.com/vjrvxO9.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:10:07'),
	(64, 'Barbell Squats', 'barbell-squats', 'description of exercise', NULL, 'https://i.imgur.com/QRWcQjs.jpg', 'https://i.imgur.com/bj7BW1s.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:10:53'),
	(65, 'Dumbbell Squats', 'dumbbell-squats', 'description of exercise', NULL, 'https://i.imgur.com/HO00g1G.jpg', 'https://i.imgur.com/xAv7Xed.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:11:22'),
	(66, 'Barbell Deadlift', 'barbell-deadlift', 'description of exercise', NULL, 'https://i.imgur.com/D5kzgaV.jpg', 'https://i.imgur.com/AsHdI8a.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:12:02'),
	(67, 'Dumbbell Stiff Legged Deadlift', 'dumbbell-stiff-legged-deadlift', 'description of exercise', NULL, 'https://i.imgur.com/TECbgUK.jpg', 'https://i.imgur.com/ltoarRx.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:12:29'),
	(68, 'Stiff Legged Deadlift', 'stiff-legged-deadlift', 'description of exercise', NULL, 'https://i.imgur.com/ufrkWyq.jpg', 'https://i.imgur.com/s6nCLLL.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:12:57'),
	(69, 'One Legged Dumbbell Deadlift', 'one-legged-dumbbell-deadlift', 'description of exercise', NULL, 'https://i.imgur.com/JPlQD6I.jpg', 'https://i.imgur.com/ZZl48Sc.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:13:31'),
	(70, 'Step Ups', 'step-ups', 'description of exercise', NULL, 'https://i.imgur.com/I4svTnj.jpg', 'https://i.imgur.com/EzRlC8E.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:15:42'),
	(71, 'Dumbbell Step Ups', 'dumbbell-step-ups', 'description of exercise', NULL, 'https://i.imgur.com/I4svTnj.jpg', 'https://i.imgur.com/pLi6r2Y.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:17:19'),
	(72, 'Barbell Step Ups', 'barbell-step-ups', 'description of exercise', NULL, 'https://i.imgur.com/TQIFKaS.jpg', 'https://i.imgur.com/HRMhodI.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:18:26'),
	(73, 'Barbell Bulgarian Split Squat', 'barbell-bulgarian-split-squat', 'description of exercise', NULL, 'https://i.imgur.com/zY9cPSK.jpg', 'https://i.imgur.com/OmXnD9m.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:18:56'),
	(74, 'Dumbbell Bulgarian Split Squat', 'dumbbell-bulgarian-split-squat', 'description of exercise', NULL, 'https://i.imgur.com/0yWQNsm.jpg', 'https://i.imgur.com/WVsU50F.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:20:06'),
	(75, 'Dumbbell Goblet Squat', 'dumbbell-goblet-squat', 'description of exercise', NULL, 'https://i.imgur.com/dtrPhkH.jpg', 'https://i.imgur.com/CxVtTSG.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:22:08'),
	(76, 'Sit Up', 'sit-up', 'description of exercise', NULL, 'https://i.imgur.com/JOcy3GX.jpg', 'https://i.imgur.com/SjFsmZW.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:32:32'),
	(77, 'Crunch', 'crunch', 'description of exercise', NULL, 'https://i.imgur.com/JOcy3GX.jpg', 'https://i.imgur.com/OD74bU3.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:24:48'),
	(78, 'Weighted Crunch', 'weighted-crunch', 'description of exercise', NULL, 'https://i.imgur.com/WBpbOEU.jpg', 'https://i.imgur.com/h07MzJ4.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:28:08'),
	(79, 'Overhead Plate Sit Up', 'overhead-plate-sit-up', 'description of exercise', NULL, 'https://i.imgur.com/LfCJNHh.jpg', 'https://i.imgur.com/sxHO7wQ.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:28:57'),
	(80, 'Side Crunch', 'side-crunch', 'description of exercise', NULL, 'https://i.imgur.com/iyGW0yB.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-02-09 16:30:07'),
	(81, 'Reverse Crunch', 'reverse-crunch', 'description of exercise', NULL, 'https://i.imgur.com/0tHmMkz.jpg', 'https://i.imgur.com/NbEjDSa.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:45:34'),
	(82, 'Lying Leg Raise', 'lying-leg-raise', 'description of exercise', NULL, 'https://i.imgur.com/IxgkfU9.jpg', 'https://i.imgur.com/Lo0lVYn.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:46:53'),
	(83, 'Hanging Twisting Leg Raise', 'hanging-twisting-leg-raise', 'description of exercise', NULL, 'https://i.imgur.com/74kbqzB.jpg', 'https://i.imgur.com/Yz288Vm.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:48:46'),
	(84, 'Hanging Leg Raise', 'hanging-leg-raise', 'description of exercise', NULL, 'https://i.imgur.com/QICcTjG.jpg', 'https://i.imgur.com/oIVz7mb.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:49:45'),
	(85, 'Russian Plate Twists', 'russian-plate-twists', 'description of exercise', NULL, 'https://i.imgur.com/3Bgrbo7.jpg', 'https://i.imgur.com/kUvIORH.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:51:50'),
	(86, 'V Sit Up', 'v-sit-up', 'description of exercise', NULL, 'https://i.imgur.com/uJvPmjO.jpg', 'https://i.imgur.com/LDq6C3v.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:52:55'),
	(87, 'Ab Roller', 'ab-roller', 'description of exercise', NULL, 'https://i.imgur.com/pFGV7YC.jpg', 'https://i.imgur.com/oZUqH4q.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:53:40'),
	(88, 'Cable Wood Chop', 'cable-wood-chop', 'description of exercise', NULL, 'https://i.imgur.com/qrQQrS5.jpg', 'https://i.imgur.com/OZLBpYq.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:55:01'),
	(89, 'Cable Core Rotation', 'cable-core-rotation', 'description of exercise', NULL, 'https://i.imgur.com/LQhSONv.jpg', 'https://i.imgur.com/akkPyCA.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:55:32'),
	(90, 'Cable Crunch', 'cable-crunch', 'description of exercise', NULL, 'https://i.imgur.com/xKACmgv.jpg', 'https://i.imgur.com/ynqbz8d.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 16:56:49'),
	(91, 'Bicycle Crunches', 'bicycle-crunches', 'description of exercise', NULL, 'https://i.imgur.com/vGbHl2b.jpg', 'https://i.imgur.com/1N5FwO7.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:06:55'),
	(92, 'Close Grip Bench Press', 'close-grip-bench-press', 'description of exercise', NULL, 'https://i.imgur.com/PaxBUNM.jpg', 'https://i.imgur.com/LtXlNoN.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:07:39'),
	(93, 'Side Jackknife', 'side-jackknife', 'description of exercise', NULL, 'https://i.imgur.com/qKb8bVo.jpg', 'https://i.imgur.com/gdcU8C2.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:09:13'),
	(94, 'Single Leg Glute Bridge', 'single-leg-glute-bridge', 'description of exercise', NULL, 'https://i.imgur.com/TAHK9WS.jpg', 'https://i.imgur.com/54KZaqu.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:10:03'),
	(95, 'Glute Bridge', 'glute-bridge', 'description of exercise', NULL, 'https://i.imgur.com/4mjYJq8.jpg', 'https://i.imgur.com/kT5eIec.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:10:55'),
	(96, 'Barbell Glute Bridge', 'barbell-glute-bridge', 'description of exercise', NULL, 'https://i.imgur.com/PaFvamX.jpg', 'https://i.imgur.com/HlWD97r.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:11:54'),
	(97, 'Squat', 'squat', 'description of exercise', NULL, 'https://i.imgur.com/E555kAS.jpg', 'https://i.imgur.com/vmRL5JC.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:12:51'),
	(98, 'Box Squat', 'box-squat', 'description of exercise', NULL, 'https://i.imgur.com/SQPQEUF.jpg', 'https://i.imgur.com/0tkzpff.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:14:24'),
	(99, 'Dumbbell Box Squat', 'dumbbell-box-squat', 'description of exercise', NULL, 'https://i.imgur.com/4cL5S1C.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-02-09 17:16:59'),
	(100, 'Burpees', 'burpees', 'description of exercise', NULL, 'https://i.imgur.com/xojS74g.jpg', 'https://i.imgur.com/ZRkh5mW.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:17:57'),
	(101, 'Jump Squat', 'jump-squat', 'description of exercise', NULL, 'https://i.imgur.com/xojS74g.jpg', 'https://i.imgur.com/AV5NAsC.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:23:55'),
	(102, 'Mountain Climbers', 'mountain-climbers', 'description of exercise', NULL, 'https://i.imgur.com/GqpB6OR.jpg', 'https://i.imgur.com/PTMcXuF.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:26:29'),
	(103, 'Renegade Row', 'renegade-row', 'description of exercise', NULL, 'https://i.imgur.com/pR8gmmh.jpg', 'https://i.imgur.com/8G1qYmH.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:47:04'),
	(104, 'Dumbbell Clean', 'dumbbell-clean', 'description of exercise', NULL, 'https://i.imgur.com/pW3eopI.jpg', 'https://i.imgur.com/HBN1Zc0.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:48:41'),
	(105, 'Barbell Clean and Press', 'barbell-clean-and-press', 'description of exercise', NULL, 'https://i.imgur.com/8vHOV1r.jpg', 'https://i.imgur.com/zDyvQL7.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:49:19'),
	(106, 'Dumbbell Clean and Press', 'dumbbell-clean-and-press', 'description of exercise', NULL, 'https://i.imgur.com/lVja7XD.jpg', 'https://i.imgur.com/HBN1Zc0.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:51:13'),
	(107, 'Barbell Shrug', 'barbell-shrug', 'description of exercise', NULL, 'https://i.imgur.com/ISs2Zrs.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-02-09 17:54:20'),
	(108, 'Dumbbell Shrug', 'dumbbell-shrug', 'description of exercise', NULL, 'https://i.imgur.com/a6ubD9o.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-02-09 17:53:46'),
	(109, 'Jog', 'jog', 'description of exercise', NULL, 'https://i.imgur.com/XT054Iu.png', 'https://i.imgur.com/ewyTLkD.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:17:26'),
	(110, 'Jump Rope', 'jump-rope', 'description of exercise', NULL, 'https://i.imgur.com/i5evexr.jpg', 'https://i.imgur.com/glPONc0.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:19:11'),
	(111, 'Jumping Jacks', 'jumping-jacks', 'description of exercise', NULL, 'https://i.imgur.com/vVcjFvg.jpg', 'https://i.imgur.com/d9BvhUB.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:16:36'),
	(112, 'Kick Through', 'kick-through', 'description of exercise', NULL, 'https://i.imgur.com/6cFH2vm.jpg', 'https://i.imgur.com/HAGQlaQ.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:55:17'),
	(113, 'Barbell Front Squat to Shoulder Press', 'barbell-front-squat-to-shoulder-press', 'description of exercise', NULL, 'https://i.imgur.com/Cw8PoDw.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-02-09 17:57:09'),
	(114, 'Jump Lunge', 'jump-lunge', 'description of exercise', NULL, 'https://i.imgur.com/6vWzAOp.jpg', 'https://i.imgur.com/Le5cCnB.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 17:57:41'),
	(115, 'Jumping Jack Dumbbell Press', 'jumping-jack-dumbbell-press', 'description of exercise', NULL, 'https://i.imgur.com/oiUxObP.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-02-09 17:58:32'),
	(116, 'Hanging Chin Up', 'hanging-chin-up', 'description of exercise', NULL, 'https://i.imgur.com/DliAC3X.png', NULL, NULL, '2021-01-31 09:25:41', '2021-02-09 18:02:25'),
	(117, 'Assisted Pull Up', 'assisted-pull-up', 'description of exercise', NULL, 'https://i.imgur.com/wnl2iFU.jpg', 'https://i.imgur.com/61kEtAD.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 18:03:23'),
	(118, 'Negative Pull Up', 'negative-pull-up', 'description of exercise', NULL, 'https://i.imgur.com/nrwCjrF.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-02-09 18:03:56'),
	(119, 'Boxing', 'boxing', 'description of exercise', NULL, 'https://i.imgur.com/x1HcY9T.jpg', 'https://i.imgur.com/6mHEXhz.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 18:04:41'),
	(120, 'T Press Up', 't-press-up', 'description of exercise', NULL, 'https://i.imgur.com/ptcxwFl.jpg', 'https://i.imgur.com/8yhySql.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 18:05:10'),
	(121, 'Band T Press Up', 'band-t-press-up', 'description of exercise', NULL, 'https://i.imgur.com/8qJtLPg.png', 'https://i.imgur.com/EUMgDyL.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 18:07:16'),
	(122, 'Dumbbell T Press Up', 'dumbbell-t-press-up', 'description of exercise', NULL, 'https://i.imgur.com/kEgrqcZ.jpg', 'https://i.imgur.com/pbZeb45.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 18:08:42'),
	(123, 'Band T Plank', 'band-t-plank', 'description of exercise', NULL, 'https://i.imgur.com/1PI4GOB.png', 'https://i.imgur.com/EUMgDyL.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:16:03'),
	(124, 'Dumbbell T Plank', 'dumbbell-t-plank', 'description of exercise', NULL, 'https://i.imgur.com/dHxFtm0.jpg', NULL, NULL, '2021-01-31 09:25:41', '2021-02-09 18:13:12'),
	(125, 'T Plank', 't-plank', 'description of exercise', NULL, 'https://i.imgur.com/r5GH4NK.jpg', 'https://i.imgur.com/EUMgDyL.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:15:23'),
	(126, 'Seated Ab Crunch', 'seated-ab-crunch', 'description of exercise', NULL, 'https://i.imgur.com/yXaXBg2.jpg', 'https://i.imgur.com/FcJugh0.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 18:14:07'),
	(127, 'Seated Side Raises', 'seated-side-raises', 'description of exercise', NULL, 'https://i.imgur.com/ncevrk5.jpg', 'https://i.imgur.com/cph1WBG.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:08:04'),
	(128, 'Band Press Up', 'band-press-up', 'description of exercise', NULL, 'https://i.imgur.com/YAbpTf4.png', 'https://i.imgur.com/c25GCgl.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:08:52'),
	(129, 'Bench Dips', 'bench-dips', 'description of exercise', NULL, 'https://i.imgur.com/RhI8yMO.jpg', 'https://i.imgur.com/ySH5owz.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:18:31'),
	(130, 'Decline Press Up', 'decline-press-up', 'description of exercise', NULL, 'https://i.imgur.com/hXD1X5y.jpg', 'https://i.imgur.com/oAogWKi.gif', NULL, '2021-01-31 09:25:41', '2021-01-31 18:28:40'),
	(131, 'Russian Twist', 'russian-twist', 'description of exercise', NULL, 'https://i.imgur.com/Eu0qmUk.png', 'https://i.imgur.com/oZPm99B.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 18:10:30'),
	(132, 'Rotating Side Plank', 'rotating-side-plank', 'description of exercise', NULL, 'https://i.imgur.com/WdaNDrO.png', 'https://i.imgur.com/YKu5nI8.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 18:15:18'),
	(133, 'Spider Crawl', 'spider-crawl', 'description of exercise', NULL, 'https://i.imgur.com/cS8xEJY.png', 'https://i.imgur.com/qGC3C51.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 18:15:49'),
	(134, 'Running', 'running', 'description of exercise', NULL, 'https://i.imgur.com/TD6szLt.png', 'https://i.imgur.com/Ta3K4V1.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 18:16:09'),
	(135, 'Wall Walk', 'wall-walk', 'description of exercise', NULL, 'https://i.imgur.com/ZNgESZj.png', 'https://i.imgur.com/DMD9PWF.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 18:16:31'),
	(136, 'Side Lunge', 'side-lunge', 'description of exercise', NULL, 'https://i.imgur.com/O5Nl5np.png', 'https://i.imgur.com/emTTsnD.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 18:16:54'),
	(137, 'Dumbbell Side Lunge', 'dumbbell-side-lunge', 'description of exercise', NULL, 'https://i.imgur.com/lOtTHTP.png', 'https://i.imgur.com/ymnXplD.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 18:17:26'),
	(138, 'Barbell Side Lung', 'barbell-side-lung', 'description of exercise', NULL, 'https://i.imgur.com/XGHSRhj.png', 'https://i.imgur.com/jT0R5cc.gif', NULL, '2021-01-31 09:25:41', '2021-02-09 18:17:46');
/*!40000 ALTER TABLE `exercises` ENABLE KEYS */;

-- Dumping structure for table fwp.exercises_equipment
CREATE TABLE IF NOT EXISTS `exercises_equipment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exercise_id` bigint(20) unsigned NOT NULL,
  `equipment_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exercises_equipment_exercise_id_foreign` (`exercise_id`),
  KEY `exercises_equipment_equipment_id_foreign` (`equipment_id`),
  CONSTRAINT `exercises_equipment_equipment_id_foreign` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exercises_equipment_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.exercises_equipment: ~0 rows (approximately)
/*!40000 ALTER TABLE `exercises_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercises_equipment` ENABLE KEYS */;

-- Dumping structure for table fwp.exercise_muscles
CREATE TABLE IF NOT EXISTS `exercise_muscles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exercise_id` bigint(20) unsigned NOT NULL,
  `muscle_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exercise_muscles_exercise_id_foreign` (`exercise_id`),
  KEY `exercise_muscles_muscle_id_foreign` (`muscle_id`),
  CONSTRAINT `exercise_muscles_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exercise_muscles_muscle_id_foreign` FOREIGN KEY (`muscle_id`) REFERENCES `muscles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.exercise_muscles: ~0 rows (approximately)
/*!40000 ALTER TABLE `exercise_muscles` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercise_muscles` ENABLE KEYS */;

-- Dumping structure for table fwp.exercise_tags
CREATE TABLE IF NOT EXISTS `exercise_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exercise_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exercise_tags_exercise_id_foreign` (`exercise_id`),
  KEY `exercise_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `exercise_tags_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exercise_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.exercise_tags: ~0 rows (approximately)
/*!40000 ALTER TABLE `exercise_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercise_tags` ENABLE KEYS */;

-- Dumping structure for table fwp.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table fwp.food_items
CREATE TABLE IF NOT EXISTS `food_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `edamam_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edamam_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `food_type_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `food_items_food_type_id_foreign` (`food_type_id`),
  CONSTRAINT `food_items_food_type_id_foreign` FOREIGN KEY (`food_type_id`) REFERENCES `food_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.food_items: ~222 rows (approximately)
/*!40000 ALTER TABLE `food_items` DISABLE KEYS */;
INSERT INTO `food_items` (`id`, `name`, `slug`, `edamam_id`, `edamam_image`, `food_type_id`, `created_at`, `updated_at`) VALUES
	(1, 'chicken breast', 'chicken-breast', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(2, 'chicken thighs', 'chicken-thighs', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(3, 'whole chicken', 'whole-chicken', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(4, 'chicken wings', 'chicken-wings', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(5, 'chicken drumstick', 'chicken-drumstick', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(6, 'mince beef', 'mince-beef', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(7, 'diced beef', 'diced-beef', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(8, 'beef strips', 'beef-strips', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(9, 'burger', 'burger', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(10, 'sirloin steak', 'sirloin-steak', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(11, 'rump steak', 'rump-steak', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(12, 'ribeye steak', 'ribeye-steak', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(13, 'back bacon', 'back-bacon', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(14, 'bacon lardons', 'bacon-lardons', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(15, 'pork steaks', 'pork-steaks', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(16, 'pork chops', 'pork-chops', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(17, 'pork belly slices', 'pork-belly-slices', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(18, 'pork belly', 'pork-belly', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(19, 'pork joint', 'pork-joint', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(20, 'pork sausages', 'pork-sausages', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(21, 'cumberland sausage', 'cumberland-sausage', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(22, 'lincolnshire sausage', 'lincolnshire-sausage', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(23, 'pork & red onion sausages', 'pork-red-onion-sausages', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(24, 'lamb joint', 'lamb-joint', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(25, 'diced lamb', 'diced-lamb', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(26, 'lamb steak', 'lamb-steak', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(27, 'lamb shank', 'lamb-shank', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(28, 'duck breast', 'duck-breast', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(29, 'aromatic duck', 'aromatic-duck', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(30, 'hot dog', 'hot-dog', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(31, 'gammon', 'gammon', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(32, 'ham', 'ham', NULL, NULL, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(33, 'salmon', 'salmon', NULL, NULL, 2, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(34, 'haddock', 'haddock', NULL, NULL, 2, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(35, 'cod', 'cod', NULL, NULL, 2, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(36, 'fish fingers', 'fish-fingers', NULL, NULL, 2, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(37, 'whitefish', 'whitefish', NULL, NULL, 2, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(38, 'prawns', 'prawns', NULL, NULL, 2, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(39, 'tuna', 'tuna', NULL, NULL, 2, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(40, 'potato', 'potato', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(41, 'jaket potato', 'jaket-potato', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(42, 'baby potato', 'baby-potato', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(43, 'new potato', 'new-potato', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(44, 'long grain white rice', 'long-grain-white-rice', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(45, 'long grain brown rice', 'long-grain-brown-rice', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(46, 'basmati rice', 'basmati-rice', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(47, 'basmati brown rice', 'basmati-brown-rice', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(48, 'jasmin rice', 'jasmin-rice', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(49, 'pasta - fusilli', 'pasta-fusilli', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(50, 'pasta - spaghetti', 'pasta-spaghetti', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(51, 'pasta - tagliatelle', 'pasta-tagliatelle', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(52, 'egg noodles', 'egg-noodles', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(53, 'rice noodles', 'rice-noodles', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(54, 'sweet potato', 'sweet-potato', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(55, 'white bread', 'white-bread', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(56, 'seeded bread', 'seeded-bread', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(57, 'half baked baguette', 'half-baked-baguette', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(58, 'burger bun', 'burger-bun', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(59, 'finger bread bun', 'finger-bread-bun', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(60, 'baguette', 'baguette', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(61, 'flatbread', 'flatbread', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(62, 'naan bread', 'naan-bread', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(63, 'pitta bread', 'pitta-bread', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(64, 'flour tortilla', 'flour-tortilla', NULL, NULL, 3, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(65, 'brocolli', 'brocolli', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(66, 'tender stem', 'tender-stem', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(67, 'sprouting brocolli', 'sprouting-brocolli', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(68, 'carrrots', 'carrrots', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(69, 'peas', 'peas', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(70, 'green beans', 'green-beans', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(71, 'stir fry mix', 'stir-fry-mix', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(72, 'cauliflower', 'cauliflower', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(73, 'cabbage', 'cabbage', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(74, 'courgette', 'courgette', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(75, 'parsnips', 'parsnips', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(76, 'asparagus', 'asparagus', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(77, 'celery', 'celery', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(78, 'white onion', 'white-onion', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(79, 'red onion', 'red-onion', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(80, 'peppers', 'peppers', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(81, 'chillies', 'chillies', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(82, 'ginger', 'ginger', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(83, 'garlic', 'garlic', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(84, 'bok choi', 'bok-choi', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(85, 'leek', 'leek', NULL, NULL, 4, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(86, 'bananas', 'bananas', NULL, NULL, 5, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(87, 'blueberries', 'blueberries', NULL, NULL, 5, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(88, 'sweet clems', 'sweet-clems', NULL, NULL, 5, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(89, 'apple', 'apple', NULL, NULL, 5, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(90, 'pear', 'pear', NULL, NULL, 5, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(91, 'pineapple', 'pineapple', NULL, NULL, 5, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(92, 'green grapes', 'green-grapes', NULL, NULL, 5, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(93, 'red grapes', 'red-grapes', NULL, NULL, 5, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(94, 'black grapes', 'black-grapes', NULL, NULL, 5, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(95, 'melon', 'melon', NULL, NULL, 5, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(96, 'lime', 'lime', NULL, NULL, 5, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(97, 'lemon', 'lemon', NULL, NULL, 5, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(98, 'cranberries', 'cranberries', NULL, NULL, 5, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(99, 'mandarin', 'mandarin', NULL, NULL, 5, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(100, 'mango', 'mango', NULL, NULL, 5, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(101, 'salad tomato', 'salad-tomato', NULL, NULL, 6, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(102, 'cherry tomato', 'cherry-tomato', NULL, NULL, 6, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(103, 'cucumber', 'cucumber', NULL, NULL, 6, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(104, 'iceberg lettuce', 'iceberg-lettuce', NULL, NULL, 6, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(105, 'gem lettuce', 'gem-lettuce', NULL, NULL, 6, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(106, 'leaf salad', 'leaf-salad', NULL, NULL, 6, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(107, 'coleslaw', 'coleslaw', NULL, NULL, 6, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(108, 'spring onion', 'spring-onion', NULL, NULL, 6, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(109, 'Baked beans', 'baked-beans', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(110, 'tinned chopped tomatoes', 'tinned-chopped-tomatoes', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(111, 'tinned plum tomatoes', 'tinned-plum-tomatoes', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(112, 'tomato passata', 'tomato-passata', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(113, 'tomato puree', 'tomato-puree', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(114, 'tinned tuna', 'tinned-tuna', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(115, 'chicken soup', 'chicken-soup', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(116, 'tomato soup', 'tomato-soup', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(117, 'chickpeas', 'chickpeas', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(118, 'bolognase - jar sauce', 'bolognase-jar-sauce', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(119, 'tikka masala - jar sauce', 'tikka-masala-jar-sauce', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(120, 'balti - jar sauce', 'balti-jar-sauce', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(121, 'bhuna - jar sauce', 'bhuna-jar-sauce', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(122, 'green curry - jar sauce', 'green-curry-jar-sauce', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(123, 'green curry paste', 'green-curry-paste', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(124, 'curry paste', 'curry-paste', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(125, 'angel delight', 'angel-delight', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(126, 'coconut milk', 'coconut-milk', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(127, 'cocoa powder', 'cocoa-powder', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(128, 'plain flour', 'plain-flour', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(129, 'cornflour', 'cornflour', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(130, '00 flour', '00-flour', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(131, 'eggs', 'eggs', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(132, 'baking powder', 'baking-powder', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(133, 'gravy granules', 'gravy-granules', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(134, 'peanuts', 'peanuts', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(135, 'hazelnuts', 'hazelnuts', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(136, 'ground almonds', 'ground-almonds', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(137, 'breadcrumbs', 'breadcrumbs', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(138, 'brown sugar', 'brown-sugar', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(139, 'chocolate - milk', 'chocolate-milk', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(140, 'chocolate - dark', 'chocolate-dark', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(141, 'oats', 'oats', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(142, 'crunchy nut', 'crunchy-nut', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(143, 'peanut butter - crunchy', 'peanut-butter-crunchy', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(144, 'peanut butter - smooth', 'peanut-butter-smooth', NULL, NULL, 7, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(145, 'brown sauce', 'brown-sauce', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(146, 'bbq sauce', 'bbq-sauce', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(147, 'nancos medium', 'nancos-medium', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(148, 'malt vinegar', 'malt-vinegar', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(149, 'chicken oxo', 'chicken-oxo', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(150, 'salt', 'salt', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(151, 'rice wine', 'rice-wine', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(152, 'apple cider vinegar', 'apple-cider-vinegar', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(153, 'sherry vinegar', 'sherry-vinegar', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(154, 'balsamic vinegar', 'balsamic-vinegar', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(155, 'fish sauce', 'fish-sauce', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(156, 'sesame oil', 'sesame-oil', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(157, 'olive oil', 'olive-oil', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(158, 'vegetable oil', 'vegetable-oil', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(159, 'redpalm & rapeseed oil', 'redpalm-rapeseed-oil', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(160, 'honey', 'honey', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(161, 'hoisin sauce', 'hoisin-sauce', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(162, 'mango chutney', 'mango-chutney', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(163, 'mayonnaise', 'mayonnaise', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(164, 'sweet chilli sauce', 'sweet-chilli-sauce', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(165, 'tabasco sauce', 'tabasco-sauce', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(166, 'sriracha sauce', 'sriracha-sauce', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(167, 'worcestershire sauce', 'worcestershire-sauce', NULL, NULL, 8, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(168, 'ground cumin', 'ground-cumin', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(169, 'ground coriander', 'ground-coriander', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(170, 'garam masala', 'garam-masala', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(171, 'paprika', 'paprika', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(172, 'tandoori powder', 'tandoori-powder', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(173, 'curry powder', 'curry-powder', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(174, 'tumeric', 'tumeric', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(175, 'cinemmon', 'cinemmon', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(176, 'cardamom pod', 'cardamom-pod', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(177, 'cayenne', 'cayenne', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(178, 'Chinese 5 spice', 'chinese-5-spice', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(179, 'chilli powder', 'chilli-powder', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(180, 'cloves', 'cloves', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(181, 'all spice', 'all-spice', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(182, 'cumin seeds', 'cumin-seeds', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(183, 'coriander seeds', 'coriander-seeds', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(184, 'fennel seeds', 'fennel-seeds', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(185, 'ground ginger', 'ground-ginger', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(186, 'garlic granules', 'garlic-granules', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(187, 'nutmeg', 'nutmeg', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(188, 'sesame seeds', 'sesame-seeds', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(189, 'sichaun pepper', 'sichaun-pepper', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(190, 'star anise', 'star-anise', NULL, NULL, 9, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(191, 'mixed herbs', 'mixed-herbs', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(192, 'oregano', 'oregano', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(193, 'basil - dried', 'basil-dried', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(194, 'basil - fresh', 'basil-fresh', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(195, 'parsley - dried', 'parsley-dried', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(196, 'parsley - fresh', 'parsley-fresh', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(197, 'coriander - dried', 'coriander-dried', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(198, 'coriander - fresh', 'coriander-fresh', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(199, 'thyme - dried', 'thyme-dried', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(200, 'thyme - fresh', 'thyme-fresh', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(201, 'rosemary - dried', 'rosemary-dried', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(202, 'rosemary - fresh', 'rosemary-fresh', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(203, 'marjoram', 'marjoram', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(204, 'mint', 'mint', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(205, 'chives', 'chives', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(206, 'sage - dried', 'sage-dried', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(207, 'sage - fresh', 'sage-fresh', NULL, NULL, 10, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(208, 'greek yoghurt', 'greek-yoghurt', NULL, NULL, 11, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(209, 'strawberry yogurt', 'strawberry-yogurt', NULL, NULL, 11, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(210, 'crunch corner yogurt', 'crunch-corner-yogurt', NULL, NULL, 11, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(211, 'cheese - cheddar', 'cheese-cheddar', NULL, NULL, 11, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(212, 'cheese - red leicester', 'cheese-red-leicester', NULL, NULL, 11, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(213, 'cheese - mozarella', 'cheese-mozarella', NULL, NULL, 11, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(214, 'milk', 'milk', NULL, NULL, 11, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(215, 'butter', 'butter', NULL, NULL, 11, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(216, 'buttermilk', 'buttermilk', NULL, NULL, 11, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(217, 'double cream', 'double-cream', NULL, NULL, 11, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(218, 'single cream', 'single-cream', NULL, NULL, 11, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(219, 'clotted cream', 'clotted-cream', NULL, NULL, 11, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(220, 'squirty cream', 'squirty-cream', NULL, NULL, 11, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(221, 'cream cheese', 'cream-cheese', NULL, NULL, 11, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(222, 'mascarpone', 'mascarpone', NULL, NULL, 11, '2021-01-31 21:09:20', '2021-01-31 21:09:20');
/*!40000 ALTER TABLE `food_items` ENABLE KEYS */;

-- Dumping structure for table fwp.food_types
CREATE TABLE IF NOT EXISTS `food_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.food_types: ~11 rows (approximately)
/*!40000 ALTER TABLE `food_types` DISABLE KEYS */;
INSERT INTO `food_types` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'meat', 'meat', NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(2, 'fish', 'fish', NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(3, 'carbs', 'carbs', NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(4, 'vegetables', 'vegetables', NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(5, 'fruit', 'fruit', NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(6, 'salad', 'salad', NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(7, 'cupboard', 'cupboard', NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(8, 'condiments', 'condiments', NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(9, 'spices', 'spices', NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(10, 'herbs', 'herbs', NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(11, 'dairy', 'dairy', NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20');
/*!40000 ALTER TABLE `food_types` ENABLE KEYS */;

-- Dumping structure for table fwp.locations
CREATE TABLE IF NOT EXISTS `locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_user_id_foreign` (`user_id`),
  CONSTRAINT `locations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.locations: ~33 rows (approximately)
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` (`id`, `name`, `user_id`, `required`, `created_at`, `updated_at`) VALUES
	(1, 'Fridge', 1, 1, '2021-01-31 21:09:19', '2021-01-31 21:09:19'),
	(2, 'Freezer', 1, 1, '2021-01-31 21:09:19', '2021-01-31 21:09:19'),
	(3, 'Cupboard', 1, 1, '2021-01-31 21:09:19', '2021-01-31 21:09:19'),
	(4, 'Fridge', 2, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(5, 'Freezer', 2, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(6, 'Cupboard', 2, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(7, 'Fridge', 3, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(8, 'Freezer', 3, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(9, 'Cupboard', 3, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(10, 'Fridge', 4, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(11, 'Freezer', 4, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(12, 'Cupboard', 4, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(13, 'Fridge', 5, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(14, 'Freezer', 5, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(15, 'Cupboard', 5, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(16, 'Fridge', 6, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(17, 'Freezer', 6, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(18, 'Cupboard', 6, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(19, 'Fridge', 7, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(20, 'Freezer', 7, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(21, 'Cupboard', 7, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(22, 'Fridge', 8, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(23, 'Freezer', 8, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(24, 'Cupboard', 8, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(25, 'Fridge', 9, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(26, 'Freezer', 9, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(27, 'Cupboard', 9, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(28, 'Fridge', 10, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(29, 'Freezer', 10, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(30, 'Cupboard', 10, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(31, 'Fridge', 11, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(32, 'Freezer', 11, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(33, 'Cupboard', 11, 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;

-- Dumping structure for table fwp.meals
CREATE TABLE IF NOT EXISTS `meals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `servings` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meals_user_id_foreign` (`user_id`),
  CONSTRAINT `meals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.meals: ~2 rows (approximately)
/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
INSERT INTO `meals` (`id`, `name`, `servings`, `description`, `method`, `link`, `image`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 'Tons Bolognase', '4', 'World class meal', 'World class meal', 'none', 'none', 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(2, 'Charred Chilli Chicken', '4', 'World class meal', 'World class meal', 'none', 'none', 1, '2021-01-31 21:09:20', '2021-01-31 21:09:20');
/*!40000 ALTER TABLE `meals` ENABLE KEYS */;

-- Dumping structure for table fwp.meal_food_items
CREATE TABLE IF NOT EXISTS `meal_food_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meal_id` bigint(20) unsigned NOT NULL,
  `food_item_id` bigint(20) unsigned NOT NULL,
  `unit_id` bigint(20) unsigned NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meal_food_items_meal_id_foreign` (`meal_id`),
  KEY `meal_food_items_food_item_id_foreign` (`food_item_id`),
  KEY `meal_food_items_unit_id_foreign` (`unit_id`),
  CONSTRAINT `meal_food_items_food_item_id_foreign` FOREIGN KEY (`food_item_id`) REFERENCES `food_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meal_food_items_meal_id_foreign` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meal_food_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.meal_food_items: ~2 rows (approximately)
/*!40000 ALTER TABLE `meal_food_items` DISABLE KEYS */;
INSERT INTO `meal_food_items` (`id`, `meal_id`, `food_item_id`, `unit_id`, `unit`, `qty`, `created_at`, `updated_at`) VALUES
	(1, 1, 6, 9, 'grams', 500, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(2, 2, 2, 9, 'grams', 500, '2021-01-31 21:09:20', '2021-01-31 21:09:20');
/*!40000 ALTER TABLE `meal_food_items` ENABLE KEYS */;

-- Dumping structure for table fwp.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.migrations: ~32 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(6, '2016_06_01_000004_create_oauth_clients_table', 1),
	(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(8, '2019_08_19_000000_create_failed_jobs_table', 1),
	(9, '2020_05_25_132145_create_equipment_table', 1),
	(10, '2020_05_25_132216_create_exercise_table', 1),
	(11, '2020_05_25_132346_create_workouts_table', 1),
	(12, '2020_05_25_132356_create_custom_workouts_table', 1),
	(13, '2020_05_25_162919_create_muscles_table', 1),
	(14, '2020_05_25_163845_create_tags_table', 1),
	(15, '2020_05_25_172334_create_workout_tags_table', 1),
	(16, '2020_05_25_172356_create_workout_equipment_table', 1),
	(17, '2020_05_25_172424_create_exercises_equipment_table', 1),
	(18, '2020_05_25_172823_create_exercise_tags_table', 1),
	(19, '2020_05_25_172832_create_exercise_muscles_table', 1),
	(20, '2020_05_25_172856_create_workout_muscles_table', 1),
	(21, '2020_06_12_213315_create_custom_workouts_exercises_table', 1),
	(22, '2020_06_14_162714_create_custom_workout_exercise_set_table', 1),
	(23, '2020_06_21_172401_create_food_types_table', 1),
	(24, '2020_06_21_172402_create_food_items_table', 1),
	(25, '2020_06_21_172438_create_recipes_table', 1),
	(26, '2020_06_21_172501_create_meals_table', 1),
	(27, '2020_06_28_215535_create_locations_table', 1),
	(28, '2020_06_29_054118_create_units_table', 1),
	(29, '2020_06_29_054119_create_user_food_items_table', 1),
	(30, '2020_06_29_054327_create_entries_table', 1),
	(31, '2020_06_29_065510_create_recipe_food_items_table', 1),
	(32, '2020_07_04_122228_create_meal_food_items_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table fwp.muscles
CREATE TABLE IF NOT EXISTS `muscles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `muscles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.muscles: ~17 rows (approximately)
/*!40000 ALTER TABLE `muscles` DISABLE KEYS */;
INSERT INTO `muscles` (`id`, `name`, `slug`, `description`, `image`, `second_image`, `third_image`, `created_at`, `updated_at`) VALUES
	(1, 'biceps', 'biceps', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(2, 'chest', 'chest', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(3, 'triceps', 'triceps', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(4, 'traps', 'traps', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(5, 'upper back', 'upper-back', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(6, 'lats', 'lats', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(7, 'shoulders', 'shoulders', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(8, 'lower back', 'lower-back', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(9, 'glutes', 'glutes', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(10, 'hamstrings', 'hamstrings', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(11, 'quads', 'quads', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(12, 'calves', 'calves', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(13, 'forearms', 'forearms', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(14, 'full body', 'full-body', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(15, 'upper abs', 'upper-abs', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(16, 'lower abs', 'lower-abs', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(17, 'obliques', 'obliques', NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20');
/*!40000 ALTER TABLE `muscles` ENABLE KEYS */;

-- Dumping structure for table fwp.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.oauth_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Dumping structure for table fwp.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.oauth_auth_codes: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Dumping structure for table fwp.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.oauth_clients: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table fwp.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.oauth_personal_access_clients: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Dumping structure for table fwp.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.oauth_refresh_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Dumping structure for table fwp.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table fwp.recipes
CREATE TABLE IF NOT EXISTS `recipes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `servings` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.recipes: ~0 rows (approximately)
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;

-- Dumping structure for table fwp.recipe_food_items
CREATE TABLE IF NOT EXISTS `recipe_food_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_id` bigint(20) unsigned NOT NULL,
  `food_item_id` bigint(20) unsigned NOT NULL,
  `unit_id` bigint(20) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipe_food_items_recipe_id_foreign` (`recipe_id`),
  KEY `recipe_food_items_food_item_id_foreign` (`food_item_id`),
  KEY `recipe_food_items_unit_id_foreign` (`unit_id`),
  CONSTRAINT `recipe_food_items_food_item_id_foreign` FOREIGN KEY (`food_item_id`) REFERENCES `food_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recipe_food_items_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recipe_food_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.recipe_food_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `recipe_food_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipe_food_items` ENABLE KEYS */;

-- Dumping structure for table fwp.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.tags: ~14 rows (approximately)
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Jump Rope', 'jump-rope', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(2, 'Cardio', 'cardio', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(3, 'Resource', 'resource', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(4, 'Muscle Group Focus', 'muscle-group-focus', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(5, 'Small Space', 'small-space', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(6, 'Ladder', 'ladder', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(7, 'YouTube', 'youtube', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(8, 'Circuits', 'circuits', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(9, 'Workout Program', 'workout-program', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(10, 'Single Workout', 'single-workout', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(11, 'Quick', 'quick', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(12, 'Bodyweight Only', 'bodyweight-only', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(13, 'Full Body', 'full-body', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(14, 'Compound', 'compound', '2021-01-31 21:09:20', '2021-01-31 21:09:20');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;

-- Dumping structure for table fwp.units
CREATE TABLE IF NOT EXISTS `units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.units: ~10 rows (approximately)
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` (`id`, `name`, `label`, `created_at`, `updated_at`) VALUES
	(1, 'teaspoon', 'tsp', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(2, 'tablespoon', 'tbsp', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(3, 'pints', 'pints', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(4, 'ounces', 'oz', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(5, 'meal', 'meal', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(6, 'litres', 'lt', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(7, 'millilitres', 'ml', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(8, 'kilogram', 'kg', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(9, 'gram', 'g', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(10, 'fillet', 'fillet', '2021-01-31 21:09:20', '2021-01-31 21:09:20');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;

-- Dumping structure for table fwp.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_slug_unique` (`slug`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.users: ~11 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `slug`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Anton', 'anton', 'a.hutchinson86@gmail.com', '2021-01-31 21:09:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tNDHZFLuU1', '2021-01-31 21:09:19', '2021-01-31 21:09:19'),
	(2, 'Roxane Luettgen', 'roxane-luettgen', 'raven.altenwerth@example.org', '2021-01-31 21:09:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'elvZwa7T29', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(3, 'Selmer Bauch', 'selmer-bauch', 'corkery.kaia@example.net', '2021-01-31 21:09:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zaunIyq4aF', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(4, 'Ms. Henriette Terry', 'ms-henriette-terry', 'prempel@example.com', '2021-01-31 21:09:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7oIulsblZC', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(5, 'Kaelyn Conroy', 'kaelyn-conroy', 'juston10@example.com', '2021-01-31 21:09:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XahUbV78hS', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(6, 'Theresa Rodriguez', 'theresa-rodriguez', 'terry.raquel@example.com', '2021-01-31 21:09:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7CkFoseiYG', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(7, 'Agustin Nolan', 'agustin-nolan', 'turcotte.halle@example.com', '2021-01-31 21:09:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vVB31ZEWbg', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(8, 'Josiane Kiehn', 'josiane-kiehn', 'stroman.pat@example.net', '2021-01-31 21:09:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0JuPyaUvRE', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(9, 'Nathaniel Hand', 'nathaniel-hand', 'ubaldo72@example.org', '2021-01-31 21:09:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ACaqjeEMyn', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(10, 'Albin Schuppe', 'albin-schuppe', 'dorothy67@example.net', '2021-01-31 21:09:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LWivBvdSR7', '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(11, 'Aiyana Kohler', 'aiyana-kohler', 'sigrid.feest@example.com', '2021-01-31 21:09:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TMdsARFKGo', '2021-01-31 21:09:20', '2021-01-31 21:09:20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table fwp.user_food_items
CREATE TABLE IF NOT EXISTS `user_food_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `food_item_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `location_id` bigint(20) unsigned NOT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` bigint(20) unsigned DEFAULT NULL,
  `date_in` date NOT NULL,
  `date_out` date DEFAULT NULL,
  `days_expire` int(11) DEFAULT NULL,
  `freezeable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_food_items_food_item_id_foreign` (`food_item_id`),
  KEY `user_food_items_user_id_foreign` (`user_id`),
  KEY `user_food_items_location_id_foreign` (`location_id`),
  KEY `user_food_items_unit_id_foreign` (`unit_id`),
  CONSTRAINT `user_food_items_food_item_id_foreign` FOREIGN KEY (`food_item_id`) REFERENCES `food_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_food_items_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_food_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_food_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.user_food_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_food_items` DISABLE KEYS */;
INSERT INTO `user_food_items` (`id`, `created_at`, `updated_at`, `food_item_id`, `user_id`, `location_id`, `qty`, `unit_id`, `date_in`, `date_out`, `days_expire`, `freezeable`) VALUES
	(1, '2021-01-31 21:22:13', '2021-01-31 21:22:12', 1, 1, 3, '4', 10, '2021-01-31', '2021-02-01', 10, NULL);
/*!40000 ALTER TABLE `user_food_items` ENABLE KEYS */;

-- Dumping structure for table fwp.workouts
CREATE TABLE IF NOT EXISTS `workouts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci,
  `links` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workouts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.workouts: ~20 rows (approximately)
/*!40000 ALTER TABLE `workouts` DISABLE KEYS */;
INSERT INTO `workouts` (`id`, `name`, `slug`, `description`, `excerpt`, `image`, `image_url`, `link`, `links`, `created_at`, `updated_at`) VALUES
	(1, 'Explicabo quae labore molestias veritatis repudiandae.', 'explicabo-quae-labore-molestias-veritatis-repudiandae', 'Eligendi quos sed sequi tempora deleniti id. Dolor est fugiat est qui qui quia. Minima illo earum laboriosam perspiciatis. In incidunt est vitae.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(2, 'Voluptatem a amet eos eius corrupti.', 'voluptatem-a-amet-eos-eius-corrupti', 'Aut beatae sed quia totam aut officia. Voluptatem autem quasi magnam delectus qui nihil debitis. Aut minima culpa rerum consequuntur maxime.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(3, 'Aliquam officia quam maiores sequi.', 'aliquam-officia-quam-maiores-sequi', 'Architecto nobis eos et et. Placeat minus est dolor et adipisci corporis. Aut necessitatibus distinctio ipsam.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(4, 'Totam tempora est molestias reprehenderit dolores est ullam.', 'totam-tempora-est-molestias-reprehenderit-dolores-est-ullam', 'Sit praesentium aut veritatis ea et unde quos eius. Maiores officiis ratione consequatur ut. Temporibus asperiores officia et repellendus exercitationem.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(5, 'Ex accusantium voluptas aperiam.', 'ex-accusantium-voluptas-aperiam', 'Occaecati tempore eos animi. Voluptas harum ut tempora nobis et. Est sapiente quo nemo quia quam.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(6, 'Dolorem quidem amet alias.', 'dolorem-quidem-amet-alias', 'Assumenda dolores voluptatibus et. Facere quia veniam nam aperiam delectus. Consequatur rem consequatur nobis animi dolorem eaque aut.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(7, 'Et velit magni consectetur pariatur.', 'et-velit-magni-consectetur-pariatur', 'Qui sit rerum voluptas quibusdam. Illum est molestiae ut. Et ut necessitatibus quae quo. Quod aut nihil reiciendis sit error aspernatur explicabo. Reprehenderit quasi magnam adipisci quia officia sequi.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(8, 'Est quia quam ad.', 'est-quia-quam-ad', 'Non odio dolorum corrupti aut. Fugit quam perspiciatis fuga cumque. Velit et minima laboriosam aut. Id necessitatibus cupiditate dolorem rerum laborum eaque delectus. Deserunt alias enim reprehenderit voluptatem incidunt expedita laborum.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(9, 'Commodi ut.', 'commodi-ut', 'A nam ipsam et est maxime doloribus saepe. Praesentium nobis natus ut cumque provident voluptas. Doloremque libero voluptatum reiciendis voluptas ducimus esse. Sapiente aliquam ratione et corporis quam soluta et.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(10, 'Explicabo quo tempore corporis.', 'explicabo-quo-tempore-corporis', 'Molestiae quaerat in recusandae facilis consequatur sit voluptas. Repellendus error quia voluptatem qui minima voluptatem. Voluptas atque nihil laboriosam esse amet adipisci. Voluptates minus nobis fuga sunt est.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(11, 'Non a tempore quo explicabo aut.', 'non-a-tempore-quo-explicabo-aut', 'Officiis consequatur enim molestiae optio quia aut. Est harum consequatur facere voluptate quo error. Magnam omnis voluptatem similique accusantium est reprehenderit laborum et. Omnis eveniet autem ipsum.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(12, 'Voluptates cumque unde.', 'voluptates-cumque-unde', 'Quaerat eius voluptas nihil tenetur est. Ipsam recusandae impedit rerum ex eos error dolores. Sit sit est odit unde tempora.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(13, 'Vel blanditiis.', 'vel-blanditiis', 'Nulla beatae ipsa voluptas qui ipsum delectus. Labore ad omnis et sit maxime. Expedita eum voluptatibus aut debitis quia doloribus. Assumenda dolor praesentium quam tempora asperiores doloribus magnam.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(14, 'Saepe officiis nulla.', 'saepe-officiis-nulla', 'Repudiandae nisi voluptate aut velit quo tempore eos. Explicabo reprehenderit consequatur blanditiis. Ut voluptate cupiditate consectetur velit. In natus est iusto.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(15, 'Quia quia ducimus odit rerum.', 'quia-quia-ducimus-odit-rerum', 'Eum inventore dolores iste. Placeat qui assumenda illum. Error veniam alias dolores. Laudantium dicta necessitatibus enim cum sed iure eveniet.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(16, 'Ipsa illo voluptatum.', 'ipsa-illo-voluptatum', 'Sequi id eum quibusdam sunt tenetur. Hic pariatur maiores exercitationem in ut. Nobis ut nostrum odit quo et.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(17, 'Amet temporibus ea sit.', 'amet-temporibus-ea-sit', 'Nihil totam officia vel sit. Nemo quas sed non. Ut et suscipit doloribus quia.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(18, 'Maxime voluptas.', 'maxime-voluptas', 'Nihil aut id autem maxime ut qui consequuntur ullam. Et id quibusdam provident consequatur labore accusamus. Ipsam explicabo consequatur enim. Quos expedita quis eum nostrum.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(19, 'Repellendus non molestiae.', 'repellendus-non-molestiae', 'Ex vel qui laborum nobis animi consequatur. Soluta et eius vel pariatur. Tempore omnis ea in ipsam sequi. Consequuntur at autem facilis non optio eaque.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20'),
	(20, 'Sit nisi rem labore.', 'sit-nisi-rem-labore', 'Voluptas aliquid et consequuntur reprehenderit at nihil. Ut rem sapiente sed dignissimos dolore.', NULL, NULL, NULL, NULL, NULL, '2021-01-31 21:09:20', '2021-01-31 21:09:20');
/*!40000 ALTER TABLE `workouts` ENABLE KEYS */;

-- Dumping structure for table fwp.workout_equipment
CREATE TABLE IF NOT EXISTS `workout_equipment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `workout_id` bigint(20) unsigned NOT NULL,
  `equipment_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workout_equipment_workout_id_foreign` (`workout_id`),
  KEY `workout_equipment_equipment_id_foreign` (`equipment_id`),
  CONSTRAINT `workout_equipment_equipment_id_foreign` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `workout_equipment_workout_id_foreign` FOREIGN KEY (`workout_id`) REFERENCES `workouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.workout_equipment: ~0 rows (approximately)
/*!40000 ALTER TABLE `workout_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `workout_equipment` ENABLE KEYS */;

-- Dumping structure for table fwp.workout_muscles
CREATE TABLE IF NOT EXISTS `workout_muscles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `workout_id` bigint(20) unsigned NOT NULL,
  `muscle_id` bigint(20) unsigned NOT NULL,
  `primary` tinyint(4) NOT NULL,
  `secondary` tinyint(4) NOT NULL,
  `tertiary` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workout_muscles_workout_id_foreign` (`workout_id`),
  KEY `workout_muscles_muscle_id_foreign` (`muscle_id`),
  CONSTRAINT `workout_muscles_muscle_id_foreign` FOREIGN KEY (`muscle_id`) REFERENCES `muscles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `workout_muscles_workout_id_foreign` FOREIGN KEY (`workout_id`) REFERENCES `workouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.workout_muscles: ~0 rows (approximately)
/*!40000 ALTER TABLE `workout_muscles` DISABLE KEYS */;
/*!40000 ALTER TABLE `workout_muscles` ENABLE KEYS */;

-- Dumping structure for table fwp.workout_tags
CREATE TABLE IF NOT EXISTS `workout_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `workout_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workout_tags_workout_id_foreign` (`workout_id`),
  KEY `workout_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `workout_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `workout_tags_workout_id_foreign` FOREIGN KEY (`workout_id`) REFERENCES `workouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fwp.workout_tags: ~0 rows (approximately)
/*!40000 ALTER TABLE `workout_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `workout_tags` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
