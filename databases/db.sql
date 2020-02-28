# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.16)
# Database: hm
# Generation Time: 2017-02-22 03:58:10 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table hm2_deposits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_deposits`;

CREATE TABLE `hm2_deposits` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `type_id` bigint(20) NOT NULL DEFAULT '0',
  `deposit_date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `last_pay_date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `status` enum('on','off') DEFAULT 'on',
  `q_pays` bigint(20) NOT NULL DEFAULT '0',
  `amount` double(10,5) NOT NULL DEFAULT '0.00000',
  `actual_amount` double(10,5) NOT NULL DEFAULT '0.00000',
  `ec` int(11) NOT NULL,
  `compound` float(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table hm2_emails
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_emails`;

CREATE TABLE `hm2_emails` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `text` text,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `hm2_emails` WRITE;
/*!40000 ALTER TABLE `hm2_emails` DISABLE KEYS */;

INSERT INTO `hm2_emails` (`id`, `name`, `subject`, `text`, `status`)
VALUES
	('account_update_confirmation','Account Update Confirmation','Account Update Confirmation','Dear #name# (#username#),\n\nSomeone from IP address #ip# (most likely you) is trying to change your account data.\n\nTo confirm these changes please use this Confirmation Code:\n#confirmation_code#\n\nThank you.\n#site_name#\n#site_url#',1),
	('bonus','Bonus Notification','Bonus Notification','Hello #name#,\r\n\r\nYou received a bonus: $#amount#\r\nYou can check your statistics here:\r\n#site_url#\r\n\r\nGood luck.',1),
	('brute_force_activation','Account Activation after Brute Force','#site_name# - Your account activation code.','Someone from IP #ip# has entered a password for your account \"#username#\" incorrectly #max_tries# times. System locked your accout until you activate it.\r\n\r\nClick here to activate your account :\r\n\r\n#site_url#?a=activate&code=#activation_code#\r\n\r\nThank you.\r\n#site_name#',1),
	('change_account','Account Change Notification','Account Change Notification','Hello #name#,\r\n\r\nYour account data has been changed from ip #ip#\r\n\r\n\r\nNew information:\r\n\r\nPassword: #password#\r\nE-gold account: #egold#\r\nE-mail address: #email#\r\n\r\nContact us immediately if you did not authorize this change.\r\n\r\nThank you.',1),
	('confirm_registration','Registration Confirmation','Confirm your registration','Hello #name#,\r\n\r\nThank you for registering in our program\r\nPlease confirm your registration or ignore this message.\r\n\r\nCopy and paste this link to your browser:\r\n#site_url#/?a=confirm_registration&c=#confirm_string#\r\n\r\nThank you.\r\n#site_name#',1),
	('deposit_admin_notification','Administrator Deposit Notification','A deposit has been processed','User #username# deposit $#amount# #currency# to #plan#.\r\n\r\nAccount: #account#\r\nBatch: #batch#\r\nCompound: #compound#%.\r\nReferrers fee: $#ref_sum#',1),
	('deposit_approved_admin_notification','Deposit Approved Admin Notification','Deposit has been approved','Deposit has been approved:\n\nUser: #username# (#name#)\nAmount: $#amount# of #currency#\nPlan: #plan#\nDate: #deposit_date#\n#fields#',1),
	('deposit_approved_user_notification','Deposit Approved User Notification','Deposit has been approved','Dear #name#\n\nYour deposit has been approved:\n\nAmount: $#amount# of #currency#\nPlan: #plan#\n#fields#',1),
	('deposit_user_notification','Deposit User Notification','Payment received','Dear #name# (#username#)\r\n\r\nWe have successfully recived your deposit $#amount# #currency# to #plan#.\r\n\r\nYour Account: #account#\r\nBatch: #batch#\r\nCompound: #compound#%.\r\n\r\n\r\nThank you.\r\n#site_name#\r\n#site_url#',1),
	('direct_signup_notification','Direct Referral Signup','You have a new direct signup on #site_name#','Dear #name# (#username#)\n\nYou have a new direct signup on #site_name#\nUser: #ref_username#\nName: #ref_name#\nE-mail: #ref_email#\n\nThank you.',1),
	('exchange_admin_notification','Exchange Admin Notification','Currency Exchange Processed','User #username# has exchanged $#amount_from# #currency_from# to $#amount_to# #currency_to#.',0),
	('exchange_user_notification','Exchange User Notification','Currency Exchange Completed','Dear #name# (#username#).\r\n\r\nYou have successfully exchanged $#amount_from# #currency_from# to $#amount_to# #currency_to#.\r\n\r\nThank you.\r\n#site_name#\r\n#site_url#',0),
	('forgot_password','Password Reminder','The password you requested','Hello #name#,\r\n\r\nSomeone (most likely you) requested your username and password from the IP #ip#.\r\nYour password has been changed!!!\r\n\r\nYou can log into our account with:\r\n\r\nUsername: #username#\r\nPassword: #password#\r\n\r\nHope that helps.',1),
	('penalty','Penalty Notification','Penalty Notification','Hello #name#,\r\n\r\nYour account has been charged for $#amount#\r\nYou can check your statistics here:\r\n#site_url#\r\n\r\nGood luck.',1),
	('pending_deposit_admin_notification','Deposit Request Admin Notification','Deposit Request Notification','User #username# save deposit $#amount# of #currency# to #plan#.\n\n#fields#',1),
	('referral_commision_notification','Referral Comission Notification','#site_name# Referral Comission','Dear #name# (#username#)\n\nYou have recived a referral comission of $#amount# #currency# from the #ref_name# (#ref_username#) deposit.\n\nThank you.',1),
	('registration','Registration Completetion','Registration Info','Hello #name#,\r\n\r\nThank you for registration on our site.\r\n\r\nYour login information:\r\n\r\nLogin: #username#\r\nPassword: #password#\r\n\r\nYou can login here: #site_url#\r\n\r\nContact us immediately if you did not authorize this registration.\r\n\r\nThank you.',1),
	('withdraw_admin_notification','Administrator Withdrawal Notification','Withdrawal has been sent','User #username# received $#amount# to #currency# account #account#. Batch is #batch#.',1),
	('withdraw_request_admin_notification','Administrator Withdrawal Request Notification','Withdrawal Request has been sent','User #username# requested to withdraw $#amount# from IP #ip#.',1),
	('withdraw_request_user_notification','User Withdrawal Request Notification','Withdrawal Request has been sent','Hello #name#,\r\n\r\n\r\nYou has requested to withdraw $#amount#.\r\nRequest IP address is #ip#.\r\n\r\n\r\nThank you.\r\n#site_name#\r\n#site_url#',1),
	('withdraw_user_notification','User Withdrawal Notification','Withdrawal has been sent','Hello #name#.\r\n\r\n$#amount# has been successfully sent to your #currency# account #account#.\r\nTransaction batch is #batch#.\r\n\r\n#site_name#\r\n#site_url#',1);

/*!40000 ALTER TABLE `hm2_emails` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hm2_exchange_rates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_exchange_rates`;

CREATE TABLE `hm2_exchange_rates` (
  `sfrom` int(10) unsigned DEFAULT NULL,
  `sto` int(10) unsigned DEFAULT NULL,
  `percent` float(3,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table hm2_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_history`;

CREATE TABLE `hm2_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `amount` float(10,5) DEFAULT NULL,
  `type` enum('deposit','bonus','penality','earning','withdrawal','commissions','early_deposit_release','early_deposit_charge','release_deposit','add_funds','withdraw_pending','exchange_in','exchange_out','internal_transaction_spend','internal_transaction_receive') DEFAULT NULL,
  `description` text NOT NULL,
  `actual_amount` float(10,5) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `str` varchar(40) NOT NULL DEFAULT '',
  `ec` int(11) NOT NULL,
  `deposit_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table hm2_news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_news`;

CREATE TABLE `hm2_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `small_text` text,
  `full_text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table hm2_online
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_online`;

CREATE TABLE `hm2_online` (
  `ip` varchar(15) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# Dump of table hm2_pay_errors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_pay_errors`;

CREATE TABLE `hm2_pay_errors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `txt` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table hm2_pay_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_pay_settings`;

CREATE TABLE `hm2_pay_settings` (
  `n` varchar(200) NOT NULL DEFAULT '',
  `v` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `hm2_pay_settings` WRITE;
/*!40000 ALTER TABLE `hm2_pay_settings` DISABLE KEYS */;

INSERT INTO `hm2_pay_settings` (`n`, `v`)
VALUES
	('egold_account_password','');

/*!40000 ALTER TABLE `hm2_pay_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hm2_pending_deposits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_pending_deposits`;

CREATE TABLE `hm2_pending_deposits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ec` bigint(20) unsigned DEFAULT NULL,
  `fields` text,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `amount` float(10,5) NOT NULL DEFAULT '0.00000',
  `type_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `status` enum('new','problem','processed') NOT NULL DEFAULT 'new',
  `compound` double(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table hm2_plans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_plans`;

CREATE TABLE `hm2_plans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `description` text,
  `min_deposit` float(10,2) DEFAULT NULL,
  `max_deposit` float(10,2) DEFAULT NULL,
  `percent` float(10,2) DEFAULT NULL,
  `status` enum('on','off') DEFAULT NULL,
  `parent` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `hm2_plans` WRITE;
/*!40000 ALTER TABLE `hm2_plans` DISABLE KEYS */;

INSERT INTO `hm2_plans` (`id`, `name`, `description`, `min_deposit`, `max_deposit`, `percent`, `status`, `parent`)
VALUES
	(1,'Plan 1',NULL,0.00,100.00,2.20,NULL,1),
	(2,'Plan 2',NULL,101.00,1000.00,2.30,NULL,1),
	(3,'Plan 3',NULL,1001.00,0.00,2.40,NULL,1),
	(4,'Plan 1',NULL,10.00,100.00,3.20,NULL,2),
	(5,'Plan 2',NULL,101.00,1000.00,3.30,NULL,2),
	(6,'Plan 3',NULL,1001.00,5000.00,3.40,NULL,2),
	(7,'Plan 1',NULL,10.00,100.00,10.00,NULL,3),
	(8,'Plan 2',NULL,101.00,1000.00,20.00,NULL,3),
	(9,'Plan 3',NULL,1001.00,0.00,50.00,NULL,3);

/*!40000 ALTER TABLE `hm2_plans` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hm2_processings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_processings`;

CREATE TABLE `hm2_processings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `infofields` text,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `hm2_processings` WRITE;
/*!40000 ALTER TABLE `hm2_processings` DISABLE KEYS */;

INSERT INTO `hm2_processings` (`id`, `name`, `infofields`, `status`, `description`)
VALUES
	(999,'Bank Wire','a:3:{i:1;s:9:\"Bank Name\";i:2;s:12:\"Account Name\";i:3;s:15:\"Payment Details\";}',0,'Send your bank wires here:<br>\r\nBeneficiary\'s Bank Name: <b>Your Bank Name</b><br>\r\nBeneficiary\'s Bank SWIFT code: <b>Your Bank SWIFT code</b><br>\r\nBeneficiary\'s Bank Address: <b>Your Bank address</b><br>\r\nBeneficiary Account: <b>Your Account</b><br>\r\nBeneficiary Name: <b>Your Name</b><br>\r\n\r\nCorrespondent Bank Name: <b>Your Bank Name</b><br>\r\nCorrespondent Bank Address: <b>Your Bank Address</b><br>\r\nCorrespondent Bank codes: <b>Your Bank codes</b><br>\r\nABA: <b>Your ABA</b><br>'),
	(1000,'e-Bullion','a:2:{i:1;s:13:\"Payer Account\";i:2;s:14:\"Transaction ID\";}',0,'Please send your payments to this account: <b>Your e-Bullion account</b>'),
	(1001,'NetPay','a:2:{i:1;s:13:\"Payer Account\";i:2;s:14:\"Transaction ID\";}',0,'Send your funds to account: <b>Your NetPay account</b>'),
	(1002,'GoldMoney','a:2:{i:1;s:13:\"Payer Account\";i:2;s:14:\"Transaction ID\";}',0,'Send your fund to account: <b>your GoldMoney account</b>'),
	(1003,'MoneyBookers','a:2:{i:1;s:13:\"Payer Account\";i:2;s:14:\"Transaction ID\";}',0,'Send your funds to account: <b>your MoneyBookers account</b>'),
	(1004,'Pecunix','a:2:{i:1;s:19:\"Your e-mail address\";i:2;s:16:\"Reference Number\";}',0,'Send your funds to account: <b>your Pecunix account</b>'),
	(1005,'PicPay','a:2:{i:1;s:13:\"Payer Account\";i:2;s:14:\"Transaction ID\";}',0,'Send your funds to account: <b>Your PicPay account</b>');

/*!40000 ALTER TABLE `hm2_processings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hm2_referal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_referal`;

CREATE TABLE `hm2_referal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(200) DEFAULT NULL,
  `from_value` bigint(20) NOT NULL DEFAULT '0',
  `to_value` bigint(20) NOT NULL DEFAULT '0',
  `percent` double(10,2) DEFAULT NULL,
  `percent_daily` double(10,2) DEFAULT NULL,
  `percent_weekly` double(10,2) DEFAULT NULL,
  `percent_monthly` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `hm2_referal` WRITE;
/*!40000 ALTER TABLE `hm2_referal` DISABLE KEYS */;

INSERT INTO `hm2_referal` (`id`, `level`, `name`, `from_value`, `to_value`, `percent`, `percent_daily`, `percent_weekly`, `percent_monthly`)
VALUES
	(1,1,'Level A',1,2,2.00,NULL,NULL,NULL),
	(2,1,'Level B',3,5,3.00,NULL,NULL,NULL),
	(3,1,'Level C',6,10,5.00,NULL,NULL,NULL),
	(4,1,'Level D',11,20,7.50,NULL,NULL,NULL),
	(5,1,'Level E',21,0,10.00,NULL,NULL,NULL);

/*!40000 ALTER TABLE `hm2_referal` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hm2_referal_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_referal_stats`;

CREATE TABLE `hm2_referal_stats` (
  `date` date NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `income` bigint(20) NOT NULL,
  `reg` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table hm2_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_settings`;

CREATE TABLE `hm2_settings` (
  `name` varchar(200) NOT NULL DEFAULT '',
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table hm2_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_types`;

CREATE TABLE `hm2_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `description` text,
  `q_days` bigint(20) DEFAULT NULL,
  `min_deposit` float(10,2) DEFAULT NULL,
  `max_deposit` float(10,2) DEFAULT NULL,
  `period` enum('d','w','b-w','m','2m','3m','6m','y','end') DEFAULT NULL,
  `status` enum('on','off','suspended') DEFAULT NULL,
  `return_profit` enum('0','1') DEFAULT NULL,
  `return_profit_percent` float(10,2) DEFAULT NULL,
  `percent` float(10,2) DEFAULT NULL,
  `pay_to_egold_directly` int(11) NOT NULL DEFAULT '0',
  `use_compound` int(11) NOT NULL,
  `work_week` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `withdraw_principal` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `withdraw_principal_percent` double(10,2) NOT NULL DEFAULT '0.00',
  `withdraw_principal_duration` int(10) unsigned NOT NULL DEFAULT '0',
  `compound_min_deposit` double(10,2) DEFAULT '0.00',
  `compound_max_deposit` double(10,2) DEFAULT '0.00',
  `compound_percents_type` tinyint(1) unsigned DEFAULT '0',
  `compound_min_percent` double(10,2) DEFAULT '0.00',
  `compound_max_percent` double(10,2) DEFAULT '100.00',
  `compound_percents` text,
  `closed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `withdraw_principal_duration_max` int(10) unsigned NOT NULL DEFAULT '0',
  `dsc` text,
  `hold` int(11) NOT NULL,
  `delay` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `hm2_types` WRITE;
/*!40000 ALTER TABLE `hm2_types` DISABLE KEYS */;

INSERT INTO `hm2_types` (
  `id`,
  `name`,
  `description`,
  `q_days`,
  `min_deposit`,
  `max_deposit`,
  `period`,
  `status`,
  `return_profit`,
  `return_profit_percent`,
  `percent`,
  `pay_to_egold_directly`,
  `use_compound`,
  `work_week`,
  `parent`,
  `withdraw_principal`,
  `withdraw_principal_percent`,
  `withdraw_principal_duration`,
  `compound_min_deposit`,
  `compound_max_deposit`,
  `compound_percents_type`,
  `compound_min_percent`,
  `compound_max_percent`,
  `compound_percents`,
  `closed`,
  `withdraw_principal_duration_max`,
  `dsc`,
  `hold`,
  `delay`
  )
VALUES
	(
    1,
    '1 year 2.4% daily',
    NULL,
    365,
    NULL,
    NULL,
    'd',
    'on',
    '0',
    0.00,
    NULL,
    0,
    0,
    0,
    0,
    0,
    0.00,
    0,
    0.00,
    0.00,
    0,
    0.00,
    100.00,
    '',
    0,
    0,
    '',
    0,
    0
  ), (
    2,
    '100 days 3.4% daily',
    NULL,
    365,
    NULL,
    NULL,
    'd',
    'on',
    '0',
    0.00,
    NULL,
    0,
    0,
    0,
    0,
    0,
    0.00,
    0,
    0.00,
    0.00,
    0,
    0.00,
    100.00,
    '',
    0,
    0,
    '',
    0,
    0
  ), (
    3,
    '30 days deposit. 150%',
    NULL,
    30,
    NULL,
    NULL,
    'end',
    'on',
    '1',
    0.00,
    NULL,
    0,
    0,
    0,
    0,
    0,
    0.00,
    0,
    0.00,
    0.00,
    0,
    0.00,
    100.00,
    '',
    0,
    0,
    '',
    0,
    0
);

/*!40000 ALTER TABLE `hm2_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hm2_user_access_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_user_access_log`;

CREATE TABLE `hm2_user_access_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# Dump of table hm2_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_users`;

CREATE TABLE `hm2_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `date_register` datetime DEFAULT NULL,
  `egold_account` bigint(20) NOT NULL DEFAULT '0',
  `perfectmoney_account` varchar(200) NOT NULL DEFAULT '',
  `email` varchar(200) DEFAULT NULL,
  `status` enum('on','off','suspended') DEFAULT NULL,
  `came_from` text NOT NULL,
  `ref` bigint(20) NOT NULL DEFAULT '0',
  `deposit_total` float(10,2) NOT NULL DEFAULT '0.00',
  `confirm_string` varchar(200) NOT NULL DEFAULT '',
  `ip_reg` varchar(15) NOT NULL DEFAULT '',
  `last_access_time` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `last_access_ip` varchar(15) NOT NULL DEFAULT '',
  `stat_password` varchar(200) NOT NULL,
  `auto_withdraw` int(11) NOT NULL DEFAULT '1',
  `user_auto_pay_earning` int(11) NOT NULL,
  `admin_auto_pay_earning` int(11) NOT NULL,
  `pswd` varchar(50) NOT NULL,
  `evocash_account` bigint(20) NOT NULL DEFAULT '0',
  `intgold_account` bigint(20) NOT NULL DEFAULT '0',
  `hid` varchar(50) NOT NULL,
  `question` varchar(50) NOT NULL DEFAULT '',
  `answer` varchar(50) NOT NULL DEFAULT '',
  `l_e_t` datetime NOT NULL DEFAULT '2004-01-01 00:00:00',
  `activation_code` varchar(50) NOT NULL,
  `bf_counter` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `transaction_code` varchar(255) DEFAULT NULL,
  `stormpay_account` varchar(200) NOT NULL,
  `ebullion_account` varchar(200) NOT NULL,
  `paypal_account` varchar(200) NOT NULL,
  `goldmoney_account` varchar(200) NOT NULL,
  `eeecurrency_account` bigint(20) NOT NULL DEFAULT '0',
  `pecunix_account` bigint(20) NOT NULL DEFAULT '0',
  `ac` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `hm2_users` WRITE;
/*!40000 ALTER TABLE `hm2_users` DISABLE KEYS */;

INSERT INTO `hm2_users` (
  `id`,
  `name`,
  `username`,
  `password`,
  `date_register`,
  `egold_account`,
  `perfectmoney_account`,
  `email`,
  `status`,
  `came_from`,
  `ref`,
  `deposit_total`,
  `confirm_string`,
  `ip_reg`,
  `last_access_time`,
  `last_access_ip`,
  `stat_password`,
  `auto_withdraw`,
  `user_auto_pay_earning`,
  `admin_auto_pay_earning`,
  `pswd`,
  `evocash_account`,
  `intgold_account`,
  `hid`,
  `question`,
  `answer`,
  `l_e_t`,
  `activation_code`,
  `bf_counter`,
  `address`,
  `city`,
  `state`,
  `zip`,
  `country`,
  `transaction_code`,
  `stormpay_account`,
  `ebullion_account`,
  `paypal_account`,
  `goldmoney_account`,
  `eeecurrency_account`,
  `pecunix_account`,
  `ac`
) VALUES (
  1,
  'admin',
  'admin',
  '21232f297a57a5a743894a0e4a801fc3',
  NULL,
  0,
  '',
  'admin',
  'on',
  '     ',
  0,
  0.00,
  '',
  '',
  '2017-02-17 15:02:35',
  '127.0.0.1',
  '',
  1,
  0,
  0,
  '',
  0,
  0,
  '7F0FED123DF1C4A4BC96BBDEF2C35C',
  '',
  '',
  '2017-02-17 15:01:55',
  '',
  0,
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  0,
  0,
  '520f767b42417c0b02122051305c5a4c675944160c30090d7b635d5b35535a5c215066024a0209040e165326475022356650345d4f43214666024a02000a16505e3052572d245d107d4102057e162154585154120f470d7609172025545b281003437e0576031b545943406b55315c4232244b107d4102057e16255d545156120f470d7409172d204a46195b48127f477e0c031a5954595d596108467b720310365b56127f477e09031a1a0b470e0e791141282c5c4132535540660f2d03090345'
);

/*!40000 ALTER TABLE `hm2_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hm2_wires
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hm2_wires`;

CREATE TABLE `hm2_wires` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `pname` varchar(250) NOT NULL,
  `paddress` varchar(250) NOT NULL,
  `pzip` varchar(250) NOT NULL,
  `pcity` varchar(250) NOT NULL,
  `pstate` varchar(250) NOT NULL,
  `pcountry` varchar(250) NOT NULL,
  `bname` varchar(250) NOT NULL,
  `baddress` varchar(250) NOT NULL,
  `bzip` varchar(250) NOT NULL,
  `bcity` varchar(250) NOT NULL,
  `bstate` varchar(250) NOT NULL,
  `bcountry` varchar(250) NOT NULL,
  `baccount` varchar(250) NOT NULL,
  `biban` varchar(250) NOT NULL,
  `bswift` varchar(250) NOT NULL,
  `amount` float(10,5) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `wire_date` datetime NOT NULL,
  `compound` float(10,5) DEFAULT NULL,
  `status` enum('new','problem','processed') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
