-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2019 at 03:36 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_hms`
--
CREATE DATABASE `hospital_hms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hospital_hms`;

-- --------------------------------------------------------

--
-- Table structure for table `accountant`
--

CREATE TABLE `accountant` (
  `accountant_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accountant`
--

INSERT INTO `accountant` (`accountant_id`, `name`, `email`, `password`, `address`, `phone`) VALUES
(1, 'Carol Mendoza', 'cmendoza@student.apc.edu.ph', 'password', 'Taguig, Philippines', '9123456789');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`, `address`, `phone`) VALUES
(1, 'Job Brioso', 'admin@admin.com', 'password', 'Admin Address', '9123456789');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `appointment_timestamp` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `appointment_timestamp`, `doctor_id`, `patient_id`) VALUES
(1, 1449097200, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE `bed` (
  `bed_id` int(11) NOT NULL,
  `bed_number` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` longtext NOT NULL COMMENT 'ward,cabin,ICU',
  `status` int(11) NOT NULL DEFAULT '0',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bed`
--

INSERT INTO `bed` (`bed_id`, `bed_number`, `type`, `status`, `description`) VALUES
(1, 'W1', 'ward', 0, 'ward1'),
(2, 'W2', 'ward', 0, 'ward 2'),
(3, 'I1', 'icu', 0, 'icu 1');

-- --------------------------------------------------------

--
-- Table structure for table `bed_allotment`
--

CREATE TABLE `bed_allotment` (
  `bed_allotment_id` int(11) NOT NULL,
  `bed_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `allotment_timestamp` int(11) NOT NULL,
  `discharge_timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bed_allotment`
--

INSERT INTO `bed_allotment` (`bed_allotment_id`, `bed_id`, `patient_id`, `allotment_timestamp`, `discharge_timestamp`) VALUES
(1, 1, 2, 1449702000, 1449874800);

-- --------------------------------------------------------

--
-- Table structure for table `blood_bank`
--

CREATE TABLE `blood_bank` (
  `blood_group_id` int(11) NOT NULL,
  `blood_group` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blood_bank`
--

INSERT INTO `blood_bank` (`blood_group_id`, `blood_group`, `status`) VALUES
(1, 'A+', '55'),
(2, 'A-', '42'),
(3, 'B+', '98'),
(4, 'B-', '63'),
(5, 'AB+', '47'),
(6, 'AB-', '65'),
(7, 'O+', '28'),
(8, 'O-', '64');

-- --------------------------------------------------------

--
-- Table structure for table `blood_donor`
--

CREATE TABLE `blood_donor` (
  `blood_donor_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `blood_group` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sex` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_donation_timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blood_donor`
--

INSERT INTO `blood_donor` (`blood_donor_id`, `name`, `blood_group`, `sex`, `age`, `phone`, `email`, `address`, `last_donation_timestamp`) VALUES
(1, 'Ariana Grande', 'A+', 'Female', 25, '9123456789', 'arig@student.apc.edu.ph', 'Boca Raton, Florida, United States', 1413237600),
(2, 'Mariah Carey', 'AB+', 'Female', 49, '9123456789', 'mcarey@student.apc.edu.ph', 'Huntington, New York, United States', 0),
(3, 'Marshall Bruce Mathers III', 'AB-', 'Male', 46, '9123456789', 'eminem@student.apc.edu.ph', 'Saint Joseph, Missouri, United States', 0);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `name`, `description`) VALUES
(1, 'Anesthesiology', 'Anesthesiology'),
(2, 'Bacteriological Laboratory', 'Bacteriological Laboratory'),
(3, 'Physical Therapy', 'Physical Therapy'),
(4, 'Plastic Surgery', 'Plastic Surgery'),
(5, 'HIV Surgeon', 'Plastic Surgery');

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis_report`
--

CREATE TABLE `diagnosis_report` (
  `diagnosis_report_id` int(11) NOT NULL,
  `report_type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'xray,blood test',
  `document_type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'text,photo',
  `file_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `laboratorist_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `profile` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `name`, `email`, `password`, `address`, `phone`, `department_id`, `profile`) VALUES
(1, 'Vicki Belo', 'vgbelo@student.apc.edu.ph', 'password', 'Philippines', '9123456789', 2, 'Text'),
(2, 'Hayden Kho', 'hjrkho@student.apc.edu.ph', 'password', 'Philippines', '9123456789', 3, 'Text');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `creation_timestamp` int(11) NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'paid or unpaid'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `patient_id`, `title`, `description`, `amount`, `creation_timestamp`, `status`) VALUES
(1, 1, 'Blood Test', 'Blood Test for Malaria, Nov 2018', 500, 1448985663, 'Unpaid'),
(2, 2, 'Fracture', 'Fracture Bandage.', 1200, 1448985702, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `phrase_id` int(11) NOT NULL,
  `phrase` longtext COLLATE utf8_unicode_ci NOT NULL,
  `English` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Spanish` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Arabe` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Francais` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`phrase_id`, `phrase`, `English`, `Spanish`, `Arabe`, `Francais`) VALUES
(1, 'admin_dashboard', 'admin dashboard', 'panel de administración', 'لوحة أجهزة قياس المشرف', 'interface d\'administration'),
(2, 'login', 'login', 'login', 'دخول', 'S\'identifier'),
(3, 'email', 'email', 'email', 'البريد الإلكتروني', 'email'),
(4, 'password', 'password', 'contraseña', 'كلمة السر', 'mot de passe'),
(5, 'forgot_password?', 'forgot password?', '¿Olvidó su contraseña?', 'هل نسيت كلمة المرور ؟', 'Mot de passe oublié?'),
(6, 'account_type', 'account type', 'Tipo de cuenta', 'نوع الحساب', 'type de compte'),
(7, 'admin', 'admin', 'administración', 'مشرف', 'administrateur'),
(8, 'doctor', 'doctor', 'doctor', 'طبيب', 'médecin'),
(9, 'patient', 'patient', 'paciente', 'المريض', 'patients'),
(10, 'pharmacist', 'pharmacist', 'farmacéutico', 'صيدلي', 'pharmacien'),
(11, 'laboratorist', 'laboratorist,eo', 'laboratorista', 'مدير المختبر', 'laboratorist'),
(12, 'accountant', 'accountant', 'contador', 'محاسب', 'comptable'),
(13, 'monitor_hospital', 'monitor hospital', 'hospital monitor', 'مستشفى رصد', 'hôpital moniteur'),
(14, 'nurse', 'nurse', 'enfermera', 'ممرضة', 'infirmière'),
(15, 'department', 'department', 'departamento', 'قسم', 'département'),
(16, 'dashboard', 'dashboard', 'salpicadero', 'لوحة أجهزة القياس', 'tableau de bord'),
(17, 'settings', 'settings', 'ajustes', 'إعدادات', 'réglages'),
(18, 'profile', 'profile', 'perfil', 'الملف الشخصي', 'profil'),
(19, 'settings_updated', 'settings updated', 'configuración actualizado', 'تحديث إعدادات', 'les paramètres mis à jour'),
(20, 'logout', 'logout', 'logout', 'خروج', 'déconnexion'),
(21, 'logged_out', 'logged out', 'desconectado', 'تسجيل الخروج', 'déconnecté'),
(22, 'reset_password', 'reset password', 'restablecer la contraseña', 'إعادة تعيين كلمة المرور', 'réinitialiser le mot de passe'),
(23, 'reset', 'reset', 'reajustar', 'إعادة تعيين', 'réinitialiser'),
(24, 'account', 'account', 'cuenta', 'حساب', 'considération'),
(25, 'select_language', 'select language', 'seleccionar el idioma', 'اختر اللغة', 'sélectionner la langue'),
(26, 'panel', 'panel', 'panel', 'لوحة', 'panneau'),
(27, 'view_appointment', 'view appointment', 'ver la cita', 'عرض التعيين', 'voir rendez-vous'),
(28, 'view_payment', 'view payment', 'ver pago', 'عرض الدفع', 'voir paiement'),
(29, 'view_bed_status', 'view bed status', 'ver el estado de la cama', 'عرض حالة السرير', 'afficher l\'état du lit'),
(30, 'view_blood_bank', 'view blood bank', 'ver el banco de sangre', 'عرض بنك الدم', 'voir la banque de sang'),
(31, 'view_medicine', 'view medicine', 'ver la medicina', 'نظر إلى الطب', 'voir la médecine'),
(32, 'view_operation', 'view operation', 'ver la operación', 'عرض عملية', 'voir opération'),
(33, 'view_birth_report', 'view birth report', 'ver el informe de nacimiento', 'عرض التقرير الميلاد', 'voir rapport de naissance'),
(34, 'view_death_report', 'view death report', 'ver el informe de la muerte', 'عرض تقرير الوفاة', 'voir rapport de la mort'),
(35, 'manage_email_template', 'manage email template', 'gestión de plantilla de correo electrónico', 'إدارة قالب البريد الإلكتروني', 'gérer modèle de courriel'),
(36, 'manage_noticeboard', 'manage noticeboard', 'gestionar tablón de anuncios', 'إدارة اللافتة', 'gérer panneau d\''),
(37, 'system_settings', 'system settings', 'configuración del sistema', 'إعدادات النظام', 'les paramètres du système'),
(38, 'manage_language', 'manage language', 'gestionar idioma', 'إدارة اللغة', 'gérer langue'),
(39, 'backup_restore', 'backup restore', 'Restaurar copia de seguridad', 'استعادة النسخ الاحتياطي', 'Backup Restore'),
(40, 'appointment', 'appointment', 'nombramiento', 'موعد', 'rendez-vous'),
(41, 'payment', 'payment', 'pago', 'دفع', 'paiement'),
(42, 'blood_bank', 'blood bank', 'banco de sangre', 'بنك الدم', 'la banque de sang'),
(43, 'medicine', 'medicine', 'medicina', 'دواء', 'médecine'),
(44, 'operation_report', 'operation report', 'confirmación de la operación', 'تقرير العملية', 'rapport d\'opération'),
(45, 'birth_report', 'birth report', 'informe nacimiento', 'تقرير الميلاد', 'rapport à la naissance'),
(46, 'death_report', 'death report', 'informe de la muerte', 'تقرير الموت', 'Rapport de mort'),
(47, 'bed_allotment', 'bed allotment', 'asignación de cama', 'تخصيص سرير', 'attribution de lit'),
(48, 'noticeboard', 'noticeboard', 'noticeboard', 'اللافتة', 'Panneau d\'affichage'),
(49, 'language', 'language', 'idioma', 'لغة', 'langue'),
(50, 'backup', 'backup', 'copia de seguridad', 'النسخ الاحتياطي', 'sauvegarder'),
(51, 'calendar_schedule', 'calendar schedule', 'horario de calendario', 'جدول التقويم', 'calendrier calendrier'),
(52, 'manage_department', 'manage department', 'gestionar departamento', 'إدارة قسم', 'gérer département'),
(53, 'department_list', 'department list', 'Lista departamento', 'قائمة وزارة', 'Liste département'),
(54, 'add_department', 'add department', 'añadir departamento', 'إضافة قسم', 'ajouter département'),
(55, 'department_name', 'department name', 'nombre del departamento', 'اسم القسم', 'nom du département'),
(56, 'description', 'description', 'descripción', 'وصف', 'Description'),
(57, 'options', 'options', 'Opciones', 'خيارات', 'les options'),
(58, 'edit', 'edit', 'editar', 'تعديل', 'éditer'),
(59, 'delete', 'delete', 'borrar', 'حذف', 'supprimer'),
(60, 'department_description', 'department description', 'Descripción del departamento', 'وصف قسم', 'Description département'),
(61, 'manage_doctor', 'manage doctor', 'gestionar médico', 'إدارة الطبيب', 'gérer médecin'),
(62, 'doctor_list', 'doctor list', 'Lista médico', 'قائمة الطبيب', 'liste de racle'),
(63, 'add_doctor', 'add doctor', 'añadir médico', 'طبيب جديد', 'ajouter médecin'),
(64, 'doctor_name', 'doctor name', 'Nombre del médico', 'اسم الطبيب', 'Nom du médecin'),
(65, 'name', 'name', 'nombre', 'اسم', 'Nom'),
(66, 'address', 'address', 'dirección', 'عنوان', 'Adresse'),
(67, 'phone', 'phone', 'teléfono', 'هاتف', 'téléphone'),
(68, 'manage_patient', 'manage patient', 'gestionar paciente', 'إدارة المريض', 'gérer les patients'),
(69, 'patient_list', 'patient list', 'lista de pacientes', 'قائمة المريض', 'liste des patients'),
(70, 'add_patient', 'add patient', 'añadir paciente', 'إضافة مريض', 'ajouter patients'),
(71, 'patient_name', 'patient name', 'Nombre del paciente', 'اسم المريض', 'le nom du patient'),
(72, 'age', 'age', 'edad', 'عمر', 'âge'),
(73, 'sex', 'sex', 'sexo', 'جنس', 'sexe'),
(74, 'blood_group', 'blood group', 'grupo sanguíneo', 'فصيلة الدم', 'groupe sanguin'),
(75, 'birth_date', 'birth date', 'fecha de nacimiento', 'تاريخ الميلاد', 'date de naissance'),
(76, 'male', 'male', 'macho', 'ذكر', 'masculin'),
(77, 'female', 'female', 'femenino', 'أنثى', 'féminin'),
(78, 'manage_nurse', 'manage nurse', 'gestionar la enfermera', 'إدارة ممرضة', 'gérer infirmière'),
(79, 'nurse_list', 'nurse list', 'Lista de enfermera', 'قائمة ممرضات', 'infirmière liste'),
(80, 'add_nurse', 'add nurse', 'añadir enfermera', 'إضافة ممرضة', 'ajouter infirmière'),
(81, 'nurse_name', 'nurse name', 'nombre de la enfermera', 'اسم الممرضة', 'nom de l\'infirmière'),
(82, 'manage_pharmacist', 'manage pharmacist', 'gestionar farmacéutico', 'إدارة الصيدلي', 'gérer pharmacien'),
(83, 'pharmacist_list', 'pharmacist list', 'Lista farmacéutico', 'قائمة صيدلي', 'liste de pharmacien'),
(84, 'add_pharmacist', 'add pharmacist', 'añadir farmacéutico', 'إضافة صيدلي', 'ajouter pharmacien'),
(85, 'pharmacist_name', 'pharmacist name', 'Nombre farmacéutico', 'اسم الصيدلي', 'Nom du pharmacien'),
(86, 'manage_laboratorist', 'manage laboratorist,eo', 'gestionar laboratorista', 'ادارة المختبر', 'gérer laboratorist'),
(87, 'laboratorist_list', 'laboratorist list,eo', 'Lista laboratorista', 'قائمة محتويات المختبر', 'Liste d\'laboratorist'),
(88, 'add_laboratorist', 'add laboratorist,eo', 'añadir laboratorista', 'اضافة مختبر', 'ajouter laboratorist'),
(89, 'laboratorist_name', 'laboratorist name,sl', 'Nombre laboratorista', 'اسم المختبر', 'nom de laboratorist'),
(90, 'manage_accountant', 'manage accountant', 'gestión contable', 'إدارة محاسب', 'gérer comptable'),
(91, 'accountant_list', 'accountant list', 'Lista de contador', 'قائمة المحاسب', 'Liste comptable'),
(92, 'add_accountant', 'add accountant', 'añadir contador', 'إضافة محاسب', 'ajouter comptable'),
(93, 'accountant_name', 'accountant name', 'Nombre del contador', 'اسم محاسب', 'Nom de l\'expert-comptable'),
(94, 'phrase_list', 'phrase list', 'lista de frases', 'قائمة العبارة', 'liste de phrase'),
(95, 'add_phrase', 'add phrase', 'añadir una frase', 'إضافة العبارة', 'ajouter phrase'),
(96, 'add_language', 'add language', 'añadir el idioma', 'إضافة لغة', 'ajouter langue'),
(97, 'phrase', 'phrase', 'frase', 'العبارة', 'phrase'),
(98, 'delete_language', 'delete language', 'eliminar el idioma', 'لغة حذف', 'supprimer langue'),
(99, 'update_phrase', 'update phrase', 'actualizar frase', 'تحديث العبارة', 'mettre à jour phrase'),
(100, 'time', 'time', 'tiempo', 'وقت', 'heure'),
(101, 'amount', 'amount', 'cantidad', 'كمية', 'montant'),
(102, 'payment_type', 'payment type', 'forma de pago', 'نوع الدفع', 'Type de paiement'),
(103, 'transaction_id', 'transaction id', 'identificación de la transacción', 'رقم المعاملات', 'Identifiant de transaction'),
(104, 'invoice_id', 'invoice id', 'Identificación factura', 'رقم الفاتورة', 'Identifiant facture'),
(105, 'method', 'method', 'método', 'طريقة', 'méthode'),
(106, 'bed_list', 'bed list', 'Lista de cama', 'قائمة سرير', 'liste de lit'),
(107, 'bed_id', 'bed id', 'Identificación cama', 'معرف السرير', 'Identifiant du lit'),
(108, 'bed_type', 'bed type', 'tipo de cama', 'نوع السرير', 'Type de lit'),
(109, 'allotment_time', 'allotment time', 'asignación del tiempo', 'وقت التخصيص', 'temps d\'attribution'),
(110, 'discharge_time', 'discharge time', 'tiempo de descarga', 'وقت التفريغ', 'temps de décharge'),
(111, 'bed_number', 'bed number', 'número de la cama', 'عدد السرير', 'Numéro du lit'),
(112, 'type', 'type', 'tipo', 'نوع', 'catégorie'),
(113, 'blood_donor_list', 'blood donor list', 'lista de donantes de sangre', 'قائمة المتبرعين بالدم', 'liste des donneurs de sang'),
(114, 'last_donation_date', 'last donation date', 'última fecha de la donación', 'مشاركة تاريخ التبرع', 'date du dernier don'),
(115, 'status', 'status', 'estado', 'حالة', 'statut'),
(116, 'category', 'category', 'categoría', 'الفئة', 'catégorie'),
(117, 'price', 'price', 'precio', 'السعر', 'prix'),
(118, 'manufacturing_company', 'manufacturing company', 'empresa de fabricación', 'شركة التصنيع', 'entreprise de fabrication'),
(119, 'view_operation_report', 'view operation report', 'ver la confirmación de la operación', 'عرض تقرير العملية', 'voir rapport d\'opération'),
(120, 'view_report', 'view report', 'ver el informe', 'عرض تقرير', 'voir rapport'),
(121, 'date', 'date', 'fecha', 'تاريخ', 'Date'),
(122, 'noticeboard_list', 'noticeboard list', 'Lista tablón de anuncios', 'القائمة', 'liste de tableau d\'affichage'),
(123, 'add_noticeboard', 'add noticeboard', 'añadir tablón de anuncios', 'إضافة لافتة', 'ajouter tableau d\'affichage'),
(124, 'title', 'title', 'título', 'لقب', 'titre'),
(125, 'notice', 'notice', 'notar', 'إشعار', 'remarquer'),
(126, 'system_name', 'system name', 'Nombre del sistema', 'اسم النظام', 'nom de système'),
(127, 'save', 'save', 'guardar', 'حفظ', 'sauver'),
(128, 'system_email', 'system email', 'sistema de correo electrónico', 'نظام البريد الإلكتروني', 'email de système'),
(129, 'system_title', 'system title', 'Título sistema', 'عناوين النظام', 'titre du système'),
(130, 'paypal_email', 'paypal email', 'email paypal', 'البريد الإلكتروني باي بال', 'email paypal'),
(131, 'currency', 'currency', 'moneda', 'عملة', 'monnaie'),
(132, 'restore', 'restore', 'restaurar', 'استعادة', 'rétablir'),
(133, 'report', 'report', 'reportar', 'تقرير', 'signaler'),
(134, 'all', 'all', 'todo', 'الكل', 'tous'),
(135, 'upload_&_restore_from_backup', 'upload & restore from backup', 'cargar y restaurar la copia de seguridad', 'تحميل واستعادة من النسخة الاحتياطية', 'télécharger et de restauration de la sauvegarde'),
(136, 'manage_profile', 'manage profile', 'gestionar el perfil', 'إدارة الملف الشخصي', 'Gérer le profil'),
(137, 'update_profile', 'update profile', 'actualizar el perfil', 'تحديث الملف الشخصي', 'mettre à jour le profil'),
(138, 'change_password', 'change password', 'cambiar la contraseña', 'تغيير كلمة المرور', 'changer le mot de passe'),
(139, 'new_password', 'new password', 'nueva contraseña', 'كلمة مرور جديدة', 'nouveau mot de passe'),
(140, 'confirm_new_password', 'confirm new password', 'confirmar nueva contraseña', 'تأكيد كلمة المرور الجديدة', 'confirmer le nouveau mot de passe'),
(141, 'update_password', 'update password', 'actualización de la contraseña', 'تحديث كلمة السر', 'mise à jour le mot de passe'),
(142, 'option', 'option', 'opción', 'خيار', 'choix'),
(143, 'edit_phrase', 'edit phrase', 'editar frase', 'تحرير العبارة', 'éditer phrase'),
(144, 'edit_noticeboard', 'edit noticeboard', 'editar tablón de anuncios', 'تعديل اللافتة', 'éditer panneau d\''),
(145, 'doctor_dashboard', 'doctor dashboard', 'médico salpicadero', 'طبيب لوحة أجهزة القياس', 'médecin tableau de bord'),
(146, 'manage_appointment', 'manage appointment', 'gestionar cita', 'تعيين إدارة', 'gérer les rendez-vous'),
(147, 'manage_prescription', 'manage prescription', 'gestión de la prescripción', 'إدارة وصفة طبية', 'gérer prescription'),
(148, 'manage_report', 'manage report', 'gestionar informe', 'إدارة تقرير', 'gérer rapport'),
(149, 'prescription', 'prescription', 'prescripción', 'وصفة طبية', 'ordonnance'),
(150, 'edit_patient', 'edit patient', 'editar paciente', 'تحرير المريض', 'éditer des patients'),
(151, 'appointment_list', 'appointment list', 'lista de citas', 'قائمة التعيين', 'liste des rendez-vous'),
(152, 'add_appointment', 'add appointment', 'añadir cita', 'إضافة موعد', 'ajouter rendez-vous'),
(153, 'edit_appointment', 'edit appointment', 'editar nombramiento', 'تعديل موعد', 'modifier les rendez-vous'),
(154, 'prescription_list', 'prescription list', 'Lista de prescripción', 'قائمة وصفة طبية', 'liste prescription'),
(155, 'add_prescription', 'add prescription', 'añadir receta', 'إضافة وصفة طبية', 'ajouter prescription'),
(156, 'case_history', 'case history', 'historia clínica', 'تاريخ الحالة', 'anamnèse'),
(157, 'add_description', 'add description', 'añadir una descripción', 'إضافة الوصف', 'ajouter une description'),
(158, 'medication', 'medication', 'medicación', 'دواء', 'médication'),
(159, 'medication_from_pharmacist', 'medication from pharmacist', 'medicamento del farmacéutico', 'الدواء من الصيدلي', 'médicaments de pharmacien'),
(160, 'edit_prescription', 'edit prescription', 'editar prescripción', 'تحرير وصفة طبية', 'modifier prescription'),
(161, 'diagnosis_report', 'diagnosis report', 'informe de diagnóstico', 'تقرير التشخيص', 'rapport de diagnostic'),
(162, 'report_type', 'report type', 'informar de tipo', 'نوع التقرير', 'Type de rapport'),
(163, 'document_type', 'document type', 'tipo de documento', 'نوع الوثيقة', 'type de document'),
(164, 'download', 'download', 'descargar', 'تحميل', 'télécharger'),
(165, 'manage_bed_allotment', 'manage bed allotment', 'gestionar adjudicación cama', 'إدارة مخصصات السرير', 'gérer l\'attribution de lit'),
(166, 'bed_allotment_list', 'bed allotment list', 'lista de adjudicación cama', 'قائمة تخصيص سرير', 'liste d\'attribution de lit'),
(167, 'add_bed_allotment', 'add bed allotment', 'añadir adjudicación cama', 'إضافة تخصيص سرير', 'ajouter attribution de lit'),
(168, 'allotment_date_time', 'allotment date time', 'Fecha y hora de adjudicación', 'تخصيص وقت التسجيل', 'lotissement date heure'),
(169, 'discharge_date_time', 'discharge date time', 'Fecha y hora de descarga', 'تصريف الوقت التسجيل', 'temps de décharge de la date'),
(170, 'operation', 'operation', 'operación', 'عملية', 'opération'),
(171, 'birth', 'birth', 'nacimiento', 'الولادة', 'naissance'),
(172, 'death', 'death', 'muerte', 'الموت', 'décès'),
(173, 'other', 'other', 'otro', 'آخر', 'autre'),
(174, 'add_report', 'add report', 'agregar informe', 'إضافة تقرير', 'Ajouter un rapport'),
(175, 'patient_dashboard', 'patient dashboard', 'tablero paciente', 'لوحة أجهزة القياس المريض', 'tableau de bord patients'),
(176, 'view_prescription', 'view prescription', 'ver receta', 'عرض وصفة طبية', 'voir prescription'),
(177, 'view_doctor', 'view doctor', 'ver médico', 'عرض الطبيب', 'voir un médecin'),
(178, 'admit_history', 'admit history', 'admitir la historia', 'أعترف التاريخ', 'admettre histoire'),
(179, 'operation_history', 'operation history', 'historial de operaciones', 'تاريخ العملية', 'historique de fonctionnement'),
(180, 'view_invoice', 'view invoice', 'ver la factura', 'عرض الفاتورة', 'voir facture'),
(181, 'payment_history', 'payment history', 'historial de pago', 'تاريخ الدفع', 'l\'historique des paiements'),
(182, 'view_admit_history', 'view admit history', 'ver admitir historia', 'عرض أعترف التاريخ', 'voir admettre histoire'),
(183, 'view_operation_history', 'view operation history', 'ver el historial de operación', 'عرض تاريخ العملية', 'voir l\'historique des opérations'),
(184, 'invoice_list', 'invoice list', 'lista de facturas', 'قائمة الفاتورة', 'liste des factures'),
(185, 'creation_timestamp', 'creation timestamp', 'fecha y hora de creación', 'الطابع الزمني خلق', 'horodatage de création'),
(186, 'nurse_dashboard', 'nurse dashboard', 'dashboard enfermera', 'لوحة أجهزة القياس ممرضة', 'infirmière tableau de bord'),
(187, 'bed_ward', 'bed ward', 'sala de cama', 'جناح السرير', 'salle de lit'),
(188, 'manage_bed', 'manage bed', 'gestión de la cama', 'إدارة السرير', 'gérer lit'),
(189, 'manage_blood_bank', 'manage blood bank', 'gestión de bancos de sangre', 'إدارة بنك الدم', 'gérer la banque de sang'),
(190, 'manage_blood_donor', 'manage blood donor', 'gestión de donantes de sangre', 'إدارة للمتبرعين بالدم', 'gérer les donneurs de sang'),
(191, 'add_bed', 'add bed', 'añadir cama', 'إضافة السرير', 'ajouter un lit'),
(192, 'ward', 'ward', 'sala', 'جناح', 'Ward'),
(193, 'cabin', 'cabin', 'cabina', 'قمرة', 'cabine'),
(194, 'icu', 'icu', 'icu', 'وحدة العناية المركزة', 'ICU'),
(195, 'edit_bed', 'edit bed', 'editar cama', 'تعديل سرير', 'modifier lit'),
(196, 'edit_bed_allotment', 'edit bed allotment', 'editar adjudicación cama', 'تعديل المخصصات السرير', 'modifier l\'attribution de lit'),
(197, 'blood_bank_list', 'blood bank list', 'lista de bancos de sangre', 'قائمة بنك الدم', 'liste de banques de sang'),
(198, 'edit_blood_bank', 'edit blood bank', 'editar banco de sangre', 'تعديل بنك الدم', 'modifier banque de sang'),
(199, 'add_blood_donor', 'add blood donor', 'añadir donante de sangre', 'إضافة للمتبرعين بالدم', 'ajouter donneurs de sang'),
(200, 'edit_blood_donor', 'edit blood donor', 'editar donante de sangre', 'تعديل للمتبرعين بالدم', 'modifier les donneurs de sang'),
(201, 'pharmacist_dashboard', 'pharmacist dashboard', 'tablero farmacéutico', 'لوحة أجهزة القياس الصيدلي', 'tableau de bord du pharmacien'),
(202, 'medicine_category', 'medicine category', 'Categoría Medicina', 'الطب فئة', 'médecine catégorie'),
(203, 'manage_medicine', 'manage medicine', 'administrar medicamentos', 'إدارة الطب', 'gérer médecine'),
(204, 'provide_medication', 'provide medication', 'proporcionar la medicación', 'توفير الدواء', 'fournir des médicaments'),
(205, 'manage_medicine_category', 'manage medicine category', 'gestionar Categoría Medicina', 'إدارة فئة الطب', 'gérer catégorie de médicaments'),
(206, 'medicine_category_list', 'medicine category list', 'lista de categorías de la medicina', 'قائمة فئة الطب', 'liste des catégories médecine'),
(207, 'add_medicine_category', 'add medicine category', 'añadir Categoría Medicina', 'إضافة فئة الطب', 'ajouter la catégorie de la médecine'),
(208, 'medicine_category_name', 'medicine category name', 'medicina nombre de la categoría', 'الطب اسم التصنيف', 'médecine nom de la catégorie'),
(209, 'medicine_category_description', 'medicine category description', 'medicina descripción de la categoría', 'الطب التصنيف الوصف', 'médecine description de catégorie'),
(210, 'medicine_list', 'medicine list', 'lista de medicamentos', 'قائمة الأدوية', 'médecine liste'),
(211, 'add_medicine', 'add medicine', 'añadir la medicina', 'إضافة الدواء', 'ajouter médecine'),
(212, 'medicine_name', 'medicine name', 'Nombre del medicamento', 'اسم الدواء', 'nom du médicament'),
(213, 'medicine_catogory', 'medicine catogory', 'medicina catogory', 'الطب catogory', 'médecine catogory'),
(214, 'edit_medicine_category', 'edit medicine category', 'edit Categoría Medicina', 'تحرير فئة الطب', 'edit médecine catégorie'),
(215, 'edit_medicine', 'edit medicine', 'edit medicina', 'تحرير الطب', 'médecine édition'),
(216, 'laboratorist_dashboard', 'laboratorist dashboard,eo', 'laboratorista salpicadero', 'laboratorist لوحة أجهزة القياس', 'laboratorist tableau de bord'),
(217, 'add_diagnosis_report', 'add diagnosis report', 'agregar informe diagnóstico', 'إضافة تقرير التشخيص', 'Ajouter un rapport de diagnostic'),
(218, 'report_status', 'report status', 'estado del informe', 'تقرير الحالة', 'état du rapport'),
(219, 'add_diagnostic_report', 'add diagnostic report', 'agregar informe de diagnóstico', 'إضافة تقرير التشخيص', 'Ajouter un rapport de diagnostic'),
(220, 'image', 'image', 'imagen', 'صورة', 'Image'),
(221, 'doc', 'doc', 'doctor', 'دوك', 'doc'),
(222, 'pdf', 'pdf', 'pdf', 'PDF', 'pdf'),
(223, 'excel', 'excel', 'sobresalir', 'تفوق', 'excel'),
(224, 'upload_document', 'upload document', 'Cargar documento', 'تحميل الوثيقة', 'télécharger le document'),
(225, 'accountant_dashboard', 'accountant dashboard', 'tablero contador', 'لوحة أجهزة قياس محاسب', 'tableau de bord comptable'),
(226, 'invoice / take_payment', 'invoice / take payment', 'factura / recibir el pago', 'فاتورة / أخذ الأجرة', 'facture / prendre le paiement'),
(227, 'manage_invoice', 'manage invoice', 'gestionar factura', 'إدارة الفاتورة', 'gérer facture'),
(228, 'add_invoice', 'add invoice', 'añadir factura', 'إضافة فاتورة', 'ajouter facture'),
(229, 'unpaid', 'unpaid', 'no pagado', 'غير مدفوع', 'non rémunéré'),
(230, 'take_cash_payment', 'take cash payment', 'tomar el pago en efectivo', 'أخذ الأجرة النقدية', 'prendre le paiement en espèces'),
(231, 'paid', 'paid', 'pagado', 'مدفوع', 'payé'),
(232, 'edit_invoice', 'Edit invoice', 'editar factura', 'تحرير الفاتورة', 'éditer facture'),
(233, 'edit_nurse', 'Edit nurse', '', 'تعديل ممرضة', 'modifier infirmière'),
(234, 'Choisir la langue', 'Select Language', 'Seleccione el idioma', 'تغيير اللغة', 'Choisir la langue');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicine_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `medicine_category_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price` longtext COLLATE utf8_unicode_ci NOT NULL,
  `manufacturing_company` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicine_id`, `name`, `medicine_category_id`, `description`, `price`, `manufacturing_company`, `status`) VALUES
(1, 'Paracetamol', 2, 'Paracetamol, also known as acetaminophen and APAP, is a medication used to treat pain and fever. It is typically used for mild to moderate pain relief. There is mixed evidence for its use to relieve fever in children. It is often sold in combination with other medications, such as in many cold medications.', '25', 'Mercury Drugstore', '50'),
(2, 'Dextromethorphan', 2, 'Dextromethorphan is a medication most often used as a cough suppressant in over-the-counter cold and cough medicines. It is sold in syrup, tablet, spray, and lozenge forms. It is in the morphinan class of medications with sedative, dissociative, and stimulant properties.', '555', 'The Generics Pharmacy', 'valable');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_category`
--

CREATE TABLE `medicine_category` (
  `medicine_category_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `medicine_category`
--

INSERT INTO `medicine_category` (`medicine_category_id`, `name`, `description`) VALUES
(1, 'Allergy Liquids', 'Allergic medicines'),
(2, 'Vitamins Tablets', 'Vitamins tablets only');

-- --------------------------------------------------------

--
-- Table structure for table `noticeboard`
--

CREATE TABLE `noticeboard` (
  `notice_id` int(11) NOT NULL,
  `notice_title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `notice` longtext COLLATE utf8_unicode_ci NOT NULL,
  `create_timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `noticeboard`
--

INSERT INTO `noticeboard` (`notice_id`, `notice_title`, `notice`, `create_timestamp`) VALUES
(4, 'Notice Board Text 1', 'Notice Board Text 1', 1541977200),
(3, 'Notice Board Text 2', 'Notice Board Text 2', 1509922800),
(5, 'Notice Board Text 3', 'Notice Board Text 3', 1493589600),
(6, 'Notice Board Text 4', 'Notice Board Text 4', 1525039200);

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `nurse_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`nurse_id`, `name`, `email`, `password`, `address`, `phone`) VALUES
(1, 'Lady Gaga', 'shallow@student.apc.edu.ph', 'password', 'Lenox Hill Hospital, New York, United States', '9123456789'),
(2, 'Bradley Cooper', 'tellmesomethinggirl@student.apc.edu.ph', 'password', 'Philadelphia, Pennsylvania, United States', '9123456789');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sex` longtext COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `blood_group` longtext COLLATE utf8_unicode_ci NOT NULL,
  `account_opening_timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `name`, `email`, `password`, `address`, `phone`, `sex`, `birth_date`, `age`, `blood_group`, `account_opening_timestamp`) VALUES
(1, 'Britney Spears', 'bjspears@student.apc.edu.ph', 'password', 'McComb, Mississippi, United States', '9123456789', 'Female', '12/02/1981', 37, 'B+', 1448984171);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `payment_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `transaction_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `method` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `payment_type`, `transaction_id`, `invoice_id`, `patient_id`, `method`, `description`, `amount`, `timestamp`) VALUES
(1, 'Fracture', '573319', 2, 2, 'cash', 'Fracture bandage.', 1200, 1448985709);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist`
--

CREATE TABLE `pharmacist` (
  `pharmacist_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacist`
--

INSERT INTO `pharmacist` (`pharmacist_id`, `name`, `email`, `password`, `address`, `phone`) VALUES
(1, 'Moira Dela Torre', 'mrbcdelatorre@student.apc.edu.ph', 'password', 'Philippines', '9123456789');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescription_id` int(11) NOT NULL,
  `creation_timestamp` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `case_history` longtext COLLATE utf8_unicode_ci NOT NULL,
  `medication` longtext COLLATE utf8_unicode_ci NOT NULL,
  `medication_from_pharmacist` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescription_id`, `creation_timestamp`, `doctor_id`, `patient_id`, `case_history`, `medication`, `medication_from_pharmacist`, `description`) VALUES
(1, 1448984647, 1, 1, 'Case history details here of patient Britney Spears<br>', 'Medication details here of patient Britney Spears<br>', 'Medication from pharmacist details here of patient Britney Spears<br>', 'Additional description here of patient Britney Spears<br>');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'operation,birth,death',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_id`, `type`, `description`, `timestamp`, `doctor_id`, `patient_id`) VALUES
(1, 'Birth', 'Stormi Webster', 1524943867, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `type`, `description`) VALUES
(1, 'system_name', ''),
(7, 'system_email', 'hms@email.com'),
(2, 'system_title', 'Hospital Management System'),
(3, 'address', 'Makati, Philippines'),
(4, 'phone', '9123456789'),
(5, 'paypal_email', 'paypal@paypal.com'),
(6, 'currency', 'PHP');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountant`
--
ALTER TABLE `accountant`
  ADD PRIMARY KEY (`accountant_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`bed_id`);

--
-- Indexes for table `bed_allotment`
--
ALTER TABLE `bed_allotment`
  ADD PRIMARY KEY (`bed_allotment_id`);

--
-- Indexes for table `blood_bank`
--
ALTER TABLE `blood_bank`
  ADD PRIMARY KEY (`blood_group_id`);

--
-- Indexes for table `blood_donor`
--
ALTER TABLE `blood_donor`
  ADD PRIMARY KEY (`blood_donor_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `diagnosis_report`
--
ALTER TABLE `diagnosis_report`
  ADD PRIMARY KEY (`diagnosis_report_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`phrase_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicine_id`);

--
-- Indexes for table `medicine_category`
--
ALTER TABLE `medicine_category`
  ADD PRIMARY KEY (`medicine_category_id`);

--
-- Indexes for table `noticeboard`
--
ALTER TABLE `noticeboard`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`nurse_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `pharmacist`
--
ALTER TABLE `pharmacist`
  ADD PRIMARY KEY (`pharmacist_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescription_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountant`
--
ALTER TABLE `accountant`
  MODIFY `accountant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bed`
--
ALTER TABLE `bed`
  MODIFY `bed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bed_allotment`
--
ALTER TABLE `bed_allotment`
  MODIFY `bed_allotment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blood_bank`
--
ALTER TABLE `blood_bank`
  MODIFY `blood_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `blood_donor`
--
ALTER TABLE `blood_donor`
  MODIFY `blood_donor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `diagnosis_report`
--
ALTER TABLE `diagnosis_report`
  MODIFY `diagnosis_report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `phrase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medicine_category`
--
ALTER TABLE `medicine_category`
  MODIFY `medicine_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `noticeboard`
--
ALTER TABLE `noticeboard`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nurse`
--
ALTER TABLE `nurse`
  MODIFY `nurse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pharmacist`
--
ALTER TABLE `pharmacist`
  MODIFY `pharmacist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE USER 'job'@'%' IDENTIFIED BY '';

GRANT ALL PRIVILEGES ON `hospital_hms`.* TO 'job'@'%';

