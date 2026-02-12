/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.34 : Database - drowsiness
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`drowsiness` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `drowsiness`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add login_table',7,'add_login_table'),
(26,'Can change login_table',7,'change_login_table'),
(27,'Can delete login_table',7,'delete_login_table'),
(28,'Can view login_table',7,'view_login_table'),
(29,'Can add music_table',8,'add_music_table'),
(30,'Can change music_table',8,'change_music_table'),
(31,'Can delete music_table',8,'delete_music_table'),
(32,'Can view music_table',8,'view_music_table'),
(33,'Can add user_table',9,'add_user_table'),
(34,'Can change user_table',9,'change_user_table'),
(35,'Can delete user_table',9,'delete_user_table'),
(36,'Can view user_table',9,'view_user_table'),
(37,'Can add playlist_table',10,'add_playlist_table'),
(38,'Can change playlist_table',10,'change_playlist_table'),
(39,'Can delete playlist_table',10,'delete_playlist_table'),
(40,'Can view playlist_table',10,'view_playlist_table'),
(41,'Can add drowsiness_table',11,'add_drowsiness_table'),
(42,'Can change drowsiness_table',11,'change_drowsiness_table'),
(43,'Can delete drowsiness_table',11,'delete_drowsiness_table'),
(44,'Can view drowsiness_table',11,'view_drowsiness_table');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$DAgY90eobHZejRvYifJm9H$0KldJbxC3IhyUIsae2Crnebf+/aBHMG1Ivp9Nyhn24U=','2024-01-11 06:25:29.050513',1,'admin','','','admin@gmail.com',1,1,'2024-01-03 07:45:08.398636');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(11,'drs_app','drowsiness_table'),
(7,'drs_app','login_table'),
(8,'drs_app','music_table'),
(10,'drs_app','playlist_table'),
(9,'drs_app','user_table'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-12-27 06:47:16.299136'),
(2,'auth','0001_initial','2023-12-27 06:47:16.584040'),
(3,'admin','0001_initial','2023-12-27 06:47:16.657848'),
(4,'admin','0002_logentry_remove_auto_add','2023-12-27 06:47:16.657848'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-12-27 06:47:16.672862'),
(6,'contenttypes','0002_remove_content_type_name','2023-12-27 06:47:16.732053'),
(7,'auth','0002_alter_permission_name_max_length','2023-12-27 06:47:16.787820'),
(8,'auth','0003_alter_user_email_max_length','2023-12-27 06:47:16.819131'),
(9,'auth','0004_alter_user_username_opts','2023-12-27 06:47:16.827259'),
(10,'auth','0005_alter_user_last_login_null','2023-12-27 06:47:16.863876'),
(11,'auth','0006_require_contenttypes_0002','2023-12-27 06:47:16.869528'),
(12,'auth','0007_alter_validators_add_error_messages','2023-12-27 06:47:16.869528'),
(13,'auth','0008_alter_user_username_max_length','2023-12-27 06:47:16.919536'),
(14,'auth','0009_alter_user_last_name_max_length','2023-12-27 06:47:16.952325'),
(15,'auth','0010_alter_group_name_max_length','2023-12-27 06:47:16.976466'),
(16,'auth','0011_update_proxy_permissions','2023-12-27 06:47:16.986225'),
(17,'auth','0012_alter_user_first_name_max_length','2023-12-27 06:47:17.022872'),
(18,'drs_app','0001_initial','2023-12-27 06:47:17.191078'),
(19,'sessions','0001_initial','2023-12-27 06:47:17.219392'),
(20,'drs_app','0002_drowsiness_table_status','2024-01-05 06:19:10.580517'),
(21,'drs_app','0003_auto_20240110_1049','2024-01-10 05:19:52.539657');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('bpmha9uqpmeqvkjjcz6yfkuj6d41bgby','.eJxVjjsOgzAQRO_iGln-YINTps8Z0K53HZMQLPGpotw9gCiSaqSZN6N5iw7WJXfrzFPXk7gILapfDyE-edwDesB4LzKWcZl6lDsiz3SWt0I8XE_2byDDnLd2AqesCU1SITB4sGwSA1IgH7luyWKL2qnIxhH4RhuVED0l53WsTXDb6Os4qCsxHPr5AuulPRg:1rNoVN:CYpCOra_YahERECtwbF4zKPJRFrKw86BZp7CiLX2Uzk','2024-01-25 06:25:29.060504'),
('e0wz1pfyetza73x5vs24s2hn1gjgbhev','eyJtX2lkIjo0fQ:1rJT9O:rHSyaWt1eVsZDQPdnWsesZ2WMqy_xJnFYKxy3xZqPAY','2024-01-13 06:48:50.403857');

/*Table structure for table `drs_app_drowsiness_table` */

DROP TABLE IF EXISTS `drs_app_drowsiness_table`;

CREATE TABLE `drs_app_drowsiness_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `USER_id` bigint NOT NULL,
  `status` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drs_app_drowsiness_t_USER_id_3673ced4_fk_drs_app_u` (`USER_id`),
  CONSTRAINT `drs_app_drowsiness_t_USER_id_3673ced4_fk_drs_app_u` FOREIGN KEY (`USER_id`) REFERENCES `drs_app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `drs_app_drowsiness_table` */

insert  into `drs_app_drowsiness_table`(`id`,`image`,`date`,`USER_id`,`status`) values 
(1,'bvffhg','2023-12-27',1,'h');

/*Table structure for table `drs_app_login_table` */

DROP TABLE IF EXISTS `drs_app_login_table`;

CREATE TABLE `drs_app_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `drs_app_login_table` */

insert  into `drs_app_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','123','admin'),
(2,'user','123','user'),
(3,'hkk','hkk','user'),
(4,'hkk','hkk','user'),
(5,'hkk','hkk','user'),
(7,'thomas','john123','user'),
(8,'hii','hii','user'),
(9,'hii','hii','user');

/*Table structure for table `drs_app_music_table` */

DROP TABLE IF EXISTS `drs_app_music_table`;

CREATE TABLE `drs_app_music_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `music` varchar(100) NOT NULL,
  `singer` varchar(80) NOT NULL,
  `year` int NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  `emotion` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drs_app_music_table_LOGIN_id_263a97f3_fk_drs_app_login_table_id` (`LOGIN_id`),
  CONSTRAINT `drs_app_music_table_LOGIN_id_263a97f3_fk_drs_app_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `drs_app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `drs_app_music_table` */

insert  into `drs_app_music_table`(`id`,`music`,`singer`,`year`,`LOGIN_id`,`emotion`) values 
(1,'Screenshot 2023-01-27 162242.png','Blaqbonez',2024,1,'1'),
(6,'Blaqbonez-Novacane-(TrendyBeatz.com) (1)_bIS6jFN.mp3','abcd',2004,1,'1'),
(8,'front-view.webp','aaa',2021,1,'happiness'),
(9,'istockphoto.jpg','aaa',2021,1,'happiness');

/*Table structure for table `drs_app_playlist_table` */

DROP TABLE IF EXISTS `drs_app_playlist_table`;

CREATE TABLE `drs_app_playlist_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `MUSIC_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drs_app_playlist_tab_MUSIC_id_6e9b695f_fk_drs_app_m` (`MUSIC_id`),
  KEY `drs_app_playlist_table_USER_id_7c5d841a_fk_drs_app_user_table_id` (`USER_id`),
  CONSTRAINT `drs_app_playlist_tab_MUSIC_id_6e9b695f_fk_drs_app_m` FOREIGN KEY (`MUSIC_id`) REFERENCES `drs_app_music_table` (`id`),
  CONSTRAINT `drs_app_playlist_table_USER_id_7c5d841a_fk_drs_app_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `drs_app_user_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `drs_app_playlist_table` */

/*Table structure for table `drs_app_user_table` */

DROP TABLE IF EXISTS `drs_app_user_table`;

CREATE TABLE `drs_app_user_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstname` varchar(80) NOT NULL,
  `lastname` varchar(80) NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(80) NOT NULL,
  `place` varchar(80) NOT NULL,
  `post` varchar(80) NOT NULL,
  `pin` int NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drs_app_user_table_LOGIN_id_e7fec358_fk_drs_app_login_table_id` (`LOGIN_id`),
  CONSTRAINT `drs_app_user_table_LOGIN_id_e7fec358_fk_drs_app_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `drs_app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `drs_app_user_table` */

insert  into `drs_app_user_table`(`id`,`firstname`,`lastname`,`phone`,`email`,`place`,`post`,`pin`,`LOGIN_id`) values 
(1,'Toni','Jack',1243674332,'ToniJack123@gmail.com','london','london',653671,2),
(2,'naveen','john',9876543210,'naveen@gmail.com','kp','kkm',654321,7),
(3,'beudbd799','aa',9868958523,'hii123@gmail.com','tshsjdn','hsbdhnf',123456,9);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
