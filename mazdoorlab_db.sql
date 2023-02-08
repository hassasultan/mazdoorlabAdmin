-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 12, 2022 at 05:24 AM
-- Server version: 10.3.23-MariaDB-cll-lve
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mazdoorlab_db`
--

DELIMITER $$
--
-- Functions
--
$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double(20,17) NOT NULL DEFAULT 0.00000000000000000,
  `longitude` double(20,17) NOT NULL DEFAULT 0.00000000000000000,
  `default` tinyint(1) DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `description`, `address`, `latitude`, `longitude`, `default`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Work', '49744 Hackett Flat Apt. 116\nLake Isabelle, RI 44280-3732', 50.23285210000000000, 9.72471791000000000, 0, 8, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(2, 'Home', '2177 Dooley Lane Suite 218\nBruenport, NV 78450', 50.10586051000000000, 10.20425728000000000, 0, 7, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(3, 'Hotel', '10639 Dietrich Springs\nFritschburgh, MN 18865', 50.38878773000000000, 9.54299851000000000, 0, 5, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(4, 'Building', '91282 Yvonne Track Apt. 319\nJuniusfort, IL 48952-0131', 50.61722197000000000, 9.92179707000000000, 0, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(5, 'Workshop', '886 Eichmann Flats Suite 020\nKhalilshire, IA 58469-3521', 51.95160158000000000, 10.95064957000000000, 0, 5, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(6, 'Home', '48995 Schoen Place\nLake Sofia, TX 37005-2866', 50.96855409000000000, 10.09163845000000000, 0, 4, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(7, 'Building', '61788 Labadie Path\nWest Osvaldoberg, OR 00035-4234', 50.95075000000000000, 11.99231318000000000, 0, 8, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(8, 'Workshop', '6573 Kevin View Suite 145\nNorth Armand, OK 93047', 50.88755988000000000, 10.81218256000000000, 0, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(9, 'Work', '8915 Abby Spur Apt. 645\nPort Erich, AL 79239', 50.61297318000000000, 11.77969914000000000, 0, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(10, 'Office', '418 Noemi Dam Suite 324\nNorth Magali, AL 05006-4042', 50.65345678000000000, 11.48268077000000000, 0, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(11, 'Workshop', '72122 Lincoln Mall\nMohrshire, DE 50955', 50.14445934000000000, 11.92228389000000000, 0, 6, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(12, 'Office', '3832 Lizeth Mall Suite 886\nSouth Zula, WV 23268', 51.30808009000000000, 11.38444265000000000, 0, 5, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(13, 'Hotel', '65794 Maybell Glen\nLake Roselynmouth, NM 53905', 50.48461496000000000, 10.04158094000000000, 0, 6, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(14, 'Office', '3903 Gunnar Throughway Apt. 478\nEast Aileen, VT 89211', 51.55207893000000000, 9.94119974000000000, 0, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(15, 'Home', '7805 Hermiston Pine\nNew Fred, WV 07836-8132', 50.78491999000000000, 11.91516441000000000, 0, 7, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(16, 'Work', '97216 Agustina Gardens Suite 653\nWhiteland, CA 92601-7594', 51.23776525000000000, 9.79531742000000000, 0, 6, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(17, 'Workshop', '7942 Cartwright Prairie\nNew Odie, NM 32943-8169', 51.65046327000000000, 10.68606416000000000, 0, 7, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(18, 'Hotel', '7342 Vicenta Courts\nJefferyborough, CT 14911', 51.54118488000000000, 10.62885524000000000, 0, 8, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(19, 'Office', '734 Casper Locks\nBreitenbergton, MT 18977', 50.69430568000000000, 10.83136517000000000, 0, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(20, 'Home', '7268 Danielle Village\nLake Rossie, ME 33232-2931', 50.74551867000000000, 9.98516672000000000, 0, 4, '2022-03-21 18:46:58', '2022-03-21 18:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `key`, `value`) VALUES
(7, 'date_format', 'l jS F Y (H:i:s)'),
(8, 'language', 'en'),
(17, 'is_human_date_format', '1'),
(18, 'app_name', 'Home Services'),
(19, 'app_short_description', 'Manage Mobile Application'),
(20, 'mail_driver', 'smtp'),
(21, 'mail_host', 'smtp.hostinger.com'),
(22, 'mail_port', '587'),
(23, 'mail_username', 'test@demo.com'),
(24, 'mail_password', '-'),
(25, 'mail_encryption', 'ssl'),
(26, 'mail_from_address', 'test@demo.com'),
(27, 'mail_from_name', 'Smarter Vision'),
(30, 'timezone', 'America/Montserrat'),
(32, 'theme_contrast', 'light'),
(33, 'theme_color', 'primary'),
(34, 'app_logo', '020a2dd4-4277-425a-b450-426663f52633'),
(35, 'nav_color', 'navbar-dark navbar-navy'),
(38, 'logo_bg_color', 'text-light  navbar-navy'),
(66, 'default_role', 'admin'),
(68, 'facebook_app_id', '518416208939727'),
(69, 'facebook_app_secret', '93649810f78fa9ca0d48972fee2a75cd'),
(71, 'twitter_app_id', 'twitter'),
(72, 'twitter_app_secret', 'twitter 1'),
(74, 'google_app_id', '527129559488-roolg8aq110p8r1q952fqa9tm06gbloe.apps.googleusercontent.com'),
(75, 'google_app_secret', 'FpIi8SLgc69ZWodk-xHaOrxn'),
(77, 'enable_google', '1'),
(78, 'enable_facebook', '1'),
(93, 'enable_stripe', '1'),
(94, 'stripe_key', 'pk_test_pltzOnX3zsUZMoTTTVUL4O41'),
(95, 'stripe_secret', 'sk_test_o98VZx3RKDUytaokX4My3a20'),
(101, 'custom_field_models.0', 'App\\Models\\User'),
(104, 'default_tax', '10'),
(107, 'default_currency', '$'),
(108, 'fixed_header', '1'),
(109, 'fixed_footer', '0'),
(110, 'fcm_key', 'AAAAHMZiAQA:APA91bEb71b5sN5jl-w_mmt6vLfgGY5-_CQFxMQsVEfcwO3FAh4-mk1dM6siZwwR3Ls9U0pRDpm96WN1AmrMHQ906GxljILqgU2ZB6Y1TjiLyAiIUETpu7pQFyicER8KLvM9JUiXcfWK'),
(111, 'enable_notifications', '1'),
(112, 'paypal_username', 'sb-z3gdq482047_api1.business.example.com'),
(113, 'paypal_password', '-'),
(114, 'paypal_secret', '-'),
(115, 'enable_paypal', '1'),
(116, 'main_color', '#F4841F'),
(117, 'main_dark_color', '#F4841F'),
(118, 'second_color', '#08143A'),
(119, 'second_dark_color', '#CCCCDD'),
(120, 'accent_color', '#8C9DA8'),
(121, 'accent_dark_color', '#9999AA'),
(122, 'scaffold_dark_color', '#2C2C2C'),
(123, 'scaffold_color', '#FAFAFA'),
(124, 'google_maps_key', '-'),
(125, 'mobile_language', 'en'),
(126, 'app_version', '1.0.0'),
(127, 'enable_version', '1'),
(128, 'default_currency_id', '1'),
(129, 'default_currency_code', 'USD'),
(130, 'default_currency_decimal_digits', '2'),
(131, 'default_currency_rounding', '0'),
(132, 'currency_right', '1'),
(133, 'distance_unit', 'km'),
(134, 'default_theme', 'light'),
(135, 'enable_paystack', '1'),
(136, 'paystack_key', 'pk_test_d754715fa3fa9048c9ab2832c440fb183d7c91f5'),
(137, 'paystack_secret', 'sk_test_66f87edaac94f8adcb28fdf7452f12ccc63d068d'),
(138, 'enable_flutterwave', '1'),
(139, 'flutterwave_key', 'FLWPUBK_TEST-d465ba7e4f6b86325cb9881835726402-X'),
(140, 'flutterwave_secret', 'FLWSECK_TEST-d3f8801da31fc093fb1207ea34e68fbb-X'),
(141, 'enable_stripe_fpx', '1'),
(142, 'stripe_fpx_key', 'pk_test_51IQ0zvB0wbAJesyPLo3x4LRgOjM65IkoO5hZLHOMsnO2RaF0NlH7HNOfpCkjuLSohvdAp30U5P1wKeH98KnwXkOD00mMDavaFX'),
(143, 'stripe_fpx_secret', 'sk_test_51IQ0zvB0wbAJesyPUtR7yGdyOR7aGbMQAX5Es9P56EDUEsvEQAC0NBj7JPqFuJEYXrvSCm5OPRmGaUQBswjkRxVB00mz8xhkFX'),
(144, 'enable_paymongo', '1'),
(145, 'paymongo_key', 'pk_test_iD6aYYm4yFuvkuisyU2PGSYH'),
(146, 'paymongo_secret', 'sk_test_oxD79bMKxb8sA47ZNyYPXwf3'),
(147, 'provider_app_name', 'Service Provider'),
(148, 'default_country_code', 'DE');

-- --------------------------------------------------------

--
-- Table structure for table `availability_hours`
--

CREATE TABLE `availability_hours` (
  `id` int(10) UNSIGNED NOT NULL,
  `day` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monday',
  `start_at` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_at` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `availability_hours`
--

INSERT INTO `availability_hours` (`id`, `day`, `start_at`, `end_at`, `data`, `e_provider_id`) VALUES
(1, 'tuesday', '06:00', '20:00', '{\"en\":\"Nihil sit aperiam qui et.\"}', 15),
(2, 'wednesday', '06:00', '19:00', '{\"en\":\"Quia provident eaque facilis sunt.\"}', 3),
(3, 'friday', '09:00', '23:00', '{\"en\":\"Dolores mollitia id eaque illum.\"}', 2),
(4, 'wednesday', '10:00', '19:00', '{\"en\":\"Et aut vel temporibus repudiandae cumque aut est.\"}', 11),
(5, 'thursday', '11:00', '20:00', '{\"en\":\"Voluptatibus saepe sint modi esse vel.\"}', 12),
(6, 'wednesday', '06:00', '17:00', '{\"en\":\"Ut optio eos repudiandae tenetur.\"}', 17),
(7, 'saturday', '02:00', '13:00', '{\"en\":\"Ipsa reiciendis inventore deleniti unde sint id.\"}', 15),
(8, 'sunday', '06:00', '16:00', '{\"en\":\"Rem doloremque quo sit deserunt temporibus autem.\"}', 7),
(9, 'friday', '10:00', '13:00', '{\"en\":\"Amet in impedit ex cumque.\"}', 3),
(10, 'tuesday', '07:00', '22:00', '{\"en\":\"Facilis dolorem et dolor accusamus reprehenderit.\"}', 3),
(11, 'monday', '08:00', '15:00', '{\"en\":\"Nihil ex et occaecati deleniti.\"}', 2),
(12, 'wednesday', '09:00', '13:00', '{\"en\":\"Debitis earum distinctio odit.\"}', 13),
(13, 'wednesday', '07:00', '14:00', '{\"en\":\"Ex cumque commodi animi non ullam.\"}', 6),
(14, 'saturday', '12:00', '18:00', '{\"en\":\"Necessitatibus dignissimos esse aut maxime.\"}', 16),
(15, 'friday', '09:00', '20:00', '{\"en\":\"Dolor sint delectus sint voluptas.\"}', 13),
(16, 'tuesday', '11:00', '22:00', '{\"en\":\"Iste voluptatibus aut et magnam consequuntur.\"}', 17),
(17, 'wednesday', '12:00', '15:00', '{\"en\":\"Reprehenderit error excepturi qui explicabo sed.\"}', 10),
(18, 'tuesday', '07:00', '17:00', '{\"en\":\"Nesciunt eaque aut porro reiciendis.\"}', 5),
(19, 'sunday', '06:00', '17:00', '{\"en\":\"Sint et quis nisi molestiae reprehenderit.\"}', 13),
(20, 'thursday', '08:00', '17:00', '{\"en\":\"Alias et tenetur eos nobis placeat.\"}', 14),
(21, 'wednesday', '08:00', '14:00', '{\"en\":\"Quia nihil dolore architecto aut sunt.\"}', 4),
(22, 'sunday', '07:00', '17:00', '{\"en\":\"Sed molestiae ipsum soluta eos.\"}', 15),
(23, 'monday', '12:00', '21:00', '{\"en\":\"Numquam assumenda est est tenetur.\"}', 7),
(24, 'friday', '11:00', '14:00', '{\"en\":\"Et et quisquam et voluptates.\"}', 17),
(25, 'wednesday', '06:00', '19:00', '{\"en\":\"Nam quo sed adipisci sint est quia.\"}', 6),
(26, 'tuesday', '11:00', '14:00', '{\"en\":\"Culpa cupiditate est voluptatibus quo.\"}', 11),
(27, 'thursday', '04:00', '20:00', '{\"en\":\"Aut et quo nobis et velit tempora aliquam iure.\"}', 6),
(28, 'thursday', '05:00', '15:00', '{\"en\":\"Fugiat sed aut veniam minima.\"}', 16),
(29, 'thursday', '06:00', '19:00', '{\"en\":\"Deserunt ex ex corrupti pariatur quod.\"}', 4),
(30, 'thursday', '08:00', '14:00', '{\"en\":\"Impedit laborum accusamus odio ipsa voluptas.\"}', 14),
(31, 'sunday', '05:00', '19:00', '{\"en\":\"Corrupti eveniet totam officia ad.\"}', 10),
(32, 'saturday', '09:00', '20:00', '{\"en\":\"Asperiores dolore sit animi voluptatem est.\"}', 15),
(33, 'wednesday', '04:00', '18:00', '{\"en\":\"Ratione sed est quod est.\"}', 12),
(34, 'monday', '12:00', '18:00', '{\"en\":\"Et fugiat animi possimus repellat est.\"}', 2),
(35, 'wednesday', '02:00', '18:00', '{\"en\":\"Quo eum aut et sequi nihil aut nihil porro.\"}', 10),
(36, 'sunday', '06:00', '18:00', '{\"en\":\"Quod quia commodi aut omnis repudiandae.\"}', 8),
(37, 'monday', '11:00', '15:00', '{\"en\":\"Sed excepturi sapiente similique magnam.\"}', 10),
(38, 'thursday', '06:00', '13:00', '{\"en\":\"Aut quia nisi dolore voluptatem ut et animi.\"}', 16),
(39, 'tuesday', '06:00', '13:00', '{\"en\":\"Amet accusamus ipsam est.\"}', 9),
(40, 'monday', '02:00', '19:00', '{\"en\":\"Aut sed optio impedit sint.\"}', 14),
(41, 'friday', '12:00', '21:00', '{\"en\":\"Omnis consequatur voluptatem quia rerum.\"}', 9),
(42, 'monday', '11:00', '18:00', '{\"en\":\"Deleniti impedit cupiditate rerum et.\"}', 16),
(43, 'saturday', '04:00', '16:00', '{\"en\":\"Quas nulla soluta nihil dolore in magnam.\"}', 10),
(44, 'sunday', '10:00', '15:00', '{\"en\":\"Harum consectetur illo dolorum nam cum.\"}', 9),
(45, 'thursday', '06:00', '21:00', '{\"en\":\"Exercitationem quibusdam delectus et quia.\"}', 1),
(46, 'thursday', '07:00', '14:00', '{\"en\":\"Omnis omnis rem nulla itaque accusantium.\"}', 3),
(47, 'saturday', '11:00', '19:00', '{\"en\":\"Ducimus id quibusdam vel nulla enim.\"}', 1),
(48, 'sunday', '07:00', '17:00', '{\"en\":\"Nobis sequi est perferendis quaerat.\"}', 1),
(49, 'sunday', '05:00', '22:00', '{\"en\":\"Perspiciatis exercitationem cumque quis dolor.\"}', 3),
(50, 'saturday', '07:00', '17:00', '{\"en\":\"Ut placeat reiciendis corporis dolor odit.\"}', 7);

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `awards`
--

INSERT INTO `awards` (`id`, `title`, `description`, `e_provider_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Asperiores minima consequuntur et voluptatem. Consequatur earum molestias repellendus rem.\"}', '{\"en\":\"She soon got it out to be almost out of the house, \\\"Let us both go to on the floor: in another moment, when she noticed that they couldn\'t see it?\' So she set off at once to eat the comfits: this.\"}', 11, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(2, '{\"en\":\"Quasi quia cum minus facere perspiciatis. Dicta eveniet est quos neque a recusandae modi.\"}', '{\"en\":\"Gryphon. \'It\'s all his fancy, that: they never executes nobody, you know. But do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, as she heard it say to this: so she sat on, with.\"}', 16, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(3, '{\"en\":\"Aut hic est in et unde. Quo nobis ut tempore dignissimos magni ea laudantium.\"}', '{\"en\":\"Alice thought over all the while, and fighting for the garden!\' and she at once set to work shaking him and punching him in the direction it pointed to, without trying to invent something!\' \'I--I\'m.\"}', 12, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(4, '{\"en\":\"Vel ex earum sit dolores. Molestiae suscipit eum quibusdam ab. Impedit molestiae architecto velit.\"}', '{\"en\":\"Queen said severely \'Who is this?\' She said it to be managed? I suppose it were nine o\'clock in the wind, and was suppressed. \'Come, that finished the goose, with the other: the only one way of.\"}', 13, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(5, '{\"en\":\"Quibusdam et dolorem unde dolorem. Est libero voluptas voluptates molestiae ut molestias.\"}', '{\"en\":\"White Rabbit, \'but it doesn\'t mind.\' The table was a sound of a good deal worse off than before, as the door between us. For instance, suppose it were nine o\'clock in the beautiful garden, among the.\"}', 7, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(6, '{\"en\":\"Dolores eius quo rem. Praesentium minima odio aut. Ratione aut dolor alias sint quas occaecati.\"}', '{\"en\":\"Mock Turtle said with a deep voice, \'are done with a whiting. Now you know.\' He was looking at it uneasily, shaking it every now and then; such as, \'Sure, I don\'t believe there\'s an atom of meaning.\"}', 6, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(7, '{\"en\":\"Deserunt eum explicabo et et. Quia incidunt repudiandae facilis. Sunt perspiciatis non nihil dicta.\"}', '{\"en\":\"Alice; \'all I know who I WAS when I learn music.\' \'Ah! that accounts for it,\' said Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, she found to be afraid of them!\' \'And who is to.\"}', 10, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(8, '{\"en\":\"Asperiores fugiat aliquid eum quia. Minus molestiae ut non temporibus.\"}', '{\"en\":\"Alice. \'Did you speak?\' \'Not I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' \'But, it goes on \\\"THEY ALL RETURNED FROM HIM TO YOU,\\\"\' said Alice. The King looked.\"}', 9, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(9, '{\"en\":\"Ipsam est pariatur distinctio. Possimus quia in quia. Minus perspiciatis quo incidunt porro.\"}', '{\"en\":\"You grant that?\' \'I suppose they are the jurors.\' She said the White Rabbit as he fumbled over the fire, licking her paws and washing her face--and she is such a puzzled expression that she was.\"}', 6, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(10, '{\"en\":\"Totam tempore cum voluptatem iure. Rem magnam enim ullam est minima et. Nam et ea sed a vero.\"}', '{\"en\":\"The table was a general clapping of hands at this: it was too late to wish that! She went on again:-- \'I didn\'t write it, and yet it was perfectly round, she found herself safe in a day or two.\"}', 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(11, '{\"en\":\"Earum officiis sed rerum. Qui est odio sed ipsum qui tempora et. Consequatur et ipsam nobis.\"}', '{\"en\":\"Alice whispered, \'that it\'s done by everybody minding their own business,\' the Duchess was VERY ugly; and secondly, because they\'re making such VERY short remarks, and she felt a little timidly.\"}', 16, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(12, '{\"en\":\"Veniam omnis occaecati repellat excepturi placeat. Rerum ipsam quis voluptatem.\"}', '{\"en\":\"Gryphon, \'that they WOULD put their heads down! I am to see if he would deny it too: but the Rabbit whispered in reply, \'for fear they should forget them before the officer could get away without.\"}', 7, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(13, '{\"en\":\"Sed assumenda iusto repellat autem. Distinctio quia enim dicta eius.\"}', '{\"en\":\"However, this bottle does. I do wonder what Latitude or Longitude either, but thought they were lying on their slates, and then sat upon it.) \'I\'m glad they don\'t give birthday presents like that!\'.\"}', 16, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(14, '{\"en\":\"Facere non voluptas quas velit qui a omnis. Odio nostrum et et cupiditate omnis.\"}', '{\"en\":\"March Hare. Alice was thoroughly puzzled. \'Does the boots and shoes!\' she repeated in a tone of great curiosity. \'It\'s a Cheshire cat,\' said the Cat, \'or you wouldn\'t keep appearing and vanishing so.\"}', 8, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(15, '{\"en\":\"Incidunt ut voluptatem cum. Praesentium vitae laudantium sunt.\"}', '{\"en\":\"WOULD always get into her eyes; and once she remembered the number of changes she had sat down again in a hurry: a large cauldron which seemed to her great disappointment it was in managing her.\"}', 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(16, '{\"en\":\"Magni ut quia eum quasi. Voluptatum incidunt qui quis quaerat minus. Occaecati sint asperiores sed.\"}', '{\"en\":\"He got behind Alice as she could, for the end of trials, \\\"There was some attempts at applause, which was full of soup. \'There\'s certainly too much frightened that she was quite impossible to say it.\"}', 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(17, '{\"en\":\"Saepe qui commodi voluptate deleniti. Dolorem eos voluptate nemo dolorum.\"}', '{\"en\":\"I gave her answer. \'They\'re done with a knife, it usually bleeds; and she very seldom followed it), and handed back to the door, staring stupidly up into the sea, \'and in that case I can go back and.\"}', 15, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(18, '{\"en\":\"Odio earum enim sed. Possimus necessitatibus ipsum qui sed hic.\"}', '{\"en\":\"Alice, \'we learned French and music.\' \'And washing?\' said the Hatter. He had been to the part about her pet: \'Dinah\'s our cat. And she\'s such a subject! Our family always HATED cats: nasty, low.\"}', 9, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(19, '{\"en\":\"Voluptatem molestias odit vel fugit. Vel voluptatibus saepe tenetur ut consequuntur.\"}', '{\"en\":\"Queen of Hearts were seated on their slates, when the Rabbit noticed Alice, as she could even make out who was peeping anxiously into her head. \'If I eat one of them bowed low. \'Would you like to be.\"}', 13, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(20, '{\"en\":\"Autem amet incidunt sint et. Dicta possimus sit ut odit. Ea ad id cupiditate ut aperiam.\"}', '{\"en\":\"Dormouse shall!\' they both sat silent for a minute or two, which gave the Pigeon in a shrill, passionate voice. \'Would YOU like cats if you hold it too long; and that is rather a complaining tone.\"}', 7, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(21, '{\"en\":\"Praesentium quasi ea quia voluptates. Aspernatur ab voluptatibus rerum velit et voluptatum id et.\"}', '{\"en\":\"ARE OLD, FATHER WILLIAM,\\\"\' said the King, who had meanwhile been examining the roses. \'Off with his nose, you know?\' \'It\'s the Cheshire Cat, she was now more than three.\' \'Your hair wants cutting,\'.\"}', 17, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(22, '{\"en\":\"Facere accusantium qui architecto ipsam. Incidunt molestiae et aut deleniti.\"}', '{\"en\":\"Pat, what\'s that in some alarm. This time there were a Duck and a large cat which was sitting on a little bottle on it, and finding it very nice, (it had, in fact, I didn\'t know how to speak first.\"}', 10, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(23, '{\"en\":\"Autem ullam quia officia non error. Consequatur necessitatibus sed labore sunt consequatur est.\"}', '{\"en\":\"Dormouse,\' the Queen added to one of its little eyes, but it was good manners for her to carry it further. So she set the little crocodile Improve his shining tail, And pour the waters of the door.\"}', 13, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(24, '{\"en\":\"Fugit tempore rerum totam dolor consectetur provident. Non rerum nihil est qui.\"}', '{\"en\":\"PRECIOUS nose\'; as an explanation; \'I\'ve none of them bowed low. \'Would you like the look of the tail, and ending with the dream of Wonderland of long ago: and how she was now more than Alice could.\"}', 9, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(25, '{\"en\":\"Accusamus temporibus nisi facere blanditiis ipsum asperiores. Nam hic quam delectus dolor.\"}', '{\"en\":\"English,\' thought Alice; \'only, as it\'s asleep, I suppose it were nine o\'clock in the pool as it can talk: at any rate I\'ll never go THERE again!\' said Alice hastily; \'but I\'m not particular as to.\"}', 13, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(26, '{\"en\":\"Quam non ut non. Neque vel reprehenderit rerum in fugiat veritatis.\"}', '{\"en\":\"Gryphon. \'I\'ve forgotten the little door, had vanished completely. Very soon the Rabbit just under the circumstances. There was a queer-shaped little creature, and held out its arms and legs in all.\"}', 12, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(27, '{\"en\":\"Aspernatur quidem praesentium nisi placeat earum. Voluptas est expedita est qui.\"}', '{\"en\":\"There was a queer-shaped little creature, and held out its arms folded, quietly smoking a long tail, certainly,\' said Alice, and tried to fancy what the name of nearly everything there. \'That\'s the.\"}', 10, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(28, '{\"en\":\"Aperiam et dolorem eveniet commodi delectus. Laboriosam velit ipsa ex et.\"}', '{\"en\":\"While she was quite out of the court. (As that is rather a complaining tone, \'and they drew all manner of things--everything that begins with a smile. There was not a VERY unpleasant state of mind.\"}', 16, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(29, '{\"en\":\"Ullam aliquid iste voluptas vel eos. Doloremque adipisci eos est nemo atque error.\"}', '{\"en\":\"Alice. \'Come, let\'s hear some of them at dinn--\' she checked herself hastily, and said to herself; \'his eyes are so VERY much out of court! Suppress him! Pinch him! Off with his nose, you know?\'.\"}', 4, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(30, '{\"en\":\"At ea dolor corporis iste et aliquam. Laudantium nemo quia dolor et. Dolor consequatur qui sequi.\"}', '{\"en\":\"You see the Queen. \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a hatter.\' Here the other paw, \'lives a Hatter: and in another moment, splash! she was surprised to see if she did.\"}', 12, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(31, '{\"en\":\"Magnam expedita iure id dolor eos. Autem praesentium voluptas illum nulla consectetur.\"}', '{\"en\":\"Alice had never been so much frightened to say a word, but slowly followed her back to the table, half hoping that they couldn\'t see it?\' So she began nibbling at the Gryphon as if he doesn\'t.\"}', 16, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(32, '{\"en\":\"Corrupti quasi omnis et explicabo. Sit ea eos qui non dolor.\"}', '{\"en\":\"When the procession moved on, three of her hedgehog. The hedgehog was engaged in a large plate came skimming out, straight at the stick, running a very short time the Mouse replied rather crossly.\"}', 15, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(33, '{\"en\":\"Et inventore id tempora omnis. Aut voluptatem nemo enim aspernatur. Et nemo vel repellendus quam.\"}', '{\"en\":\"Bill! I wouldn\'t say anything about it, so she waited. The Gryphon sat up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t mean it!\' pleaded poor Alice in a day did you call it.\"}', 4, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(34, '{\"en\":\"Vero cupiditate et velit. Neque qui delectus illo quia cupiditate. Cupiditate vel totam ipsam.\"}', '{\"en\":\"Queen. \'You make me giddy.\' And then, turning to Alice, she went back to the heads of the way the people that walk with their heads!\' and the small ones choked and had just begun to think this a.\"}', 4, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(35, '{\"en\":\"Corporis quos vel voluptates reiciendis quo qui eveniet assumenda. Sed quaerat sequi fugit.\"}', '{\"en\":\"Alice, were in custody and under sentence of execution.\' \'What for?\' said Alice. \'Off with her arms folded, frowning like a thunderstorm. \'A fine day, your Majesty!\' the soldiers had to stoop to.\"}', 12, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(36, '{\"en\":\"Mollitia dolorum veritatis adipisci deleniti similique. Ullam aperiam iusto modi est quo.\"}', '{\"en\":\"I shall see it trying in a tone of delight, which changed into alarm in another moment, when she went back to her: its face in her life, and had to double themselves up and rubbed its eyes: then it.\"}', 13, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(37, '{\"en\":\"Et doloribus libero animi et molestiae. Enim minus et et architecto eum nesciunt.\"}', '{\"en\":\"Lobster Quadrille, that she had never done such a long time together.\' \'Which is just the case with my wife; And the muscular strength, which it gave to my jaw, Has lasted the rest of the ground.\"}', 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(38, '{\"en\":\"Asperiores enim architecto soluta sapiente. Libero vero mollitia dolorum.\"}', '{\"en\":\"March Hare was said to the Gryphon. \'Turn a somersault in the world she was quite pale (with passion, Alice thought), and it set to work very carefully, with one of them.\' In another minute there.\"}', 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(39, '{\"en\":\"Est eaque error quibusdam quod tempora totam ut. Reiciendis iusto omnis voluptatem illum sunt.\"}', '{\"en\":\"Alice did not venture to go with the Queen left off, quite out of the house down!\' said the Mock Turtle went on, taking first one side and then turned to the Dormouse, after thinking a minute or two.\"}', 13, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(40, '{\"en\":\"Nemo asperiores ex voluptates corrupti fugiat. Quo quasi accusantium iure aut quia.\"}', '{\"en\":\"For instance, suppose it were white, but there was nothing else to do, and perhaps after all it might happen any minute, \'and then,\' thought she, \'what would become of me?\' Luckily for Alice, the.\"}', 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(41, '{\"en\":\"Ducimus qui modi est in ex a. Sint corrupti excepturi et. Dolorem odio quia molestias magnam.\"}', '{\"en\":\"Alice; not that she began thinking over other children she knew, who might do very well to introduce some other subject of conversation. While she was to get out again. That\'s all.\' \'Thank you,\'.\"}', 17, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(42, '{\"en\":\"Ut perspiciatis et et in. Et et laboriosam ipsam. Enim nobis iusto omnis repellendus.\"}', '{\"en\":\"Queen, stamping on the door between us. For instance, suppose it doesn\'t matter which way it was very like having a game of play with a shiver. \'I beg your pardon,\' said Alice sharply, for she was.\"}', 7, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(43, '{\"en\":\"Qui tempore natus dolorem voluptatem aut. Modi nesciunt amet earum veniam.\"}', '{\"en\":\"Caterpillar angrily, rearing itself upright as it can\'t possibly make me smaller, I can kick a little!\' She drew her foot as far down the hall. After a time she heard her sentence three of the.\"}', 11, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(44, '{\"en\":\"Ut ut laudantium aliquid sit. Numquam provident tenetur commodi asperiores aperiam veniam dolorem.\"}', '{\"en\":\"Soup! Soup of the party sat silent for a baby: altogether Alice did not venture to say than his first remark, \'It was the King; and as the Caterpillar angrily, rearing itself upright as it was only.\"}', 14, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(45, '{\"en\":\"Iure est quo sed non. Animi voluptates magni quae quo neque sed facere explicabo.\"}', '{\"en\":\"Hatter. Alice felt dreadfully puzzled. The Hatter\'s remark seemed to be managed? I suppose Dinah\'ll be sending me on messages next!\' And she began very cautiously: \'But I don\'t want YOU with us!\\\"\'.\"}', 6, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(46, '{\"en\":\"Atque dolorem nisi iste dolor commodi. Ut assumenda voluptas rerum earum et.\"}', '{\"en\":\"At this moment the King, \'and don\'t be nervous, or I\'ll have you executed, whether you\'re a little glass box that was lying under the table: she opened it, and talking over its head. \'Very.\"}', 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(47, '{\"en\":\"Possimus aut vero asperiores ducimus cupiditate minima. Est provident ea non.\"}', '{\"en\":\"Lizard, Bill, was in March.\' As she said to the shore, and then she looked down, was an old Crab took the place of the jury asked. \'That I can\'t understand it myself to begin with,\' the Mock Turtle.\"}', 9, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(48, '{\"en\":\"Nam quia nam ex. Atque assumenda et deleniti.\"}', '{\"en\":\"And the moral of that is--\\\"Birds of a book,\' thought Alice to herself. At this the White Rabbit, with a yelp of delight, which changed into alarm in another minute there was the first figure!\' said.\"}', 11, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(49, '{\"en\":\"Quas eligendi magni recusandae nihil. Mollitia voluptatum tenetur repellat vero doloribus.\"}', '{\"en\":\"Come on!\' \'Everybody says \\\"come on!\\\" here,\' thought Alice, \'they\'re sure to happen,\' she said to Alice. \'Nothing,\' said Alice. \'Why?\' \'IT DOES THE BOOTS AND SHOES.\' the Gryphon went on \'And how many.\"}', 14, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(50, '{\"en\":\"Nam ullam aut ut aliquam cum optio delectus. Id optio repellendus non est in.\"}', '{\"en\":\"THIS size: why, I should think you\'ll feel it a very good height indeed!\' said the Gryphon, before Alice could not remember ever having heard of uglifying!\' it exclaimed. \'You know what \\\"it\\\" means.\"}', 16, '2022-03-21 18:46:58', '2022-03-21 18:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `believers`
--

CREATE TABLE `believers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `believers`
--

INSERT INTO `believers` (`id`, `user_id`, `provider_id`, `created_at`, `updated_at`) VALUES
(0, 1, 1, '2022-04-04 17:42:44', '2022-04-04 17:42:44'),
(0, 1, 2, '2022-04-04 17:42:52', '2022-04-04 17:42:52');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `e_provider` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `e_service` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` smallint(6) DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `booking_status_id` int(10) UNSIGNED DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `coupon` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_at` datetime DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `hint` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_statuses`
--

CREATE TABLE `booking_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_statuses`
--

INSERT INTO `booking_statuses` (`id`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Received', 1, '2021-01-26 00:25:46', '2021-01-29 22:56:35'),
(2, 'In Progress', 40, '2021-01-26 00:26:02', '2021-02-17 02:56:52'),
(3, 'On the Way', 20, '2021-01-28 12:47:23', '2021-02-16 17:10:13'),
(4, 'Accepted', 10, '2021-02-16 17:09:29', '2021-02-16 17:10:06'),
(5, 'Ready', 30, '2021-02-16 17:11:50', '2021-02-17 02:56:42'),
(6, 'Done', 50, '2021-02-17 02:57:02', '2021-02-17 02:57:02'),
(7, 'Failed', 60, '2021-02-17 02:58:36', '2021-02-17 02:58:36');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  `featured` tinyint(1) DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `color`, `description`, `order`, `featured`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Car Services', '#ff9f43', '<p>Categories for all cars services</p>', 1, 1, NULL, '2021-01-19 22:01:35', '2021-01-31 19:19:56'),
(2, 'Medical Services', '#0abde3', '<p>Categories for all Medical Services<br></p>', 2, 1, NULL, '2021-01-19 23:05:00', '2021-01-31 18:35:11'),
(3, 'Laundry Service', '#ee5253', '<p>Category for all Laundry Service</p>', 3, 1, NULL, '2021-01-31 18:37:04', '2021-02-02 05:33:10'),
(4, 'Beauty & Hair Cuts', '#10ac84', '<p>Category for Hair Cuts and Barber</p>', 4, 0, NULL, '2021-01-31 18:38:37', '2021-02-23 19:37:09'),
(5, 'Washing & Cleaning', '#5f27cd', '<p>Category for&nbsp;Washing &amp; Cleaning&nbsp;</p>', 5, 0, NULL, '2021-01-31 18:42:02', '2021-01-31 18:42:02'),
(6, 'Media & Photography', '#ff9f43', '<p>Category for Media & Photography</p>', 6, 0, NULL, '2021-01-31 18:43:20', '2021-01-31 19:55:51'),
(7, 'Sewer Cleaning', '#5f27cd', '<p>Category for Sewer Cleaning<br></p>', 1, 0, 5, '2021-01-31 19:46:15', '2021-01-31 19:46:30'),
(8, 'Carpet Cleaning', '#5f27cd', '<p>Category for Carpet Cleaning<br></p>', 2, 0, 5, '2021-01-31 19:47:23', '2021-01-31 19:47:23'),
(9, 'Wheel Repair', '#5f27cd', '<p>Category for Wheel Repair<br></p>', 1, 0, 1, '2021-01-31 19:49:40', '2021-01-31 19:49:40');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(12) NOT NULL,
  `commenter_id` int(12) NOT NULL,
  `comment_text` varchar(520) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_id` int(12) NOT NULL,
  `provider_id` int(12) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `commenter_id`, `comment_text`, `media_id`, `provider_id`, `created_at`, `updated_at`) VALUES
(2, 1, 'testing', 1, 1, '2022-04-04 19:15:50', '2022-04-04 19:15:50');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal_digits` tinyint(3) UNSIGNED DEFAULT NULL,
  `rounding` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `decimal_digits`, `rounding`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', '$', 'USD', 2, 0, '2020-10-22 19:50:48', '2020-10-22 19:50:48'),
(2, 'Euro', '€', 'EUR', 2, 0, '2020-10-22 19:51:39', '2020-10-22 19:51:39'),
(3, 'Indian Rupee', 'টকা', 'INR', 2, 0, '2020-10-22 19:52:50', '2020-10-22 19:52:50'),
(4, 'Indonesian Rupiah', 'Rp', 'IDR', 0, 0, '2020-10-22 19:53:22', '2020-10-22 19:53:22'),
(5, 'Brazilian Real', 'R$', 'BRL', 2, 0, '2020-10-22 19:54:00', '2020-10-22 19:54:00'),
(6, 'Cambodian Riel', '៛', 'KHR', 2, 0, '2020-10-22 19:55:51', '2020-10-22 19:55:51'),
(7, 'Vietnamese Dong', '₫', 'VND', 0, 0, '2020-10-22 19:56:26', '2020-10-22 19:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(56) COLLATE utf8mb4_unicode_ci NOT NULL,
  `values` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `in_table` tinyint(1) DEFAULT NULL,
  `bootstrap_column` tinyint(4) DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `custom_field_model` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `name`, `type`, `values`, `disabled`, `required`, `in_table`, `bootstrap_column`, `order`, `custom_field_model`, `created_at`, `updated_at`) VALUES
(5, 'bio', 'textarea', NULL, 0, 0, 0, 6, 1, 'App\\Models\\User', '2019-09-07 01:43:58', '2019-09-07 01:43:58'),
(6, 'address', 'text', NULL, 0, 0, 0, 6, 3, 'App\\Models\\User', '2019-09-07 01:49:22', '2019-09-07 01:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_id` int(10) UNSIGNED NOT NULL,
  `customizable_type` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customizable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_field_values`
--

INSERT INTO `custom_field_values` (`id`, `value`, `view`, `custom_field_id`, `customizable_type`, `customizable_id`, `created_at`, `updated_at`) VALUES
(30, 'Explicabo. Eum provi.&nbsp;', 'Explicabo. Eum provi.&nbsp;', 5, 'App\\Models\\User', 2, '2019-09-07 01:52:30', '2021-02-02 16:32:57'),
(31, 'Modi est libero qui', 'Modi est libero qui', 6, 'App\\Models\\User', 2, '2019-09-07 01:52:30', '2021-02-02 16:32:57'),
(33, 'Consequatur error ip.&nbsp;', 'Consequatur error ip.&nbsp;', 5, 'App\\Models\\User', 1, '2019-09-07 01:53:58', '2021-02-02 16:32:01'),
(34, 'Qui vero ratione vel', 'Qui vero ratione vel', 6, 'App\\Models\\User', 1, '2019-09-07 01:53:58', '2021-02-02 16:32:01'),
(36, 'Dolor optio, error e', 'Dolor optio, error e', 5, 'App\\Models\\User', 3, '2019-10-15 21:21:32', '2021-02-02 16:33:23'),
(37, 'Voluptatibus ad ipsu', 'Voluptatibus ad ipsu', 6, 'App\\Models\\User', 3, '2019-10-15 21:21:32', '2021-02-02 16:33:23'),
(39, 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 5, 'App\\Models\\User', 4, '2019-10-16 23:31:46', '2019-10-16 23:31:46'),
(40, 'Sequi molestiae ipsa1', 'Sequi molestiae ipsa1', 6, 'App\\Models\\User', 4, '2019-10-16 23:31:46', '2021-02-22 04:32:10'),
(42, 'Omnis fugiat et cons.', 'Omnis fugiat et cons.', 5, 'App\\Models\\User', 5, '2019-12-15 23:49:44', '2021-02-02 16:29:47'),
(43, 'Consequatur delenit', 'Consequatur delenit', 6, 'App\\Models\\User', 5, '2019-12-15 23:49:44', '2021-02-02 16:29:47'),
(45, '<p>Short bio for this driver</p>', 'Short bio for this driver', 5, 'App\\Models\\User', 6, '2020-03-29 21:28:05', '2020-03-29 21:28:05'),
(46, '4722 Villa Drive', '4722 Villa Drive', 6, 'App\\Models\\User', 6, '2020-03-29 21:28:05', '2020-03-29 21:28:05'),
(48, 'Voluptatem. Omnis op.', 'Voluptatem. Omnis op.', 5, 'App\\Models\\User', 7, '2021-01-17 21:13:24', '2021-02-02 16:31:36'),
(49, 'Perspiciatis aut ei', 'Perspiciatis aut ei', 6, 'App\\Models\\User', 7, '2021-01-17 21:13:24', '2021-02-02 16:31:36'),
(51, 'sdfsdf56', 'sdfsdf56', 5, 'App\\Models\\User', 8, '2021-02-10 16:31:12', '2021-02-19 19:09:37'),
(52, 'Adressttt', 'Adressttt', 6, 'App\\Models\\User', 8, '2021-02-10 16:31:12', '2021-02-19 18:57:27'),
(53, NULL, '', 5, 'App\\Models\\User', 13, '2022-03-23 08:23:58', '2022-03-23 08:23:58'),
(54, NULL, NULL, 6, 'App\\Models\\User', 13, '2022-03-23 08:23:58', '2022-03-23 08:23:58'),
(55, NULL, '', 5, 'App\\Models\\User', 15, '2022-04-15 18:47:01', '2022-04-15 18:47:01'),
(56, NULL, NULL, 6, 'App\\Models\\User', 15, '2022-04-15 18:47:01', '2022-04-15 18:47:01');

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages`
--

CREATE TABLE `custom_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages`
--

INSERT INTO `custom_pages` (`id`, `title`, `content`, `published`, `created_at`, `updated_at`) VALUES
(1, 'Privacy Policy', '<h1>Privacy Policy of SmarterVision</h1>\n<p>SmarterVision operates the SmarterVision website, which provides the SERVICE.</p>\n<p>This page is used to inform website visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service, the smartersvision.com website.</p>\n<p>If you choose to use our Service, then you agree to the collection and use of information in relation with this policy. The Personal Information that we collect are used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.</p>\n<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at smartersvision.com, unless otherwise defined in this Privacy Policy.</p>\n<h2>Information Collection and Use</h2>\n<p>For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to your name, phone number, and postal address. The information that we collect will be used to contact or identify you.</p>\n<h2>Log Data</h2>\n<p>We want to inform you that whenever you visit our Service, we collect information that your browser sends to us which is called Log Data. This Log Data may include information such as your computer\'s Internet Protocol (“IP”) address, browser version, pages of our Service that you visit, the time and date of your visit, the time spent on those pages, and other statistics.</p>\n<h2>Cookies</h2>\n<p>Cookies are files with small amount of data that is commonly used an anonymous unique identifier. These are sent to your browser from the website that you visit and are stored on your computer\'s hard drive.</p>\n<p>Our website uses these “cookies” to collection information and to improve our Service. You have the option to either accept or refuse these cookies, and know when a cookie is being sent to your computer. If you choose to refuse our cookies, you may not be able to use some portions of our Service.</p>\n<h2>Service Providers</h2>\n<p>We may employ third-party companies and individuals due to the following reasons:</p>\n<ul>\n<li>To facilitate our Service;</li>\n<li>To provide the Service on our behalf;</li>\n<li>To perform Service-related services; or</li>\n<li>To assist us in analyzing how our Service is used.</li>\n</ul>\n<p>We want to inform our Service users that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>\n<h2>Security</h2>\n<p>We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.</p>\n<h2>Links to Other Sites</h2>\n<p>Our Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over, and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>\n<h2>Children\'s Privacy</h2>\n<p>Our Services do not address anyone under the age of 13. We do not knowingly collect personal identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.</p>\n<h2>Changes to This Privacy Policy</h2>\n<p>We may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately, after they are posted on this page.</p>\n<h2>Contact Us</h2>\n<p>If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.</p>', 1, '2021-02-24 16:53:21', '2021-02-24 18:19:19'),
(2, 'Terms & Conditions', '<h2>Terms &amp; Conditions</h2><p>Dolor consequat. Ex ducimus, dolores fugiat ipsam sunt non a dolor quidem nulla ullamco Nam labore nostrum sit amet, tenetur ut consequatur? Non aut incididunt consequatur, rem veniam, veritatis molestiae neque non veniam, nemo facilis eligendi qui aut enim aperiam rerum fugiat, dolorum qui id, in sint et assumenda mollitia dignissimos illum, ipsum maiores asperiores exercitationem odio labore laboris consequatur? Consequatur, sapiente ipsum, laboriosam, laudantium, dolor sed autem eligendi ea a.</p><p>Dolor consequat. Ex ducimus, dolores fugiat ipsam sunt non a dolor quidem nulla ullamco Nam labore nostrum sit amet, tenetur ut consequatur? Non aut incididunt consequatur, rem veniam, veritatis molestiae neque non veniam, nemo facilis eligendi qui aut enim aperiam rerum fugiat, dolorum qui id, in sint et assumenda mollitia dignissimos illum, ipsum maiores asperiores exercitationem odio labore laboris consequatur? Consequatur, sapiente ipsum, laboriosam, laudantium, dolor sed autem eligendi ea a.<br></p>', 1, '2021-02-24 18:20:06', '2021-02-24 18:23:52');

-- --------------------------------------------------------

--
-- Table structure for table `discountables`
--

CREATE TABLE `discountables` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `discountable_type` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discountable_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `id` int(10) UNSIGNED NOT NULL,
  `e_provider_id` int(10) UNSIGNED DEFAULT NULL,
  `total_bookings` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_earning` double(10,2) NOT NULL DEFAULT 0.00,
  `admin_earning` double(10,2) NOT NULL DEFAULT 0.00,
  `e_provider_earning` double(10,2) NOT NULL DEFAULT 0.00,
  `taxes` double(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `earnings`
--

INSERT INTO `earnings` (`id`, `e_provider_id`, `total_bookings`, `total_earning`, `admin_earning`, `e_provider_earning`, `taxes`, `created_at`, `updated_at`) VALUES
(1, 19, 0, 0.00, 0.00, 0.00, 0.00, '2022-04-04 21:37:22', '2022-04-04 21:37:22'),
(2, 20, 0, 0.00, 0.00, 0.00, 0.00, '2022-04-05 17:00:00', '2022-04-05 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

CREATE TABLE `experiences` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `experiences`
--

INSERT INTO `experiences` (`id`, `title`, `description`, `e_provider_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Vel quae ut exercitationem tempora aperiam. Fuga accusantium nihil quasi ducimus facere amet.\"}', '{\"en\":\"Queen, \'Really, my dear, YOU must cross-examine THIS witness.\' \'Well, if I was, I shouldn\'t want YOURS: I don\'t know,\' he went on, \'I must go by the hedge!\' then silence, and then turned to the.\"}', 18, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(2, '{\"en\":\"Aut dolores ullam accusamus facere doloremque aut fugiat assumenda. Iure aliquam praesentium porro eligendi ea nemo debitis.\"}', '{\"en\":\"Gryphon, and the reason they\'re called lessons,\' the Gryphon at the Duchess sneezed occasionally; and as the doubled-up soldiers were always getting up and beg for its dinner, and all of you, and.\"}', 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(3, '{\"en\":\"Necessitatibus deleniti tempora porro animi et. Blanditiis quod in voluptatem est. Est illum enim ab laboriosam.\"}', '{\"en\":\"I\'m here! Digging for apples, indeed!\' said the Mock Turtle. \'Very much indeed,\' said Alice. \'Then it wasn\'t trouble enough hatching the eggs,\' said the King, rubbing his hands; \'so now let the.\"}', 11, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(4, '{\"en\":\"Libero sunt est dolore dolorum. Dolor nobis sed sunt repudiandae et. Est fuga deleniti soluta vel consequatur.\"}', '{\"en\":\"Gryphon, and the words \'DRINK ME,\' but nevertheless she uncorked it and put back into the roof off.\' After a while, finding that nothing more to be said. At last the Mouse, sharply and very soon had.\"}', 11, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(5, '{\"en\":\"Aliquam deleniti id enim rem. Ipsa ipsa non quam id sint qui. Voluptatibus corrupti molestias laborum id.\"}', '{\"en\":\"HERE.\' \'But then,\' thought she, \'if people had all to lie down upon their faces. There was exactly one a-piece all round. (It was this last remark. \'Of course twinkling begins with a large.\"}', 15, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(6, '{\"en\":\"A voluptatem perferendis at et dolorem. Recusandae similique quis doloremque saepe temporibus.\"}', '{\"en\":\"Alice, \'to pretend to be sure; but I shall be punished for it flashed across her mind that she had drunk half the bottle, saying to herself \'This is Bill,\' she gave one sharp kick, and waited to see.\"}', 17, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(7, '{\"en\":\"Et amet quas error quis ipsam. Impedit amet deleniti quia necessitatibus distinctio tempora sit.\"}', '{\"en\":\"Dormouse turned out, and, by the fire, and at once took up the chimney, and said anxiously to herself, \'Now, what am I to get out again. The Mock Turtle would be four thousand miles down, I think--\'.\"}', 11, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(8, '{\"en\":\"Occaecati laudantium et dolorem ipsa et non quas. Quia facilis nesciunt repudiandae non. Ea soluta est repudiandae sunt.\"}', '{\"en\":\"Alice rather unwillingly took the cauldron of soup off the fire, stirring a large ring, with the words have got into the garden with one finger, as he said in a deep sigh, \'I was a dead silence.\"}', 15, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(9, '{\"en\":\"Ullam qui voluptates est est non. Quia quo dolorum est suscipit provident maxime ipsam. Nisi hic ea aut aut sunt.\"}', '{\"en\":\"So you see, so many tea-things are put out here?\' she asked. \'Yes, that\'s it,\' said Alice. \'You did,\' said the Pigeon the opportunity of saying to her that she was coming back to the little creature.\"}', 17, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(10, '{\"en\":\"Magni ex quia quo saepe ea ea. Tenetur amet omnis quia sed. Dolor distinctio commodi quia et consequatur.\"}', '{\"en\":\"Mouse had changed his mind, and was going to remark myself.\' \'Have you guessed the riddle yet?\' the Hatter said, turning to the other: the only one way up as the Lory positively refused to tell them.\"}', 7, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(11, '{\"en\":\"Iure aut perferendis id consectetur et quia aliquam. Ducimus ut sunt ipsum quod impedit corrupti ut.\"}', '{\"en\":\"Pigeon went on, spreading out the verses the White Rabbit read:-- \'They told me he was going to give the prizes?\' quite a conversation of it appeared. \'I don\'t much care where--\' said Alice. \'Why.\"}', 13, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(12, '{\"en\":\"Eos ipsam quibusdam delectus harum dignissimos ea. Ut non aut architecto.\"}', '{\"en\":\"At this moment the door with his head!\' she said, without even looking round. \'I\'ll fetch the executioner ran wildly up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t mean.\"}', 14, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(13, '{\"en\":\"Officia fuga fuga vel ducimus eius. Sit magni quia maiores autem quasi iusto dolorem voluptatem.\"}', '{\"en\":\"Alice, and, after folding his arms and legs in all my life!\' Just as she could. \'The Dormouse is asleep again,\' said the Duchess; \'and most things twinkled after that--only the March Hare. Alice was.\"}', 17, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(14, '{\"en\":\"Quod nemo ut officiis facere amet eaque. Impedit adipisci et aut at quaerat quia. Est veritatis non et.\"}', '{\"en\":\"Alice indignantly, and she tried hard to whistle to it; but she could see her after the birds! Why, she\'ll eat a bat?\' when suddenly, thump! thump! down she came up to the seaside once in the.\"}', 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(15, '{\"en\":\"Dignissimos occaecati mollitia vel sapiente. Reprehenderit et et minima et. Illum earum sit ad alias.\"}', '{\"en\":\"SOME change in my size; and as it spoke. \'As wet as ever,\' said Alice loudly. \'The idea of the sort!\' said Alice. \'Nothing WHATEVER?\' persisted the King. \'It began with the Mouse was speaking, and.\"}', 10, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(16, '{\"en\":\"Quo ea provident sed dolores. In deleniti corporis nesciunt quis. Non est nemo et rerum. Et repellat et id.\"}', '{\"en\":\"Queen. \'It proves nothing of the baby, it was just in time to begin at HIS time of life. The King\'s argument was, that she had sat down with wonder at the March Hare. The Hatter looked at the stick.\"}', 17, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(17, '{\"en\":\"Quia molestiae impedit totam quia. Earum dolor eveniet molestiae nulla. Voluptatum iste ex sit minima veritatis quis.\"}', '{\"en\":\"She hastily put down the chimney?--Nay, I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go through next walking about at the thought that she was playing against herself, for this curious child.\"}', 16, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(18, '{\"en\":\"Sint animi nihil ea et atque laudantium ad. Enim quia est nostrum. Ullam aut sit ipsam ea facere ipsum facere.\"}', '{\"en\":\"Alice\'s, and they sat down in a very difficult game indeed. The players all played at once to eat or drink under the table: she opened it, and on both sides at once. \'Give your evidence,\' said the.\"}', 15, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(19, '{\"en\":\"Molestias pariatur qui quia a qui alias mollitia. Non tenetur neque non nulla minima quis enim optio.\"}', '{\"en\":\"Rabbit, and had just begun to dream that she did not like to have no idea what a long time with great curiosity, and this was not even get her head on her toes when they liked, and left off when.\"}', 8, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(20, '{\"en\":\"Corrupti tenetur qui repellendus dolores qui. Voluptates est eos quaerat voluptatum qui eos explicabo mollitia.\"}', '{\"en\":\"Queen of Hearts, who only bowed and smiled in reply. \'That\'s right!\' shouted the Queen was to find that her flamingo was gone across to the executioner: \'fetch her here.\' And the moral of that.\"}', 17, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(21, '{\"en\":\"Est facere est ut. Laborum ut ipsum quia vitae cumque accusamus sunt sunt.\"}', '{\"en\":\"Majesty,\' the Hatter grumbled: \'you shouldn\'t have put it in a very difficult question. However, at last turned sulky, and would only say, \'I am older than you, and must know better\'; and this was.\"}', 4, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(22, '{\"en\":\"Nostrum maxime officia fuga omnis et quae. Qui temporibus iure quia. Repellendus amet sapiente beatae nulla.\"}', '{\"en\":\"Alice, with a teacup in one hand, and a piece of it had made. \'He took me for his housemaid,\' she said to the little crocodile Improve his shining tail, And pour the waters of the officers: but the.\"}', 16, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(23, '{\"en\":\"Nam dolores sequi nobis quia iure optio. Est enim inventore ipsum qui. Quas labore ab enim similique rerum animi expedita.\"}', '{\"en\":\"White Rabbit read out, at the time he was gone, and, by the pope, was soon left alone. \'I wish I could show you our cat Dinah: I think that proved it at all. \'But perhaps it was too much frightened.\"}', 11, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(24, '{\"en\":\"Quo cupiditate voluptatem quia. Fugit aut fuga nam consequatur officiis tenetur rerum. Earum ullam molestiae et animi.\"}', '{\"en\":\"Alice; \'only, as it\'s asleep, I suppose you\'ll be telling me next that you weren\'t to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree stood near the house of the garden: the roses.\"}', 16, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(25, '{\"en\":\"Quam est voluptatem dignissimos. Quo nostrum quo quam rerum quae numquam odio. Laboriosam facere magni et saepe mollitia.\"}', '{\"en\":\"Gryphon: and it said in an offended tone, and added with a sigh: \'he taught Laughing and Grief, they used to queer things happening. While she was peering about anxiously among the distant green.\"}', 16, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(26, '{\"en\":\"Accusamus voluptatem iste quo voluptas rerum et dolorum. Vel iusto sit est sed. Ex atque aut rem tenetur illum quia sed.\"}', '{\"en\":\"Longitude I\'ve got to the door, she walked sadly down the chimney!\' \'Oh! So Bill\'s got the other--Bill! fetch it here, lad!--Here, put \'em up at the March Hare. Alice was very provoking to find any.\"}', 6, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(27, '{\"en\":\"Aut et occaecati aut quis impedit. Et similique et consequatur dolores voluptatem aut. Mollitia et odio aliquid amet.\"}', '{\"en\":\"Five! Don\'t go splashing paint over me like that!\' \'I couldn\'t afford to learn it.\' said the Dodo in an angry tone, \'Why, Mary Ann, what ARE you doing out here? Run home this moment, I tell you, you.\"}', 5, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(28, '{\"en\":\"Id sapiente eum et. Rem esse dolore fuga id consectetur. Eum consequuntur et dolore ea soluta.\"}', '{\"en\":\"This of course, to begin at HIS time of life. The King\'s argument was, that her flamingo was gone in a very curious to know when the White Rabbit read out, at the thought that SOMEBODY ought to have.\"}', 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(29, '{\"en\":\"Ut ea voluptatibus commodi expedita. Et magnam voluptatem esse dolorem tempora.\"}', '{\"en\":\"Bill! the master says you\'re to go and get in at the window.\' \'THAT you won\'t\' thought Alice, as she could remember them, all these changes are! I\'m never sure what I\'m going to be, from one minute.\"}', 15, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(30, '{\"en\":\"Nobis quaerat soluta odio. Ad ipsa et sit voluptatum. Et quo explicabo ut voluptatem provident quia ut.\"}', '{\"en\":\"Hatter, and, just as well. The twelve jurors were all ornamented with hearts. Next came an angry tone, \'Why, Mary Ann, and be turned out of the right-hand bit to try the experiment?\' \'HE might.\"}', 8, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(31, '{\"en\":\"Ipsum sed aut nostrum esse voluptas occaecati. Totam vel voluptatum aut et. Ut cum possimus non vitae qui sint cupiditate.\"}', '{\"en\":\"I was going off into a butterfly, I should have liked teaching it tricks very much, if--if I\'d only been the whiting,\' said Alice, who felt very glad to find her in a melancholy tone: \'it doesn\'t.\"}', 17, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(32, '{\"en\":\"Perspiciatis fuga ea fuga molestias. Tempore nobis sit omnis qui harum.\"}', '{\"en\":\"Queen added to one of them didn\'t know how to spell \'stupid,\' and that is enough,\' Said his father; \'don\'t give yourself airs! Do you think, at your age, it is you hate--C and D,\' she added in a low.\"}', 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(33, '{\"en\":\"Et officia tempore voluptatem in. Nulla eligendi inventore et molestias.\"}', '{\"en\":\"Alice thought to herself, for this curious child was very glad to get rather sleepy, and went back to yesterday, because I was going a journey, I should be raving mad--at least not so mad as it.\"}', 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(34, '{\"en\":\"Qui quae sint fugiat ut corrupti qui. Voluptates impedit et est saepe. Quas ducimus atque earum rem aliquam nihil minus.\"}', '{\"en\":\"And beat him when he sneezes; For he can EVEN finish, if he thought it over afterwards, it occurred to her ear. \'You\'re thinking about something, my dear, and that he had to pinch it to annoy.\"}', 4, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(35, '{\"en\":\"Id omnis molestiae facere nam voluptatibus. Sunt sit culpa ratione ex fugiat ut.\"}', '{\"en\":\"I don\'t know much,\' said Alice; \'that\'s not at all like the wind, and the baby--the fire-irons came first; then followed a shower of saucepans, plates, and dishes. The Duchess took no notice of her.\"}', 7, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(36, '{\"en\":\"Labore veniam facere dolor. Et est est reiciendis est laboriosam animi voluptas. Tempora suscipit similique voluptatem in et.\"}', '{\"en\":\"Gryphon, with a teacup in one hand, and made believe to worry it; then Alice put down her flamingo, and began by taking the little golden key was lying under the circumstances. There was a general.\"}', 12, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(37, '{\"en\":\"Doloremque pariatur magni nobis placeat fugit. Ratione fuga ut enim repellat ducimus iste labore. Fugit sed optio enim hic.\"}', '{\"en\":\"Number One,\' said Alice. \'Of course it was,\' he said. \'Fifteenth,\' said the Cat went on, \'if you don\'t know what to do with this creature when I was sent for.\' \'You ought to have wondered at this.\"}', 6, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(38, '{\"en\":\"Necessitatibus ullam consequatur voluptate occaecati inventore dolorem. Sed fuga deleniti non quae alias nisi.\"}', '{\"en\":\"Pray how did you ever saw. How she longed to get in?\' asked Alice again, for she was out of a candle is like after the rest of my life.\' \'You are old,\' said the Cat, and vanished again. Alice waited.\"}', 18, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(39, '{\"en\":\"Eum voluptatem qui illo recusandae eveniet ut. Voluptatem assumenda velit odio non veniam.\"}', '{\"en\":\"French mouse, come over with diamonds, and walked off; the Dormouse crossed the court, she said to the Queen, pointing to Alice an excellent opportunity for repeating his remark, with variations. \'I.\"}', 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(40, '{\"en\":\"Sit repellat ut qui nam et rem. Pariatur modi excepturi sunt quasi quibusdam fuga saepe. Aut quaerat fugiat aliquid qui qui.\"}', '{\"en\":\"Now I growl when I\'m angry. Therefore I\'m mad.\' \'I call it purring, not growling,\' said Alice. \'Well, I never heard it muttering to himself in an angry tone, \'Why, Mary Ann, what ARE you doing out.\"}', 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(41, '{\"en\":\"Nam omnis aut sint perferendis quibusdam at accusamus ea. Saepe non id commodi omnis. Porro in iusto pariatur impedit.\"}', '{\"en\":\"King replied. Here the Dormouse denied nothing, being fast asleep. \'After that,\' continued the Gryphon. \'They can\'t have anything to put it to half-past one as long as I was thinking I should be.\"}', 9, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(42, '{\"en\":\"Magni labore ut sunt aliquam fuga. Repellendus saepe sapiente voluptatum quod sint magnam.\"}', '{\"en\":\"Hatter. \'It isn\'t a bird,\' Alice remarked. \'Right, as usual,\' said the King, \'that saves a world of trouble, you know, and he called the Queen, who was trembling down to them, they set to work.\"}', 5, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(43, '{\"en\":\"Sit ut porro aliquid eaque autem autem facilis. Maiores labore ut ad rerum odio illo. Est non debitis labore velit nihil.\"}', '{\"en\":\"Father William replied to his ear. Alice considered a little, and then nodded. \'It\'s no business there, at any rate he might answer questions.--How am I to get an opportunity of showing off a little.\"}', 13, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(44, '{\"en\":\"Laborum voluptas laboriosam qui assumenda sit. Officiis est alias tempora laboriosam.\"}', '{\"en\":\"I like being that person, I\'ll come up: if not, I\'ll stay down here! It\'ll be no chance of getting her hands up to her daughter \'Ah, my dear! I shall ever see such a nice soft thing to nurse--and.\"}', 11, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(45, '{\"en\":\"Beatae voluptatem quo facere et et sint veritatis sunt. Odio et minus autem deserunt. Sed officiis libero sit et commodi quam.\"}', '{\"en\":\"I will just explain to you never had fits, my dear, I think?\' \'I had NOT!\' cried the Gryphon, half to herself, for this curious child was very like a frog; and both the hedgehogs were out of it, and.\"}', 5, '2022-03-21 18:46:59', '2022-03-21 18:46:59'),
(46, '{\"en\":\"Aspernatur quisquam totam labore corporis nihil. Vel alias omnis aut aut vitae sint et et.\"}', '{\"en\":\"March Hare and his buttons, and turns out his toes.\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Panther received knife and fork with a sigh.\"}', 2, '2022-03-21 18:46:59', '2022-03-21 18:46:59'),
(47, '{\"en\":\"Maiores qui sed ut eveniet repudiandae ad modi. Qui velit sit tempore voluptas. Aliquam ipsum ipsum optio.\"}', '{\"en\":\"Alice in a very melancholy voice. \'Repeat, \\\"YOU ARE OLD, FATHER WILLIAM,\\\"\' said the Hatter. \'I told you butter wouldn\'t suit the works!\' he added in a sulky tone; \'Seven jogged my elbow.\' On which.\"}', 8, '2022-03-21 18:46:59', '2022-03-21 18:46:59'),
(48, '{\"en\":\"Eum quos assumenda non totam reiciendis. Quidem cupiditate assumenda voluptatem. Nam ducimus aut sed omnis tempora.\"}', '{\"en\":\"Which shall sing?\' \'Oh, YOU sing,\' said the King. \'Nearly two miles high,\' added the March Hare meekly replied. \'Yes, but some crumbs must have got altered.\' \'It is a long silence after this, and.\"}', 12, '2022-03-21 18:46:59', '2022-03-21 18:46:59'),
(49, '{\"en\":\"Rem voluptatem dolor et id quasi in. Dolor debitis ullam omnis harum. Cupiditate et perferendis adipisci deserunt.\"}', '{\"en\":\"Mock Turtle, and said \'What else have you executed on the floor, as it could go, and broke to pieces against one of the country is, you see, Miss, this here ought to be sure; but I can\'t understand.\"}', 7, '2022-03-21 18:46:59', '2022-03-21 18:46:59'),
(50, '{\"en\":\"Commodi labore numquam deleniti et quia illum modi qui. Esse a explicabo rerum quidem sit in est autem.\"}', '{\"en\":\"The Mouse did not appear, and after a few minutes she heard a little anxiously. \'Yes,\' said Alice to herself, \'the way all the party were placed along the course, here and there stood the Queen.\"}', 13, '2022-03-21 18:46:59', '2022-03-21 18:46:59');

-- --------------------------------------------------------

--
-- Table structure for table `e_providers`
--

CREATE TABLE `e_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_provider_type_id` int(10) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `availability_range` double(9,2) DEFAULT 0.00,
  `available` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `accepted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_providers`
--

INSERT INTO `e_providers` (`id`, `name`, `e_provider_type_id`, `description`, `phone_number`, `mobile_number`, `availability_range`, `available`, `featured`, `accepted`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Glass Dach Inc\"}', 2, '{\"en\":\"Nam omnis velit est asperiores omnis laudantium. Quae enim amet unde incidunt. Et harum velit aut consequuntur molestiae sed. Cum nisi dolores harum et quis veritatis.\"}', '539-531-3497', '856-283-6111', 8252.62, 1, 0, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(2, '{\"en\":\"Dentists Halvorson-Howe\"}', 2, '{\"en\":\"Qui eos quo natus aliquam reprehenderit. In et incidunt vero vitae molestiae voluptatum dolor. Sed odio vel et saepe. Officiis et unde voluptatem qui nemo necessitatibus.\"}', '+1-667-771-4922', '820-240-2542', 12958.92, 1, 0, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(3, '{\"en\":\"Security Barrows, Upton and Schumm\"}', 3, '{\"en\":\"Exercitationem et eos maxime asperiores. Minima modi dicta deserunt ratione. Facilis nobis quia eius dolorem repudiandae natus. Distinctio fugit numquam ea beatae distinctio atque.\"}', '(423) 821-1738', '970-944-1484', 6307.29, 1, 1, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(4, '{\"en\":\"Architect Jenkins LLC\"}', 3, '{\"en\":\"Eum optio quasi saepe enim. Omnis in velit consequatur.\"}', '435.241.0832', '(941) 921-8920', 9981.66, 1, 0, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(5, '{\"en\":\"Security Mraz, Simonis and Bogan\"}', 2, '{\"en\":\"Nemo nulla expedita cumque eum. Reprehenderit culpa explicabo atque doloremque accusantium dolorem molestias. Dolores alias molestias dolore magni.\"}', '1-458-278-0175', '+1 (225) 340-3714', 9892.94, 1, 0, 0, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(6, '{\"en\":\"Dentists Parker, Olson and Leffler\"}', 3, '{\"en\":\"Voluptatem est maiores ullam amet officiis sapiente delectus. Cumque fugiat unde voluptatem. Voluptatibus non dolores voluptatem repudiandae earum illum vero. Voluptatem cumque ipsum est.\"}', '470.463.2584', '+1.351.745.3808', 6606.15, 1, 1, 0, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(7, '{\"en\":\"Security Rohan, Russel and Kuhn\"}', 3, '{\"en\":\"Dolore rerum a voluptate quisquam non temporibus. Assumenda et ut rerum incidunt.\"}', '+1-586-594-6380', '+18387291060', 6777.90, 1, 0, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(8, '{\"en\":\"Gardner Construction Hoppe-Zboncak\"}', 3, '{\"en\":\"Voluptatem ipsam vero sint rerum consequatur. Reiciendis ducimus qui et rerum voluptas. Qui ut debitis ut culpa.\"}', '+12195233279', '469.229.0430', 9513.47, 1, 0, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(9, '{\"en\":\"Painting Rau, Kirlin and Zemlak\"}', 2, '{\"en\":\"Consequatur sed facilis rem mollitia rem. Ut magni possimus perspiciatis quae accusantium quia. Aut qui tenetur ipsam assumenda quod ipsa odit voluptates. Excepturi dicta nihil cupiditate.\"}', '1-458-980-2730', '850-663-4219', 9724.27, 1, 1, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(10, '{\"en\":\"Dentists Spencer, Treutel and Reynolds\"}', 2, '{\"en\":\"Praesentium repellat rerum consequatur harum. Quibusdam et animi vel labore. Ipsam qui nobis fugit voluptatum suscipit.\"}', '(870) 712-6782', '+12817793415', 7377.62, 1, 0, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(11, '{\"en\":\"Glass Hammes-Lesch\"}', 2, '{\"en\":\"Provident quibusdam necessitatibus aliquid tempora quia optio. Velit est repellendus excepturi voluptatem mollitia. Incidunt neque eveniet tempore illum voluptatum.\"}', '+13039394601', '+1.959.300.7541', 11629.49, 1, 0, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(12, '{\"en\":\"Dentists Kling, Roob and Franecki\"}', 3, '{\"en\":\"At voluptas autem hic aut. Voluptas esse qui non assumenda amet dignissimos non aperiam. Omnis vel ut minus et sint blanditiis voluptatum dolor.\"}', '+12609723143', '+1.618.826.4999', 13033.12, 0, 0, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(13, '{\"en\":\"Epoxy Coating Collins Inc\"}', 3, '{\"en\":\"Deleniti beatae voluptas non soluta. Distinctio quos maiores est et est sequi quaerat. Commodi omnis rerum necessitatibus porro dolorem nostrum.\"}', '1-747-536-1620', '740.300.6604', 9417.89, 1, 0, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(14, '{\"en\":\"Sewer Cleaning Balistreri-Leuschke\"}', 2, '{\"en\":\"Atque veniam ut nulla vel. Dolores expedita eius tenetur qui maxime perspiciatis vel. Eaque illo commodi et similique aperiam. Accusamus repellendus qui quia et voluptates.\"}', '+1-781-388-8344', '(307) 354-9347', 8345.85, 1, 1, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(15, '{\"en\":\"Roofing McLaughlin, Lowe and Senger\"}', 2, '{\"en\":\"Sit nisi velit dolorem quos a incidunt. Molestiae sunt consequatur est molestiae. Impedit veniam maiores ducimus ex.\"}', '1-781-971-3167', '(475) 323-3496', 12637.00, 1, 0, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(16, '{\"en\":\"Painting Yundt, Bashirian and Wiza\"}', 2, '{\"en\":\"Odio atque reprehenderit minima sit nisi debitis. Aut debitis consectetur non voluptatem suscipit. Aliquid deserunt ab est provident. Quam placeat hic molestiae est magni non.\"}', '352-859-4861', '386.505.9270', 8674.65, 1, 1, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(17, '{\"en\":\"Security Rolfson Group\"}', 3, '{\"en\":\"Molestiae laborum dolorem est quod voluptatem saepe et atque. Dolorem nemo quasi eveniet omnis.\"}', '+1-678-593-3647', '(234) 244-4480', 12806.88, 1, 0, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(18, '{\"en\":\"House Pfannerstill-Mante\"}', 3, '{\"en\":\"Ad nostrum esse maxime tenetur. Totam repellat nostrum recusandae earum est sequi nostrum. Doloribus sit aut nulla aut.\"}', '947-526-5802', '+1-310-798-7699', 11867.23, 1, 0, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(19, '{\"en\":\"nadeem\"}', 2, '{\"en\":\"testing\"}', '03464323220', '03464323220', 20.00, 1, 0, 0, '2022-04-04 21:37:22', '2022-04-04 21:37:22'),
(20, '{\"en\":\"Nadeem Aslam\"}', 2, '{\"en\":\"testing\"}', '03464323220', '03464323220', 42.00, 1, 0, 0, '2022-04-05 17:00:00', '2022-04-05 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_addresses`
--

CREATE TABLE `e_provider_addresses` (
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `address_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_provider_addresses`
--

INSERT INTO `e_provider_addresses` (`e_provider_id`, `address_id`) VALUES
(1, 2),
(1, 7),
(3, 2),
(3, 16),
(3, 20),
(5, 18),
(6, 18),
(8, 6),
(8, 8),
(8, 10),
(9, 7),
(11, 1),
(11, 10),
(11, 11),
(12, 13),
(12, 17),
(13, 11),
(14, 1),
(14, 2),
(14, 11),
(14, 16),
(15, 6),
(15, 7),
(16, 1),
(16, 11),
(16, 19),
(17, 11),
(17, 18),
(18, 2),
(18, 11);

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_payouts`
--

CREATE TABLE `e_provider_payouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `method` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `paid_date` datetime NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_taxes`
--

CREATE TABLE `e_provider_taxes` (
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_provider_taxes`
--

INSERT INTO `e_provider_taxes` (`e_provider_id`, `tax_id`) VALUES
(19, 1),
(19, 2),
(19, 3),
(20, 1),
(20, 2);

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_types`
--

CREATE TABLE `e_provider_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` double(5,2) NOT NULL DEFAULT 0.00,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_provider_types`
--

INSERT INTO `e_provider_types` (`id`, `name`, `commission`, `disabled`, `created_at`, `updated_at`) VALUES
(2, 'Company', 75.00, 0, '2021-01-13 23:05:35', '2021-02-02 02:22:19'),
(3, 'Freelancer', 50.00, 0, '2021-01-18 00:27:18', '2021-02-24 23:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_users`
--

CREATE TABLE `e_provider_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_provider_users`
--

INSERT INTO `e_provider_users` (`user_id`, `e_provider_id`) VALUES
(2, 1),
(2, 2),
(2, 6),
(2, 18),
(4, 3),
(4, 5),
(4, 9),
(4, 14),
(6, 2),
(6, 4),
(6, 14),
(6, 17),
(14, 19),
(14, 20);

-- --------------------------------------------------------

--
-- Table structure for table `e_services`
--

CREATE TABLE `e_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `discount_price` double(10,2) DEFAULT 0.00,
  `price_unit` enum('hourly','fixed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity_unit` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) DEFAULT 0,
  `enable_booking` tinyint(1) DEFAULT 1,
  `available` tinyint(1) DEFAULT 1,
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_services`
--

INSERT INTO `e_services` (`id`, `name`, `price`, `discount_price`, `price_unit`, `quantity_unit`, `duration`, `description`, `featured`, `enable_booking`, `available`, `e_provider_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Nurse Service\"}', 25.54, 0.00, 'fixed', NULL, '5:00', '{\"en\":\"Dicta molestias aut illum est sapiente id expedita quo. Officia enim asperiores soluta cum animi omnis. Numquam et aut sed. Dolores tempore ea neque repellat et.\"}', 1, 0, 0, 11, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(2, '{\"en\":\"Wedding Photos\"}', 19.57, 0.00, 'hourly', NULL, '2:00', '{\"en\":\"Reprehenderit est ut sed autem. Deleniti ex consequatur iure natus et. Magni quia ut qui quia molestiae illum.\"}', 0, 1, 0, 12, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(3, '{\"en\":\"Nurse Service\"}', 45.02, 0.00, 'hourly', NULL, '4:00', '{\"en\":\"Dolorum nam qui consequatur quas fugiat animi minus. Rerum voluptatibus dolorum ea qui nemo aut. Accusantium rem molestiae quaerat ex.\"}', 0, 1, 0, 7, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(4, '{\"en\":\"Real Estate Agents\"}', 11.18, 8.84, 'hourly', NULL, '4:00', '{\"en\":\"Omnis sed neque maxime qui similique fugit tempore modi. Dicta doloribus sed autem qui quam.\"}', 0, 1, 1, 9, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(5, '{\"en\":\"Tank Cleaning\"}', 35.16, 0.00, 'hourly', NULL, '5:00', '{\"en\":\"Itaque optio molestias sint dolorem quod voluptas perferendis. Veniam doloremque aspernatur fugit eligendi minima eum. Porro qui sit reprehenderit enim exercitationem sunt illum.\"}', 1, 1, 1, 9, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(6, '{\"en\":\"Bathtub Refinishing\"}', 27.23, 24.67, 'hourly', NULL, '1:00', '{\"en\":\"Error ut eaque quae iusto dolorum. Eius consequuntur explicabo ratione. Placeat sit ut corporis quaerat minima deleniti animi assumenda.\"}', 1, 0, 0, 14, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(7, '{\"en\":\"Real Estate Agents\"}', 15.64, 0.00, 'hourly', NULL, '3:00', '{\"en\":\"Amet necessitatibus sit ut quibusdam. Soluta consequuntur quasi expedita ut omnis quis. Hic occaecati eveniet voluptatem delectus a rerum occaecati.\"}', 1, 1, 1, 1, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(8, '{\"en\":\"Hair Style Service\"}', 43.01, 0.00, 'fixed', NULL, '2:00', '{\"en\":\"Assumenda voluptate iure recusandae dolor. Deleniti odio id quia magni reprehenderit velit. Dolor dolores voluptates quia aut. Quas quae minus accusamus omnis vel veritatis.\"}', 1, 1, 1, 7, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(9, '{\"en\":\"Architect Service\"}', 30.30, 0.00, 'hourly', NULL, '2:00', '{\"en\":\"Omnis qui tempore ut est iusto. Ipsum ratione et et eaque voluptate labore. Aut soluta autem debitis aut rem minus omnis.\"}', 0, 0, 0, 9, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(10, '{\"en\":\"Makeup & Beauty Services\"}', 49.74, 0.00, 'hourly', NULL, '4:00', '{\"en\":\"Error quis ex expedita officia natus. Facere officia at blanditiis maxime minus quia quam. Qui fugit quis aut aut occaecati. Delectus distinctio saepe quisquam omnis est.\"}', 0, 0, 1, 14, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(11, '{\"en\":\"Office Cleaning\"}', 20.18, 10.89, 'fixed', NULL, '5:00', '{\"en\":\"Maiores labore facere eum mollitia tempore facere et. A inventore aut ex iure. Et voluptatem in dolor voluptas qui inventore itaque. Odio et commodi sit. Modi nostrum architecto id ex quos eaque.\"}', 1, 0, 1, 2, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(12, '{\"en\":\"Suv Car Washing \"}', 15.38, 8.10, 'fixed', NULL, '2:00', '{\"en\":\"Recusandae odio omnis inventore sunt. Autem atque delectus vel sapiente qui. Placeat sequi et deserunt est. Sed fugiat ut reiciendis laudantium repellat.\"}', 0, 1, 1, 8, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(13, '{\"en\":\"Wedding Photos\"}', 20.94, 11.30, 'hourly', NULL, '2:00', '{\"en\":\"Nostrum et non dignissimos omnis. Voluptatem harum et sapiente exercitationem rerum. Ea quia itaque odit esse et rerum quo. Aut amet eum illo a sed.\"}', 0, 0, 0, 16, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(14, '{\"en\":\"Massage Services\"}', 21.36, 0.00, 'fixed', NULL, '3:00', '{\"en\":\"Non sint molestiae quisquam optio. Cum qui culpa ut. Consequatur dolorem quia illum eligendi non soluta.\"}', 0, 1, 0, 17, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(15, '{\"en\":\"Lawn Care Services\"}', 41.34, 0.00, 'hourly', NULL, '2:00', '{\"en\":\"Reprehenderit voluptas nam impedit id sint aut. Molestiae ducimus dolores aut et voluptas quaerat qui. Assumenda ut distinctio sit quia.\"}', 0, 0, 1, 17, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(16, '{\"en\":\"Facials Services\"}', 31.92, 0.00, 'hourly', NULL, '4:00', '{\"en\":\"Dolores nemo itaque quo enim. Et laudantium esse ullam laborum. Molestiae eius aut illo quisquam in. Impedit repellat impedit suscipit quia earum.\"}', 0, 0, 0, 10, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(17, '{\"en\":\"Photography Services\"}', 31.49, 0.00, 'fixed', NULL, '3:00', '{\"en\":\"Atque voluptatem labore voluptatem et. Rerum ut vel eos aspernatur corrupti dolorem. Dolorum corporis tempora ut fugit tempore omnis ut. Ut temporibus voluptatem et.\"}', 0, 1, 0, 5, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(18, '{\"en\":\"Architect Service\"}', 46.35, 40.95, 'hourly', NULL, '4:00', '{\"en\":\"Sunt mollitia cum et sequi. Accusamus placeat cupiditate dolores in. Quasi beatae cum et ipsam qui ab explicabo.\"}', 1, 1, 0, 9, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(19, '{\"en\":\"Lawn Care Services\"}', 27.66, 0.00, 'fixed', NULL, '5:00', '{\"en\":\"Voluptates id quidem voluptate sed et sequi ad. Sapiente reiciendis laborum voluptatem voluptatibus maiores repellendus rerum. Blanditiis ut assumenda illum dolor eos.\"}', 0, 1, 0, 10, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(20, '{\"en\":\"Makeup & Beauty Services\"}', 28.78, 20.15, 'hourly', NULL, '4:00', '{\"en\":\"Minus magni quasi voluptatum impedit. Et in sint animi quas pariatur. Est itaque maxime non. Est facilis molestias quo culpa repellat. Ipsa nostrum necessitatibus laboriosam eveniet quibusdam.\"}', 0, 1, 0, 2, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(21, '{\"en\":\"Real Estate Agents\"}', 15.64, 11.90, 'fixed', NULL, '1:00', '{\"en\":\"Laudantium maxime dolores hic veniam ut sunt. Quae voluptatibus accusamus vel magni voluptas quae quisquam. Facilis ullam sit maxime quaerat dignissimos. Eaque quis eos doloribus sed et.\"}', 0, 1, 0, 16, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(22, '{\"en\":\"Wedding Photos\"}', 13.92, 0.00, 'hourly', NULL, '3:00', '{\"en\":\"Rerum mollitia perspiciatis blanditiis aut dolores. Quia magni qui ratione accusantium dignissimos nemo iure. Non quos quo voluptatem voluptatem. Quibusdam sint aut laborum deleniti tempora sed.\"}', 1, 0, 0, 3, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(23, '{\"en\":\"Post Party Cleaning\"}', 20.30, 0.00, 'hourly', NULL, '4:00', '{\"en\":\"Doloribus eaque nisi velit quia ratione. Magni aut et aliquam animi. Est doloremque id facere placeat non pariatur minus. Voluptatem voluptatibus aliquid aut ut esse modi.\"}', 0, 1, 0, 14, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(24, '{\"en\":\"Facials Services\"}', 46.39, 40.96, 'fixed', NULL, '5:00', '{\"en\":\"Hic tempora eligendi est amet dolores. Aut nam qui ut veniam architecto. Autem esse sunt culpa mollitia similique.\"}', 0, 0, 0, 4, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(25, '{\"en\":\"Full Home Deep Cleaning\"}', 42.05, 34.71, 'hourly', NULL, '2:00', '{\"en\":\"Et aspernatur odio dolor illo saepe ut. Sint animi quod quaerat officia. Est rem aut et. Quia accusantium aliquid pariatur perferendis voluptate quos.\"}', 1, 1, 0, 8, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(26, '{\"en\":\"Bathtub Refinishing\"}', 49.73, 45.50, 'fixed', NULL, '3:00', '{\"en\":\"Et nobis eaque doloribus illo. Omnis molestiae eos error omnis excepturi ut in. Laborum sed aut autem vitae deleniti. Dolore sit sunt laudantium dolore repudiandae aspernatur.\"}', 1, 1, 0, 15, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(27, '{\"en\":\"Post Party Cleaning\"}', 38.21, 34.45, 'fixed', NULL, '1:00', '{\"en\":\"Minima repellat error tempore assumenda sit. Beatae eaque quam qui et nihil molestias repellat deleniti. Quam ipsum tenetur expedita illum porro. Est blanditiis at maiores placeat et beatae debitis.\"}', 1, 0, 1, 11, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(28, '{\"en\":\"Nurse Service\"}', 24.15, 14.52, 'hourly', NULL, '4:00', '{\"en\":\"Temporibus itaque assumenda molestiae et est. Qui accusantium atque ab. Expedita quisquam aut corporis molestiae voluptates eum officiis.\"}', 1, 0, 0, 15, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(29, '{\"en\":\"Photography Services\"}', 48.23, 0.00, 'hourly', NULL, '3:00', '{\"en\":\"Ducimus unde et perspiciatis id provident non. Ipsum ut quam odio architecto magnam. Sequi ut suscipit temporibus enim id est.\"}', 0, 1, 1, 8, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(30, '{\"en\":\"Screens - New and Repair\"}', 14.42, 0.00, 'fixed', NULL, '3:00', '{\"en\":\"Ullam facilis voluptatem blanditiis ut non cupiditate quae eligendi. Nesciunt libero id id et consequuntur quas. Rerum nihil id voluptatem pariatur. Maxime voluptatem voluptatibus atque est.\"}', 0, 1, 0, 4, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(31, '{\"en\":\"Makeup & Beauty Services\"}', 12.84, 0.00, 'hourly', NULL, '2:00', '{\"en\":\"Odit animi libero est nesciunt exercitationem ipsa. Et non placeat eum sapiente dolor eaque unde. Modi asperiores et dolor suscipit repellendus.\"}', 0, 0, 0, 18, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(32, '{\"en\":\"Portrait Photos Services\"}', 22.43, 0.00, 'fixed', NULL, '2:00', '{\"en\":\"Dolor sit sapiente fugiat deserunt qui doloremque. Qui excepturi nesciunt ab numquam veritatis voluptas. Sint iste voluptas quidem est. Voluptas ex beatae voluptates ipsa omnis.\"}', 0, 0, 0, 3, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(33, '{\"en\":\"Office Cleaning\"}', 20.90, 0.00, 'fixed', NULL, '5:00', '{\"en\":\"Et enim laboriosam modi deleniti sint provident. Placeat et expedita possimus sunt dolorem ipsam. Ea perferendis autem rerum tempora animi quaerat. Non accusamus harum harum sint.\"}', 0, 0, 0, 18, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(34, '{\"en\":\"Hair Style Service\"}', 21.47, 17.97, 'fixed', NULL, '1:00', '{\"en\":\"Dolores voluptatum voluptas veniam ut. Consequatur officiis et saepe qui aliquam veniam. Ratione velit officiis at ut.\"}', 0, 1, 1, 7, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(35, '{\"en\":\"Suv Car Washing \"}', 26.90, 20.07, 'hourly', NULL, '3:00', '{\"en\":\"Voluptatem non et tempore est velit et. Temporibus amet voluptas eligendi ipsum facere praesentium. Et recusandae dolorum laborum a cupiditate.\"}', 0, 1, 0, 9, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(36, '{\"en\":\"Architect Service\"}', 47.02, 42.89, 'fixed', NULL, '3:00', '{\"en\":\"Qui cumque assumenda eos id. In ea dolor consequuntur dolor. Aliquam nemo reiciendis et ab.\"}', 1, 1, 1, 2, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(37, '{\"en\":\"Post Party Cleaning\"}', 29.79, 0.00, 'fixed', NULL, '4:00', '{\"en\":\"Qui voluptatem minus veniam laudantium ullam. Dolores voluptas voluptatum odit dolores voluptatum earum qui amet. Eum ea assumenda quisquam vel et aut totam.\"}', 0, 0, 0, 13, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(38, '{\"en\":\"Massage Services\"}', 47.63, 0.00, 'hourly', NULL, '1:00', '{\"en\":\"Inventore non sed nesciunt sint ratione rerum. Dolorem optio aut laudantium impedit eum quo beatae. Id ut optio laboriosam dolores. Velit aut quis tempora deleniti.\"}', 1, 1, 0, 10, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(39, '{\"en\":\"Post Party Cleaning\"}', 16.48, 15.42, 'fixed', NULL, '2:00', '{\"en\":\"Praesentium nulla repudiandae eum deserunt. Rerum a illum et perspiciatis qui at aliquam quibusdam. Odio accusantium laboriosam a deleniti possimus officia.\"}', 0, 1, 0, 2, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(40, '{\"en\":\"Real Estate Agents\"}', 30.14, 26.41, 'fixed', NULL, '5:00', '{\"en\":\"Placeat vel magnam amet vel soluta fuga quis et. Atque quo adipisci consequatur sed maiores. Quidem nulla consequuntur praesentium tempora id.\"}', 0, 0, 1, 13, '2022-03-21 18:46:57', '2022-03-21 18:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `e_service_categories`
--

CREATE TABLE `e_service_categories` (
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_service_categories`
--

INSERT INTO `e_service_categories` (`e_service_id`, `category_id`) VALUES
(1, 6),
(4, 4),
(5, 4),
(7, 6),
(10, 7),
(10, 9),
(11, 4),
(12, 1),
(12, 4),
(14, 2),
(16, 2),
(16, 3),
(17, 7),
(17, 8),
(18, 2);

-- --------------------------------------------------------

--
-- Table structure for table `e_service_reviews`
--

CREATE TABLE `e_service_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(3,2) NOT NULL DEFAULT 0.00,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_service_reviews`
--

INSERT INTO `e_service_reviews` (`id`, `review`, `rate`, `user_id`, `e_service_id`, `created_at`, `updated_at`) VALUES
(1, 'I say--that\'s the same thing,\' said the Queen, \'Really, my dear, YOU must cross-examine the next.', 3.00, 5, 24, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(2, 'He only does it matter to me whether you\'re a little timidly, for she was dozing off, and had just.', 5.00, 5, 13, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(3, 'Edwin and Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the.', 2.00, 8, 27, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(4, 'Dormouse indignantly. However, he consented to go after that into a small passage, not much like.', 4.00, 8, 14, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(5, 'Alice ventured to taste it, and kept doubling itself up and walking away. \'You insult me by.', 3.00, 7, 8, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(6, 'I goes like a wild beast, screamed \'Off with her friend. When she got into it), and handed them.', 2.00, 7, 18, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(7, 'Some of the evening, beautiful Soup! Soup of the baby?\' said the Dormouse crossed the court.', 5.00, 3, 16, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(8, 'TO BE TRUE--\" that\'s the queerest thing about it.\' \'She\'s in prison,\' the Queen in front of them.', 4.00, 7, 17, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(9, 'I shall have some fun now!\' thought Alice. \'Now we shall get on better.\' \'I\'d rather finish my.', 5.00, 3, 32, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(10, 'Mock Turtle a little different. But if I\'m Mabel, I\'ll stay down here! It\'ll be no use in talking.', 3.00, 8, 24, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(11, 'Alice. \'You must be,\' said the young Crab, a little hot tea upon its forehead (the position in.', 3.00, 3, 18, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(12, 'Alice very humbly: \'you had got to the other: the Duchess was VERY ugly; and secondly, because she.', 4.00, 5, 22, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(13, 'I do it again and again.\' \'You are old, Father William,\' the young man said, \'And your hair has.', 2.00, 7, 36, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(14, 'Alice. \'I\'m glad I\'ve seen that done,\' thought Alice. \'I\'m a--I\'m a--\' \'Well! WHAT are you?\' said.', 2.00, 7, 34, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(15, 'When the pie was all very well to introduce it.\' \'I don\'t believe you do lessons?\' said Alice, as.', 5.00, 5, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(16, 'I will prosecute YOU.--Come, I\'ll take no denial; We must have been ill.\' \'So they were,\' said the.', 5.00, 7, 33, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(17, 'Seven looked up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t write it.', 4.00, 7, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(18, 'Lory. Alice replied eagerly, for she was about a foot high: then she had made the whole head.', 3.00, 8, 16, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(19, 'Cat. \'I don\'t know of any good reason, and as for the immediate adoption of more broken glass.).', 4.00, 8, 23, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(20, 'Mary Ann, and be turned out of sight, they were all in bed!\' On various pretexts they all cheered.', 2.00, 7, 31, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(21, 'I\'d hardly finished the guinea-pigs!\' thought Alice. \'Now we shall have to turn round on its.', 5.00, 8, 25, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(22, 'Why, there\'s hardly enough of me left to make SOME change in my kitchen AT ALL. Soup does very.', 5.00, 7, 35, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(23, 'Waiting in a sorrowful tone, \'I\'m afraid I\'ve offended it again!\' For the Mouse heard this, it.', 3.00, 8, 16, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(24, 'Duchess said to herself. (Alice had no very clear notion how delightful it will be much the same.', 3.00, 5, 19, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(25, 'I beg your acceptance of this elegant thimble\'; and, when it saw mine coming!\' \'How do you mean by.', 5.00, 5, 29, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(26, 'He looked at Alice. \'It must be kind to them,\' thought Alice, \'as all the time they were all.', 3.00, 7, 19, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(27, 'Caterpillar. Here was another puzzling question; and as it left no mark on the twelfth?\' Alice.', 5.00, 5, 7, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(28, 'Hatter. \'It isn\'t directed at all,\' said the Footman, and began to tremble. Alice looked very.', 4.00, 8, 10, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(29, 'I shan\'t grow any more--As it is, I suppose?\' \'Yes,\' said Alice, who felt very glad to find that.', 5.00, 3, 33, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(30, 'PLEASE mind what you\'re talking about,\' said Alice. \'Anything you like,\' said the Cat, and.', 2.00, 5, 16, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(31, 'YOUR adventures.\' \'I could tell you my history, and you\'ll understand why it is right?\' \'In my.', 2.00, 8, 22, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(32, 'White Rabbit blew three blasts on the breeze that followed them, the melancholy words:-- \'Soo--oop.', 4.00, 5, 24, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(33, 'Alice said nothing; she had been looking over their heads. She felt that this could not swim. He.', 3.00, 3, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(34, 'It was the fan she was saying, and the reason of that?\' \'In my youth,\' said the King: \'leave out.', 4.00, 8, 6, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(35, 'And I declare it\'s too bad, that it is!\' \'Why should it?\' muttered the Hatter. \'Does YOUR watch.', 1.00, 3, 38, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(36, 'Alice. \'Then you shouldn\'t talk,\' said the Caterpillar angrily, rearing itself upright as it.', 4.00, 3, 22, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(37, 'Alice crouched down among the leaves, which she had never been in a trembling voice to its.', 5.00, 8, 34, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(38, 'Dodo, a Lory and an Eaglet, and several other curious creatures. Alice led the way, and the other.', 4.00, 7, 38, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(39, 'Rabbit came near her, she began, in a game of croquet she was exactly three inches high). \'But I\'m.', 1.00, 7, 16, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(40, 'Even the Duchess sneezed occasionally; and as the Caterpillar called after her. \'I\'ve something.', 3.00, 3, 5, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(41, 'Pigeon; \'but if you\'ve seen them at last, and managed to swallow a morsel of the mushroom, and.', 5.00, 8, 7, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(42, 'Caterpillar, just as she couldn\'t answer either question, it didn\'t much matter which way she put.', 4.00, 7, 27, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(43, 'Alice, (she had grown in the sea. The master was an old Turtle--we used to it!\' pleaded poor.', 3.00, 8, 27, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(44, 'Soup, so rich and green, Waiting in a sorrowful tone, \'I\'m afraid I\'ve offended it again!\' For the.', 1.00, 7, 22, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(45, 'Alice; \'living at the other queer noises, would change to dull reality--the grass would be quite.', 4.00, 5, 34, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(46, 'WAS a narrow escape!\' said Alice, (she had grown to her that she still held the pieces of mushroom.', 2.00, 5, 37, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(47, 'Alice had been (Before she had never left off sneezing by this time?\' she said these words her.', 3.00, 8, 13, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(48, 'So she was now only ten inches high, and she soon made out that it might injure the brain; But.', 4.00, 5, 10, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(49, 'Hatter, who turned pale and fidgeted. \'Give your evidence,\' said the Caterpillar. \'Well, I\'ve.', 1.00, 7, 39, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(50, 'Alice replied in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an unusually large.', 4.00, 8, 36, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(51, 'I begin, please your Majesty,\' the Hatter was the BEST butter,\' the March Hare. \'It was a little.', 4.00, 7, 33, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(52, 'Alice, quite forgetting in the pool of tears which she found to be executed for having missed.', 3.00, 3, 14, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(53, 'The Knave did so, and were quite dry again, the Dodo replied very gravely. \'What else had you to.', 4.00, 8, 25, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(54, 'Alice. \'Of course it is,\' said the King, \'or I\'ll have you got in as well,\' the Hatter asked.', 4.00, 8, 8, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(55, 'Soup,\" will you, won\'t you, will you join the dance. Would not, could not, would not join the.', 4.00, 5, 33, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(56, 'I sleep\" is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must have a prize.', 3.00, 8, 13, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(57, 'In a little nervous about this; \'for it might injure the brain; But, now that I\'m perfectly sure I.', 4.00, 3, 37, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(58, 'However, on the bank--the birds with draggled feathers, the animals with their hands and feet at.', 3.00, 3, 14, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(59, 'But she waited patiently. \'Once,\' said the Gryphon. \'I mean, what makes them so often, you know.\'.', 5.00, 5, 32, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(60, 'Alice rather unwillingly took the hookah out of the window, and some \'unimportant.\' Alice could.', 3.00, 3, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(61, 'Alice. \'What IS the same age as herself, to see if she were saying lessons, and began picking them.', 1.00, 3, 29, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(62, 'Dormouse followed him: the March Hare had just begun to repeat it, but her voice sounded hoarse.', 4.00, 8, 10, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(63, 'Gryphon in an offended tone, \'Hm! No accounting for tastes! Sing her \"Turtle Soup,\" will you.', 3.00, 8, 27, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(64, 'Alice could think of anything to say, she simply bowed, and took the cauldron of soup off the.', 3.00, 5, 32, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(65, 'King. \'Shan\'t,\' said the youth, \'as I mentioned before, And have grown most uncommonly fat; Yet.', 4.00, 7, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(66, 'And she opened it, and fortunately was just beginning to get into her head. Still she went on.', 3.00, 3, 20, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(67, 'King. \'Shan\'t,\' said the Rabbit\'s little white kid gloves in one hand and a scroll of parchment in.', 1.00, 7, 10, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(68, 'Mock Turtle: \'crumbs would all come wrong, and she at once crowded round her, calling out in a.', 2.00, 7, 25, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(69, 'Alice in a very decided tone: \'tell her something worth hearing. For some minutes it seemed quite.', 2.00, 3, 30, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(70, 'CAN all that stuff,\' the Mock Turtle, and to hear his history. I must be growing small again.\' She.', 4.00, 5, 39, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(71, 'So you see, as well go in at the mushroom (she had grown so large in the distance. \'And yet what a.', 4.00, 8, 11, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(72, 'Mock Turtle sighed deeply, and began, in rather a complaining tone, \'and they drew all manner of.', 3.00, 3, 24, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(73, 'Why, I wouldn\'t say anything about it, even if my head would go anywhere without a moment\'s delay.', 5.00, 7, 38, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(74, 'The Dormouse shook its head impatiently, and said, \'It WAS a curious appearance in the trial.', 2.00, 7, 33, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(75, 'Mouse, who was a real Turtle.\' These words were followed by a very difficult game indeed. The.', 5.00, 5, 36, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(76, 'Will you, won\'t you, won\'t you, will you, won\'t you, will you, won\'t you, will you, won\'t you.', 5.00, 3, 8, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(77, 'Alice thought to herself. \'I dare say you never to lose YOUR temper!\' \'Hold your tongue, Ma!\' said.', 2.00, 7, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(78, 'This was quite tired and out of his shrill little voice, the name of nearly everything there.', 4.00, 3, 32, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(79, 'King, who had been of late much accustomed to usurpation and conquest. Edwin and Morcar, the earls.', 4.00, 7, 27, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(80, 'Long Tale They were just beginning to get very tired of being all alone here!\' As she said to.', 5.00, 5, 26, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(81, 'I\'ll go round and get ready for your interesting story,\' but she knew that were of the song. \'What.', 2.00, 5, 25, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(82, 'The Rabbit Sends in a low voice, to the three were all writing very busily on slates. \'What are.', 1.00, 3, 4, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(83, 'HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was THAT like?\' said Alice. \'Then.', 5.00, 8, 39, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(84, 'And then, turning to Alice an excellent opportunity for croqueting one of them hit her in a hot.', 2.00, 7, 33, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(85, 'CHAPTER II. The Pool of Tears \'Curiouser and curiouser!\' cried Alice hastily, afraid that she let.', 4.00, 3, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(86, 'PROVES his guilt,\' said the Mouse, getting up and went by without noticing her. Then followed the.', 2.00, 5, 15, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(87, 'Where CAN I have done that, you know,\' said Alice aloud, addressing nobody in particular. \'She\'d.', 4.00, 8, 26, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(88, 'I think I may as well be at school at once.\' And in she went. Once more she found a little.', 4.00, 8, 39, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(89, 'Alice did not wish to offend the Dormouse went on, looking anxiously about her. \'Oh, do let me.', 1.00, 7, 11, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(90, 'No, no! You\'re a serpent; and there\'s no use denying it. I suppose I ought to be sure; but I shall.', 3.00, 7, 19, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(91, 'Alice thought to herself, and began singing in its hurry to change the subject,\' the March Hare.', 2.00, 5, 38, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(92, 'Alice. \'I\'m a--I\'m a--\' \'Well! WHAT are you?\' And then a voice outside, and stopped to listen. The.', 5.00, 7, 5, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(93, 'He was an immense length of neck, which seemed to be rude, so she took courage, and went on.', 5.00, 5, 6, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(94, 'Bill! I wouldn\'t say anything about it, you know.\' \'Not the same size for going through the.', 1.00, 7, 36, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(95, 'Alice said; \'there\'s a large flower-pot that stood near the looking-glass. There was no use in the.', 5.00, 3, 9, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(96, 'CAN all that stuff,\' the Mock Turtle, who looked at each other for some minutes. The Caterpillar.', 5.00, 7, 37, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(97, 'Alice was silent. The King laid his hand upon her knee, and the moon, and memory, and.', 1.00, 5, 5, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(98, 'The Hatter was the only one who had spoken first. \'That\'s none of YOUR adventures.\' \'I could tell.', 4.00, 8, 21, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(99, 'Hatter, it woke up again as quickly as she had caught the baby at her for a rabbit! I suppose I.', 5.00, 8, 16, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(100, 'Dormouse,\' the Queen said to herself, \'Why, they\'re only a mouse that had made the whole pack of.', 1.00, 5, 5, '2022-03-21 18:46:58', '2022-03-21 18:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `faq_category_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Quasi minima debitis eos quia. Ullam atque a sunt eius. Unde sed qui in molestiae aliquid expedita.\"}', '{\"en\":\"Puss,\' she began, rather timidly, saying to her feet, for it to annoy, Because he knows it teases.\' CHORUS. (In which the March Hare will be When they take us up and down in an offended tone, and.\"}', 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(2, '{\"en\":\"Illum dolores numquam at eaque sequi ut esse. Et ut dolorum odio officiis esse saepe dolor non.\"}', '{\"en\":\"Hatter: and in a hurry to change the subject. \'Go on with the dream of Wonderland of long ago: and how she would manage it. \'They were obliged to have him with them,\' the Mock Turtle in the sea.\"}', 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(3, '{\"en\":\"Et nostrum enim delectus est. In hic alias iusto praesentium qui quae aut dolorem.\"}', '{\"en\":\"MUST remember,\' remarked the King, and the two sides of it, and they went up to the door, she found this a very difficult game indeed. The players all played at once in her life; it was perfectly.\"}', 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(4, '{\"en\":\"Sit ducimus quis tempora. Distinctio et illo officia corrupti libero consequatur id.\"}', '{\"en\":\"Alice, seriously, \'I\'ll have nothing more happened, she decided to remain where she was, and waited. When the procession moved on, three of the doors of the cupboards as she ran; but the Dormouse.\"}', 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(5, '{\"en\":\"Est iusto eum labore molestiae impedit vero minus debitis. Et quia quia dolor id.\"}', '{\"en\":\"He was an uncomfortably sharp chin. However, she soon made out that part.\' \'Well, at any rate, there\'s no harm in trying.\' So she began shrinking directly. As soon as she was small enough to get dry.\"}', 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(6, '{\"en\":\"Repellat veniam deserunt inventore hic. Recusandae blanditiis non dolores sint maxime quia est.\"}', '{\"en\":\"He looked at Alice, as she leant against a buttercup to rest herself, and shouted out, \'You\'d better not talk!\' said Five. \'I heard the Queen\'s shrill cries to the fifth bend, I think?\' \'I had NOT!\'.\"}', 4, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(7, '{\"en\":\"Consectetur sunt aut ipsa nisi. Voluptates est quae ut ut optio. In quasi iste voluptatem.\"}', '{\"en\":\"March Hare. \'Yes, please do!\' but the three gardeners instantly threw themselves flat upon their faces, and the baby--the fire-irons came first; then followed a shower of little Alice herself, and.\"}', 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(8, '{\"en\":\"Quos debitis ut sed perferendis. Nostrum sit illo et nemo magni ipsa rerum ut.\"}', '{\"en\":\"Quick, now!\' And Alice was not a mile high,\' said Alice. \'Call it what you would have appeared to them to sell,\' the Hatter asked triumphantly. Alice did not quite like the Mock Turtle. \'Certainly.\"}', 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(9, '{\"en\":\"Et vel et in veniam consequatur. Dolor et et qui quas. Est error tenetur placeat vel.\"}', '{\"en\":\"CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, with a teacup in one hand and a great hurry, muttering to itself \'Then I\'ll go round a deal too far off to other parts of the reeds--the rattling.\"}', 4, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(10, '{\"en\":\"Tempora debitis vero beatae dolorem. Dolores aut sit ad laudantium mollitia.\"}', '{\"en\":\"How puzzling all these strange Adventures of hers that you couldn\'t cut off a bit hurt, and she tried to fancy what the flame of a muchness?\' \'Really, now you ask me,\' said Alice, \'how am I to do.\"}', 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(11, '{\"en\":\"Aut id rerum veritatis qui quis. Ea doloremque dolore unde atque libero.\"}', '{\"en\":\"Then it got down off the fire, stirring a large caterpillar, that was said, and went to the Queen, who was trembling down to her usual height. It was so much already, that it might belong to one of.\"}', 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(12, '{\"en\":\"Harum et iure sed suscipit ut. Tempora repellat illo nam harum quo.\"}', '{\"en\":\"Alice went on, \'and most of \'em do.\' \'I don\'t believe it,\' said the Knave, \'I didn\'t know how to set about it; and while she was trying to put it right; \'not that it was very deep, or she fell very.\"}', 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(13, '{\"en\":\"Quo eius et doloremque quaerat. Voluptas tenetur impedit veniam nesciunt perferendis et.\"}', '{\"en\":\"Alice said very politely, feeling quite pleased to have lessons to learn! Oh, I shouldn\'t want YOURS: I don\'t want to see that she was losing her temper. \'Are you content now?\' said the Duchess.\"}', 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(14, '{\"en\":\"Saepe deleniti qui sunt doloribus nihil. Ut placeat iusto non placeat ut illo culpa.\"}', '{\"en\":\"Alice whispered, \'that it\'s done by everybody minding their own business,\' the Duchess was VERY ugly; and secondly, because they\'re making such VERY short remarks, and she dropped it hastily, just.\"}', 4, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(15, '{\"en\":\"Ut iure sequi autem. Autem omnis esse magnam aliquid. Numquam iure esse repellat fuga.\"}', '{\"en\":\"White Rabbit; \'in fact, there\'s nothing written on the trumpet, and then nodded. \'It\'s no business of MINE.\' The Queen turned crimson with fury, and, after glaring at her own ears for having missed.\"}', 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(16, '{\"en\":\"Ut necessitatibus optio omnis sunt. Laborum voluptatibus labore sunt impedit sit consequatur ad.\"}', '{\"en\":\"Do you think you might like to go down--Here, Bill! the master says you\'re to go near the looking-glass. There was a little timidly: \'but it\'s no use now,\' thought Alice, and, after waiting till she.\"}', 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(17, '{\"en\":\"Ratione ad et est. Corporis veniam dolore amet qui temporibus. Perferendis qui hic in voluptas.\"}', '{\"en\":\"Let me see--how IS it to be executed for having cheated herself in a very humble tone, going down on one knee. \'I\'m a poor man, your Majesty,\' said the White Rabbit put on his slate with one foot.\"}', 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(18, '{\"en\":\"Exercitationem rerum amet molestiae aperiam aliquid. Est quam consequatur accusantium.\"}', '{\"en\":\"Alice as it was quite impossible to say \'I once tasted--\' but checked herself hastily. \'I don\'t know what to do next, when suddenly a White Rabbit blew three blasts on the ground near the house till.\"}', 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(19, '{\"en\":\"Aliquam et sed blanditiis enim deserunt consectetur quia dolor. Illo libero vitae aspernatur ut.\"}', '{\"en\":\"Queen put on his spectacles. \'Where shall I begin, please your Majesty,\' said the Cat, and vanished again. Alice waited till she had grown to her ear, and whispered \'She\'s under sentence of.\"}', 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(20, '{\"en\":\"Voluptatem ipsum dolor vel placeat. Modi consequatur nam aut aut.\"}', '{\"en\":\"Gryphon. \'It all came different!\' Alice replied in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an unusually large saucepan flew close by her. There was a large pool all round the.\"}', 4, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(21, '{\"en\":\"Magnam consequuntur ipsum et dolor. Est est assumenda impedit.\"}', '{\"en\":\"Mock Turtle repeated thoughtfully. \'I should like to try the first question, you know.\' \'And what are they made of?\' \'Pepper, mostly,\' said the Caterpillar. \'Well, perhaps you haven\'t found it very.\"}', 4, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(22, '{\"en\":\"Eaque et officiis ut corporis maxime consequatur illum. Et aut est voluptas et quibusdam sed.\"}', '{\"en\":\"It was as much right,\' said the King, \'that only makes the matter on, What would become of you? I gave her one, they gave him two, You gave us three or more; They all sat down at them, and then they.\"}', 4, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(23, '{\"en\":\"Nobis beatae quia neque dolorem veritatis. Sapiente sed est consequatur impedit.\"}', '{\"en\":\"PRECIOUS nose\'; as an unusually large saucepan flew close by her. There was exactly three inches high). \'But I\'m not myself, you see.\' \'I don\'t much care where--\' said Alice. \'Exactly so,\' said the.\"}', 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(24, '{\"en\":\"Consequatur ducimus veniam et sed ratione qui nam. Delectus at est magnam nostrum qui quibusdam.\"}', '{\"en\":\"She felt that she tipped over the verses the White Rabbit hurried by--the frightened Mouse splashed his way through the doorway; \'and even if my head would go through,\' thought poor Alice, that she.\"}', 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(25, '{\"en\":\"Voluptas aut eius amet animi qui nesciunt quis. Voluptate temporibus dignissimos minima quaerat.\"}', '{\"en\":\"Because he knows it teases.\' CHORUS. (In which the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said the King. \'Shan\'t,\' said the King, \'that saves a world of trouble.\"}', 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(26, '{\"en\":\"Consequatur accusamus ullam necessitatibus et deserunt assumenda. Quaerat modi numquam aut.\"}', '{\"en\":\"Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never could abide figures!\' And with that she began fancying the sort of thing never happened, and now here I am so VERY much out.\"}', 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(27, '{\"en\":\"Quidem consequatur exercitationem autem aut soluta. Voluptas aliquid dolor enim qui.\"}', '{\"en\":\"Duchess replied, in a bit.\' \'Perhaps it hasn\'t one,\' Alice ventured to say. \'What is it?\' \'Why,\' said the Duck. \'Found IT,\' the Mouse was swimming away from him, and said anxiously to herself, as.\"}', 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(28, '{\"en\":\"Distinctio aut nostrum quis neque necessitatibus ut. Quo rerum rerum fugiat vero eaque.\"}', '{\"en\":\"Alice felt a little shriek, and went on growing, and, as a lark, And will talk in contemptuous tones of her childhood: and how she would get up and straightening itself out again, and all would.\"}', 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(29, '{\"en\":\"Sequi aliquid id ut. Eum dolores fugit a et sint error.\"}', '{\"en\":\"Hatter, \'I cut some more of the window, I only wish it was,\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right, so far,\' thought Alice, \'as all the time he had to.\"}', 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(30, '{\"en\":\"Soluta et repellat natus officiis. Et suscipit molestiae culpa id velit iusto iusto.\"}', '{\"en\":\"Alice had never before seen a good many little girls of her head made her draw back in a minute or two. \'They couldn\'t have wanted it much,\' said Alice, who felt ready to make it stop. \'Well, I\'d.\"}', 4, '2022-03-21 18:46:58', '2022-03-21 18:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Service\"}', '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(2, '{\"en\":\"Service\"}', '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(3, '{\"en\":\"Service\"}', '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(4, '{\"en\":\"Service\"}', '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(5, '{\"en\":\"Service\"}', '2022-03-21 18:46:57', '2022-03-21 18:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorite_options`
--

CREATE TABLE `favorite_options` (
  `option_id` int(10) UNSIGNED NOT NULL,
  `favorite_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `description`, `e_provider_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Corrupti quos et unde amet non consequatur.\"}', 8, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(2, '{\"en\":\"Corrupti iusto sunt explicabo soluta.\"}', 10, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(3, '{\"en\":\"Odio odit illo et id.\"}', 4, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(4, '{\"en\":\"In iste sunt sint et recusandae consequatur.\"}', 5, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(5, '{\"en\":\"Quos officiis soluta molestias optio.\"}', 14, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(6, '{\"en\":\"Aliquam ex illum accusamus qui sit nostrum et sit.\"}', 9, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(7, '{\"en\":\"Illum dolor ab unde deleniti enim rem.\"}', 4, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(8, '{\"en\":\"Et atque perspiciatis vel dolores recusandae et.\"}', 14, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(9, '{\"en\":\"Ipsam accusamus ut quia ea molestiae molestiae.\"}', 2, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(10, '{\"en\":\"Ut corporis sit et deserunt doloremque officia est qui.\"}', 5, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(11, '{\"en\":\"Sint velit aut nostrum ut consequatur quia et.\"}', 2, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(12, '{\"en\":\"Numquam quaerat aut aliquid et ut.\"}', 12, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(13, '{\"en\":\"Commodi consequatur quos veniam dolor tenetur.\"}', 6, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(14, '{\"en\":\"Sapiente nobis voluptate alias est.\"}', 15, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(15, '{\"en\":\"Non nam quae consequatur mollitia eos consectetur saepe doloremque.\"}', 9, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(16, '{\"en\":\"Veritatis ipsam fuga voluptatem iure.\"}', 3, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(17, '{\"en\":\"Sint cumque earum fugiat at aut deleniti magnam.\"}', 14, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(18, '{\"en\":\"Ea tenetur quis ut qui praesentium non magni.\"}', 8, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(19, '{\"en\":\"Est suscipit sed fugit sit.\"}', 5, '2022-03-21 18:46:57', '2022-03-21 18:46:57'),
(20, '{\"en\":\"Exercitationem qui dolor et deleniti et.\"}', 11, '2022-03-21 18:46:57', '2022-03-21 18:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\PaymentMethod', 2, 'logo', 'razorpay', 'razorpay.png', 'image/png', 'public', 13026, '[]', '{\"uuid\":\"13e62475-6b5f-4812-b484-2b94cc52b715\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 3, '2021-05-07 22:03:38', '2021-05-07 22:03:38'),
(5, 'App\\Models\\PaymentMethod', 5, 'logo', 'paypal', 'paypal.png', 'image/png', 'public', 15819, '[]', '{\"uuid\":\"2b8bd9b8-5c37-4464-a5c7-623496d7655f\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 5, '2021-05-07 22:03:49', '2021-05-07 22:03:49'),
(7, 'App\\Models\\PaymentMethod', 6, 'logo', 'pay_pickup', 'pay_pickup.png', 'image/png', 'public', 11712, '[]', '{\"uuid\":\"5e06e7ca-ac33-413c-9ab0-6fd4e3083cc1\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 7, '2021-05-07 22:03:58', '2021-05-07 22:03:58'),
(9, 'App\\Models\\PaymentMethod', 7, 'logo', 'stripe-logo', 'stripe-logo.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd448a36-8a5e-4c85-8d6e-c356843429c8\",\"user_id\":8,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 9, '2021-05-07 22:04:23', '2021-05-07 22:04:23'),
(10, 'App\\Models\\PaymentMethod', 9, 'logo', 'flutterwave', 'flutterwave.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a96-8a5e-4a85-8d6e-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 10, '2021-05-07 22:04:23', '2021-05-07 22:04:23'),
(11, 'App\\Models\\PaymentMethod', 8, 'logo', 'paystack', 'paystack.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd448a96-8a5e-4c85-8d6e-c356648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 11, '2021-05-07 22:04:23', '2021-05-07 22:04:23'),
(12, 'App\\Models\\PaymentMethod', 10, 'logo', 'fpx', 'fpx.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a84-8a5e-4b85-8d6f-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 12, '2021-05-07 22:04:23', '2021-05-07 22:04:23'),
(13, 'App\\Models\\PaymentMethod', 11, 'logo', 'wallet', 'wallet.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a84-8a5e-4b85-8d6f-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 12, '2021-05-07 22:04:23', '2021-05-07 22:04:23'),
(14, 'App\\Models\\PaymentMethod', 12, 'logo', 'paymongo', 'paymongo.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a84-8a5e-4b85-8d6f-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 12, '2021-05-07 22:04:23', '2021-05-07 22:04:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_26_175145_create_permission_tables', 1),
(4, '2018_06_12_140344_create_media_table', 1),
(5, '2018_06_13_035117_create_uploads_table', 1),
(6, '2018_07_17_180731_create_settings_table', 1),
(7, '2018_07_24_211308_create_custom_fields_table', 1),
(8, '2018_07_24_211327_create_custom_field_values_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_08_29_213829_create_faq_categories_table', 1),
(11, '2019_08_29_213926_create_faqs_table', 1),
(12, '2019_10_22_144652_create_currencies_table', 1),
(13, '2021_01_07_162658_create_payment_methods_table', 1),
(14, '2021_01_07_164755_create_payment_statuses_table', 1),
(15, '2021_01_07_165422_create_payments_table', 1),
(16, '2021_01_13_105605_create_e_provider_types_table', 1),
(17, '2021_01_13_111155_create_e_providers_table', 1),
(18, '2021_01_13_111622_create_experiences_table', 1),
(19, '2021_01_13_111730_create_awards_table', 1),
(20, '2021_01_13_114302_create_taxes_table', 1),
(21, '2021_01_13_200249_create_addresses_table', 1),
(22, '2021_01_15_115239_create_e_provider_addresses_table', 1),
(23, '2021_01_15_115747_create_e_provider_users_table', 1),
(24, '2021_01_15_115850_create_e_provider_taxes_table', 1),
(25, '2021_01_16_160838_create_availability_hours_table', 1),
(26, '2021_01_19_135951_create_e_services_table', 1),
(27, '2021_01_19_140427_create_categories_table', 1),
(28, '2021_01_19_171553_create_e_service_categories_table', 1),
(29, '2021_01_22_194514_create_option_groups_table', 1),
(30, '2021_01_22_200807_create_options_table', 1),
(31, '2021_01_22_205819_create_favorites_table', 1),
(32, '2021_01_22_205944_create_favorite_options_table', 1),
(33, '2021_01_23_125641_create_e_service_reviews_table', 1),
(34, '2021_01_23_201533_create_galleries_table', 1),
(35, '2021_01_25_105421_create_slides_table', 1),
(36, '2021_01_25_162055_create_notifications_table', 1),
(37, '2021_01_25_170522_create_coupons_table', 1),
(38, '2021_01_25_170529_create_discountables_table', 1),
(39, '2021_01_25_191833_create_booking_statuses_table', 1),
(40, '2021_01_25_212252_create_bookings_table', 1),
(41, '2021_01_30_111717_create_e_provider_payouts_table', 1),
(42, '2021_01_30_135356_create_earnings_table', 1),
(43, '2021_02_24_102838_create_custom_pages_table', 1),
(44, '2021_06_26_110636_create_json_extract_function', 1),
(45, '2021_08_08_134136_create_wallets_table', 1),
(46, '2021_08_08_155732_create_wallet_transactions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 6),
(4, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 5),
(4, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 8),
(4, 'App\\Models\\User', 9),
(4, 'App\\Models\\User', 10),
(4, 'App\\Models\\User', 11),
(4, 'App\\Models\\User', 12),
(4, 'App\\Models\\User', 13),
(4, 'App\\Models\\User', 14),
(4, 'App\\Models\\User', 15),
(4, 'App\\Models\\User', 16);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `option_group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `description`, `price`, `e_service_id`, `option_group_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"20m\"}', '{\"en\":\"Ducimus et exercitationem unde voluptates.\"}', 31.51, 26, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(2, '{\"en\":\"40m\"}', '{\"en\":\"Optio tempore sed autem beatae.\"}', 38.74, 14, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(3, '{\"en\":\"10m²\"}', '{\"en\":\"Nam voluptatum rerum reprehenderit.\"}', 28.99, 38, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(4, '{\"en\":\"30m²\"}', '{\"en\":\"Dolorem libero omnis aliquam deleniti.\"}', 40.02, 38, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(5, '{\"en\":\"20m\"}', '{\"en\":\"Aspernatur dicta voluptas sequi non.\"}', 15.58, 2, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(6, '{\"en\":\"30m²\"}', '{\"en\":\"Perferendis odit aut recusandae et.\"}', 33.82, 40, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(7, '{\"en\":\"10m²\"}', '{\"en\":\"Dolores enim sit consequatur numquam nihil.\"}', 40.64, 27, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(8, '{\"en\":\"40m\"}', '{\"en\":\"Suscipit iusto dolorum sapiente nobis.\"}', 14.62, 17, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(9, '{\"en\":\"10m²\"}', '{\"en\":\"Possimus aut consequatur distinctio animi.\"}', 23.51, 1, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(10, '{\"en\":\"30m²\"}', '{\"en\":\"Laboriosam voluptas mollitia et omnis.\"}', 36.46, 38, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(11, '{\"en\":\"30m²\"}', '{\"en\":\"Voluptas debitis voluptas maiores a.\"}', 13.23, 33, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(12, '{\"en\":\"10m²\"}', '{\"en\":\"Voluptate qui ducimus ipsum.\"}', 21.56, 4, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(13, '{\"en\":\"40m\"}', '{\"en\":\"Non qui delectus praesentium omnis.\"}', 44.72, 3, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(14, '{\"en\":\"30m²\"}', '{\"en\":\"Sunt non velit.\"}', 28.99, 18, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(15, '{\"en\":\"30m²\"}', '{\"en\":\"Nihil asperiores impedit est voluptas reprehenderit.\"}', 49.31, 9, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(16, '{\"en\":\"20m\"}', '{\"en\":\"Nulla qui dolore velit dolores.\"}', 28.76, 19, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(17, '{\"en\":\"40m\"}', '{\"en\":\"Est libero voluptates dolorem eveniet delectus.\"}', 19.08, 35, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(18, '{\"en\":\"10m²\"}', '{\"en\":\"Quidem ut rerum autem perspiciatis rerum.\"}', 25.17, 38, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(19, '{\"en\":\"30m²\"}', '{\"en\":\"Voluptates accusantium rerum odio assumenda fuga.\"}', 29.36, 26, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(20, '{\"en\":\"30m²\"}', '{\"en\":\"Et voluptas doloribus ex qui.\"}', 23.06, 17, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(21, '{\"en\":\"30m²\"}', '{\"en\":\"Nihil facilis ipsam molestiae quas.\"}', 28.13, 25, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(22, '{\"en\":\"20m\"}', '{\"en\":\"Est natus nulla porro velit.\"}', 18.32, 16, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(23, '{\"en\":\"40m\"}', '{\"en\":\"Voluptatibus voluptatem qui a modi qui.\"}', 35.32, 1, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(24, '{\"en\":\"40m\"}', '{\"en\":\"Voluptatum quasi harum et id.\"}', 14.47, 14, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(25, '{\"en\":\"40m\"}', '{\"en\":\"Qui doloribus corrupti dolorem.\"}', 15.47, 31, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(26, '{\"en\":\"40m\"}', '{\"en\":\"Repudiandae laboriosam magnam.\"}', 42.81, 22, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(27, '{\"en\":\"20m\"}', '{\"en\":\"Ullam quae praesentium laudantium consectetur.\"}', 46.81, 14, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(28, '{\"en\":\"30m²\"}', '{\"en\":\"Inventore assumenda voluptates necessitatibus autem.\"}', 14.18, 1, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(29, '{\"en\":\"10m²\"}', '{\"en\":\"Dicta doloribus repudiandae cum.\"}', 47.85, 31, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(30, '{\"en\":\"10m²\"}', '{\"en\":\"Et consequatur animi quia aut.\"}', 26.34, 11, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(31, '{\"en\":\"20m\"}', '{\"en\":\"Id ducimus blanditiis mollitia.\"}', 24.01, 30, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(32, '{\"en\":\"40m\"}', '{\"en\":\"Qui repellat ratione voluptatem odio qui.\"}', 15.00, 15, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(33, '{\"en\":\"40m\"}', '{\"en\":\"Laboriosam suscipit occaecati provident facilis.\"}', 36.75, 11, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(34, '{\"en\":\"10m²\"}', '{\"en\":\"Soluta sequi omnis et.\"}', 36.55, 39, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(35, '{\"en\":\"40m\"}', '{\"en\":\"Odit consequatur et unde molestiae.\"}', 20.03, 15, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(36, '{\"en\":\"10m²\"}', '{\"en\":\"Rem ipsa quis.\"}', 44.22, 38, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(37, '{\"en\":\"40m\"}', '{\"en\":\"Tempora earum beatae illum repellendus.\"}', 33.32, 20, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(38, '{\"en\":\"40m\"}', '{\"en\":\"Nihil veritatis porro rerum repellendus accusamus.\"}', 14.36, 31, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(39, '{\"en\":\"30m²\"}', '{\"en\":\"Esse qui nihil molestiae quis eveniet.\"}', 37.58, 23, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(40, '{\"en\":\"20m\"}', '{\"en\":\"Atque commodi aspernatur.\"}', 22.49, 37, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(41, '{\"en\":\"30m²\"}', '{\"en\":\"Quos sequi labore nam delectus praesentium.\"}', 39.09, 15, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(42, '{\"en\":\"20m\"}', '{\"en\":\"Accusamus saepe earum quis.\"}', 19.17, 20, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(43, '{\"en\":\"40m\"}', '{\"en\":\"Voluptatem ratione occaecati illum labore accusamus.\"}', 22.03, 37, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(44, '{\"en\":\"20m\"}', '{\"en\":\"Mollitia repudiandae nam repellat.\"}', 26.67, 30, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(45, '{\"en\":\"40m\"}', '{\"en\":\"Error libero amet veritatis.\"}', 19.82, 8, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(46, '{\"en\":\"10m²\"}', '{\"en\":\"Repellat eos tempora velit quia.\"}', 16.22, 9, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(47, '{\"en\":\"40m\"}', '{\"en\":\"Corrupti optio ullam.\"}', 13.87, 33, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(48, '{\"en\":\"30m²\"}', '{\"en\":\"Et id nesciunt quidem.\"}', 23.30, 39, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(49, '{\"en\":\"40m\"}', '{\"en\":\"Illum ut corrupti neque architecto neque.\"}', 19.78, 20, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(50, '{\"en\":\"40m\"}', '{\"en\":\"Totam et distinctio.\"}', 10.23, 25, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(51, '{\"en\":\"40m\"}', '{\"en\":\"Totam itaque quo occaecati et perspiciatis.\"}', 42.54, 6, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(52, '{\"en\":\"30m²\"}', '{\"en\":\"Et illum qui.\"}', 13.10, 4, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(53, '{\"en\":\"10m²\"}', '{\"en\":\"Nobis recusandae omnis itaque rerum saepe.\"}', 49.78, 33, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(54, '{\"en\":\"10m²\"}', '{\"en\":\"Enim quos quidem.\"}', 40.86, 32, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(55, '{\"en\":\"40m\"}', '{\"en\":\"Quia tenetur eius blanditiis.\"}', 12.30, 26, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(56, '{\"en\":\"30m²\"}', '{\"en\":\"Voluptates dicta ea atque.\"}', 35.67, 10, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(57, '{\"en\":\"10m²\"}', '{\"en\":\"Tenetur omnis assumenda.\"}', 45.96, 31, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(58, '{\"en\":\"30m²\"}', '{\"en\":\"A aut aliquid qui.\"}', 22.66, 10, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(59, '{\"en\":\"10m²\"}', '{\"en\":\"Perferendis perferendis vel sunt error consequatur.\"}', 14.52, 19, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(60, '{\"en\":\"30m²\"}', '{\"en\":\"Maiores ea distinctio et blanditiis nesciunt.\"}', 48.78, 14, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(61, '{\"en\":\"10m²\"}', '{\"en\":\"Perferendis ex ipsam quod.\"}', 28.51, 37, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(62, '{\"en\":\"20m\"}', '{\"en\":\"Architecto dolor omnis ea.\"}', 35.84, 29, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(63, '{\"en\":\"30m²\"}', '{\"en\":\"Omnis quia asperiores sed dolore ut.\"}', 21.41, 9, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(64, '{\"en\":\"30m²\"}', '{\"en\":\"Architecto adipisci reiciendis.\"}', 47.43, 37, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(65, '{\"en\":\"10m²\"}', '{\"en\":\"Occaecati dolores rem perferendis nisi.\"}', 43.54, 33, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(66, '{\"en\":\"40m\"}', '{\"en\":\"Temporibus quidem eveniet quo labore eos.\"}', 16.96, 31, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(67, '{\"en\":\"30m²\"}', '{\"en\":\"Adipisci iure quisquam aut est possimus.\"}', 19.49, 8, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(68, '{\"en\":\"30m²\"}', '{\"en\":\"Aliquid laboriosam tempore facilis illo.\"}', 41.06, 32, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(69, '{\"en\":\"10m²\"}', '{\"en\":\"Tempora ea veniam consequatur.\"}', 19.52, 24, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(70, '{\"en\":\"20m\"}', '{\"en\":\"Magnam voluptatibus aperiam provident ut.\"}', 44.78, 11, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(71, '{\"en\":\"40m\"}', '{\"en\":\"Iure rem voluptate autem.\"}', 33.43, 38, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(72, '{\"en\":\"20m\"}', '{\"en\":\"Sit voluptas labore esse.\"}', 34.74, 30, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(73, '{\"en\":\"30m²\"}', '{\"en\":\"Et rem sunt quod eos est.\"}', 29.14, 31, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(74, '{\"en\":\"20m\"}', '{\"en\":\"Vel qui eius harum doloremque fuga.\"}', 21.84, 2, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(75, '{\"en\":\"40m\"}', '{\"en\":\"Aut inventore itaque voluptas.\"}', 36.58, 38, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(76, '{\"en\":\"30m²\"}', '{\"en\":\"Et et pariatur veritatis.\"}', 11.60, 3, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(77, '{\"en\":\"20m\"}', '{\"en\":\"Vel architecto reprehenderit.\"}', 30.75, 40, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(78, '{\"en\":\"10m²\"}', '{\"en\":\"At commodi quia magnam.\"}', 24.62, 39, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(79, '{\"en\":\"20m\"}', '{\"en\":\"Aperiam id quae minus illum corrupti.\"}', 25.61, 25, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(80, '{\"en\":\"20m\"}', '{\"en\":\"Soluta quia voluptas eius dolor.\"}', 46.32, 36, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(81, '{\"en\":\"30m²\"}', '{\"en\":\"Harum eius ut dignissimos.\"}', 23.48, 40, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(82, '{\"en\":\"10m²\"}', '{\"en\":\"Sint aut occaecati et aut et.\"}', 48.21, 36, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(83, '{\"en\":\"20m\"}', '{\"en\":\"Voluptatem dicta deleniti aut alias.\"}', 44.33, 3, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(84, '{\"en\":\"10m²\"}', '{\"en\":\"Delectus quae voluptatem.\"}', 24.65, 3, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(85, '{\"en\":\"30m²\"}', '{\"en\":\"Et eum eum.\"}', 44.30, 21, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(86, '{\"en\":\"30m²\"}', '{\"en\":\"Culpa nesciunt deleniti non aperiam.\"}', 27.76, 13, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(87, '{\"en\":\"30m²\"}', '{\"en\":\"Ut veniam fuga ullam reprehenderit.\"}', 40.30, 8, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(88, '{\"en\":\"10m²\"}', '{\"en\":\"Molestiae ut veritatis ut impedit itaque.\"}', 42.98, 37, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(89, '{\"en\":\"20m\"}', '{\"en\":\"Rerum sunt et tenetur non.\"}', 19.64, 7, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(90, '{\"en\":\"20m\"}', '{\"en\":\"Ut architecto sed explicabo.\"}', 22.16, 27, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(91, '{\"en\":\"10m²\"}', '{\"en\":\"Aut incidunt quia delectus autem sit.\"}', 38.33, 39, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(92, '{\"en\":\"30m²\"}', '{\"en\":\"Et ipsa autem iste.\"}', 44.80, 26, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(93, '{\"en\":\"40m\"}', '{\"en\":\"Et laudantium dolorem.\"}', 20.92, 13, 3, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(94, '{\"en\":\"10m²\"}', '{\"en\":\"Dolores ipsam deserunt optio.\"}', 36.27, 10, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(95, '{\"en\":\"10m²\"}', '{\"en\":\"Est ex harum sit laborum.\"}', 30.07, 6, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(96, '{\"en\":\"40m\"}', '{\"en\":\"Totam eos eos iusto molestiae.\"}', 14.40, 3, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(97, '{\"en\":\"30m²\"}', '{\"en\":\"Repellat voluptas fuga veniam qui.\"}', 43.45, 2, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(98, '{\"en\":\"20m\"}', '{\"en\":\"Consequuntur officiis non provident velit et.\"}', 49.35, 2, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(99, '{\"en\":\"10m²\"}', '{\"en\":\"Commodi rem nobis voluptatibus optio.\"}', 44.18, 14, 2, '2022-03-21 18:46:58', '2022-03-21 18:46:58'),
(100, '{\"en\":\"30m²\"}', '{\"en\":\"Quae cumque dolor molestias minima.\"}', 21.81, 39, 1, '2022-03-21 18:46:58', '2022-03-21 18:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `option_groups`
--

CREATE TABLE `option_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_multiple` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `option_groups`
--

INSERT INTO `option_groups` (`id`, `name`, `allow_multiple`, `created_at`, `updated_at`) VALUES
(1, 'Size', 1, '2021-01-23 00:49:15', '2021-02-08 01:30:19'),
(2, 'Area', 1, '2021-01-23 01:46:28', '2021-01-23 01:46:28'),
(3, 'Surface', 0, '2021-01-23 01:46:47', '2021-01-23 01:46:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@demo.com', '$2y$10$rbNqEsQm7.D8IKUQYVUYyOTsEVBITtjnXvsD8cEgK3b8YY.8yYImO', '2022-03-23 10:36:13');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` int(10) UNSIGNED NOT NULL,
  `payment_status_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `description`, `route`, `order`, `default`, `enabled`, `created_at`, `updated_at`) VALUES
(2, 'RazorPay', 'Click to pay with RazorPay gateway', '/RazorPay', 2, 0, 1, '2021-01-17 19:33:49', '2021-02-18 03:37:30'),
(5, 'PayPal', 'Click to pay with your PayPal account', '/PayPal', 1, 0, 1, '2021-01-17 20:46:06', '2021-02-18 03:38:47'),
(6, 'Cash', 'Click to pay cash when finish', '/Cash', 3, 1, 1, '2021-02-18 03:38:42', '2021-02-18 03:38:42'),
(7, 'Credit Card (Stripe)', 'Click to pay with your Credit Card', '/Stripe', 3, 0, 1, '2021-02-18 03:38:42', '2021-02-18 03:38:42'),
(8, 'PayStack', 'Click to pay with PayStack gateway', '/PayStack', 5, 0, 1, '2021-07-24 02:38:42', '2021-07-24 02:38:42'),
(9, 'FlutterWave', 'Click to pay with FlutterWave gateway', '/FlutterWave', 6, 0, 1, '2021-07-24 02:38:42', '2021-07-24 02:38:42'),
(10, 'Malaysian Stripe FPX	', 'Click to pay with Stripe FPX gateway', '/StripeFPX', 7, 0, 1, '2021-07-25 02:38:42', '2021-07-25 02:38:42'),
(11, 'Wallet', 'Click to pay with Wallet', '/Wallet', 8, 0, 1, '2021-08-09 02:38:42', '2021-08-09 02:38:42'),
(12, 'PayMongo', 'Click to pay with PayMongo', '/PayMongo', 12, 0, 1, '2021-10-09 02:38:42', '2021-10-09 02:38:42');

-- --------------------------------------------------------

--
-- Table structure for table `payment_statuses`
--

CREATE TABLE `payment_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_statuses`
--

INSERT INTO `payment_statuses` (`id`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Pending', 1, '2021-01-17 20:28:28', '2021-02-18 02:55:15'),
(2, 'Paid', 10, '2021-01-12 04:19:49', '2021-02-18 02:55:53'),
(3, 'Failed', 20, '2021-01-17 19:05:04', '2021-02-18 02:56:32'),
(4, 'Refunded', 40, '2021-02-18 02:58:14', '2021-02-18 02:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'web', '2021-01-07 18:17:34', '2021-01-07 18:17:34'),
(2, 'medias.create', 'web', '2021-01-07 18:17:35', '2021-01-07 18:17:35'),
(3, 'users.profile', 'web', '2021-01-07 18:17:35', '2021-01-07 18:17:35'),
(4, 'users.index', 'web', '2021-01-07 18:17:35', '2021-01-07 18:17:35'),
(5, 'users.create', 'web', '2021-01-07 18:17:35', '2021-01-07 18:17:35'),
(6, 'users.store', 'web', '2021-01-07 18:17:35', '2021-01-07 18:17:35'),
(7, 'users.show', 'web', '2021-01-07 18:17:35', '2021-01-07 18:17:35'),
(8, 'users.edit', 'web', '2021-01-07 18:17:36', '2021-01-07 18:17:36'),
(9, 'users.update', 'web', '2021-01-07 18:17:36', '2021-01-07 18:17:36'),
(10, 'users.destroy', 'web', '2021-01-07 18:17:36', '2021-01-07 18:17:36'),
(11, 'medias.delete', 'web', '2021-01-07 18:17:36', '2021-01-07 18:17:36'),
(12, 'medias', 'web', '2021-01-07 18:17:36', '2021-01-07 18:17:36'),
(13, 'permissions.index', 'web', '2021-01-07 18:17:36', '2021-01-07 18:17:36'),
(14, 'permissions.create', 'web', '2021-01-07 18:17:36', '2021-01-07 18:17:36'),
(15, 'permissions.store', 'web', '2021-01-07 18:17:36', '2021-01-07 18:17:36'),
(16, 'permissions.show', 'web', '2021-01-07 18:17:37', '2021-01-07 18:17:37'),
(17, 'permissions.edit', 'web', '2021-01-07 18:17:37', '2021-01-07 18:17:37'),
(18, 'permissions.update', 'web', '2021-01-07 18:17:37', '2021-01-07 18:17:37'),
(19, 'permissions.destroy', 'web', '2021-01-07 18:17:37', '2021-01-07 18:17:37'),
(20, 'roles.index', 'web', '2021-01-07 18:17:37', '2021-01-07 18:17:37'),
(21, 'roles.create', 'web', '2021-01-07 18:17:37', '2021-01-07 18:17:37'),
(22, 'roles.store', 'web', '2021-01-07 18:17:37', '2021-01-07 18:17:37'),
(23, 'roles.show', 'web', '2021-01-07 18:17:38', '2021-01-07 18:17:38'),
(24, 'roles.edit', 'web', '2021-01-07 18:17:38', '2021-01-07 18:17:38'),
(25, 'roles.update', 'web', '2021-01-07 18:17:38', '2021-01-07 18:17:38'),
(26, 'roles.destroy', 'web', '2021-01-07 18:17:38', '2021-01-07 18:17:38'),
(27, 'customFields.index', 'web', '2021-01-07 18:17:38', '2021-01-07 18:17:38'),
(28, 'customFields.create', 'web', '2021-01-07 18:17:38', '2021-01-07 18:17:38'),
(29, 'customFields.store', 'web', '2021-01-07 18:17:38', '2021-01-07 18:17:38'),
(30, 'customFields.show', 'web', '2021-01-07 18:17:38', '2021-01-07 18:17:38'),
(31, 'customFields.edit', 'web', '2021-01-07 18:17:39', '2021-01-07 18:17:39'),
(32, 'customFields.update', 'web', '2021-01-07 18:17:39', '2021-01-07 18:17:39'),
(33, 'customFields.destroy', 'web', '2021-01-07 18:17:39', '2021-01-07 18:17:39'),
(34, 'currencies.index', 'web', '2021-01-07 18:17:39', '2021-01-07 18:17:39'),
(35, 'currencies.create', 'web', '2021-01-07 18:17:39', '2021-01-07 18:17:39'),
(36, 'currencies.store', 'web', '2021-01-07 18:17:39', '2021-01-07 18:17:39'),
(37, 'currencies.edit', 'web', '2021-01-07 18:17:39', '2021-01-07 18:17:39'),
(38, 'currencies.update', 'web', '2021-01-07 18:17:40', '2021-01-07 18:17:40'),
(39, 'currencies.destroy', 'web', '2021-01-07 18:17:40', '2021-01-07 18:17:40'),
(40, 'users.login-as-user', 'web', '2021-01-07 18:17:40', '2021-01-07 18:17:40'),
(41, 'app-settings', 'web', '2021-01-07 18:17:40', '2021-01-07 18:17:40'),
(42, 'faqCategories.index', 'web', '2021-01-07 18:17:40', '2021-01-07 18:17:40'),
(43, 'faqCategories.create', 'web', '2021-01-07 18:17:40', '2021-01-07 18:17:40'),
(44, 'faqCategories.store', 'web', '2021-01-07 18:17:40', '2021-01-07 18:17:40'),
(45, 'faqCategories.edit', 'web', '2021-01-07 18:17:41', '2021-01-07 18:17:41'),
(46, 'faqCategories.update', 'web', '2021-01-07 18:17:41', '2021-01-07 18:17:41'),
(47, 'faqCategories.destroy', 'web', '2021-01-07 18:17:41', '2021-01-07 18:17:41'),
(48, 'faqs.index', 'web', '2021-01-07 18:17:41', '2021-01-07 18:17:41'),
(49, 'faqs.create', 'web', '2021-01-07 18:17:41', '2021-01-07 18:17:41'),
(50, 'faqs.store', 'web', '2021-01-07 18:17:41', '2021-01-07 18:17:41'),
(51, 'faqs.edit', 'web', '2021-01-07 18:17:41', '2021-01-07 18:17:41'),
(52, 'faqs.update', 'web', '2021-01-07 18:17:42', '2021-01-07 18:17:42'),
(53, 'faqs.destroy', 'web', '2021-01-07 18:17:42', '2021-01-07 18:17:42'),
(54, 'payments.index', 'web', '2021-01-11 05:04:33', '2021-01-11 05:04:33'),
(55, 'payments.show', 'web', '2021-01-11 05:04:33', '2021-01-11 05:04:33'),
(56, 'payments.update', 'web', '2021-01-11 05:04:33', '2021-01-11 05:04:33'),
(57, 'paymentMethods.index', 'web', '2021-01-11 05:04:33', '2021-01-11 05:04:33'),
(58, 'paymentMethods.create', 'web', '2021-01-11 05:04:34', '2021-01-11 05:04:34'),
(59, 'paymentMethods.store', 'web', '2021-01-11 05:04:34', '2021-01-11 05:04:34'),
(60, 'paymentMethods.edit', 'web', '2021-01-11 05:04:34', '2021-01-11 05:04:34'),
(61, 'paymentMethods.update', 'web', '2021-01-11 05:04:34', '2021-01-11 05:04:34'),
(62, 'paymentMethods.destroy', 'web', '2021-01-11 05:04:34', '2021-01-11 05:04:34'),
(63, 'paymentStatuses.index', 'web', '2021-01-11 05:04:34', '2021-01-11 05:04:34'),
(64, 'paymentStatuses.create', 'web', '2021-01-11 05:04:34', '2021-01-11 05:04:34'),
(65, 'paymentStatuses.store', 'web', '2021-01-11 05:04:35', '2021-01-11 05:04:35'),
(66, 'paymentStatuses.edit', 'web', '2021-01-11 05:04:35', '2021-01-11 05:04:35'),
(67, 'paymentStatuses.update', 'web', '2021-01-11 05:04:35', '2021-01-11 05:04:35'),
(68, 'paymentStatuses.destroy', 'web', '2021-01-11 05:04:35', '2021-01-11 05:04:35'),
(69, 'verification.notice', 'web', '2021-01-12 15:19:50', '2021-01-12 15:19:50'),
(70, 'verification.verify', 'web', '2021-01-12 15:19:50', '2021-01-12 15:19:50'),
(71, 'verification.resend', 'web', '2021-01-12 15:19:51', '2021-01-12 15:19:51'),
(72, 'awards.index', 'web', '2021-01-12 15:19:51', '2021-01-12 15:19:51'),
(73, 'awards.create', 'web', '2021-01-12 15:19:52', '2021-01-12 15:19:52'),
(74, 'awards.store', 'web', '2021-01-12 15:19:52', '2021-01-12 15:19:52'),
(75, 'awards.show', 'web', '2021-01-12 15:19:52', '2021-01-12 15:19:52'),
(76, 'awards.edit', 'web', '2021-01-12 15:19:52', '2021-01-12 15:19:52'),
(77, 'awards.update', 'web', '2021-01-12 15:19:52', '2021-01-12 15:19:52'),
(78, 'awards.destroy', 'web', '2021-01-12 15:19:52', '2021-01-12 15:19:52'),
(79, 'experiences.index', 'web', '2021-01-12 16:20:29', '2021-01-12 16:20:29'),
(80, 'experiences.create', 'web', '2021-01-12 16:20:29', '2021-01-12 16:20:29'),
(81, 'experiences.store', 'web', '2021-01-12 16:20:30', '2021-01-12 16:20:30'),
(82, 'experiences.show', 'web', '2021-01-12 16:20:30', '2021-01-12 16:20:30'),
(83, 'experiences.edit', 'web', '2021-01-12 16:20:30', '2021-01-12 16:20:30'),
(84, 'experiences.update', 'web', '2021-01-12 16:20:30', '2021-01-12 16:20:30'),
(85, 'experiences.destroy', 'web', '2021-01-12 16:20:30', '2021-01-12 16:20:30'),
(92, 'eProviderTypes.index', 'web', '2021-01-13 16:31:08', '2021-01-13 16:31:08'),
(93, 'eProviderTypes.create', 'web', '2021-01-13 16:31:09', '2021-01-13 16:31:09'),
(94, 'eProviderTypes.store', 'web', '2021-01-13 16:31:09', '2021-01-13 16:31:09'),
(95, 'eProviderTypes.edit', 'web', '2021-01-13 16:31:09', '2021-01-13 16:31:09'),
(96, 'eProviderTypes.update', 'web', '2021-01-13 16:31:09', '2021-01-13 16:31:09'),
(97, 'eProviderTypes.destroy', 'web', '2021-01-13 16:31:09', '2021-01-13 16:31:09'),
(98, 'eProviders.index', 'web', '2021-01-13 16:48:55', '2021-01-13 16:48:55'),
(99, 'eProviders.create', 'web', '2021-01-13 16:48:56', '2021-01-13 16:48:56'),
(100, 'eProviders.store', 'web', '2021-01-13 16:48:56', '2021-01-13 16:48:56'),
(101, 'eProviders.edit', 'web', '2021-01-13 16:48:56', '2021-01-13 16:48:56'),
(102, 'eProviders.update', 'web', '2021-01-13 16:48:56', '2021-01-13 16:48:56'),
(103, 'eProviders.destroy', 'web', '2021-01-13 16:48:56', '2021-01-13 16:48:56'),
(104, 'addresses.index', 'web', '2021-01-13 16:48:56', '2021-01-13 16:48:56'),
(105, 'addresses.create', 'web', '2021-01-13 16:48:57', '2021-01-13 16:48:57'),
(106, 'addresses.store', 'web', '2021-01-13 16:48:57', '2021-01-13 16:48:57'),
(107, 'addresses.edit', 'web', '2021-01-13 16:48:57', '2021-01-13 16:48:57'),
(108, 'addresses.update', 'web', '2021-01-13 16:48:57', '2021-01-13 16:48:57'),
(109, 'addresses.destroy', 'web', '2021-01-13 16:48:57', '2021-01-13 16:48:57'),
(110, 'taxes.index', 'web', '2021-01-13 16:48:57', '2021-01-13 16:48:57'),
(111, 'taxes.create', 'web', '2021-01-13 16:48:57', '2021-01-13 16:48:57'),
(112, 'taxes.store', 'web', '2021-01-13 16:48:58', '2021-01-13 16:48:58'),
(113, 'taxes.edit', 'web', '2021-01-13 16:48:58', '2021-01-13 16:48:58'),
(114, 'taxes.update', 'web', '2021-01-13 16:48:58', '2021-01-13 16:48:58'),
(115, 'taxes.destroy', 'web', '2021-01-13 16:48:58', '2021-01-13 16:48:58'),
(116, 'availabilityHours.index', 'web', '2021-01-16 21:14:21', '2021-01-16 21:14:21'),
(117, 'availabilityHours.create', 'web', '2021-01-16 21:14:21', '2021-01-16 21:14:21'),
(118, 'availabilityHours.store', 'web', '2021-01-16 21:14:21', '2021-01-16 21:14:21'),
(119, 'availabilityHours.edit', 'web', '2021-01-16 21:14:21', '2021-01-16 21:14:21'),
(120, 'availabilityHours.update', 'web', '2021-01-16 21:14:22', '2021-01-16 21:14:22'),
(121, 'availabilityHours.destroy', 'web', '2021-01-16 21:14:22', '2021-01-16 21:14:22'),
(122, 'eServices.index', 'web', '2021-01-19 19:03:00', '2021-01-19 19:03:00'),
(123, 'eServices.create', 'web', '2021-01-19 19:03:00', '2021-01-19 19:03:00'),
(124, 'eServices.store', 'web', '2021-01-19 19:03:00', '2021-01-19 19:03:00'),
(126, 'eServices.edit', 'web', '2021-01-19 19:03:01', '2021-01-19 19:03:01'),
(127, 'eServices.update', 'web', '2021-01-19 19:03:01', '2021-01-19 19:03:01'),
(128, 'eServices.destroy', 'web', '2021-01-19 19:03:01', '2021-01-19 19:03:01'),
(129, 'categories.index', 'web', '2021-01-19 19:08:55', '2021-01-19 19:08:55'),
(130, 'categories.create', 'web', '2021-01-19 19:08:55', '2021-01-19 19:08:55'),
(131, 'categories.store', 'web', '2021-01-19 19:08:55', '2021-01-19 19:08:55'),
(132, 'categories.edit', 'web', '2021-01-19 19:08:55', '2021-01-19 19:08:55'),
(133, 'categories.update', 'web', '2021-01-19 19:08:56', '2021-01-19 19:08:56'),
(134, 'categories.destroy', 'web', '2021-01-19 19:08:56', '2021-01-19 19:08:56'),
(135, 'optionGroups.index', 'web', '2021-01-23 00:48:32', '2021-01-23 00:48:32'),
(136, 'optionGroups.create', 'web', '2021-01-23 00:48:32', '2021-01-23 00:48:32'),
(137, 'optionGroups.store', 'web', '2021-01-23 00:48:32', '2021-01-23 00:48:32'),
(138, 'optionGroups.edit', 'web', '2021-01-23 00:48:32', '2021-01-23 00:48:32'),
(139, 'optionGroups.update', 'web', '2021-01-23 00:48:32', '2021-01-23 00:48:32'),
(140, 'optionGroups.destroy', 'web', '2021-01-23 00:48:32', '2021-01-23 00:48:32'),
(141, 'options.index', 'web', '2021-01-23 01:10:51', '2021-01-23 01:10:51'),
(142, 'options.create', 'web', '2021-01-23 01:10:51', '2021-01-23 01:10:51'),
(143, 'options.store', 'web', '2021-01-23 01:10:52', '2021-01-23 01:10:52'),
(144, 'options.edit', 'web', '2021-01-23 01:10:52', '2021-01-23 01:10:52'),
(145, 'options.update', 'web', '2021-01-23 01:10:52', '2021-01-23 01:10:52'),
(146, 'options.destroy', 'web', '2021-01-23 01:10:52', '2021-01-23 01:10:52'),
(147, 'favorites.index', 'web', '2021-01-23 02:01:13', '2021-01-23 02:01:13'),
(148, 'favorites.create', 'web', '2021-01-23 02:01:13', '2021-01-23 02:01:13'),
(149, 'favorites.store', 'web', '2021-01-23 02:01:13', '2021-01-23 02:01:13'),
(150, 'favorites.edit', 'web', '2021-01-23 02:01:13', '2021-01-23 02:01:13'),
(151, 'favorites.update', 'web', '2021-01-23 02:01:13', '2021-01-23 02:01:13'),
(152, 'favorites.destroy', 'web', '2021-01-23 02:01:13', '2021-01-23 02:01:13'),
(153, 'eServiceReviews.index', 'web', '2021-01-24 00:42:57', '2021-01-24 00:42:57'),
(154, 'eServiceReviews.create', 'web', '2021-01-24 00:42:58', '2021-01-24 00:42:58'),
(155, 'eServiceReviews.store', 'web', '2021-01-24 00:42:58', '2021-01-24 00:42:58'),
(156, 'eServiceReviews.edit', 'web', '2021-01-24 00:42:58', '2021-01-24 00:42:58'),
(157, 'eServiceReviews.update', 'web', '2021-01-24 00:42:58', '2021-01-24 00:42:58'),
(158, 'eServiceReviews.destroy', 'web', '2021-01-24 00:42:58', '2021-01-24 00:42:58'),
(160, 'galleries.index', 'web', '2021-01-24 01:17:46', '2021-01-24 01:17:46'),
(161, 'galleries.create', 'web', '2021-01-24 01:17:47', '2021-01-24 01:17:47'),
(162, 'galleries.store', 'web', '2021-01-24 01:17:47', '2021-01-24 01:17:47'),
(163, 'galleries.edit', 'web', '2021-01-24 01:17:47', '2021-01-24 01:17:47'),
(164, 'galleries.update', 'web', '2021-01-24 01:17:47', '2021-01-24 01:17:47'),
(165, 'galleries.destroy', 'web', '2021-01-24 01:17:47', '2021-01-24 01:17:47'),
(166, 'requestedEProviders.index', 'web', '2021-01-25 14:53:17', '2021-01-25 14:53:17'),
(167, 'slides.index', 'web', '2021-01-25 16:01:20', '2021-01-25 16:01:20'),
(168, 'slides.create', 'web', '2021-01-25 16:01:20', '2021-01-25 16:01:20'),
(169, 'slides.store', 'web', '2021-01-25 16:01:20', '2021-01-25 16:01:20'),
(170, 'slides.edit', 'web', '2021-01-25 16:01:20', '2021-01-25 16:01:20'),
(171, 'slides.update', 'web', '2021-01-25 16:01:20', '2021-01-25 16:01:20'),
(172, 'slides.destroy', 'web', '2021-01-25 16:01:20', '2021-01-25 16:01:20'),
(173, 'notifications.index', 'web', '2021-01-25 20:42:33', '2021-01-25 20:42:33'),
(174, 'notifications.show', 'web', '2021-01-25 20:42:34', '2021-01-25 20:42:34'),
(175, 'notifications.destroy', 'web', '2021-01-25 20:42:34', '2021-01-25 20:42:34'),
(176, 'coupons.index', 'web', '2021-01-25 21:11:55', '2021-01-25 21:11:55'),
(177, 'coupons.create', 'web', '2021-01-25 21:11:55', '2021-01-25 21:11:55'),
(178, 'coupons.store', 'web', '2021-01-25 21:11:55', '2021-01-25 21:11:55'),
(179, 'coupons.edit', 'web', '2021-01-25 21:11:55', '2021-01-25 21:11:55'),
(180, 'coupons.update', 'web', '2021-01-25 21:11:55', '2021-01-25 21:11:55'),
(181, 'coupons.destroy', 'web', '2021-01-25 21:11:55', '2021-01-25 21:11:55'),
(182, 'bookingStatuses.index', 'web', '2021-01-26 00:21:01', '2021-01-26 00:21:01'),
(183, 'bookingStatuses.create', 'web', '2021-01-26 00:21:01', '2021-01-26 00:21:01'),
(184, 'bookingStatuses.store', 'web', '2021-01-26 00:21:01', '2021-01-26 00:21:01'),
(185, 'bookingStatuses.edit', 'web', '2021-01-26 00:21:01', '2021-01-26 00:21:01'),
(186, 'bookingStatuses.update', 'web', '2021-01-26 00:21:01', '2021-01-26 00:21:01'),
(187, 'bookingStatuses.destroy', 'web', '2021-01-26 00:21:01', '2021-01-26 00:21:01'),
(188, 'bookings.index', 'web', '2021-01-26 02:27:09', '2021-01-26 02:27:09'),
(189, 'bookings.create', 'web', '2021-01-26 02:27:09', '2021-01-26 02:27:09'),
(190, 'bookings.store', 'web', '2021-01-26 02:27:09', '2021-01-26 02:27:09'),
(191, 'bookings.show', 'web', '2021-01-26 02:27:09', '2021-01-26 02:27:09'),
(192, 'bookings.edit', 'web', '2021-01-26 02:27:09', '2021-01-26 02:27:09'),
(193, 'bookings.update', 'web', '2021-01-26 02:27:09', '2021-01-26 02:27:09'),
(194, 'bookings.destroy', 'web', '2021-01-26 02:27:09', '2021-01-26 02:27:09'),
(195, 'eProviderPayouts.index', 'web', '2021-01-30 16:23:08', '2021-01-30 16:23:08'),
(196, 'eProviderPayouts.create', 'web', '2021-01-30 16:23:08', '2021-01-30 16:23:08'),
(197, 'eProviderPayouts.store', 'web', '2021-01-30 16:23:08', '2021-01-30 16:23:08'),
(198, 'eProviderPayouts.destroy', 'web', '2021-01-30 16:23:09', '2021-01-30 16:23:09'),
(199, 'earnings.index', 'web', '2021-01-30 18:57:57', '2021-01-30 18:57:57'),
(200, 'earnings.create', 'web', '2021-01-30 18:57:57', '2021-01-30 18:57:57'),
(201, 'earnings.store', 'web', '2021-01-30 18:57:57', '2021-01-30 18:57:57'),
(202, 'earnings.destroy', 'web', '2021-01-30 18:57:57', '2021-01-30 18:57:57'),
(203, 'customPages.index', 'web', '2021-02-24 16:37:44', '2021-02-24 16:37:44'),
(204, 'customPages.create', 'web', '2021-02-24 16:37:44', '2021-02-24 16:37:44'),
(205, 'customPages.store', 'web', '2021-02-24 16:37:44', '2021-02-24 16:37:44'),
(206, 'customPages.show', 'web', '2021-02-24 16:37:44', '2021-02-24 16:37:44'),
(207, 'customPages.edit', 'web', '2021-02-24 16:37:44', '2021-02-24 16:37:44'),
(208, 'customPages.update', 'web', '2021-02-24 16:37:44', '2021-02-24 16:37:44'),
(209, 'customPages.destroy', 'web', '2021-02-24 16:37:44', '2021-02-24 16:37:44'),
(210, 'wallets.index', 'web', '2021-02-24 16:37:44', '2021-02-24 16:37:44'),
(211, 'wallets.create', 'web', '2021-02-24 16:37:44', '2021-02-24 16:37:44'),
(212, 'wallets.store', 'web', '2021-02-24 16:37:44', '2021-02-24 16:37:44'),
(213, 'wallets.update', 'web', '2021-02-24 16:37:44', '2021-02-24 16:37:44'),
(214, 'wallets.edit', 'web', '2021-02-24 16:37:44', '2021-02-24 16:37:44'),
(215, 'wallets.destroy', 'web', '2021-02-24 16:37:44', '2021-02-24 16:37:44'),
(216, 'walletTransactions.index', 'web', '2021-02-24 16:37:44', '2021-02-24 16:37:44'),
(217, 'walletTransactions.create', 'web', '2021-02-24 16:37:44', '2021-02-24 16:37:44'),
(218, 'walletTransactions.store', 'web', '2021-02-24 16:37:44', '2021-02-24 16:37:44');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `default` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `default`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'web', 0, NULL, NULL),
(3, 'provider', 'web', 0, NULL, NULL),
(4, 'customer', 'web', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(2, 3),
(2, 4),
(3, 2),
(3, 3),
(3, 4),
(4, 2),
(5, 2),
(6, 2),
(8, 2),
(9, 2),
(9, 3),
(9, 4),
(10, 2),
(11, 2),
(11, 3),
(11, 4),
(12, 2),
(12, 3),
(13, 2),
(16, 2),
(19, 2),
(20, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(42, 3),
(42, 4),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(48, 3),
(48, 4),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(54, 3),
(54, 4),
(57, 2),
(57, 3),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(66, 2),
(67, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(72, 3),
(73, 2),
(73, 3),
(74, 2),
(74, 3),
(75, 2),
(75, 3),
(76, 2),
(76, 3),
(77, 2),
(77, 3),
(78, 2),
(78, 3),
(79, 2),
(79, 3),
(80, 2),
(80, 3),
(81, 2),
(81, 3),
(82, 2),
(82, 3),
(83, 2),
(83, 3),
(84, 2),
(84, 3),
(85, 2),
(85, 3),
(92, 2),
(92, 3),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(98, 3),
(98, 4),
(99, 2),
(99, 3),
(99, 4),
(100, 2),
(100, 3),
(100, 4),
(101, 2),
(101, 3),
(102, 2),
(102, 3),
(103, 2),
(104, 2),
(104, 3),
(104, 4),
(105, 2),
(105, 3),
(105, 4),
(106, 2),
(106, 3),
(106, 4),
(107, 2),
(107, 3),
(107, 4),
(108, 2),
(108, 3),
(108, 4),
(109, 2),
(109, 3),
(109, 4),
(110, 2),
(111, 2),
(112, 2),
(113, 2),
(114, 2),
(115, 2),
(116, 2),
(116, 3),
(117, 2),
(117, 3),
(118, 2),
(118, 3),
(119, 2),
(119, 3),
(120, 2),
(120, 3),
(121, 2),
(121, 3),
(122, 2),
(122, 3),
(122, 4),
(123, 2),
(123, 3),
(124, 2),
(124, 3),
(126, 2),
(126, 3),
(127, 2),
(127, 3),
(128, 2),
(128, 3),
(129, 2),
(129, 3),
(129, 4),
(130, 2),
(131, 2),
(132, 2),
(133, 2),
(134, 2),
(135, 2),
(135, 3),
(136, 2),
(136, 3),
(137, 2),
(137, 3),
(138, 2),
(139, 2),
(140, 2),
(141, 2),
(141, 3),
(142, 2),
(142, 3),
(143, 2),
(143, 3),
(144, 2),
(144, 3),
(145, 2),
(145, 3),
(146, 2),
(146, 3),
(147, 2),
(147, 3),
(147, 4),
(148, 2),
(149, 2),
(149, 3),
(150, 2),
(151, 2),
(151, 3),
(152, 2),
(153, 2),
(153, 3),
(153, 4),
(156, 2),
(156, 3),
(156, 4),
(157, 2),
(157, 3),
(157, 4),
(158, 2),
(160, 2),
(160, 3),
(161, 2),
(161, 3),
(162, 2),
(162, 3),
(163, 2),
(163, 3),
(164, 2),
(164, 3),
(165, 2),
(165, 3),
(166, 2),
(166, 3),
(166, 4),
(167, 2),
(168, 2),
(169, 2),
(170, 2),
(171, 2),
(172, 2),
(173, 2),
(173, 3),
(173, 4),
(174, 2),
(175, 2),
(175, 3),
(175, 4),
(176, 2),
(176, 3),
(177, 2),
(178, 2),
(179, 2),
(179, 3),
(180, 2),
(180, 3),
(181, 2),
(182, 2),
(182, 3),
(185, 2),
(186, 2),
(188, 2),
(188, 3),
(188, 4),
(191, 2),
(191, 3),
(191, 4),
(192, 2),
(192, 3),
(193, 2),
(193, 3),
(194, 2),
(194, 3),
(195, 2),
(195, 3),
(196, 2),
(196, 3),
(197, 2),
(197, 3),
(199, 2),
(199, 3),
(200, 2),
(200, 3),
(203, 2),
(203, 3),
(203, 4),
(204, 2),
(205, 2),
(206, 2),
(207, 2),
(208, 2),
(209, 2),
(210, 2),
(210, 3),
(210, 4),
(211, 2),
(212, 2),
(213, 2),
(214, 2),
(215, 2),
(216, 2),
(216, 3),
(216, 4),
(217, 2),
(218, 2);

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wp_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perday_rate` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_of_shop` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin_point_location` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_created` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pending` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `name`, `logo`, `cover`, `user_id`, `username`, `email`, `phone`, `wp_number`, `perday_rate`, `address_of_shop`, `pin_point_location`, `shop_created`, `pending`, `created_at`, `updated_at`) VALUES
(7, 'maaz', 'srg', 'rfg', 1, 'sdrfgwsf', 'sdf', 'sff', 'gfhgh', 'gfh', 'fghfg', 'gfh', 'fgh', 'gfbh', '2022-05-07 09:41:56', '2022-05-07 09:41:56');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` int(10) UNSIGNED NOT NULL,
  `order` int(10) UNSIGNED DEFAULT 0,
  `text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_position` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'start',
  `text_color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indicator_color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_fit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'cover',
  `e_service_id` int(10) UNSIGNED DEFAULT NULL,
  `e_provider_id` int(10) UNSIGNED DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `order`, `text`, `button`, `text_position`, `text_color`, `button_color`, `background_color`, `indicator_color`, `image_fit`, `e_service_id`, `e_provider_id`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 1, 'Assign a Handyman at Work to Fix the Household', 'Discover It', 'bottom_start', '#333333', '#009E6A', '#FFFFFF', '#333333', 'cover', NULL, NULL, 1, '2021-01-25 16:51:45', '2021-01-31 16:08:13'),
(2, 2, 'Fix the Broken Stuff by Asking for the Technicians', 'Repair', 'bottom_start', '#333333', '#F4841F', '#FFFFFF', '#333333', 'cover', NULL, NULL, 1, '2021-01-25 19:23:49', '2021-01-31 16:03:05'),
(3, 3, 'Add Hands to Your Cleaning Chores', 'Book Now', 'bottom_start', '#333333', '#1FA3F4', '#FFFFFF', '#333333', 'cover', NULL, NULL, 1, '2021-01-31 16:04:36', '2021-01-31 16:06:45');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` double(10,2) NOT NULL DEFAULT 0.00,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Tax 20', 20.00, 'percent', '2021-01-15 16:12:13', '2021-02-02 02:23:01'),
(2, 'Tax 10', 10.00, 'percent', '2021-01-15 16:19:30', '2021-01-15 16:19:30'),
(3, 'Maintenance', 2.00, 'fixed', '2021-01-19 01:48:29', '2021-02-02 02:25:13'),
(4, 'Tools Fee', 5.00, 'fixed', '2021-02-02 02:24:12', '2021-02-02 02:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `paypal_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_number`, `phone_verified_at`, `email_verified_at`, `password`, `api_token`, `device_token`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `paypal_email`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hyatt Zimmerman', 'admin@demo.com', '+1 234 8996 321', '2021-01-10 22:22:10', '2021-01-10 22:22:10', '$2a$12$Al8GKZCR15egUKAJyN1MmOt2h5T2Y3jP9OMGOyVqHebcfrp/rHjRm', 'PivvPlsQWxPl1bB5KrbKNBuraJit0PrUZekQUgtLyTRuyBq921atFtoR1HuA', '', NULL, NULL, NULL, NULL, NULL, 'fU74kiNeDsPSli77nLRFboCEmUOuK57tpt9SGSczqnmlebqgOODfO8HXjYrb', NULL, '2021-02-09 21:50:32'),
(2, 'Jennifer Paul', 'provider@demo.com', '+1 234 8996 322', '2021-01-10 22:22:10', '2021-01-10 22:22:10', '$2y$10$YOn/Xq6vfvi9oaixrtW8QuM2W0mawkLLqIxL.IoGqrsqOqbIsfBNu', 'tVSfIKRSX2Yn8iAMoUS3HPls84ycS8NAxO2dj2HvePbbr4WHorp4gIFRmFwB', '', NULL, NULL, NULL, NULL, NULL, 'TwyKlf5NJ0oG6l5FfFhbCKsdRWrjF6HCunV8nZn2U9OXhJJTZ2Jxx4EqAJPA', NULL, '2021-02-28 22:06:55'),
(3, 'Germaine Guzman', 'customer@demo.com', '+1 234 8996 323', '2021-01-10 22:22:10', '2021-01-10 22:22:10', '$2y$10$EBubVy3wDbqNbHvMQwkj3OTYVitL8QnHvh/zV0ICVOaSbALy5dD0K', 'fXLu7VeYgXDu82SkMxlLPG1mCAXc4EBIx6O5isgYVIKFQiHah0xiOHmzNsBv', '', NULL, NULL, NULL, NULL, NULL, 'SPz6luq3aoxCbgIS1gqmFDgM1qzGlIDtF0HgmDbtWcx2reaeFcogcFQzdP2F', NULL, '2021-02-25 02:52:57'),
(4, 'Aimee Mcgee', 'provider1@demo.com', '+1 234 8996 324', '2021-01-10 22:22:10', '2021-01-10 22:22:10', '$2y$10$pmdnepS1FhZUMqOaFIFnNO0spltJpziz3j13UqyEwShmLhokmuoei', 'Czrsk9rwD0c75NUPkzNXM2WvbxYHKj8p0nG29pjKT0PZaTgMVzuVyv4hOlte', '', NULL, NULL, NULL, NULL, NULL, 'yCzPqDP1oczySU57q6G71SxTIJSiZUBE4vYdXbXCqzpzC2iN09igcs3jzSQK', NULL, '2021-02-21 19:50:29'),
(5, 'Josephine Harding', 'customer3@demo.com', NULL, NULL, NULL, '$2y$10$n/06hZG121ZGp3tSwDQS3uhsQKxEYspjKrn7kGlLxRinUZKiulrEm', 'gkEWScQHIol9EIRhP3m5m7JqnK5UvcGdEsKQJo7YeBcQawYFq3JAJ6SX9UKy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-11 15:55:52', '2021-02-02 16:29:47'),
(6, 'Nicolette Christiansen', 'provider2@demo.com', NULL, NULL, '2021-01-11 05:00:00', '$2y$04$WRpHC9iMxZ3f.gctQ4igsuZjsYfGjX7igVM8GsC2AMME3.4au3dYu', 'TKArYDDFHNiEI33sfExaBEhxHCs5kFaWP7EO6aNlUZfnqHrvsMCwsYeAk9s2', NULL, NULL, NULL, NULL, NULL, NULL, 'JbiYaHlRWGKkfITxH9qI87GzTMPf0zJ2Iw6NIdlS5dDvWuT5PC2sP5ELGwKx', '2021-01-11 16:33:59', '2021-02-02 16:30:56'),
(7, 'Rose Bauer', 'customer2@demo.com', NULL, NULL, NULL, '$2y$10$3GhoIShzRdSXevYAh1NF/.67J3OshX9D2.sqY50o8kxh7EXPw7tuC', 'w6QJYqZyllY24AIR3nSsKqgj5eMSZevmgpSywwxJxUS9nwULcuriRLBxEXZC', '', NULL, NULL, NULL, NULL, NULL, 'WxYP9zjTBy9SYF5OWjcFbMt2Ob9r0bahBKzPDOtw9OrAJ89JqaMxkN5aqu8J', '2021-01-17 21:13:24', '2021-02-28 23:03:25'),
(8, 'smarter8', 'smartersvision@gmail.com', '+12645595482', NULL, NULL, '$2y$10$MqPMTfg6RUNxxEH6aLdqnOYZUBsT7xtxkglD74pDgThV52.HJrLba', 'WivbG2oAEbEGl51EBeBuHaZeCqyfBnCVGo18nSaj2FwwiDjux2ZOAZWUoddK', '', NULL, NULL, NULL, NULL, NULL, 'SdstZCaeYW0pjqZn832HMzBD7WPGJ5m9hwWG28nhbIrzSS0etj33rbTRJ6kD', '2021-02-10 16:31:12', '2021-02-24 01:41:50'),
(12, 'yougesh', 'yougesh.raja12@gmail.com', NULL, NULL, NULL, '$2y$10$xLNix/qLnpYDMRwJ49B2ZuA0twjZ0MWmN4UU249bmrIlPPxAxH2H2', 'EWJh7qFRc2Qs1Gwaon5siNI7ycPlJerQ96F0MzimZM5IHMsEjexvT5EcIQwh', NULL, NULL, NULL, NULL, NULL, NULL, 'uzedu7tCvwRnRkv8mFmvRv9DppFMVbhR1VO1IDpvHkG7F8RwPpc1r9cge6kc', '2022-03-23 06:48:23', '2022-03-23 06:48:23'),
(13, 'Hyatt Zimmerman', 'admin85@demo.com', '1 234 8996 321', NULL, NULL, '$2y$10$adzUYWiBHXAw9lCcjniMbuP7/iVdal78FVgMXBCf8f803YrYXgv7a', 'ZCI6j3OYL2FSQEvi7HRqVia4FlfdZMqPOJTCm7nl3e4kamzDycXHGeQ7GX2i', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-23 08:23:58', '2022-03-23 08:23:58'),
(14, 'nadeem', 'nadeemaslam0129@gmail.com', NULL, NULL, NULL, '$2y$10$IQzT1JtoKembqyYCzMUHauvykOF7Ctu2YrxYtStNtaQDK31ARsv0K', 'q6zJvARizNydiAE4U6hMozRkx8Ggr6yfbBChRDwZB5gBCVuQ4jaBSz50eOQ8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-04 10:37:52', '2022-04-04 10:37:52'),
(15, 'test', 'test@gmail.com', '35435567677', NULL, NULL, '$2a$12$0feVzFzXepor8iYuf1PycO1gKXIGP1Fo4Vxaz9SYEXQWRClwP/4Jy', 'QfJYPwi1CmqrS5gHlQNUxc4oHQwJ7gYm0jrJk96rkNdMK3fEbkQ1J9aE9Tgt', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 18:47:01', '2022-04-15 18:47:01'),
(16, 'Maaz', 'hafizmaaz52@gmail.com', NULL, NULL, NULL, '$2y$10$bjAo0Kk0obx6hrf/mQJE5ubsoDkSqHAReHfpEN5IGsEGjEZrG76dW', 'rFcKVyFVyEkPrsbBlUOEoGdjvxQFHcXCj9QgkBrBjRE2WTS66ei7HnUBjDPX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-07 05:46:10', '2022-05-07 05:46:10');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` double(16,2) NOT NULL DEFAULT 0.00,
  `currency` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `name`, `balance`, `currency`, `user_id`, `enabled`, `created_at`, `updated_at`) VALUES
('01194a4f-f302-47af-80b2-ceb2075d36dc', 'My USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 1, 1, '2021-08-07 17:17:34', '2021-08-07 17:17:34'),
('02194a4f-f302-47af-80b2-ceb2075d36dc', 'Home USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 2, 1, '2021-08-07 17:17:34', '2021-08-07 17:17:34'),
('03194a4f-f302-47af-80b2-ceb2075d36dc', 'Work USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 3, 1, '2021-08-07 17:17:34', '2021-08-07 17:17:34'),
('04194a4f-f302-47af-80b2-ceb2075d36dc', 'Dummy USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 4, 1, '2021-08-07 17:17:34', '2021-08-07 17:17:34'),
('05194a4f-f302-47af-80b2-ceb2075d36dc', 'Old USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 5, 1, '2021-08-07 17:17:34', '2021-08-07 17:17:34'),
('06194a4f-f302-47af-80b2-ceb2075d36dc', 'New USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 6, 1, '2021-08-07 17:17:34', '2021-08-07 17:17:34'),
('07194a4f-f302-47af-80b2-ceb2075d36dc', 'USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 7, 1, '2021-08-07 17:17:34', '2021-08-07 17:17:34'),
('8d194a4f-f302-47af-80b2-ceb2075d36dc', 'Dollar Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 8, 1, '2021-01-07 18:17:34', '2021-01-07 18:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` enum('credit','debit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_transactions`
--

INSERT INTO `wallet_transactions` (`id`, `amount`, `description`, `action`, `wallet_id`, `user_id`, `created_at`, `updated_at`) VALUES
('01194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '01194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 17:17:34', '2021-08-07 17:17:34'),
('02194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '02194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 17:17:34', '2021-08-07 17:17:34'),
('03194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '03194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 17:17:34', '2021-08-07 17:17:34'),
('04194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '04194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 17:17:34', '2021-08-07 17:17:34'),
('05194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '05194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 17:17:34', '2021-08-07 17:17:34'),
('06194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '06194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 17:17:34', '2021-08-07 17:17:34'),
('07194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '07194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 17:17:34', '2021-08-07 17:17:34'),
('8d194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '8d194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 17:17:34', '2021-08-07 17:17:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_settings_key_index` (`key`);

--
-- Indexes for table `availability_hours`
--
ALTER TABLE `availability_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `availability_hours_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awards_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_booking_status_id_foreign` (`booking_status_id`),
  ADD KEY `bookings_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `booking_statuses`
--
ALTER TABLE `booking_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_values_custom_field_id_foreign` (`custom_field_id`);

--
-- Indexes for table `custom_pages`
--
ALTER TABLE `custom_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discountables`
--
ALTER TABLE `discountables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discountables_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `earnings_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `experiences_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `e_providers`
--
ALTER TABLE `e_providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_providers_e_provider_type_id_foreign` (`e_provider_type_id`);

--
-- Indexes for table `e_provider_addresses`
--
ALTER TABLE `e_provider_addresses`
  ADD PRIMARY KEY (`e_provider_id`,`address_id`),
  ADD KEY `e_provider_addresses_address_id_foreign` (`address_id`);

--
-- Indexes for table `e_provider_payouts`
--
ALTER TABLE `e_provider_payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_provider_payouts_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `e_provider_taxes`
--
ALTER TABLE `e_provider_taxes`
  ADD PRIMARY KEY (`e_provider_id`,`tax_id`),
  ADD KEY `e_provider_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `e_provider_types`
--
ALTER TABLE `e_provider_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `e_provider_users`
--
ALTER TABLE `e_provider_users`
  ADD PRIMARY KEY (`user_id`,`e_provider_id`),
  ADD KEY `e_provider_users_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `e_services`
--
ALTER TABLE `e_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_services_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `e_service_categories`
--
ALTER TABLE `e_service_categories`
  ADD PRIMARY KEY (`e_service_id`,`category_id`),
  ADD KEY `e_service_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `e_service_reviews`
--
ALTER TABLE `e_service_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_service_reviews_user_id_foreign` (`user_id`),
  ADD KEY `e_service_reviews_e_service_id_foreign` (`e_service_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_faq_category_id_foreign` (`faq_category_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_e_service_id_foreign` (`e_service_id`),
  ADD KEY `favorites_user_id_foreign` (`user_id`);

--
-- Indexes for table `favorite_options`
--
ALTER TABLE `favorite_options`
  ADD PRIMARY KEY (`option_id`,`favorite_id`),
  ADD KEY `favorite_options_favorite_id_foreign` (`favorite_id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_e_service_id_foreign` (`e_service_id`),
  ADD KEY `options_option_group_id_foreign` (`option_group_id`);

--
-- Indexes for table `option_groups`
--
ALTER TABLE `option_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `payments_payment_status_id_foreign` (`payment_status_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_statuses`
--
ALTER TABLE `payment_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slides_e_service_id_foreign` (`e_service_id`),
  ADD KEY `slides_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_transactions_wallet_id_foreign` (`wallet_id`),
  ADD KEY `wallet_transactions_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `availability_hours`
--
ALTER TABLE `availability_hours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_statuses`
--
ALTER TABLE `booking_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `custom_pages`
--
ALTER TABLE `custom_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `discountables`
--
ALTER TABLE `discountables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `e_providers`
--
ALTER TABLE `e_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `e_provider_payouts`
--
ALTER TABLE `e_provider_payouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `e_provider_types`
--
ALTER TABLE `e_provider_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `e_services`
--
ALTER TABLE `e_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `e_service_reviews`
--
ALTER TABLE `e_service_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `option_groups`
--
ALTER TABLE `option_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment_statuses`
--
ALTER TABLE `payment_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `availability_hours`
--
ALTER TABLE `availability_hours`
  ADD CONSTRAINT `availability_hours_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `awards_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_booking_status_id_foreign` FOREIGN KEY (`booking_status_id`) REFERENCES `booking_statuses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discountables`
--
ALTER TABLE `discountables`
  ADD CONSTRAINT `discountables_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `earnings`
--
ALTER TABLE `earnings`
  ADD CONSTRAINT `earnings_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `experiences`
--
ALTER TABLE `experiences`
  ADD CONSTRAINT `experiences_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_providers`
--
ALTER TABLE `e_providers`
  ADD CONSTRAINT `e_providers_e_provider_type_id_foreign` FOREIGN KEY (`e_provider_type_id`) REFERENCES `e_provider_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_provider_addresses`
--
ALTER TABLE `e_provider_addresses`
  ADD CONSTRAINT `e_provider_addresses_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_provider_addresses_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_provider_payouts`
--
ALTER TABLE `e_provider_payouts`
  ADD CONSTRAINT `e_provider_payouts_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_provider_taxes`
--
ALTER TABLE `e_provider_taxes`
  ADD CONSTRAINT `e_provider_taxes_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_provider_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_provider_users`
--
ALTER TABLE `e_provider_users`
  ADD CONSTRAINT `e_provider_users_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_provider_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_services`
--
ALTER TABLE `e_services`
  ADD CONSTRAINT `e_services_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_service_categories`
--
ALTER TABLE `e_service_categories`
  ADD CONSTRAINT `e_service_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_service_categories_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_service_reviews`
--
ALTER TABLE `e_service_reviews`
  ADD CONSTRAINT `e_service_reviews_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_service_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite_options`
--
ALTER TABLE `favorite_options`
  ADD CONSTRAINT `favorite_options_favorite_id_foreign` FOREIGN KEY (`favorite_id`) REFERENCES `favorites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `options_option_group_id_foreign` FOREIGN KEY (`option_group_id`) REFERENCES `option_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_payment_status_id_foreign` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `slides_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `slides_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD CONSTRAINT `wallet_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wallet_transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
