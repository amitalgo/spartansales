-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2018 at 06:06 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spartan_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievement_assigngoal`
--

CREATE TABLE `achievement_assigngoal` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `assignTo_id` int(11) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `goal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `achievement_goal`
--

CREATE TABLE `achievement_goal` (
  `id` int(11) NOT NULL,
  `goal_name` varchar(300) DEFAULT NULL,
  `target` double DEFAULT NULL,
  `financial_year` varchar(10) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `remarks` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `goal_matrix_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `achievement_goal`
--

INSERT INTO `achievement_goal` (`id`, `goal_name`, `target`, `financial_year`, `start_date`, `end_date`, `remarks`, `status`, `created_at`, `updated_at`, `created_by_id`, `department_id`, `goal_matrix_id`, `parent_id`, `product_id`) VALUES
(1, '50 INR Kandivali', 55, '2018', '2018-08-01', '2018-08-30', 'remarks', 1, '2018-09-04 12:54:37.568914', '2018-09-11 04:35:03.046963', 4, 2, 1, NULL, 1),
(2, '50 INR Allahabad', 50, '2018', '2018-09-01', '2018-09-30', 'remarks', 1, '2018-09-04 12:55:26.740048', '2018-09-04 12:55:37.893952', 3, 1, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `achievement_goalmatrix`
--

CREATE TABLE `achievement_goalmatrix` (
  `id` int(11) NOT NULL,
  `goal_name` varchar(250) NOT NULL,
  `target` double DEFAULT NULL,
  `goal_type` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `achievement_goalmatrix`
--

INSERT INTO `achievement_goalmatrix` (`id`, `goal_name`, `target`, `goal_type`, `status`, `created_at`, `updated_at`) VALUES
(1, '100 INR Business', 100, 'amount', 1, '2018-09-04 12:53:39.596256', '2018-09-04 12:53:39.596256');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`, `parent_id`) VALUES
(1, 'Branch Head', NULL),
(2, 'Manager', 1),
(3, 'Employee', 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(44, 1, 44),
(45, 1, 45),
(46, 1, 46),
(47, 1, 47),
(48, 1, 48),
(49, 1, 49),
(50, 1, 50),
(51, 1, 51),
(52, 1, 52),
(53, 1, 53),
(54, 1, 54),
(55, 1, 55),
(56, 1, 56),
(57, 1, 57),
(58, 1, 58),
(59, 1, 59),
(60, 1, 60),
(61, 1, 61),
(62, 1, 62),
(63, 1, 63),
(64, 1, 64),
(65, 1, 65),
(66, 1, 66),
(67, 1, 67),
(68, 1, 68),
(69, 1, 69),
(70, 1, 70),
(71, 1, 71),
(72, 1, 72),
(73, 1, 73),
(74, 1, 74),
(75, 1, 75),
(76, 1, 76),
(77, 1, 77),
(78, 1, 78),
(79, 1, 79),
(80, 1, 80),
(81, 1, 81),
(82, 1, 82),
(83, 1, 83),
(84, 1, 84),
(85, 1, 85),
(86, 1, 86),
(87, 1, 87),
(88, 1, 88),
(89, 1, 89),
(90, 1, 90),
(91, 1, 91),
(92, 1, 92),
(93, 1, 93),
(94, 1, 94),
(95, 1, 95),
(96, 1, 96),
(97, 1, 97),
(98, 1, 98),
(99, 1, 99),
(100, 1, 100),
(101, 1, 101),
(102, 1, 102),
(103, 1, 103),
(104, 1, 104),
(105, 1, 105),
(106, 2, 1),
(107, 2, 2),
(108, 2, 3),
(109, 2, 4),
(110, 2, 5),
(111, 2, 6),
(112, 2, 7),
(113, 2, 8),
(114, 2, 9),
(115, 2, 10),
(116, 2, 11),
(117, 2, 12),
(118, 2, 13),
(119, 2, 14),
(120, 2, 15),
(121, 2, 16),
(122, 2, 17),
(123, 2, 18),
(124, 2, 19),
(125, 2, 20),
(126, 2, 21),
(127, 2, 22),
(128, 2, 23),
(129, 2, 24),
(130, 2, 25),
(131, 2, 26),
(132, 2, 27),
(133, 2, 28),
(134, 2, 29),
(135, 2, 30),
(136, 2, 31),
(137, 2, 32),
(138, 2, 33),
(139, 2, 34),
(140, 2, 35),
(141, 2, 36),
(142, 2, 37),
(143, 2, 38),
(144, 2, 39),
(145, 2, 40),
(146, 2, 41),
(147, 2, 42),
(148, 2, 43),
(149, 2, 44),
(150, 2, 45),
(151, 2, 46),
(152, 2, 47),
(153, 2, 48),
(154, 2, 49),
(155, 2, 50),
(156, 2, 51),
(157, 2, 52),
(158, 2, 53),
(159, 2, 54),
(160, 2, 55),
(161, 2, 56),
(162, 2, 57),
(163, 2, 58),
(164, 2, 59),
(165, 2, 60),
(166, 2, 61),
(167, 2, 62),
(168, 2, 63),
(169, 2, 64),
(170, 2, 65),
(171, 2, 66),
(172, 2, 67),
(173, 2, 68),
(174, 2, 69),
(175, 2, 70),
(176, 2, 71),
(177, 2, 72),
(178, 2, 73),
(179, 2, 74),
(180, 2, 75),
(181, 2, 76),
(182, 2, 77),
(183, 2, 78),
(184, 2, 79),
(185, 2, 80),
(186, 2, 81),
(187, 2, 82),
(188, 2, 83),
(189, 2, 84),
(190, 2, 85),
(191, 2, 86),
(192, 2, 87),
(193, 2, 88),
(194, 2, 89),
(195, 2, 90),
(196, 2, 91),
(197, 2, 92),
(198, 2, 93),
(199, 2, 94),
(200, 2, 95),
(201, 2, 96),
(202, 2, 97),
(203, 2, 98),
(204, 2, 99),
(205, 2, 100),
(206, 2, 101),
(207, 2, 102),
(208, 2, 103),
(209, 2, 104),
(210, 2, 105),
(211, 3, 1),
(212, 3, 2),
(213, 3, 3),
(214, 3, 4),
(215, 3, 5),
(216, 3, 6),
(217, 3, 7),
(218, 3, 8),
(219, 3, 9),
(220, 3, 10),
(221, 3, 11),
(222, 3, 12),
(223, 3, 13),
(224, 3, 14),
(225, 3, 15),
(226, 3, 16),
(227, 3, 17),
(228, 3, 18),
(229, 3, 19),
(230, 3, 20),
(231, 3, 21),
(232, 3, 22),
(233, 3, 23),
(234, 3, 24),
(235, 3, 25),
(236, 3, 26),
(237, 3, 27),
(238, 3, 28),
(239, 3, 29),
(240, 3, 30),
(241, 3, 31),
(242, 3, 32),
(243, 3, 33),
(244, 3, 34),
(245, 3, 35),
(246, 3, 36),
(247, 3, 37),
(248, 3, 38),
(249, 3, 39),
(250, 3, 40),
(251, 3, 41),
(252, 3, 42),
(253, 3, 43),
(254, 3, 44),
(255, 3, 45),
(256, 3, 46),
(257, 3, 47),
(258, 3, 48),
(259, 3, 49),
(260, 3, 50),
(261, 3, 51),
(262, 3, 52),
(263, 3, 53),
(264, 3, 54),
(265, 3, 55),
(266, 3, 56),
(267, 3, 57),
(268, 3, 58),
(269, 3, 59),
(270, 3, 60),
(271, 3, 61),
(272, 3, 62),
(273, 3, 63),
(274, 3, 64),
(275, 3, 65),
(276, 3, 66),
(277, 3, 67),
(278, 3, 68),
(279, 3, 69),
(280, 3, 70),
(281, 3, 71),
(282, 3, 72),
(283, 3, 73),
(284, 3, 74),
(285, 3, 75),
(286, 3, 76),
(287, 3, 77),
(288, 3, 78),
(289, 3, 79),
(290, 3, 80),
(291, 3, 81),
(292, 3, 82),
(293, 3, 83),
(294, 3, 84),
(295, 3, 85),
(296, 3, 86),
(297, 3, 87),
(298, 3, 88),
(299, 3, 89),
(300, 3, 90),
(301, 3, 91),
(302, 3, 92),
(303, 3, 93),
(304, 3, 94),
(305, 3, 95),
(306, 3, 96),
(307, 3, 97),
(308, 3, 98),
(309, 3, 99),
(310, 3, 100),
(311, 3, 101),
(312, 3, 102),
(313, 3, 103),
(314, 3, 104),
(315, 3, 105),
(316, 3, 106),
(317, 3, 107),
(318, 3, 108),
(319, 3, 109),
(320, 3, 110),
(321, 3, 111),
(322, 3, 112),
(323, 3, 113),
(324, 3, 114),
(325, 3, 115),
(326, 3, 116),
(327, 3, 117),
(328, 3, 118),
(329, 3, 119),
(330, 3, 120),
(331, 3, 121),
(332, 3, 122),
(333, 3, 123),
(336, 3, 124),
(337, 3, 125),
(338, 3, 126),
(339, 3, 127),
(334, 3, 128),
(335, 3, 129),
(340, 3, 130),
(341, 3, 131),
(342, 3, 132),
(343, 3, 133),
(344, 3, 134),
(345, 3, 135),
(346, 3, 136),
(347, 3, 137),
(348, 3, 138);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add goal matrix', 1, 'add_goalmatrix'),
(2, 'Can change goal matrix', 1, 'change_goalmatrix'),
(3, 'Can delete goal matrix', 1, 'delete_goalmatrix'),
(4, 'Can add goal', 2, 'add_goal'),
(5, 'Can change goal', 2, 'change_goal'),
(6, 'Can delete goal', 2, 'delete_goal'),
(7, 'Can add assign goal', 3, 'add_assigngoal'),
(8, 'Can change assign goal', 3, 'change_assigngoal'),
(9, 'Can delete assign goal', 3, 'delete_assigngoal'),
(10, 'Can add branch', 4, 'add_branch'),
(11, 'Can change branch', 4, 'change_branch'),
(12, 'Can delete branch', 4, 'delete_branch'),
(13, 'Can add country', 5, 'add_country'),
(14, 'Can change country', 5, 'change_country'),
(15, 'Can delete country', 5, 'delete_country'),
(16, 'Can add employee', 6, 'add_employee'),
(17, 'Can change employee', 6, 'change_employee'),
(18, 'Can delete employee', 6, 'delete_employee'),
(19, 'Can add employee report', 7, 'add_employeereport'),
(20, 'Can change employee report', 7, 'change_employeereport'),
(21, 'Can delete employee report', 7, 'delete_employeereport'),
(22, 'Can add employee branch', 8, 'add_employeebranch'),
(23, 'Can change employee branch', 8, 'change_employeebranch'),
(24, 'Can delete employee branch', 8, 'delete_employeebranch'),
(25, 'Can add employee media', 9, 'add_employeemedia'),
(26, 'Can change employee media', 9, 'change_employeemedia'),
(27, 'Can delete employee media', 9, 'delete_employeemedia'),
(28, 'Can add insentive matrix', 10, 'add_insentivematrix'),
(29, 'Can change insentive matrix', 10, 'change_insentivematrix'),
(30, 'Can delete insentive matrix', 10, 'delete_insentivematrix'),
(31, 'Can add insentive assigned', 11, 'add_insentiveassigned'),
(32, 'Can change insentive assigned', 11, 'change_insentiveassigned'),
(33, 'Can delete insentive assigned', 11, 'delete_insentiveassigned'),
(34, 'Can add lead source', 12, 'add_leadsource'),
(35, 'Can change lead source', 12, 'change_leadsource'),
(36, 'Can delete lead source', 12, 'delete_leadsource'),
(37, 'Can add department', 13, 'add_department'),
(38, 'Can change department', 13, 'change_department'),
(39, 'Can delete department', 13, 'delete_department'),
(40, 'Can add lead status type', 14, 'add_leadstatustype'),
(41, 'Can change lead status type', 14, 'change_leadstatustype'),
(42, 'Can delete lead status type', 14, 'delete_leadstatustype'),
(43, 'Can add organization details', 15, 'add_organizationdetails'),
(44, 'Can change organization details', 15, 'change_organizationdetails'),
(45, 'Can delete organization details', 15, 'delete_organizationdetails'),
(46, 'Can add organization lead details', 16, 'add_organizationleaddetails'),
(47, 'Can change organization lead details', 16, 'change_organizationleaddetails'),
(48, 'Can delete organization lead details', 16, 'delete_organizationleaddetails'),
(49, 'Can add assign leads', 17, 'add_assignleads'),
(50, 'Can change assign leads', 17, 'change_assignleads'),
(51, 'Can delete assign leads', 17, 'delete_assignleads'),
(52, 'Can add lead status', 18, 'add_leadstatus'),
(53, 'Can change lead status', 18, 'change_leadstatus'),
(54, 'Can delete lead status', 18, 'delete_leadstatus'),
(55, 'Can add reason type', 19, 'add_reasontype'),
(56, 'Can change reason type', 19, 'change_reasontype'),
(57, 'Can delete reason type', 19, 'delete_reasontype'),
(58, 'Can add order lost', 20, 'add_orderlost'),
(59, 'Can change order lost', 20, 'change_orderlost'),
(60, 'Can delete order lost', 20, 'delete_orderlost'),
(61, 'Can add product', 21, 'add_product'),
(62, 'Can change product', 21, 'change_product'),
(63, 'Can delete product', 21, 'delete_product'),
(64, 'Can add product price', 22, 'add_productprice'),
(65, 'Can change product price', 22, 'change_productprice'),
(66, 'Can delete product price', 22, 'delete_productprice'),
(67, 'Can add product department', 23, 'add_productdepartment'),
(68, 'Can change product department', 23, 'change_productdepartment'),
(69, 'Can delete product department', 23, 'delete_productdepartment'),
(70, 'Can add product media', 24, 'add_productmedia'),
(71, 'Can change product media', 24, 'change_productmedia'),
(72, 'Can delete product media', 24, 'delete_productmedia'),
(73, 'Can add region', 25, 'add_region'),
(74, 'Can change region', 25, 'change_region'),
(75, 'Can delete region', 25, 'delete_region'),
(76, 'Can add role', 26, 'add_role'),
(77, 'Can change role', 26, 'change_role'),
(78, 'Can delete role', 26, 'delete_role'),
(79, 'Can add role privillage', 27, 'add_roleprivillage'),
(80, 'Can change role privillage', 27, 'change_roleprivillage'),
(81, 'Can delete role privillage', 27, 'delete_roleprivillage'),
(82, 'Can add employee role', 28, 'add_employeerole'),
(83, 'Can change employee role', 28, 'change_employeerole'),
(84, 'Can delete employee role', 28, 'delete_employeerole'),
(85, 'Can add task', 29, 'add_task'),
(86, 'Can change task', 29, 'change_task'),
(87, 'Can delete task', 29, 'delete_task'),
(88, 'Can add log entry', 30, 'add_logentry'),
(89, 'Can change log entry', 30, 'change_logentry'),
(90, 'Can delete log entry', 30, 'delete_logentry'),
(91, 'Can add permission', 31, 'add_permission'),
(92, 'Can change permission', 31, 'change_permission'),
(93, 'Can delete permission', 31, 'delete_permission'),
(94, 'Can add group', 32, 'add_group'),
(95, 'Can change group', 32, 'change_group'),
(96, 'Can delete group', 32, 'delete_group'),
(97, 'Can add user', 33, 'add_user'),
(98, 'Can change user', 33, 'change_user'),
(99, 'Can delete user', 33, 'delete_user'),
(100, 'Can add content type', 34, 'add_contenttype'),
(101, 'Can change content type', 34, 'change_contenttype'),
(102, 'Can delete content type', 34, 'delete_contenttype'),
(103, 'Can add session', 35, 'add_session'),
(104, 'Can change session', 35, 'change_session'),
(105, 'Can delete session', 35, 'delete_session'),
(106, 'Can add report', 36, 'add_report'),
(107, 'Can change report', 36, 'change_report'),
(108, 'Can delete report', 36, 'delete_report'),
(109, 'Can add repo', 37, 'add_repo'),
(110, 'Can change repo', 37, 'change_repo'),
(111, 'Can delete repo', 37, 'delete_repo'),
(112, 'Can add report', 37, 'add_report'),
(113, 'Can change report', 37, 'change_report'),
(114, 'Can delete report', 37, 'delete_report'),
(115, 'Can add reportt', 37, 'add_reportt'),
(116, 'Can change reportt', 37, 'change_reportt'),
(117, 'Can delete reportt', 37, 'delete_reportt'),
(118, 'Can add department wise report', 38, 'add_departmentwisereport'),
(119, 'Can change department wise report', 38, 'change_departmentwisereport'),
(120, 'Can delete department wise report', 38, 'delete_departmentwisereport'),
(121, 'Can add product wise report', 39, 'add_productwisereport'),
(122, 'Can change product wise report', 39, 'change_productwisereport'),
(123, 'Can delete product wise report', 39, 'delete_productwisereport'),
(124, 'Can add department wise report', 40, 'add_departmentwisereport'),
(125, 'Can change department wise report', 40, 'change_departmentwisereport'),
(126, 'Can delete department wise report', 40, 'delete_departmentwisereport'),
(127, 'Can add product wise report', 41, 'add_productwisereport'),
(128, 'Can change product wise report', 41, 'change_productwisereport'),
(129, 'Can delete product wise report', 41, 'delete_productwisereport'),
(130, 'Can add product contribution cumulative', 42, 'add_productcontributioncumulative'),
(131, 'Can change product contribution cumulative', 42, 'change_productcontributioncumulative'),
(132, 'Can delete product contribution cumulative', 42, 'delete_productcontributioncumulative'),
(133, 'Can add quarterly report', 43, 'add_quarterlyreport'),
(134, 'Can change quarterly report', 43, 'change_quarterlyreport'),
(135, 'Can delete quarterly report', 43, 'delete_quarterlyreport'),
(136, 'Can add achievement year wise', 44, 'add_achievementyearwise'),
(137, 'Can change achievement year wise', 44, 'change_achievementyearwise'),
(138, 'Can delete achievement year wise', 44, 'delete_achievementyearwise');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$JaKRg6BKEHml$KhtzmD8N2N490Gi22Nr9Bv9HT1SH3YBT9wqv6EIp31w=', '2018-09-19 10:48:39.567575', 1, 'admin', 'Admin', 'Admin', 'admin@admin.com', 1, 1, '2018-09-04 11:48:56.000000'),
(2, 'pbkdf2_sha256$36000$K1gSkrDUUD8k$YwUWO0yMdy/wHmZhWIpuz/vbHECvn8sHz+Pnj5YvAgo=', '2018-09-05 05:34:47.000000', 0, 'aditya', 'Aditya', 'Rao', 'aditya@technople.in', 1, 1, '2018-09-04 12:35:31.000000'),
(3, 'pbkdf2_sha256$36000$MNebyHGimwxx$dHzMjcz1FBiyS21ZRRMdM6rG7VsfXO5jZqtnQZOYMuk=', '2018-09-19 13:05:46.718927', 0, 'Asim', 'Asim', 'Sagir', 'asim@technople.in', 1, 1, '2018-09-04 12:41:17.000000'),
(4, 'pbkdf2_sha256$36000$WUHtJILzLqWv$WPRpEtKpeg+0lTuieFT02NvFvBGwFGpPtuWcsU2yb9Q=', '2018-09-14 04:11:27.232496', 0, 'amit', 'Amit', 'Chaurasia', 'amitc@technople.in', 1, 1, '2018-09-04 12:42:12.000000'),
(5, 'pbkdf2_sha256$36000$knDkqj0tkOaW$bfV4+iv4UTz35yxzJDEhAFruHJ0BRjJ4n3Vw8OKqpzA=', NULL, 0, 'Ram', 'Ram', 'Sir', 'ram@technople.in', 1, 1, '2018-09-04 12:43:14.000000'),
(6, 'pbkdf2_sha256$36000$eWEvNGw2zLgn$rWdmnT+RbjuzHbLlh1pIrpCuukL75hh7jcmhQKfXvIA=', '2018-09-17 05:28:54.804525', 0, 'yogendra', 'Yogendra', 'Sir', 'yogendra@technople.in', 1, 1, '2018-09-04 12:44:14.000000'),
(7, 'pbkdf2_sha256$36000$2OhfKhIaPg3y$J/HpXnrFu7Gh7Kk0YqsBZdYgIykKMoG3MvADerdHY0E=', '2018-09-19 12:51:04.644844', 0, 'gawde', 'Pandurang', 'Gawde', 'gawde@technople.in', 1, 1, '2018-09-04 12:45:11.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 2),
(2, 3, 2),
(3, 4, 3),
(4, 5, 3),
(5, 6, 3),
(6, 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branch_branch`
--

CREATE TABLE `branch_branch` (
  `id` int(11) NOT NULL,
  `branch_name` varchar(250) NOT NULL,
  `branch_address` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch_branch`
--

INSERT INTO `branch_branch` (`id`, `branch_name`, `branch_address`, `status`, `created_at`, `updated_at`, `region_id`) VALUES
(1, 'Allahabad', 'Civil Lines', 1, '2018-09-04 11:50:27.732857', '2018-09-04 11:50:27.732857', 1),
(2, 'Kandivali', 'Station Road', 1, '2018-09-04 11:50:50.012167', '2018-09-04 11:50:50.012167', 2);

-- --------------------------------------------------------

--
-- Table structure for table `country_country`
--

CREATE TABLE `country_country` (
  `id` int(11) NOT NULL,
  `country_name` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country_country`
--

INSERT INTO `country_country` (`id`, `country_name`, `status`, `created_at`, `updated_at`, `created_by_id`) VALUES
(1, 'India', 1, '2018-09-04 11:50:04.705978', '2018-09-04 11:50:04.705978', 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2018-09-04 11:50:04.754981', '1', 'India', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"region\", \"object\": \"UP\"}}, {\"added\": {\"name\": \"region\", \"object\": \"Mumbai\"}}]', 5, 1),
(2, '2018-09-04 11:50:27.752858', '1', 'Allahabad', 1, '[{\"added\": {}}]', 4, 1),
(3, '2018-09-04 11:50:50.032168', '2', 'Kandivali', 1, '[{\"added\": {}}]', 4, 1),
(4, '2018-09-04 11:52:27.568063', '1', 'Sales', 1, '[{\"added\": {}}]', 13, 1),
(5, '2018-09-04 11:52:34.058438', '2', 'AMC', 1, '[{\"added\": {}}]', 13, 1),
(6, '2018-09-04 11:52:42.992754', '3', 'Service', 1, '[{\"added\": {}}]', 13, 1),
(7, '2018-09-04 11:52:53.945543', '4', 'Parts', 1, '[{\"added\": {}}]', 13, 1),
(8, '2018-09-04 12:00:50.220634', '1', 'Pending', 1, '[{\"added\": {}}]', 14, 1),
(9, '2018-09-04 12:00:58.850415', '2', 'Completed', 1, '[{\"added\": {}}]', 14, 1),
(10, '2018-09-04 12:01:03.666108', '3', 'Progress', 1, '[{\"added\": {}}]', 14, 1),
(11, '2018-09-04 12:07:34.205535', '1', 'Newspaper', 1, '[{\"added\": {}}]', 12, 1),
(12, '2018-09-04 12:07:42.408085', '2', 'Social Network', 1, '[{\"added\": {}}]', 12, 1),
(13, '2018-09-04 12:09:04.572822', '1', 'SBM52', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"product price\", \"object\": \"ProductPrice object\"}}, {\"added\": {\"name\": \"product department\", \"object\": \"ProductDepartment object\"}}, {\"added\": {\"name\": \"product media\", \"object\": \"SBM52\"}}]', 21, 1),
(14, '2018-09-04 12:09:29.674160', '2', 'SBM42', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"product price\", \"object\": \"ProductPrice object\"}}, {\"added\": {\"name\": \"product department\", \"object\": \"ProductDepartment object\"}}, {\"added\": {\"name\": \"product media\", \"object\": \"SBM42\"}}]', 21, 1),
(15, '2018-09-04 12:09:41.461885', '2', 'SBM42', 2, '[{\"changed\": {\"fields\": [\"product_code\"]}}]', 21, 1),
(16, '2018-09-04 12:11:09.913452', '1', 'Technople', 1, '[{\"added\": {}}]', 15, 1),
(17, '2018-09-04 12:33:58.305726', '1', 'Purchase of SBM', 1, '[{\"added\": {}}]', 16, 1),
(18, '2018-09-04 12:34:26.727254', '1', 'Branch Head', 1, '[{\"added\": {}}]', 32, 1),
(19, '2018-09-04 12:34:35.557534', '2', 'Manager', 1, '[{\"added\": {}}]', 32, 1),
(20, '2018-09-04 12:34:45.034364', '3', 'Employee', 1, '[{\"added\": {}}]', 32, 1),
(21, '2018-09-04 12:34:50.669001', '2', 'Manager', 2, '[{\"changed\": {\"fields\": [\"parent\"]}}]', 32, 1),
(22, '2018-09-04 12:35:31.678026', '2', 'aditya', 1, '[{\"added\": {}}]', 33, 1),
(23, '2018-09-04 12:38:23.744982', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]', 33, 1),
(24, '2018-09-04 12:41:01.080376', '2', 'aditya', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"is_staff\"]}}, {\"added\": {\"name\": \"employee\", \"object\": \"Aditya Rao\"}}, {\"added\": {\"name\": \"employee branch\", \"object\": \"Aditya Rao -- Manager\"}}]', 33, 1),
(25, '2018-09-04 12:41:17.584508', '3', 'Asim', 1, '[{\"added\": {}}]', 33, 1),
(26, '2018-09-04 12:41:53.135214', '3', 'Asim', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"is_staff\"]}}, {\"added\": {\"name\": \"employee\", \"object\": \"Asim Sagir\"}}, {\"added\": {\"name\": \"employee branch\", \"object\": \"Asim Sagir -- Manager\"}}]', 33, 1),
(27, '2018-09-04 12:42:12.573121', '4', 'amit', 1, '[{\"added\": {}}]', 33, 1),
(28, '2018-09-04 12:42:56.192831', '4', 'amit', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"is_staff\"]}}, {\"added\": {\"name\": \"employee\", \"object\": \"Amit Chaurasia\"}}, {\"added\": {\"name\": \"employee branch\", \"object\": \"Amit Chaurasia -- Employee\"}}]', 33, 1),
(29, '2018-09-04 12:43:14.378097', '5', 'Ram', 1, '[{\"added\": {}}]', 33, 1),
(30, '2018-09-04 12:43:44.561334', '5', 'Ram', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"is_staff\"]}}, {\"added\": {\"name\": \"employee\", \"object\": \"Ram Sir\"}}, {\"added\": {\"name\": \"employee branch\", \"object\": \"Ram Sir -- Employee\"}}]', 33, 1),
(31, '2018-09-04 12:44:15.048793', '6', 'yogendra', 1, '[{\"added\": {}}]', 33, 1),
(32, '2018-09-04 12:44:51.543635', '6', 'yogendra', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"is_staff\"]}}, {\"added\": {\"name\": \"employee\", \"object\": \"Yogendra Sir\"}}, {\"added\": {\"name\": \"employee branch\", \"object\": \"Yogendra Sir -- Employee\"}}]', 33, 1),
(33, '2018-09-04 12:45:11.623337', '7', 'gawde', 1, '[{\"added\": {}}]', 33, 1),
(34, '2018-09-04 12:45:45.640352', '7', 'gawde', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"is_staff\"]}}, {\"added\": {\"name\": \"employee\", \"object\": \"Pandurang Gawde\"}}, {\"added\": {\"name\": \"employee branch\", \"object\": \"Pandurang Gawde -- Employee\"}}]', 33, 1),
(35, '2018-09-04 12:46:48.530167', '1', 'Purchase of SBM', 2, '[{\"changed\": {\"fields\": [\"branch\"]}}]', 16, 1),
(36, '2018-09-04 12:47:39.497064', '2', 'aditya', 2, '[{\"changed\": {\"name\": \"employee branch\", \"object\": \"Aditya Rao -- Manager\", \"fields\": [\"employee\"]}}]', 33, 1),
(37, '2018-09-04 12:47:46.863920', '4', 'amit', 2, '[{\"changed\": {\"name\": \"employee branch\", \"object\": \"Amit Chaurasia -- Employee\", \"fields\": [\"employee\"]}}]', 33, 1),
(38, '2018-09-04 12:47:54.557769', '3', 'Asim', 2, '[{\"changed\": {\"name\": \"employee branch\", \"object\": \"Asim Sagir -- Manager\", \"fields\": [\"employee\"]}}]', 33, 1),
(39, '2018-09-04 12:48:02.299035', '7', 'gawde', 2, '[{\"changed\": {\"name\": \"employee branch\", \"object\": \"Pandurang Gawde -- Employee\", \"fields\": [\"employee\"]}}]', 33, 1),
(40, '2018-09-04 12:48:12.851547', '5', 'Ram', 2, '[{\"changed\": {\"name\": \"employee branch\", \"object\": \"Ram Sir -- Employee\", \"fields\": [\"employee\"]}}]', 33, 1),
(41, '2018-09-04 12:48:18.845773', '7', 'gawde', 2, '[]', 33, 1),
(42, '2018-09-04 12:48:24.464197', '6', 'yogendra', 2, '[{\"changed\": {\"name\": \"employee branch\", \"object\": \"Yogendra Sir -- Employee\", \"fields\": [\"employee\"]}}]', 33, 1),
(43, '2018-09-04 12:51:20.936175', '1', 'Purchase of SBM', 1, '[{\"added\": {}}]', 17, 3),
(44, '2018-09-04 12:52:07.622458', '2', 'Purchase of SBM', 2, '[{\"changed\": {\"fields\": [\"assignTo\"]}}]', 17, 3),
(45, '2018-09-04 12:53:39.613257', '1', '100 INR Business', 1, '[{\"added\": {}}]', 1, 3),
(46, '2018-09-04 12:54:37.606916', '1', '50 INR Kandivali', 1, '[{\"added\": {}}]', 2, 3),
(47, '2018-09-04 12:55:26.748048', '2', '50 INR Bussines', 1, '[{\"added\": {}}]', 2, 3),
(48, '2018-09-04 12:55:37.894952', '2', '50 INR Allahabad', 2, '[{\"changed\": {\"fields\": [\"goal_name\"]}}]', 2, 3),
(49, '2018-09-05 06:21:47.125528', '1', 'SBM52', 2, '[{\"added\": {\"name\": \"product department\", \"object\": \"SBM52\"}}]', 21, 1),
(50, '2018-09-06 03:50:31.017485', '1', 'Purchase of SBM', 2, '[{\"changed\": {\"fields\": [\"department\", \"product\"]}}]', 16, 4),
(51, '2018-09-06 03:50:59.731602', '1', 'Purchase of SBM', 2, '[{\"changed\": {\"fields\": [\"product\"]}}]', 16, 4),
(52, '2018-09-06 07:34:48.236496', '1', 'Purchase of SBM', 2, '[]', 16, 4),
(53, '2018-09-07 06:25:38.528076', '1', 'SBM52', 2, '[{\"added\": {\"name\": \"product price\", \"object\": \"ProductPrice object\"}}]', 21, 4),
(54, '2018-09-07 06:26:12.637976', '1', 'SBM52', 2, '[{\"deleted\": {\"name\": \"product price\", \"object\": \"ProductPrice object\"}}]', 21, 4),
(55, '2018-09-10 04:52:43.254910', '2', 'aditya', 2, '[{\"changed\": {\"name\": \"employee branch\", \"object\": \"Aditya Rao -- Manager\", \"fields\": [\"employee\"]}}]', 33, 4),
(56, '2018-09-10 04:52:55.088758', '4', 'amit', 2, '[{\"changed\": {\"name\": \"employee branch\", \"object\": \"Amit Chaurasia -- Employee\", \"fields\": [\"employee\"]}}]', 33, 4),
(57, '2018-09-10 04:53:03.562052', '3', 'Asim', 2, '[{\"changed\": {\"name\": \"employee branch\", \"object\": \"Asim Sagir -- Manager\", \"fields\": [\"employee\"]}}]', 33, 4),
(58, '2018-09-10 04:53:13.364724', '7', 'gawde', 2, '[{\"changed\": {\"name\": \"employee branch\", \"object\": \"Pandurang Gawde -- Employee\", \"fields\": [\"employee\"]}}]', 33, 4),
(59, '2018-09-10 04:53:20.290982', '5', 'Ram', 2, '[{\"changed\": {\"name\": \"employee branch\", \"object\": \"Ram Sir -- Employee\", \"fields\": [\"employee\"]}}]', 33, 4),
(60, '2018-09-10 04:53:26.747627', '6', 'yogendra', 2, '[{\"changed\": {\"name\": \"employee branch\", \"object\": \"Yogendra Sir -- Employee\", \"fields\": [\"employee\"]}}]', 33, 4),
(61, '2018-09-10 05:32:55.362365', '2', 'test', 1, '[{\"added\": {}}]', 15, 4),
(62, '2018-09-10 05:33:06.127768', '2', 'test', 2, '[{\"changed\": {\"fields\": [\"first_name\"]}}]', 15, 4),
(63, '2018-09-10 05:33:16.511853', '2', 'test company', 2, '[{\"changed\": {\"fields\": [\"organisation_name\"]}}]', 15, 4),
(64, '2018-09-10 05:34:02.908255', '2', 'Sales Aditya', 1, '[{\"added\": {}}]', 16, 4),
(65, '2018-09-10 05:34:26.526604', '4', 'amit', 2, '[{\"changed\": {\"name\": \"employee branch\", \"object\": \"Amit Chaurasia -- Employee\", \"fields\": [\"branch\"]}}]', 33, 4),
(66, '2018-09-10 05:34:34.499339', '2', 'Sales Aditya', 2, '[{\"changed\": {\"fields\": [\"branch\", \"product\"]}}]', 16, 4),
(67, '2018-09-10 05:34:53.050511', '4', 'amit', 2, '[{\"changed\": {\"name\": \"employee branch\", \"object\": \"Amit Chaurasia -- Employee\", \"fields\": [\"branch\"]}}]', 33, 4),
(68, '2018-09-10 05:35:25.535676', '2', 'Sales Aditya', 2, '[]', 16, 4),
(69, '2018-09-10 05:35:53.860861', '1', 'Purchase of SBM', 2, '[{\"changed\": {\"fields\": [\"department\", \"product\"]}}]', 16, 4),
(70, '2018-09-10 05:36:40.604843', '3', 'Maintenance', 1, '[{\"added\": {}}]', 16, 4),
(71, '2018-09-11 04:35:03.069965', '1', '50 INR Kandivali', 2, '[{\"changed\": {\"fields\": [\"department\"]}}]', 2, 4),
(72, '2018-09-12 07:35:30.210633', '1', 'SBM52', 2, '[{\"added\": {\"name\": \"product price\", \"object\": \"ProductPrice object\"}}]', 21, 4),
(73, '2018-09-12 11:18:48.180285', '3', 'Employee', 2, '[]', 32, 4),
(74, '2018-09-12 11:22:40.683517', '3', 'Employee', 2, '[]', 32, 4),
(75, '2018-09-12 11:48:52.037771', '3', 'Employee', 2, '[]', 32, 4),
(76, '2018-09-17 06:08:08.383967', '3', 'SBM62', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"product price\", \"object\": \"SBM62\"}}, {\"added\": {\"name\": \"product department\", \"object\": \"SBM62\"}}, {\"added\": {\"name\": \"product media\", \"object\": \"SBM62\"}}]', 21, 7),
(77, '2018-09-17 06:08:30.310473', '3', 'SBM62', 2, '[{\"added\": {\"name\": \"product price\", \"object\": \"SBM62\"}}]', 21, 7),
(78, '2018-09-17 06:08:51.685827', '3', 'SBM62', 2, '[{\"changed\": {\"name\": \"product price\", \"object\": \"SBM62\", \"fields\": [\"year\"]}}, {\"changed\": {\"name\": \"product price\", \"object\": \"SBM62\", \"fields\": [\"year\"]}}]', 21, 7),
(79, '2018-09-17 06:09:13.938563', '3', 'SBM62', 2, '[{\"changed\": {\"name\": \"product price\", \"object\": \"SBM62\", \"fields\": [\"year\"]}}, {\"changed\": {\"name\": \"product price\", \"object\": \"SBM62\", \"fields\": [\"year\"]}}]', 21, 7),
(80, '2018-09-17 06:46:38.310544', '3', 'Employee', 2, '[]', 32, 7),
(81, '2018-09-18 08:25:18.842470', '3', 'Employee', 2, '[]', 32, 7),
(82, '2018-09-18 09:52:23.265372', '3', 'Employee', 2, '[]', 32, 7);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(3, 'achievement', 'assigngoal'),
(2, 'achievement', 'goal'),
(1, 'achievement', 'goalmatrix'),
(30, 'admin', 'logentry'),
(32, 'auth', 'group'),
(31, 'auth', 'permission'),
(33, 'auth', 'user'),
(4, 'branch', 'branch'),
(34, 'contenttypes', 'contenttype'),
(5, 'country', 'country'),
(6, 'employee', 'employee'),
(8, 'employee', 'employeebranch'),
(9, 'employee', 'employeemedia'),
(7, 'employee', 'employeereport'),
(11, 'insentive', 'insentiveassigned'),
(10, 'insentive', 'insentivematrix'),
(17, 'leads', 'assignleads'),
(13, 'leads', 'department'),
(12, 'leads', 'leadsource'),
(18, 'leads', 'leadstatus'),
(14, 'leads', 'leadstatustype'),
(20, 'leads', 'orderlost'),
(15, 'leads', 'organizationdetails'),
(16, 'leads', 'organizationleaddetails'),
(19, 'leads', 'reasontype'),
(21, 'product', 'product'),
(23, 'product', 'productdepartment'),
(24, 'product', 'productmedia'),
(22, 'product', 'productprice'),
(25, 'region', 'region'),
(38, 'repo', 'departmentwisereport'),
(39, 'repo', 'productwisereport'),
(37, 'repo', 'reportt'),
(44, 'report', 'achievementyearwise'),
(40, 'report', 'departmentwisereport'),
(42, 'report', 'productcontributioncumulative'),
(41, 'report', 'productwisereport'),
(43, 'report', 'quarterlyreport'),
(36, 'report', 'report'),
(28, 'role', 'employeerole'),
(26, 'role', 'role'),
(27, 'role', 'roleprivillage'),
(35, 'sessions', 'session'),
(29, 'taskmaster', 'task');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-09-04 11:46:11.011748'),
(2, 'auth', '0001_initial', '2018-09-04 11:46:18.197964'),
(3, 'admin', '0001_initial', '2018-09-04 11:46:21.327371'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-09-04 11:46:21.375171'),
(5, 'contenttypes', '0002_remove_content_type_name', '2018-09-04 11:46:22.067573'),
(6, 'auth', '0002_alter_permission_name_max_length', '2018-09-04 11:46:22.696574'),
(7, 'auth', '0003_alter_user_email_max_length', '2018-09-04 11:46:23.875577'),
(8, 'auth', '0004_alter_user_username_opts', '2018-09-04 11:46:23.954577'),
(9, 'auth', '0005_alter_user_last_login_null', '2018-09-04 11:46:24.441178'),
(10, 'auth', '0006_require_contenttypes_0002', '2018-09-04 11:46:24.487978'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2018-09-04 11:46:24.551378'),
(12, 'auth', '0008_alter_user_username_max_length', '2018-09-04 11:46:25.227180'),
(13, 'sessions', '0001_initial', '2018-09-04 11:46:25.683581'),
(14, 'auth', '0009_group_parent', '2018-09-04 11:46:42.292420'),
(15, 'country', '0001_initial', '2018-09-04 11:47:39.906748'),
(16, 'region', '0001_initial', '2018-09-04 11:47:42.029753'),
(17, 'branch', '0001_initial', '2018-09-04 11:47:43.004955'),
(18, 'leads', '0001_initial', '2018-09-04 11:47:51.652974'),
(19, 'product', '0001_initial', '2018-09-04 11:47:55.963383'),
(20, 'employee', '0001_initial', '2018-09-04 11:48:04.103602'),
(21, 'achievement', '0001_initial', '2018-09-04 11:48:05.582005'),
(22, 'achievement', '0002_auto_20180904_1717', '2018-09-04 11:48:15.485428'),
(23, 'insentive', '0001_initial', '2018-09-04 11:48:18.868435'),
(24, 'leads', '0002_auto_20180904_1717', '2018-09-04 11:48:28.377258'),
(25, 'taskmaster', '0001_initial', '2018-09-04 11:48:30.155061'),
(26, 'leads', '0003_auto_20180904_1743', '2018-09-04 12:13:54.382964'),
(27, 'product', '0002_remove_product_unit', '2018-09-04 12:30:38.436876'),
(28, 'product', '0003_product_unit', '2018-09-04 12:30:39.221486'),
(29, 'product', '0004_remove_product_unit', '2018-09-04 12:31:05.697558'),
(30, 'leads', '0004_auto_20180904_1803', '2018-09-04 12:33:52.139339'),
(31, 'employee', '0002_auto_20180904_1806', '2018-09-04 12:36:57.472392'),
(32, 'employee', '0003_auto_20180904_1809', '2018-09-04 12:40:02.003775'),
(33, 'employee', '0004_remove_employeebranch_employee', '2018-09-04 12:40:58.067528'),
(34, 'employee', '0005_employeebranch_employee', '2018-09-04 12:47:30.092837'),
(35, 'employee', '0006_remove_employeebranch_employee', '2018-09-05 05:32:18.859522'),
(36, 'leads', '0005_auto_20180905_1140', '2018-09-05 06:10:50.054817'),
(37, 'leads', '0006_auto_20180905_1214', '2018-09-05 06:44:23.941770'),
(38, 'leads', '0007_auto_20180905_1214', '2018-09-05 06:44:58.629689'),
(39, 'leads', '0008_auto_20180906_0929', '2018-09-06 03:59:12.191503'),
(40, 'employee', '0007_employeebranch_employee', '2018-09-10 04:52:19.245354'),
(41, 'report', '0001_initial', '2018-09-12 10:55:04.493798'),
(42, 'report', '0002_report_product_name', '2018-09-12 10:57:08.920915'),
(43, 'repo', '0001_initial', '2018-09-12 11:08:01.568244'),
(44, 'repo', '0002_auto_20180912_1640', '2018-09-12 11:10:25.071452'),
(45, 'repo', '0003_auto_20180912_1642', '2018-09-12 11:12:57.518172'),
(46, 'repo', '0004_auto_20180912_1647', '2018-09-12 11:17:58.218571'),
(47, 'repo', '0005_remove_reportt_product_namee', '2018-09-12 11:19:41.829937'),
(48, 'repo', '0006_departmentwisereport_productwisereport', '2018-09-12 11:22:19.365791'),
(49, 'repo', '0007_auto_20180912_1652', '2018-09-12 11:23:02.139960'),
(50, 'repo', '0008_delete_reportt', '2018-09-12 11:24:30.930794'),
(51, 'repo', '0009_auto_20180912_1716', '2018-09-12 11:47:14.048286'),
(52, 'report', '0003_auto_20180912_1716', '2018-09-12 11:47:14.702293'),
(53, 'leads', '0009_auto_20180917_1215', '2018-09-17 06:46:10.115727'),
(54, 'report', '0004_productcontributioncumulative', '2018-09-17 06:46:10.342529'),
(55, 'report', '0005_quarterlyreport', '2018-09-18 08:24:33.984724'),
(56, 'report', '0006_achievementyearwise', '2018-09-18 09:51:17.788036'),
(57, 'employee', '0008_remove_employeebranch_employee', '2018-09-19 12:47:56.859053'),
(58, 'employee', '0009_employeebranch_employee', '2018-09-19 13:09:06.663042'),
(59, 'employee', '0010_remove_employeebranch_employee', '2018-09-19 13:11:43.662771');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7d48isty0n0f1305fbt2dfq1l5miuzk2', 'MjcxMmJkYzUwYzBkMzFiODJiOGNkYzIxZjY1ODAyZmM4YTg2Y2ZiNzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZmMzOTg0NzYwZjg1NzcwNjliM2ZiODRiMjQyMzk4OTEyYzZhNzBkIn0=', '2018-09-21 10:37:37.954615');

-- --------------------------------------------------------

--
-- Table structure for table `employee_employee`
--

CREATE TABLE `employee_employee` (
  `id` int(11) NOT NULL,
  `mobile` varchar(251) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `address` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_employee`
--

INSERT INTO `employee_employee` (`id`, `mobile`, `gender`, `photo`, `address`, `created_at`, `updated_at`, `created_by_id`, `user_id`) VALUES
(1, '7878787878', 'male', 'image/employee/profile/Lighthouse.jpg', 's', '2018-09-04 12:41:01.075376', '2018-09-04 12:41:01.075376', 1, 2),
(2, '7878787878', 'male', 'image/employee/profile/Jellyfish_GtcTQm4.jpg', 'Kandivali', '2018-09-04 12:41:53.130214', '2018-09-04 12:41:53.130214', 1, 3),
(3, '7878787878', 'male', 'image/employee/profile/Lighthouse_q7l9YAJ.jpg', 'Kandivali', '2018-09-04 12:42:56.187831', '2018-09-04 12:42:56.187831', 1, 4),
(4, '7878787878', 'male', 'image/employee/profile/Lighthouse_ib8zONz.jpg', 'Allahabad', '2018-09-04 12:43:44.255316', '2018-09-04 12:43:44.255316', 1, 5),
(5, '7878787878', 'male', 'image/employee/profile/Lighthouse_CVt4317.jpg', 'Allahabad', '2018-09-04 12:44:51.538635', '2018-09-04 12:44:51.538635', 1, 6),
(6, '7878787878', 'male', 'image/employee/profile/Lighthouse_B8mlzkg.jpg', 'Kandivali', '2018-09-04 12:45:45.469342', '2018-09-04 12:45:45.469342', 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `employee_employeebranch`
--

CREATE TABLE `employee_employeebranch` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_employeebranch`
--

INSERT INTO `employee_employeebranch` (`id`, `created_at`, `updated_at`, `branch_id`, `user_id`) VALUES
(1, '2018-09-04 12:41:01.076376', '2018-09-10 04:52:43.249909', 1, 2),
(2, '2018-09-04 12:41:53.131214', '2018-09-10 04:53:03.558052', 2, 3),
(3, '2018-09-04 12:42:56.188831', '2018-09-10 05:34:53.046511', 2, 4),
(4, '2018-09-04 12:43:44.316320', '2018-09-10 04:53:20.286982', 1, 5),
(5, '2018-09-04 12:44:51.539635', '2018-09-10 04:53:26.743627', 1, 6),
(6, '2018-09-04 12:45:45.542347', '2018-09-10 04:53:13.360724', 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `employee_employeemedia`
--

CREATE TABLE `employee_employeemedia` (
  `id` int(11) NOT NULL,
  `mediaType` varchar(50) NOT NULL,
  `mediaUrl` longtext NOT NULL,
  `activityType` varchar(200) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_employeereport`
--

CREATE TABLE `employee_employeereport` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `report_to_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insentive_insentiveassigned`
--

CREATE TABLE `insentive_insentiveassigned` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `insentive_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insentive_insentivematrix`
--

CREATE TABLE `insentive_insentivematrix` (
  `id` int(11) NOT NULL,
  `activities` varchar(500) NOT NULL,
  `target` int(11) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `weightage_points` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leads_assignleads`
--

CREATE TABLE `leads_assignleads` (
  `id` int(11) NOT NULL,
  `remarks` longtext,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `assignTo_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leads_assignleads`
--

INSERT INTO `leads_assignleads` (`id`, `remarks`, `status`, `created_at`, `updated_at`, `assignTo_id`, `lead_id`) VALUES
(1, 'Amit Remarks', 0, '2018-09-04 12:51:20.880172', '2018-09-04 12:51:20.880172', 3, 1),
(2, 'Amit Remarks', 1, '2018-09-04 12:52:07.542453', '2018-09-04 12:52:07.542453', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `leads_department`
--

CREATE TABLE `leads_department` (
  `id` int(11) NOT NULL,
  `department` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leads_department`
--

INSERT INTO `leads_department` (`id`, `department`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sales', 1, '2018-09-04 11:52:27.553062', '2018-09-04 11:52:27.553062'),
(2, 'AMC', 1, '2018-09-04 11:52:34.057438', '2018-09-04 11:52:34.057438'),
(3, 'Service', 1, '2018-09-04 11:52:42.977154', '2018-09-04 11:52:42.977154'),
(4, 'Parts', 1, '2018-09-04 11:52:53.929542', '2018-09-04 11:52:53.929542');

-- --------------------------------------------------------

--
-- Table structure for table `leads_leadsource`
--

CREATE TABLE `leads_leadsource` (
  `id` int(11) NOT NULL,
  `source_name` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leads_leadsource`
--

INSERT INTO `leads_leadsource` (`id`, `source_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Newspaper', 1, '2018-09-04 12:07:34.187534', '2018-09-04 12:07:34.187534'),
(2, 'Social Network', 1, '2018-09-04 12:07:42.396085', '2018-09-04 12:07:42.396085');

-- --------------------------------------------------------

--
-- Table structure for table `leads_leadstatus`
--

CREATE TABLE `leads_leadstatus` (
  `id` int(11) NOT NULL,
  `remarks` longtext,
  `description` longtext,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `assignedLead_id` int(11) DEFAULT NULL,
  `lead_status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leads_leadstatus`
--

INSERT INTO `leads_leadstatus` (`id`, `remarks`, `description`, `status`, `created_at`, `updated_at`, `assignedLead_id`, `lead_status_id`) VALUES
(1, NULL, NULL, 1, '2018-09-04 12:51:20.920174', '2018-09-04 12:51:20.920174', 1, NULL),
(2, NULL, NULL, 1, '2018-09-04 12:52:07.548453', '2018-09-04 12:52:07.548453', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leads_leadstatustype`
--

CREATE TABLE `leads_leadstatustype` (
  `id` int(11) NOT NULL,
  `status_type` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `isEditable` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leads_leadstatustype`
--

INSERT INTO `leads_leadstatustype` (`id`, `status_type`, `status`, `isEditable`, `created_at`, `updated_at`) VALUES
(1, 'Pending', 1, 0, '2018-09-04 12:00:50.205633', '2018-09-04 12:00:50.205633'),
(2, 'Completed', 1, 0, '2018-09-04 12:00:58.837414', '2018-09-04 12:00:58.837414'),
(3, 'Progress', 1, 0, '2018-09-04 12:01:03.596505', '2018-09-04 12:01:03.596505');

-- --------------------------------------------------------

--
-- Table structure for table `leads_orderlost`
--

CREATE TABLE `leads_orderlost` (
  `id` int(11) NOT NULL,
  `remarks` longtext,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `reasontye_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leads_organizationdetails`
--

CREATE TABLE `leads_organizationdetails` (
  `id` int(11) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `organisation_name` varchar(250) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `address` longtext,
  `website` varchar(500) DEFAULT NULL,
  `description` longtext,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leads_organizationdetails`
--

INSERT INTO `leads_organizationdetails` (`id`, `first_name`, `last_name`, `organisation_name`, `phone`, `mobile`, `fax`, `email`, `address`, `website`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Asim', 'Sagir', 'Technople', '7878747878', '7474787874', '778877', 'asim@technople.in', 'Kandivali', 'www.technople.in', 'IT Company', 1, '2018-09-04 12:11:09.894451', '2018-09-04 12:11:09.894451'),
(2, 'test company', 'test', 'test company', '7878747878', '7474747', '787874', 'test@test.com', 'test', 'www.technople.in', 'test', 1, '2018-09-10 05:32:55.341364', '2018-09-10 05:33:16.493852');

-- --------------------------------------------------------

--
-- Table structure for table `leads_organizationleaddetails`
--

CREATE TABLE `leads_organizationleaddetails` (
  `id` int(11) NOT NULL,
  `contact_person` varchar(250) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `lead_title` varchar(250) DEFAULT NULL,
  `convert` int(11) NOT NULL,
  `discount` double DEFAULT NULL,
  `description` longtext,
  `meeting_date` date DEFAULT NULL,
  `lead_closed_date` date DEFAULT NULL,
  `selling_price` double DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `lead_source_id` int(11) DEFAULT NULL,
  `organisation_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leads_organizationleaddetails`
--

INSERT INTO `leads_organizationleaddetails` (`id`, `contact_person`, `mobile`, `email`, `lead_title`, `convert`, `discount`, `description`, `meeting_date`, `lead_closed_date`, `selling_price`, `status`, `created_at`, `updated_at`, `branch_id`, `department_id`, `lead_source_id`, `organisation_id`, `product_id`) VALUES
(1, 'Asim', '78787878787', 'asim@technople.in', 'Purchase of SBM', 1, 0, 'Desc', '2018-09-04', '2018-09-04', 45, 1, '2018-09-04 12:33:58.297726', '2018-09-10 05:35:53.846860', 2, 1, 1, 1, 2),
(2, 'Aditya', '78787878787', 'aditya@technople.in', 'Sales Aditya', 1, 50, '55', '2018-09-10', '2018-08-10', 45, 1, '2018-09-10 05:34:02.875253', '2018-09-10 05:35:25.533676', 2, 1, 1, 2, 3),
(3, 'd', '7474787874', 'aditya@technople.in', 'Maintenance', 1, 32, 'desc', '2018-09-10', '2017-09-10', 40, 1, '2018-09-10 05:36:40.588842', '2018-09-10 05:36:40.588842', 1, 2, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `leads_reasontype`
--

CREATE TABLE `leads_reasontype` (
  `id` int(11) NOT NULL,
  `reason` varchar(250) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_product`
--

CREATE TABLE `product_product` (
  `id` int(11) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `product_code` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_product`
--

INSERT INTO `product_product` (`id`, `product_name`, `product_code`, `status`, `created_at`, `updated_at`, `parent_id`) VALUES
(1, 'SBM52', 'SBM52', 1, '2018-09-04 12:09:04.535820', '2018-09-12 07:35:30.192632', NULL),
(2, 'SBM42', 'SBM42', 1, '2018-09-04 12:09:29.576154', '2018-09-04 12:09:41.455884', 1),
(3, 'SBM62', 'SBM62', 1, '2018-09-17 06:08:08.298962', '2018-09-17 06:09:13.921562', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_productdepartment`
--

CREATE TABLE `product_productdepartment` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_productdepartment`
--

INSERT INTO `product_productdepartment` (`id`, `status`, `created_at`, `updated_at`, `department_id`, `product_id`) VALUES
(1, 1, '2018-09-04 12:09:04.557821', '2018-09-04 12:09:04.557821', 1, 1),
(3, 1, '2018-09-05 06:21:47.114527', '2018-09-05 06:21:47.114527', 2, 1),
(4, 1, '2018-09-04 12:09:29.597156', '2018-09-04 12:09:29.597156', 1, 2),
(5, 1, '2018-09-17 06:08:08.307963', '2018-09-17 06:08:08.307963', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_productmedia`
--

CREATE TABLE `product_productmedia` (
  `id` int(11) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_productmedia`
--

INSERT INTO `product_productmedia` (`id`, `photo`, `created_at`, `updated_at`, `product_id`) VALUES
(1, 'image/product/Hydrangeas_5M7Ofwv.jpg', '2018-09-04 12:09:04.562821', '2018-09-04 12:09:04.562821', 1),
(2, 'image/product/Penguins.jpg', '2018-09-04 12:09:29.673160', '2018-09-04 12:09:29.673160', 2),
(3, 'image/product/Desert.jpg', '2018-09-17 06:08:08.321964', '2018-09-17 06:08:08.322964', 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_productprice`
--

CREATE TABLE `product_productprice` (
  `id` int(11) NOT NULL,
  `price` double NOT NULL,
  `year` date NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_productprice`
--

INSERT INTO `product_productprice` (`id`, `price`, `year`, `status`, `created_at`, `updated_at`, `product_id`) VALUES
(1, 42, '2018-09-04', 1, '2018-09-04 12:09:04.553821', '2018-09-04 12:09:04.553821', 1),
(2, 100, '2018-09-04', 1, '2018-09-04 12:09:29.593155', '2018-09-04 12:09:29.593155', 2),
(3, 40, '2017-09-12', 0, '2018-09-12 07:35:30.204632', '2018-09-12 07:35:30.204632', 1),
(4, 35, '2018-09-17', 1, '2018-09-17 06:08:08.306963', '2018-09-17 06:09:13.937563', 3),
(5, 30, '2017-09-17', 1, '2018-09-17 06:08:30.302473', '2018-09-17 06:09:13.937563', 3);

-- --------------------------------------------------------

--
-- Table structure for table `region_region`
--

CREATE TABLE `region_region` (
  `id` int(11) NOT NULL,
  `region_name` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `country_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `region_region`
--

INSERT INTO `region_region` (`id`, `region_name`, `status`, `created_at`, `updated_at`, `country_id`, `created_by_id`, `parent_id`) VALUES
(1, 'UP', 1, '2018-09-04 11:50:04.742980', '2018-09-04 11:50:04.742980', 1, 1, NULL),
(2, 'Mumbai', 1, '2018-09-04 11:50:04.754981', '2018-09-04 11:50:04.754981', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `report_achievementyearwise`
--

CREATE TABLE `report_achievementyearwise` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report_departmentwisereport`
--

CREATE TABLE `report_departmentwisereport` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report_productcontributioncumulative`
--

CREATE TABLE `report_productcontributioncumulative` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report_productwisereport`
--

CREATE TABLE `report_productwisereport` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report_quarterlyreport`
--

CREATE TABLE `report_quarterlyreport` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `taskmaster_task`
--

CREATE TABLE `taskmaster_task` (
  `id` int(11) NOT NULL,
  `task_name` varchar(250) NOT NULL,
  `action_plan` longtext NOT NULL,
  `remarks` longtext,
  `financial_year` varchar(10) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievement_assigngoal`
--
ALTER TABLE `achievement_assigngoal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `achievement_assigngoal_assignTo_id_5c09798c` (`assignTo_id`),
  ADD KEY `achievement_assigngoal_branch_id_2e9179e7_fk_branch_branch_id` (`branch_id`),
  ADD KEY `achievement_assigngoal_goal_id_16356ebe_fk_achievement_goal_id` (`goal_id`);

--
-- Indexes for table `achievement_goal`
--
ALTER TABLE `achievement_goal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `achievement_goal_created_by_id_2d965818_fk_auth_user_id` (`created_by_id`),
  ADD KEY `achievement_goal_department_id_ff0e27c8_fk_leads_department_id` (`department_id`),
  ADD KEY `achievement_goal_goal_matrix_id_ba2b3aaf_fk_achieveme` (`goal_matrix_id`),
  ADD KEY `achievement_goal_parent_id_94b5e710_fk_achievement_goal_id` (`parent_id`),
  ADD KEY `achievement_goal_product_id_ea15a814_fk_product_product_id` (`product_id`);

--
-- Indexes for table `achievement_goalmatrix`
--
ALTER TABLE `achievement_goalmatrix`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `auth_group_parent_id_f0431fe8_fk_auth_group_id` (`parent_id`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `branch_branch`
--
ALTER TABLE `branch_branch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_branch_region_id_bf1732fb_fk_region_region_id` (`region_id`);

--
-- Indexes for table `country_country`
--
ALTER TABLE `country_country`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_country_created_by_id_7c5627ee_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `employee_employee`
--
ALTER TABLE `employee_employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `employee_employee_created_by_id_f991820c_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `employee_employeebranch`
--
ALTER TABLE `employee_employeebranch`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `employee_employeebranch_branch_id_d2deeb4e_fk_branch_branch_id` (`branch_id`);

--
-- Indexes for table `employee_employeemedia`
--
ALTER TABLE `employee_employeemedia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_employeemed_employee_id_3e6fccdc_fk_employee_` (`employee_id`);

--
-- Indexes for table `employee_employeereport`
--
ALTER TABLE `employee_employeereport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_employeerep_employee_id_4eb476fc_fk_employee_` (`employee_id`),
  ADD KEY `employee_employeerep_report_to_id_7dcaf5f6_fk_employee_` (`report_to_id`);

--
-- Indexes for table `insentive_insentiveassigned`
--
ALTER TABLE `insentive_insentiveassigned`
  ADD PRIMARY KEY (`id`),
  ADD KEY `insentive_insentivea_insentive_id_07713094_fk_insentive` (`insentive_id`),
  ADD KEY `insentive_insentiveassigned_role_id_8a074b17_fk_auth_group_id` (`role_id`);

--
-- Indexes for table `insentive_insentivematrix`
--
ALTER TABLE `insentive_insentivematrix`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads_assignleads`
--
ALTER TABLE `leads_assignleads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_assignleads_lead_id_92abf28a_fk_leads_org` (`lead_id`),
  ADD KEY `leads_assignleads_assignTo_id_a2127b86_fk_employee_employee_id` (`assignTo_id`);

--
-- Indexes for table `leads_department`
--
ALTER TABLE `leads_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads_leadsource`
--
ALTER TABLE `leads_leadsource`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads_leadstatus`
--
ALTER TABLE `leads_leadstatus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_leadstatus_assignedLead_id_5740e61c_fk_leads_ass` (`assignedLead_id`),
  ADD KEY `leads_leadstatus_lead_status_id_5b53b6e3_fk_leads_lea` (`lead_status_id`);

--
-- Indexes for table `leads_leadstatustype`
--
ALTER TABLE `leads_leadstatustype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads_orderlost`
--
ALTER TABLE `leads_orderlost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_orderlost_lead_id_14765ef7_fk_leads_org` (`lead_id`),
  ADD KEY `leads_orderlost_reasontye_id_e64dfefd_fk_leads_reasontype_id` (`reasontye_id`);

--
-- Indexes for table `leads_organizationdetails`
--
ALTER TABLE `leads_organizationdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads_organizationleaddetails`
--
ALTER TABLE `leads_organizationleaddetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_organizationle_branch_id_9f6d01ed_fk_branch_br` (`branch_id`),
  ADD KEY `leads_organizationle_department_id_a006f397_fk_leads_dep` (`department_id`),
  ADD KEY `leads_organizationle_organisation_id_a0cd5667_fk_leads_org` (`organisation_id`),
  ADD KEY `leads_organizationleaddetails_product_id_468692e6` (`product_id`),
  ADD KEY `leads_organizationle_lead_source_id_d73b8237_fk_leads_lea` (`lead_source_id`);

--
-- Indexes for table `leads_reasontype`
--
ALTER TABLE `leads_reasontype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_product`
--
ALTER TABLE `product_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_product_parent_id_01fef757_fk_product_product_id` (`parent_id`);

--
-- Indexes for table `product_productdepartment`
--
ALTER TABLE `product_productdepartment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_productdepar_department_id_c1b4ae3e_fk_leads_dep` (`department_id`),
  ADD KEY `product_productdepar_product_id_ef788c2c_fk_product_p` (`product_id`);

--
-- Indexes for table `product_productmedia`
--
ALTER TABLE `product_productmedia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_productmedia_product_id_b83ecd16_fk_product_product_id` (`product_id`);

--
-- Indexes for table `product_productprice`
--
ALTER TABLE `product_productprice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_productprice_product_id_6ffe95b7_fk_product_product_id` (`product_id`);

--
-- Indexes for table `region_region`
--
ALTER TABLE `region_region`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_region_country_id_bab38730_fk_country_country_id` (`country_id`),
  ADD KEY `region_region_created_by_id_61ed3cb2_fk_auth_user_id` (`created_by_id`),
  ADD KEY `region_region_parent_id_ad885a67_fk_region_region_id` (`parent_id`);

--
-- Indexes for table `report_achievementyearwise`
--
ALTER TABLE `report_achievementyearwise`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_departmentwisereport`
--
ALTER TABLE `report_departmentwisereport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_productcontributioncumulative`
--
ALTER TABLE `report_productcontributioncumulative`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_productwisereport`
--
ALTER TABLE `report_productwisereport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_quarterlyreport`
--
ALTER TABLE `report_quarterlyreport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taskmaster_task`
--
ALTER TABLE `taskmaster_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taskmaster_task_branch_id_41847330_fk_branch_branch_id` (`branch_id`),
  ADD KEY `taskmaster_task_employee_id_d05aa71a_fk_employee_employee_id` (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievement_assigngoal`
--
ALTER TABLE `achievement_assigngoal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `achievement_goal`
--
ALTER TABLE `achievement_goal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `achievement_goalmatrix`
--
ALTER TABLE `achievement_goalmatrix`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch_branch`
--
ALTER TABLE `branch_branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `country_country`
--
ALTER TABLE `country_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `employee_employee`
--
ALTER TABLE `employee_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee_employeebranch`
--
ALTER TABLE `employee_employeebranch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee_employeemedia`
--
ALTER TABLE `employee_employeemedia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_employeereport`
--
ALTER TABLE `employee_employeereport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insentive_insentiveassigned`
--
ALTER TABLE `insentive_insentiveassigned`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insentive_insentivematrix`
--
ALTER TABLE `insentive_insentivematrix`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads_assignleads`
--
ALTER TABLE `leads_assignleads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `leads_department`
--
ALTER TABLE `leads_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leads_leadsource`
--
ALTER TABLE `leads_leadsource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `leads_leadstatus`
--
ALTER TABLE `leads_leadstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `leads_leadstatustype`
--
ALTER TABLE `leads_leadstatustype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leads_orderlost`
--
ALTER TABLE `leads_orderlost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads_organizationdetails`
--
ALTER TABLE `leads_organizationdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `leads_organizationleaddetails`
--
ALTER TABLE `leads_organizationleaddetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leads_reasontype`
--
ALTER TABLE `leads_reasontype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_product`
--
ALTER TABLE `product_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_productdepartment`
--
ALTER TABLE `product_productdepartment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_productmedia`
--
ALTER TABLE `product_productmedia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_productprice`
--
ALTER TABLE `product_productprice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `region_region`
--
ALTER TABLE `region_region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report_achievementyearwise`
--
ALTER TABLE `report_achievementyearwise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_departmentwisereport`
--
ALTER TABLE `report_departmentwisereport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_productcontributioncumulative`
--
ALTER TABLE `report_productcontributioncumulative`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_productwisereport`
--
ALTER TABLE `report_productwisereport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_quarterlyreport`
--
ALTER TABLE `report_quarterlyreport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taskmaster_task`
--
ALTER TABLE `taskmaster_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `achievement_assigngoal`
--
ALTER TABLE `achievement_assigngoal`
  ADD CONSTRAINT `achievement_assigngo_assignTo_id_5c09798c_fk_employee_` FOREIGN KEY (`assignTo_id`) REFERENCES `employee_employeebranch` (`id`),
  ADD CONSTRAINT `achievement_assigngoal_branch_id_2e9179e7_fk_branch_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branch_branch` (`id`),
  ADD CONSTRAINT `achievement_assigngoal_goal_id_16356ebe_fk_achievement_goal_id` FOREIGN KEY (`goal_id`) REFERENCES `achievement_goal` (`id`);

--
-- Constraints for table `achievement_goal`
--
ALTER TABLE `achievement_goal`
  ADD CONSTRAINT `achievement_goal_created_by_id_2d965818_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `achievement_goal_department_id_ff0e27c8_fk_leads_department_id` FOREIGN KEY (`department_id`) REFERENCES `leads_department` (`id`),
  ADD CONSTRAINT `achievement_goal_goal_matrix_id_ba2b3aaf_fk_achieveme` FOREIGN KEY (`goal_matrix_id`) REFERENCES `achievement_goalmatrix` (`id`),
  ADD CONSTRAINT `achievement_goal_parent_id_94b5e710_fk_achievement_goal_id` FOREIGN KEY (`parent_id`) REFERENCES `achievement_goal` (`id`),
  ADD CONSTRAINT `achievement_goal_product_id_ea15a814_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`);

--
-- Constraints for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD CONSTRAINT `auth_group_parent_id_f0431fe8_fk_auth_group_id` FOREIGN KEY (`parent_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `branch_branch`
--
ALTER TABLE `branch_branch`
  ADD CONSTRAINT `branch_branch_region_id_bf1732fb_fk_region_region_id` FOREIGN KEY (`region_id`) REFERENCES `region_region` (`id`);

--
-- Constraints for table `country_country`
--
ALTER TABLE `country_country`
  ADD CONSTRAINT `country_country_created_by_id_7c5627ee_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employee_employee`
--
ALTER TABLE `employee_employee`
  ADD CONSTRAINT `employee_employee_created_by_id_f991820c_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `employee_employee_user_id_2dd26fdc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employee_employeebranch`
--
ALTER TABLE `employee_employeebranch`
  ADD CONSTRAINT `employee_employeebranch_branch_id_d2deeb4e_fk_branch_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branch_branch` (`id`),
  ADD CONSTRAINT `employee_employeebranch_user_id_e95fa40c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employee_employeemedia`
--
ALTER TABLE `employee_employeemedia`
  ADD CONSTRAINT `employee_employeemed_employee_id_3e6fccdc_fk_employee_` FOREIGN KEY (`employee_id`) REFERENCES `employee_employee` (`id`);

--
-- Constraints for table `employee_employeereport`
--
ALTER TABLE `employee_employeereport`
  ADD CONSTRAINT `employee_employeerep_employee_id_4eb476fc_fk_employee_` FOREIGN KEY (`employee_id`) REFERENCES `employee_employee` (`id`),
  ADD CONSTRAINT `employee_employeerep_report_to_id_7dcaf5f6_fk_employee_` FOREIGN KEY (`report_to_id`) REFERENCES `employee_employee` (`id`);

--
-- Constraints for table `insentive_insentiveassigned`
--
ALTER TABLE `insentive_insentiveassigned`
  ADD CONSTRAINT `insentive_insentivea_insentive_id_07713094_fk_insentive` FOREIGN KEY (`insentive_id`) REFERENCES `insentive_insentivematrix` (`id`),
  ADD CONSTRAINT `insentive_insentiveassigned_role_id_8a074b17_fk_auth_group_id` FOREIGN KEY (`role_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `leads_assignleads`
--
ALTER TABLE `leads_assignleads`
  ADD CONSTRAINT `leads_assignleads_assignTo_id_a2127b86_fk_employee_employee_id` FOREIGN KEY (`assignTo_id`) REFERENCES `employee_employee` (`id`),
  ADD CONSTRAINT `leads_assignleads_lead_id_92abf28a_fk_leads_org` FOREIGN KEY (`lead_id`) REFERENCES `leads_organizationleaddetails` (`id`);

--
-- Constraints for table `leads_leadstatus`
--
ALTER TABLE `leads_leadstatus`
  ADD CONSTRAINT `leads_leadstatus_assignedLead_id_5740e61c_fk_leads_ass` FOREIGN KEY (`assignedLead_id`) REFERENCES `leads_assignleads` (`id`),
  ADD CONSTRAINT `leads_leadstatus_lead_status_id_5b53b6e3_fk_leads_lea` FOREIGN KEY (`lead_status_id`) REFERENCES `leads_leadstatustype` (`id`);

--
-- Constraints for table `leads_orderlost`
--
ALTER TABLE `leads_orderlost`
  ADD CONSTRAINT `leads_orderlost_lead_id_14765ef7_fk_leads_org` FOREIGN KEY (`lead_id`) REFERENCES `leads_organizationleaddetails` (`id`),
  ADD CONSTRAINT `leads_orderlost_reasontye_id_e64dfefd_fk_leads_reasontype_id` FOREIGN KEY (`reasontye_id`) REFERENCES `leads_reasontype` (`id`);

--
-- Constraints for table `leads_organizationleaddetails`
--
ALTER TABLE `leads_organizationleaddetails`
  ADD CONSTRAINT `leads_organizationle_branch_id_9f6d01ed_fk_branch_br` FOREIGN KEY (`branch_id`) REFERENCES `branch_branch` (`id`),
  ADD CONSTRAINT `leads_organizationle_department_id_a006f397_fk_leads_dep` FOREIGN KEY (`department_id`) REFERENCES `leads_department` (`id`),
  ADD CONSTRAINT `leads_organizationle_lead_source_id_d73b8237_fk_leads_lea` FOREIGN KEY (`lead_source_id`) REFERENCES `leads_leadsource` (`id`),
  ADD CONSTRAINT `leads_organizationle_organisation_id_a0cd5667_fk_leads_org` FOREIGN KEY (`organisation_id`) REFERENCES `leads_organizationdetails` (`id`),
  ADD CONSTRAINT `leads_organizationle_product_id_468692e6_fk_product_p` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`);

--
-- Constraints for table `product_product`
--
ALTER TABLE `product_product`
  ADD CONSTRAINT `product_product_parent_id_01fef757_fk_product_product_id` FOREIGN KEY (`parent_id`) REFERENCES `product_product` (`id`);

--
-- Constraints for table `product_productdepartment`
--
ALTER TABLE `product_productdepartment`
  ADD CONSTRAINT `product_productdepar_department_id_c1b4ae3e_fk_leads_dep` FOREIGN KEY (`department_id`) REFERENCES `leads_department` (`id`),
  ADD CONSTRAINT `product_productdepar_product_id_ef788c2c_fk_product_p` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`);

--
-- Constraints for table `product_productmedia`
--
ALTER TABLE `product_productmedia`
  ADD CONSTRAINT `product_productmedia_product_id_b83ecd16_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`);

--
-- Constraints for table `product_productprice`
--
ALTER TABLE `product_productprice`
  ADD CONSTRAINT `product_productprice_product_id_6ffe95b7_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`);

--
-- Constraints for table `region_region`
--
ALTER TABLE `region_region`
  ADD CONSTRAINT `region_region_country_id_bab38730_fk_country_country_id` FOREIGN KEY (`country_id`) REFERENCES `country_country` (`id`),
  ADD CONSTRAINT `region_region_created_by_id_61ed3cb2_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `region_region_parent_id_ad885a67_fk_region_region_id` FOREIGN KEY (`parent_id`) REFERENCES `region_region` (`id`);

--
-- Constraints for table `taskmaster_task`
--
ALTER TABLE `taskmaster_task`
  ADD CONSTRAINT `taskmaster_task_branch_id_41847330_fk_branch_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branch_branch` (`id`),
  ADD CONSTRAINT `taskmaster_task_employee_id_d05aa71a_fk_employee_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee_employee` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
