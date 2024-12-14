-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2024 at 04:50 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ynh_clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add appointment', 7, 'add_appointment'),
(26, 'Can change appointment', 7, 'change_appointment'),
(27, 'Can delete appointment', 7, 'delete_appointment'),
(28, 'Can view appointment', 7, 'view_appointment'),
(29, 'Can add review', 8, 'add_review'),
(30, 'Can change review', 8, 'change_review'),
(31, 'Can delete review', 8, 'delete_review'),
(32, 'Can view review', 8, 'view_review'),
(33, 'Can add doctor', 9, 'add_doctor'),
(34, 'Can change doctor', 9, 'change_doctor'),
(35, 'Can delete doctor', 9, 'delete_doctor'),
(36, 'Can view doctor', 9, 'view_doctor'),
(37, 'Can add service', 10, 'add_service'),
(38, 'Can change service', 10, 'change_service'),
(39, 'Can delete service', 10, 'delete_service'),
(40, 'Can view service', 10, 'view_service'),
(41, 'Can add info', 11, 'add_info'),
(42, 'Can change info', 11, 'change_info'),
(43, 'Can delete info', 11, 'delete_info'),
(44, 'Can view info', 11, 'view_info');

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
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$wA50orKv2JBqCj4ugswZEH$DZwOBNaAOpyZSHcm8LiCJvhuJRnVRJa7mUgO8hnGmf0=', '2024-12-12 03:33:55.090682', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2024-12-11 12:03:17.693778'),
(3, 'pbkdf2_sha256$600000$EiLUFoA9MTKjptN6Ssz0jn$p4/4VmcI4Wv0aHQIpnRptBWxH038jFiGRzkLINJKz6o=', NULL, 0, 'YuYu', '', '', 'yuyu@gmail.com', 0, 1, '2024-12-11 15:44:10.144984'),
(4, 'pbkdf2_sha256$600000$7nK89FrpDPiipqkQUGoPvn$HYnTYsOvVQP49iMZksDV7SLGb1O+3jRmOhiY8I/Cxgo=', '2024-12-12 03:34:30.925581', 0, 'ElleKim', '', '', 'elle@gmail.com', 0, 1, '2024-12-11 15:50:32.954187');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'myadmin', 'doctor'),
(11, 'myadmin', 'info'),
(10, 'myadmin', 'service'),
(7, 'myapp', 'appointment'),
(8, 'myapp', 'review'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-12-11 11:57:34.504459'),
(2, 'auth', '0001_initial', '2024-12-11 11:57:35.073069'),
(3, 'admin', '0001_initial', '2024-12-11 11:57:35.200636'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-12-11 11:57:35.200636'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-12-11 11:57:35.231296'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-12-11 11:57:35.299364'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-12-11 11:57:35.357882'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-12-11 11:57:35.390251'),
(9, 'auth', '0004_alter_user_username_opts', '2024-12-11 11:57:35.400271'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-12-11 11:57:35.602499'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-12-11 11:57:35.610491'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-12-11 11:57:35.625009'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-12-11 11:57:35.642551'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-12-11 11:57:35.656860'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-12-11 11:57:35.673608'),
(16, 'auth', '0011_update_proxy_permissions', '2024-12-11 11:57:35.689012'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-12-11 11:57:35.703988'),
(18, 'myadmin', '0001_initial', '2024-12-11 11:57:35.720985'),
(19, 'myadmin', '0002_service', '2024-12-11 11:57:35.752057'),
(20, 'myadmin', '0003_info', '2024-12-11 11:57:35.769162'),
(21, 'myapp', '0001_initial', '2024-12-11 11:57:35.895492'),
(22, 'myapp', '0002_userprofile', '2024-12-11 11:57:35.973584'),
(23, 'myapp', '0003_alter_userprofile_health_info_profile', '2024-12-11 11:57:36.084927'),
(24, 'myapp', '0004_delete_imageslider_delete_patient_and_more', '2024-12-11 11:57:36.349380'),
(25, 'sessions', '0001_initial', '2024-12-11 11:57:36.385819'),
(26, 'myadmin', '0004_rename_description_info_description1_and_more', '2024-12-11 12:33:38.115703'),
(27, 'myadmin', '0005_rename_description1_info_avoid_and_more', '2024-12-11 12:41:19.636335'),
(28, 'myapp', '0005_review_rating', '2024-12-11 17:12:30.515428'),
(29, 'myapp', '0006_alter_review_rating', '2024-12-11 17:20:11.515655'),
(30, 'myapp', '0007_alter_review_rating', '2024-12-11 17:30:20.036426'),
(31, 'myapp', '0008_remove_review_email', '2024-12-11 17:43:52.727476'),
(32, 'myapp', '0009_alter_review_review_text', '2024-12-11 17:47:08.566393'),
(33, 'myapp', '0010_remove_review_created_at_review_user_and_more', '2024-12-11 17:51:55.110371'),
(34, 'myapp', '0011_remove_review_user_review_created_at_review_email_and_more', '2024-12-12 02:56:07.414393');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('bwbfqkxvsw270w80u2rv9o1isv6usc8h', '.eJxVjEsOwjAMBe-SNYoa1yEtS_Y9Q-TYDimgVOpnhbg7VOoCtm9m3stE2tYSt0XnOIq5GDSn3y0RP7TuQO5Ub5Plqa7zmOyu2IMudphEn9fD_TsotJRvTajaIykw59Y13KIAE0jTuM57TinljJ7cGQGAesmuk-ARgYI6L8G8PwQ2OEY:1tLZPc:JYPYMo65DMXwCegsu7FVYi040xrZpRBrvoaz97KRIps', '2024-12-26 02:58:48.023278'),
('ukavhv2ex4aucy6051arenyprs82zrke', '.eJxVjEsOwjAMBe-SNYoa1yEtS_Y9Q-TYDimgVOpnhbg7VOoCtm9m3stE2tYSt0XnOIq5GDSn3y0RP7TuQO5Ub5Plqa7zmOyu2IMudphEn9fD_TsotJRvTajaIykw59Y13KIAE0jTuM57TinljJ7cGQGAesmuk-ARgYI6L8G8PwQ2OEY:1tLZPa:RWr3b7JlAmPI_NWFuX1MprxnpBycmhwZH7CZKs4Tukk', '2024-12-26 02:58:46.391319'),
('yzfphc1qh0juot4309ztt1zby5ml57wg', '.eJxVjEsOwjAMBe-SNYoa1yEtS_Y9Q-TYDimgVOpnhbg7VOoCtm9m3stE2tYSt0XnOIq5GDSn3y0RP7TuQO5Ub5Plqa7zmOyu2IMudphEn9fD_TsotJRvTajaIykw59Y13KIAE0jTuM57TinljJ7cGQGAesmuk-ARgYI6L8G8PwQ2OEY:1tLRes:PUgmKOOB7-iRaUx7MzSehqMzlIviaQlOebO3DNNxO1k', '2024-12-25 18:42:02.520333');

-- --------------------------------------------------------

--
-- Table structure for table `myadmin_doctor`
--

CREATE TABLE `myadmin_doctor` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `date_added` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `myadmin_doctor`
--

INSERT INTO `myadmin_doctor` (`id`, `name`, `specialization`, `email`, `phone`, `profile_picture`, `date_added`) VALUES
(2, 'Dr. Alice Wong', 'General Practitioner', 'alice@gmail.com', '0988888888', 'doctor_images/doctor2503.png', '2024-12-11 15:33:05.129609'),
(3, 'Dr. Benjamin Lee', 'Pediatrician', 'ben@gmail.com', '09777777777', 'doctor_images/doctor2505.png', '2024-12-11 15:34:01.424961'),
(4, 'Dr. Clara Martinez', 'Cardiologist', 'clara@gmail.com', '09666666666', 'doctor_images/doctor2501.png', '2024-12-11 15:35:10.152832'),
(5, 'Dr. Lisa Kim', 'Dermatologist', 'lisa@gmail.com', '09555555555', 'doctor_images/doctor2502.png', '2024-12-11 15:35:57.818554'),
(6, 'Dr. Emma Johnson', 'Neurologist', 'emma@gmail.com', '09444444444', 'doctor_images/doctor2504.png', '2024-12-11 15:37:07.225614');

-- --------------------------------------------------------

--
-- Table structure for table `myadmin_info`
--

CREATE TABLE `myadmin_info` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `Avoid` longtext NOT NULL,
  `Risk_Factors` longtext DEFAULT NULL,
  `What_to_Do` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `myadmin_info`
--

INSERT INTO `myadmin_info` (`id`, `name`, `Avoid`, `Risk_Factors`, `What_to_Do`) VALUES
(6, 'General Check-ups', 'Avoid: Neglecting regular check-ups, ignoring early symptoms, and self-medicating without consultation.', 'Risk Factors: Sedentary lifestyle, poor diet, and high-stress levels.', 'What to Do: Schedule regular health screenings, maintain a balanced diet, engage in regular exercise, and monitor any unusual symptoms.'),
(7, 'Pediatric Care', 'Avoid: Delaying vaccinations, exposing children to secondhand smoke, and ignoring developmental milestones.', 'Risk Factors: Poor hygiene practices, lack of nutrition, and inadequate sleep.', 'What to Do: Ensure timely vaccinations, provide a balanced diet, encourage regular physical activity, and follow pediatrician advice for growth and development monitoring.'),
(8, 'Women\'s Health', 'Avoid: Smoking, excessive alcohol consumption, and delaying routine gynecological exams.', 'Risk Factors: Family history of reproductive health issues, poor menstrual hygiene, and high stress.', 'What to Do: Schedule regular gynecological exams, practice safe reproductive health habits, and maintain a healthy weight.'),
(9, 'Chronic Disease Management', 'Avoid: Skipping medications, consuming processed foods, and leading a sedentary lifestyle.', 'Risk Factors: Family history, obesity, and uncontrolled stress.', 'What to Do: Follow prescribed treatment plans, monitor health parameters, eat a nutrient-rich diet, and incorporate physical activity into daily routines.'),
(10, 'Laboratory Services', 'Avoid: Ignoring routine tests, especially if symptomatic or with chronic conditions.', 'Risk Factors: Undiagnosed infections or delayed diagnoses due to skipped testing.', 'What to Do: Use lab services for early detection, follow fasting or other preparatory guidelines for tests, and discuss results with your doctor for timely action.'),
(11, 'Mental Health Services', 'Avoid: Stigmatizing mental health issues, self-isolating, and relying solely on self-help strategies.', 'Risk Factors: Chronic stress, lack of sleep, and substance abuse.', 'What to Do: Seek professional help, maintain open communication with trusted individuals, and practice mindfulness or relaxation techniques.');

-- --------------------------------------------------------

--
-- Table structure for table `myadmin_service`
--

CREATE TABLE `myadmin_service` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `myadmin_service`
--

INSERT INTO `myadmin_service` (`id`, `name`, `description`) VALUES
(2, 'General Check-ups', 'Regular health exams and tests can help find problems before they start. Our general check-ups ensure\r\n                you stay in optimal health.'),
(3, 'Pediatric Care', 'Comprehensive healthcare services for children, from newborns to teenagers. We provide preventive care,\r\n                immunizations, and treatment for illnesses.'),
(4, 'Women\'s Health', 'Specialized care for women’s health needs, including gynecological exams, prenatal and postnatal care,\r\n                and reproductive health services.'),
(5, 'Chronic Disease Management', 'Expert management of chronic conditions such as diabetes, hypertension, and asthma to help you live a\r\n                healthier life.'),
(6, 'Laboratory Services', 'State-of-the-art laboratory services for accurate and timely diagnostic testing, including blood tests,\r\n                urinalysis, and more.'),
(7, 'Mental Health Services', 'Comprehensive mental health care including counseling, therapy, and medication management for a wide\r\n                range of mental health conditions.'),
(8, 'Orthopedic Care', 'Specialized treatment for musculoskeletal injuries and conditions, including fractures, joint replacements, and sports injuries.'),
(9, 'Cardiology', 'Comprehensive heart care services including diagnostic tests, treatment for heart conditions, and\r\n                preventive cardiology.'),
(10, 'Diabetes Care', 'Management and treatment of diabetes through personalized care plans, education, and support to improve\r\n                quality of life.'),
(11, 'Emergency Care', 'Immediate medical attention and treatment for urgent medical conditions and injuries, available 24/7.'),
(12, 'Physical Therapy', 'Rehabilitation services to restore physical function and mobility after injury, surgery, or illness,\r\n                tailored to individual needs.'),
(13, 'Respiratory Care', 'Treatment and management of respiratory conditions such as asthma, COPD, and respiratory infections to\r\n                improve lung health.');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_appointment`
--

CREATE TABLE `myapp_appointment` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `preferred_date` date NOT NULL,
  `preferred_time` time(6) NOT NULL,
  `preferred_doctor` varchar(100) NOT NULL,
  `gender` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `myapp_review`
--

CREATE TABLE `myapp_review` (
  `id` bigint(20) NOT NULL,
  `review_text` longtext NOT NULL,
  `rating` int(10) UNSIGNED NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL
) ;

--
-- Dumping data for table `myapp_review`
--

INSERT INTO `myapp_review` (`id`, `review_text`, `rating`, `created_at`, `email`) VALUES
(12, 'This is pretty good services.', 5, '2024-12-12 03:41:21.853390', 'susu@gmail.com'),
(13, 'This is pretty bad services.', 3, '2024-12-12 03:45:19.523066', 'susu@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

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
-- Indexes for table `myadmin_doctor`
--
ALTER TABLE `myadmin_doctor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `myadmin_info`
--
ALTER TABLE `myadmin_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myadmin_service`
--
ALTER TABLE `myadmin_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_appointment`
--
ALTER TABLE `myapp_appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_review`
--
ALTER TABLE `myapp_review`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `myadmin_doctor`
--
ALTER TABLE `myadmin_doctor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `myadmin_info`
--
ALTER TABLE `myadmin_info`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `myadmin_service`
--
ALTER TABLE `myadmin_service`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `myapp_appointment`
--
ALTER TABLE `myapp_appointment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `myapp_review`
--
ALTER TABLE `myapp_review`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
