CREATE TABLE IF NOT EXISTS `achievements` (
  `citizenid` varchar(255) DEFAULT NULL,
  `myachievements` text DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `myachievements` (`myachievements`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
