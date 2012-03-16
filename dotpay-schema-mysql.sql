
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `control` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `amount` float(10,2) unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `name` varchar(120) COLLATE utf8_polish_ci DEFAULT NULL,
  `service` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `control_UNIQUE` (`control`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE IF NOT EXISTS `payment_incomings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) unsigned DEFAULT NULL,
  `control` varchar(128) COLLATE utf8_polish_ci DEFAULT NULL,
  `t_id` varchar(60) COLLATE utf8_polish_ci NOT NULL,
  `t_status` tinyint(1) unsigned NOT NULL,
  `amount` float(10,2) NOT NULL,
  `email` varchar(160) COLLATE utf8_polish_ci NOT NULL,
  `md5` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `service` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `code` varchar(32) COLLATE utf8_polish_ci DEFAULT NULL,
  `username` varchar(6) COLLATE utf8_polish_ci DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_polish_ci DEFAULT NULL,
  `created` int(10) unsigned NOT NULL,
  `updated` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_id_UNIQUE` (`t_id`),
  UNIQUE KEY `md5_UNIQUE` (`md5`),
  KEY `fk_payment_incomings_payments1` (`payment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;