-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 23, 2013 at 06:24 AM
-- Server version: 5.5.31
-- PHP Version: 5.4.4-14+deb7u5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `labstocks_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ab_avail`
--

CREATE TABLE IF NOT EXISTS `ab_avail` (
  `Type` varchar(50) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ab_avail`
--

INSERT INTO `ab_avail` (`Type`) VALUES
('available'),
('out of stock');

-- --------------------------------------------------------

--
-- Table structure for table `ab_host`
--

CREATE TABLE IF NOT EXISTS `ab_host` (
  `Host` varchar(50) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ab_host`
--

INSERT INTO `ab_host` (`Host`) VALUES
('goat'),
('horse'),
('mouse'),
('rabbit');

-- --------------------------------------------------------

--
-- Table structure for table `ab_monopoly`
--

CREATE TABLE IF NOT EXISTS `ab_monopoly` (
  `Type` varchar(50) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ab_monopoly`
--

INSERT INTO `ab_monopoly` (`Type`) VALUES
('monoclonal'),
('polyclonal');

-- --------------------------------------------------------

--
-- Table structure for table `ab_supplier`
--

CREATE TABLE IF NOT EXISTS `ab_supplier` (
  `Supplier` varchar(50) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ab_supplier`
--

INSERT INTO `ab_supplier` (`Supplier`) VALUES
('Abcam'),
('ActiveMotif'),
('Covance/Eurogentec'),
('Diagenode'),
('MPBiomedicals'),
('Sigma'),
('Upstate/Millipore');

-- --------------------------------------------------------

--
-- Table structure for table `ab_type`
--

CREATE TABLE IF NOT EXISTS `ab_type` (
  `Type` varchar(50) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ab_type`
--

INSERT INTO `ab_type` (`Type`) VALUES
('monoclonal'),
('polyclonal');

-- --------------------------------------------------------

--
-- Table structure for table `antibodies`
--

CREATE TABLE IF NOT EXISTS `antibodies` (
  `id` int(15) NOT NULL,
  `Antigen` varchar(150) NOT NULL,
  `InStock` varchar(25) NOT NULL,
  `Date` date DEFAULT NULL,
  `Comments` longtext,
  `Host` varchar(40) DEFAULT NULL,
  `Ordered_by` varchar(50) DEFAULT NULL,
  `Type` varchar(40) NOT NULL,
  `Batch_Reference` varchar(40) DEFAULT NULL,
  `Supplier` varchar(40) NOT NULL,
  `Location` varchar(40) NOT NULL,
  `Dilution-WB` text NOT NULL,
  `Volume-ChIP` text NOT NULL,
  `ProductID` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Author` (`Ordered_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `antibodies`
--

INSERT INTO `antibodies` (`id`, `Antigen`, `InStock`, `Date`, `Comments`, `Host`, `Ordered_by`, `Type`, `Batch_Reference`, `Supplier`, `Location`, `Dilution-WB`, `Volume-ChIP`, `ProductID`) VALUES
(1, 'Actin C4', 'available', '2008-09-11', 'used for WB control, do not use as control in case of TSA treatment: TSA is known to reduce actin expression.', 'mouse', 'Gael.Y', 'monoclonal', '9045J', 'MPBiomedicals', 'Boite Ac Primaires#1 / Tiroir #3', '1:20000', '', '69100');

-- --------------------------------------------------------

--
-- Table structure for table `lab_members`
--

CREATE TABLE IF NOT EXISTS `lab_members` (
  `id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `lab_members`
--

INSERT INTO `lab_members` (`id`) VALUES
('Christelle.D'),
('Florent.C'),
('Gael.Y'),
('Gift.or.Purchased'),
('Helene.B');

-- --------------------------------------------------------

--
-- Table structure for table `notebooks`
--

CREATE TABLE IF NOT EXISTS `notebooks` (
  `ID` int(15) unsigned NOT NULL,
  `Begin_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Author` varchar(50) NOT NULL,
  `Serial_Number` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Serial_Number` (`Serial_Number`),
  KEY `Author` (`Author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `notebooks`
--

INSERT INTO `notebooks` (`ID`, `Begin_Date`, `End_Date`, `Author`, `Serial_Number`) VALUES
(1, '2005-04-01', '2006-01-31', 'Gael.Y', 'GY8'),
(2, '2005-05-24', '2005-12-07', 'Christelle.D', 'CD1'),
(3, '2008-01-16', '0000-00-00', 'Helene.B', 'EVO'),
(4, '2009-07-06', '2010-01-19', 'Helene.B', 'B49069'),
(5, '2012-09-03', '0000-00-00', 'Florent.C', 'E002933');

--
-- Table structure for table `oligos`
--

CREATE TABLE IF NOT EXISTS `oligos` (
  `id` char(15) NOT NULL,
  `Sequence` varchar(150) NOT NULL,
  `Date_` date DEFAULT NULL,
  `Description` longtext,
  `PCR_conditions_predicted` longtext,
  `Author` varchar(50) DEFAULT NULL,
  `Purif` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Author` (`Author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `oligos`
--

INSERT INTO `oligos` (`id`, `Sequence`, `Date_`, `Description`, `PCR_conditions_predicted`, `Author`, `Purif`) VALUES
('1C09', 'cttaatgcgccgctacaggg', '2006-10-05', 'to screen bacteria for cloning of GAL3 fragment into pRS306', '  #1: Product of length 475 (rating: 171)\r\n      Contains region of the molecule from 4048 to 4522\r\n      Tm: 80.5 C  TaOpt: 58.6 C  GC: 53.7\r\n    Sense Primer:\r\n      CTTAATGCGCCGCTACAGGG\r\n      Similarity: 100.0%\r\n      Length: 20  Tm: 57.2 C  GC: 60.0\r\n      dH: -170.4 kcal/mol  dS: -437.5 cal/mol  dG: -38.2 kcal/mol\r\n    Antisense Primer:\r\n      GCTACTGCGACTCTTAGGGCCAAT\r\n      Similarity: 100.0%\r\n      Length: 24  Tm: 58.9 C  GC: 54.17\r\n      dH: -191.8 kcal/mol  dS: -495.6 cal/mol  dG: -42.3 kcal/mol\r\n    Tm Difference: 1.8\r\n    GC Difference: 5.8\r\n', 'Gael.Y', ''),
('1F14', 'gtgatgacggtgaaaacctc', '2009-09-07', 'Upstream selection marker in pSH* plasmids.', '', 'Gael.Y', ''),
('1F19', 'ataagggcgacacggaaatg', '2009-10-12', 'To sequence CEN/ARS of pCEN-AdeAru', '', 'Gael.Y', ''),
('1F97', 'tgtaacccactcgtgcac', '2010-03-01', 'To sequence any plasmid from the AmpR coding sequence.', '', 'Gael.Y', 'SePoP'),
('1H75', 'cactatagggcgaattgg', '2011-01-06', 'To amplify yEGFP-CYC1term from pGY8 and clone it into pCM183 by homologous recombination in yeast.', '', 'Gael.Y', 'SePoP'),
('1I97', 'atttagagcttgacggggaaagcc', '2013-03-28', 'For Laser Game mutagenesis of Cre-VVD II.', 'Taille du fragment amplifié : 1531 nucl.\r\nGC% : 46%\r\nTempérature d''hybridation suggérée (TA) : 57°C\r\nAmorce sens : 1I96\r\nAmorce anti-sens : 1I97\r\n\r\nPrimer: 1I96 (1) 5'' tacctgttttgccgggtcagaa 3'' (22)\r\n                    ||||||||||||||||||||||\r\nTarget:   (4077) 5'' tacctgttttgccgggtcagaa 3'' (4099)\r\nscore : 178\r\nTM : 58\r\n\r\n\r\nPrimer: 1I97[compl.] (24)  \r\n3'' ggctttccccgtcaagctctaaat 5'' (1)\r\n                                  ||||||||||||||||||||||||\r\nTarget:              (5584) \r\n5'' ggctttccccgtcaagctctaaat 3'' (5608)\r\nscore : 180\r\nTM : 59\r\n\r\nTarget= pGY286', 'Helene.B', 'SePoP');

-- --------------------------------------------------------

--
-- Table structure for table `olig_purif`
--

CREATE TABLE IF NOT EXISTS `olig_purif` (
  `type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `olig_purif`
--

INSERT INTO `olig_purif` (`type`) VALUES
(''),
('Gold'),
('HPLC'),
('PAGE'),
('SePoP');

-- --------------------------------------------------------

--
-- Table structure for table `pip_events`
--

CREATE TABLE IF NOT EXISTS `pip_events` (
  `Events` varchar(100) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Events`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pip_events`
--

INSERT INTO `pip_events` (`Events`) VALUES
('Change Usage'),
('Change User'),
('Discard'),
('Maintenance'),
('Misc'),
('Purchase');

-- --------------------------------------------------------

--
-- Table structure for table `pip_generic_user`
--

CREATE TABLE IF NOT EXISTS `pip_generic_user` (
  `User` varchar(100) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pip_generic_user`
--

INSERT INTO `pip_generic_user` (`User`) VALUES
('Christelle.D'),
('Everybody'),
('Standby'),
('Student');

-- --------------------------------------------------------

--
-- Table structure for table `pip_history`
--

CREATE TABLE IF NOT EXISTS `pip_history` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Serial_Number` varchar(50) COLLATE utf8_general_ci NOT NULL,
  `Date` date NOT NULL,
  `Owner_fromNowOn` varchar(50) COLLATE utf8_general_ci NOT NULL,
  `Usage_fromNowOn` varchar(50) COLLATE utf8_general_ci NOT NULL,
  `Event_Type` varchar(100) COLLATE utf8_general_ci NOT NULL,
  `Comments` text COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC AUTO_INCREMENT=90 ;

--
-- Dumping data for table `pip_history`
--

INSERT INTO `pip_history` (`ID`, `Serial_Number`, `Date`, `Owner_fromNowOn`, `Usage_fromNowOn`, `Event_Type`, `Comments`) VALUES
(1, 'Y60538M', '2005-00-00', 'Christelle.D', 'Misc', 'Purchase', ''),
(2, 'Y60538M', '2006-00-00', 'Helene.B', 'Misc', 'Change User', 'Previous user: Christelle Damon'),
(3, 'Y60538M', '2009-03-04', 'Helene.B', 'Misc', 'Maintenance', 'Change of parts (spring was broken 2009_02_12)'),
(4, 'Y58817M', '2005-00-00', 'Christelle.D', 'Misc', 'Purchase', ''),
(5, 'Y58817M', '2006-00-00', 'Helene.B', 'Misc', 'Change User', 'Previous user: Christelle Damon'),
(6, 'Y58817M', '2009-03-04', 'Helene.B', 'Misc', 'Maintenance', 'Change of parts '),
(7, 'Y63235M', '2005-00-00', 'Christelle.D', 'Misc', 'Purchase', ''),
(8, 'Y63235M', '2009-03-04', 'Helene.B', 'Misc', 'Maintenance', ''),
(9, 'Y63235M', '2006-00-00', 'Helene.B', 'Misc', 'Change User', 'Previous user: Christelle Damon'),
(10, 'Z64108A', '2005-00-00', 'Christelle.D', 'Misc', 'Purchase', ''),
(11, 'Z64108A', '2006-00-00', 'Helene.B', 'Misc', 'Change User', 'Previous user: Christelle Damon'),
(12, 'Z64108A', '2009-03-04', 'Helene.B', 'Misc', 'Maintenance', ''),
(13, '2102895', '2005-09-01', 'Everybody', 'Misc', 'Purchase', ''),
(14, '6133327', '2007-03-02', 'Everybody', 'Misc', 'Purchase', ''),
(15, 'Z64108A', '2011-02-18', 'Andri.Leonidou', 'Misc', 'Change User', 'Previous user: Christelle Damon');

-- --------------------------------------------------------

--
-- Table structure for table `pip_marque`
--

CREATE TABLE IF NOT EXISTS `pip_marque` (
  `Marque` varchar(100) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Marque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pip_marque`
--

INSERT INTO `pip_marque` (`Marque`) VALUES
('BioHit'),
('Eppendorf'),
('Gilson');

-- --------------------------------------------------------

--
-- Table structure for table `pip_nonusers`
--

CREATE TABLE IF NOT EXISTS `pip_nonusers` (
  `User` varchar(100) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pip_nonusers`
--

INSERT INTO `pip_nonusers` (`User`) VALUES
('Florent.C'),
('Gift.or.Purchased');

-- --------------------------------------------------------

--
-- Table structure for table `pip_stock`
--

CREATE TABLE IF NOT EXISTS `pip_stock` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Serial_Number` varchar(40) COLLATE utf8_general_ci NOT NULL,
  `Marque` varchar(40) COLLATE utf8_general_ci NOT NULL,
  `Type` varchar(50) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Serial_Number` (`Serial_Number`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC AUTO_INCREMENT=228 ;

--
-- Dumping data for table `pip_stock`
--

INSERT INTO `pip_stock` (`ID`, `Serial_Number`, `Marque`, `Type`) VALUES
(1, 'Y60538M', 'Gilson', 'P1000'),
(2, 'Y58817M', 'Gilson', 'P200'),
(3, 'Y63235M', 'Gilson', 'P20'),
(4, 'Z64108A', 'Gilson', 'P2'),
(5, '2102895', 'Eppendorf', 'multicanaux_10-100ul'),
(6, '6133327', 'BioHit', 'multicanaux_02-10ul');

-- --------------------------------------------------------

--
-- Table structure for table `pip_type`
--

CREATE TABLE IF NOT EXISTS `pip_type` (
  `Type` varchar(50) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pip_type`
--

INSERT INTO `pip_type` (`Type`) VALUES
('multicanaux_02-10ul'),
('multicanaux_10-100ul'),
('multicanaux_50-1200ul'),
('P1000'),
('P2'),
('P20'),
('P200');

-- --------------------------------------------------------

--
-- Table structure for table `pip_usage`
--

CREATE TABLE IF NOT EXISTS `pip_usage` (
  `Usage` varchar(100) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Usage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pip_usage`
--

INSERT INTO `pip_usage` (`Usage`) VALUES
('Cellular'),
('Misc'),
('RNA');

-- --------------------------------------------------------

--
-- Table structure for table `pip_users`
--

CREATE TABLE IF NOT EXISTS `pip_users` (
  `User` varchar(100) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pip_users`
--

INSERT INTO `pip_users` (`User`) VALUES
('Christelle.D'),
('Helene.B');

-- --------------------------------------------------------

--
-- Table structure for table `plasmids`
--

CREATE TABLE IF NOT EXISTS `plasmids` (
  `id` int(10) unsigned NOT NULL,
  `Name_` varchar(50) DEFAULT NULL,
  `Other_names` varchar(50) DEFAULT NULL,
  `date_` date DEFAULT NULL,
  `Checkings` varchar(200) DEFAULT NULL,
  `Type_` varchar(25) DEFAULT NULL,
  `Marker_1` varchar(25) DEFAULT NULL,
  `Marker_2` varchar(25) DEFAULT NULL,
  `Bacterial_selection` varchar(25) DEFAULT NULL,
  `Tags` varchar(25) DEFAULT NULL,
  `parent_vector` varchar(50) DEFAULT NULL,
  `Insert_` varchar(50) DEFAULT NULL,
  `Insert_Type` varchar(25) DEFAULT NULL,
  `Construction_Description` longtext,
  `Reference_` varchar(200) DEFAULT NULL,
  `Reporter` varchar(25) DEFAULT NULL,
  `Promoter` varchar(25) DEFAULT NULL,
  `Link_to_file` varchar(100) DEFAULT NULL,
  `sequence` text,
  `image_file` varchar(100) DEFAULT NULL,
  `Author` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Link_to_file` (`Link_to_file`),
  UNIQUE KEY `Link_to_file_2` (`Link_to_file`),
  KEY `Author` (`Author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `plasmids`
--

INSERT INTO `plasmids` (`id`, `Name_`, `Other_names`, `date_`, `Checkings`, `Type_`, `Marker_1`, `Marker_2`, `Bacterial_selection`, `Tags`, `parent_vector`, `Insert_`, `Insert_Type`, `Construction_Description`, `Reference_`, `Reporter`, `Promoter`, `Link_to_file`, `sequence`, `image_file`, `Author`) VALUES
(1, 'pRSII303', NULL, '2013-05-28', '', 'integrative', 'HIS3', '', 'Amp', '', '', '', '', 'Bought from Addgene\r\n\r\n\r\nHIS3 has been modified to remove HindIII, KpnI, and PstI sites without altering the amino acid sequence of the His3 protein.\r\n\r\n\r\n', '', 'Lac Z', '', 'pRSII303.gb.gz', 'TCGCGCGTTTCGGTGATGACGGTGAAAACCTCTGACACATGCAGCTCCCGGAGACGGTCACAGCTTGTCTGTAAGCGGATGCCGGGAGCAGACAAGCCCGTCAGGGCGCGTCAGCGGGTGTTGGCGGGTGTCGGGGCTGGCTTAACTATGCGGCATCAGAGCAGATTGTACTGAGAGTGCACCATAAATTCCCGTTTTAAGAGCTTGGTGAGCGCTAGGAGTCACTGCCAGGTATCGTTTGAACACGGCATTAGTCAGGGAAGTCATAACACAGTCCTTTCCCGCAATTTTCTTTTTCTATTACTCTTGGCCTCCTCTAGTACACTCTATATTTTTTTATGCCTCGGTAATGATTTTCATTTTTTTTTTTCCACCTAGCGGATGACTCTTTTTTTTTCTTAGCGATTGGCATTATCACATAATGAATTATACATTATATAAAGTAATGTGATTTCTTCGAAGAATATACTAAAAAATGAGCAGGCAAGATAAACGAAGGCAAAGATGACAGAGCAGAAAGCCCTAGTAAAGCGTATTACAAATGAAACCAAGATTCAGATTGCGATCTCTTTAAAGGGTGGTCCCCTAGCGATAGAGCACTCGATCTTCCCAGAAAAAGAGGCAGAAGCAGTAGCAGAACAGGCCACACAATCGCAAGTGATTAACGTCCACACAGGTATAGGGTTTCTGGACCATATGATACATGCTCTGGCCAAGCATTCCGGCTGGTCGCTAATCGTTGAGTGCATTGGTGACTTACACATAGACGACCATCACACCACTGAAGACTGCGGGATTGCTCTCGGTCAAGCATTTAAAGAGGCCCTAGGGGCCGTGCGTGGAGTAAAAAGGTTTGGATCAGGATTTGCGCCTTTGGATGAGGCACTTTCCAGAGCGGTGGTAGATCTTTCGAACAGGCCGTACGCAGTTGTCGAACTTGGTTTGCAAAGGGAGAAAGTAGGAGATCTCTCTTGCGAGATGATCCCGCATTTTCTTGAAAGTTTTGCAGAGGCTAGCAGAATTACCCTCCACGTTGATTGTCTGCGAGGCAAGAATGATCATCACCGTAGTGAGAGTGCGTTCAAGGCTCTTGCGGTTGCCATAAGAGAAGCCACCTCGCCCAATGGTACAAACGATGTTCCCTCCACCAAAGGTGTTCTTATGTAGTGACACCGATTATTTAAAGTTGCAGCATACGATATATATACATGTGTATATATGTATACCTATGAATGTCAGTAAGTATGTATACGAACAGTATGATACTGAAGATGACAAGGTAATGCATCATTCTATACGTGTCATTCTGAACGAGGCGCGCTTTCCTTTTTTCTTTTTGCTTTTTCTTTTTTTTTCTCTTGAACTCGACGGATCTATGCGGTGTGAAATACCGCACAGATGCGTAAGGAGAAAATACCGCATCAGGAAATTGTAAGCGTTAATATTTTGTTAAAATTCGCGTTAAATTTTTGTTAAATCAGCTCATTTTTTAACCAATAGGCCGAAATCGGCAAAATCCCTTATAAATCAAAAGAATAGACCGAGATAGGGTTGAGTGTTGTTCCAGTTTGGAACAAGAGTCCACTATTAAAGAACGTGGACTCCAACGTCAAAGGGCGAAAAACCGTCTATCAGGGCGATGGCCCACTACGTGAACCATCACCCTAATCAAGTTTTTTGGGGTCGAGGTGCCGTAAAGCACTAAATCGGAACCCTAAAGGGAGCCCCCGATTTAGAGCTTGACGGGGAAAGCCGGCGAACGTGGCGAGAAAGGAAGGGAAGAAAGCGAAAGGAGCGGGCGCTAGGGCGCTGGCAAGTGTAGCGGTCACGCTGCGCGTAACCACCACACCCGCCGCGCTTAATGCGCCGCTACAGGGCGCGTCCATTCGCCATTCAGGCTGCGCAACTGTTGGGAAGGGCGATCGGTGCGGGCCTCTTCGCTATTACGCCAGCTGGCGAAAGGGGGATGTGCTGCAAGGCGATTAAGTTGGGTAACGCCAGGGTTTTCCCAGTCACGACGTTGTAAAACGACGGCCAGTGAATTGTAATACGACTCACTATAGGGCGAATTGGAGCTCCACCGCGGTGGCGGCCGCTCTAGAACTAGTGGATCCCCCGGGCTGCAGGAATTCGATATCAAGCTTATCGATACCGTCGACCTCGAGGGGGGGCCCGGTACCAGCTTTTGTTCCCTTTAGTGAGGGTTAATTTCGAGCTTGGCGTAATCATGGTCATAGCTGTTTCCTGTGTGAAATTGTTATCCGCTCACAATTCCACACAACATACGAGCCGGAAGCATAAAGTGTAAAGCCTGGGGTGCCTAATGAGTGAGCTAACTCACATTAATTGCGTTGCGCTCACTGCCCGCTTTCCAGTCGGGAAACCTGTCGTGCCAGCTGCATTAATGAATCGGCCAACGCGCGGGGAGAGGCGGTTTGCGTATTGGGCGCTCTTCCGCTTCCTCGCTCACTGACTCGCTGCGCTCGGTCGTTCGGCTGCGGCGAGCGGTATCAGCTCACTCAAAGGCGGTAATACGGTTATCCACAGAATCAGGGGATAACGCAGGAAAGAACATGTGAGCAAAAGGCCAGCAAAAGGCCAGGAACCGTAAAAAGGCCGCGTTGCTGGCGTTTTTCCATAGGCTCCGCCCCCCTGACGAGCATCACAAAAATCGACGCTCAAGTCAGAGGTGGCGAAACCCGACAGGACTATAAAGATACCAGGCGTTTCCCCCTGGAAGCTCCCTCGTGCGCTCTCCTGTTCCGACCCTGCCGCTTACCGGATACCTGTCCGCCTTTCTCCCTTCGGGAAGCGTGGCGCTTTCTCATAGCTCACGCTGTAGGTATCTCAGTTCGGTGTAGGTCGTTCGCTCCAAGCTGGGCTGTGTGCACGAACCCCCCGTTCAGCCCGACCGCTGCGCCTTATCCGGTAACTATCGTCTTGAGTCCAACCCGGTAAGACACGACTTATCGCCACTGGCAGCAGCCACTGGTAACAGGATTAGCAGAGCGAGGTATGTAGGCGGTGCTACAGAGTTCTTGAAGTGGTGGCCTAACTACGGCTACACTAGAAGAACAGTATTTGGTATCTGCGCTCTGCTGAAGCCAGTTACCTTCGGAAAAAGAGTTGGTAGCTCTTGATCCGGCAAACAAACCACCGCTGGTAGCGGTGGTTTTTTTGTTTGCAAGCAGCAGATTACGCGCAGAAAAAAAGGATCTCAAGAAGATCCTTTGATCTTTTCTACGGGGTCTGACGCTCAGTGGAACGAAAACTCACGTTAAGGGATTTTGGTCATGAGATTATCAAAAAGGATCTTCACCTAGATCCTTTTAAATTAAAAATGAAGTTTTAAATCAATCTAAAGTATATATGAGTAAACTTGGTCTGACAGTTACCAATGCTTAATCAGTGAGGCACCTATCTCAGCGATCTGTCTATTTCGTTCATCCATAGTTGCCTGACTCCCCGTCGTGTAGATAACTACGATACGGGAGGGCTTACCATCTGGCCCCAGTGCTGCAATGATACCGCGAGACCCACGCTCACCGGCTCCAGATTTATCAGCAATAAACCAGCCAGCCGGAAGGGCCGAGCGCAGAAGTGGTCCTGCAACTTTATCCGCCTCCATCCAGTCTATTAATTGTTGCCGGGAAGCTAGAGTAAGTAGTTCGCCAGTTAATAGTTTGCGCAACGTTGTTGCCATTGCTACAGGCATCGTGGTGTCACGCTCGTCGTTTGGTATGGCTTCATTCAGCTCCGGTTCCCAACGATCAAGGCGAGTTACATGATCCCCCATGTTGTGCAAAAAAGCGGTTAGCTCCTTCGGTCCTCCGATCGTTGTCAGAAGTAAGTTGGCCGCAGTGTTATCACTCATGGTTATGGCAGCACTGCATAATTCTCTTACTGTCATGCCATCCGTAAGATGCTTTTCTGTGACTGGTGAGTACTCAACCAAGTCATTCTGAGAATAGTGTATGCGGCGACCGAGTTGCTCTTGCCCGGCGTCAATACGGGATAATACCGCGCCACATAGCAGAACTTTAAAAGTGCTCATCATTGGAAAACGTTCTTCGGGGCGAAAACTCTCAAGGATCTTACCGCTGTTGAGATCCAGTTCGATGTAACCCACTCGTGCACCCAACTGATCTTCAGCATCTTTTACTTTCACCAGCGTTTCTGGGTGAGCAAAAACAGGAAGGCAAAATGCCGCAAAAAAGGGAATAAGGGCGACACGGAAATGTTGAATACTCATACTCTTCCTTTTTCAATATTATTGAAGCATTTATCAGGGTTATTGTCTCATGAGCGGATACATATTTGAATGTATTTAGAAAAATAAACAAATAGGGGTTCCGCGCACATTTCCCCGAAAAGTGCCACCTGACGTCTAAGAAACCATTATTATCATGACATTAACCTATAAAAATAGGCGTATCACGAGGCCCTTTCGTC', NULL, 'Gift.or.Purchased'),
(2, 'pRSII403', NULL, '2013-05-28', '', 'integrative', 'HIS3', '', 'Amp', '', '', '', '', 'Bought from Addgene\r\n\r\n\r\nHIS3 has been modified to remove HindIII, KpnI, and PstI sites without altering the amino acid sequence of the His3 protein.\r\n\r\n\r\n', '', 'Lac Z', '', 'pRSII403.gb.gz', 'tcgcgcgtttcggtgatgacggtgaaaacctctgacacatgcagctcccggagacggtcacagcttgtctgtaagcggatgccgggagcagacaagcccgtcagggcgcgtcagcgggtgttggcgggtgtcggggctggcttaactatgcggcatcagagcagattgtactgagagtgcaccataaattcccgttttaagagcttggtgagcgctaggagtcactgccaggtatcgtttgaacacggcattagtcagggaagtcataacacagtcctttcccgcaattttctttttctattactcttggcctcctctagtacactctatatttttttatgcctcggtaatgattttcatttttttttttccAcctagcggatgactctttttttttcttagcgattggcattatcacataatgaattatacattatataaagtaatgtgatttcttcgaagaatatactaaaaaatgagcaggcaagataaacgaaggcaaagatgacagagcagaaagccctagtaaagcgtattacaaatgaaaccaagattcagattgcgatctctttaaagggtggtcccctagcgatagagcactcgatcttcccagaaaaagaggcagaagcagtagcagaacaggccacacaatcgcaagtgattaacgtccacacaggtatagggtttctggaccatatgatacatgctctggccaagcattccggctggtcgctaatcgttgagtgcattggtgacttacacatagacgaccatcacaccactgaagactgcgggattgctctcggtcaagcAtttaaagaggccctaGGggcCGTgcgtggagtaaaaaggtttggatcaggatttgcgcctttggatgaggcactttccagagcggtggtagatctttcgaacaggccgtacgcagttgtcgaacttggtttgcaaagggagaaagtaggagatctctcttgcgagatgatcccgcattttcttgaaagTtttgcagaggctagcagaattaccctccacgttgattgtctgcgaggcaagaatgatcatcaccgtagtgagagtgcgttcaaggctcttgcggttgccataagagaagccacctcgcccaatggtacAaacgatgttccctccaccaaaggtgttcttatgtagtgacaccgattatttaaagTtgcagcatacgatatatatacatgtgtatatatgtatacctatgaatgtcagtaagtatgtatacgaacagtatgatactgaagatgacaaggtaatgcatcattctatacgtgtcattctgaacgaggcgcgctttccttttttctttttgctttttctttttttttctcttgaactcgacggatctatgcggtgtgaaataccgcacagatgcgtaaggagaaaataccgcatcaggaaattgtaaGcgttaatattttgttaaaattcgcgttaaatttttgttaaatcagctcattttttaaccaataggccgaaatcggcaaaatcccttataaatcaaaagaatagaccgagatagggttgagtgttgttccagtttggaacaagagtccactattaaagaacgtggactccaacgtcaaagggcgaaaaaccgtctatcagggcgatggcccactacgtgaaccatcaccctaatcaagttttttggggtcgaggtgccgtaaagcactaaatcggaaccctaaagggagcccccgatttagagcttgacggggaaagccggcgaacgtggcgagaaaggaagggaagaaagcgaaaggagcgggcgctagggcgctggcaagtgtagcggtcacgctgcgcgtaaccaccacacccgccgcgcttaatgcgccgctacagggcgcgtccattcgccattcaggctgcgcaactgttgggaagggcgatcggtgcgggcctcttcgctattacgccagctggcgaaagggggatgtgctgcaaggcgattaagttgggtaacgccagggttttcccagtcacgacgttgtaaaacgacggccagtgagcgcgcgtaatacgactcactatagggcgaattgggtaccgggccccccctcgaggtcgacggtatcgataagcttgatatcgaattcctgcagcccgggggatccactagttctagagcggccgccaccgcggtggagctccagcttttgttccctttagtgagggttaattgcgcgcttggcgtaatcatggtcatagctgtttcctgtgtgaaattgttatccgctcacaattccacacaacataCgagccggaagcataaagtgtaaagcctggggtgcctaatgagtgagCtaactcacattaattgcgttgcgctcactgcccgctttccagtcgggaaacctgtcgtgccagctgcattaatgaatcggccaacgcgcggggagaggcggtttgcgtattgggcgctcttccgcttcctcgctcactgactcgctgcgctcggtcgttcggctgcggcgagcggtatcagctcactcaaaggcggtaatacggttatccacagaatcaggggataacgcaggaaagaacatgtgagcaaaaggccagcaaaaggccaggaaccgtaaaaaggccgcgttgctggcgtttttccataggctccgcccccctgacgagcatcacaaaaatcgacgctcaagtcagaggtggcgaaacccgacaggactataaagataccaggcgtttccccctggaagctccctcgtgcgctctcctgttccgaccctgccgcttaccggatacctgtccgcctttctcccttcgggaagcgtggcgctttctcatagctcacgctgtaggtatctcagttcggtgtaggtcgttcgctccaagctgggctgtgtgcacgaaccccccgttcagcccgaccgctgcgccttatccggtaactatcgtcttgagtccaacccggtaagacacgacttatcgccactggcagcagccactggtaacaggattagcagagcgaggtatgtaggcggtgctacagagttcttgaagtggtggcctaactacggctacactagaagAacagtatttggtatctgcgctctgctgaagccagttaccttcggaaaaagagttggtagctcttgatccggcaaacaaaccaccgctggtagcggtggtttttttgtttgcaagcagcagattacgcgcagaaaaaaaggatctcaagaagatcctttgatcttttctacggggtctgacgctcagtggaacgaaaactcacgttaagggattttggtcatgagattatcaaaaaggatcttcacctagatccttttaaattaaaaatgaagttttaaatcaatctaaagtatatatgagtaaacttggtctgacagttaccaatgcttaatcagtgaggcacctatctcagcgatctgtctatttcgttcatccatagttgcctgactccccgtcgtgtagataactacgatacgggagggcttaccatctggccccagtgctgcaatgataccgcgagacccacgctcaccggctccagatttatcagcaataaaccagccagccggaagggccgagcgcagaagtggtcctgcaactttatccgcctccatccagtctattaattgttgccgggaagctagagtaagtagttcgccagttaatagtttgcgcaacgttgttgccattgctacaggcatcgtggtgtcacgctcgtcgtttggtatggcttcattcagctccggttcccaacgatcaaggcgagttacatgatcccccatgttgtgcaaaaaagcggttagctccttcggtcctccgatcgttgtcagaagtaagttggccgcagtgttatcactcatggttatggcagcactgcataattctcttactgtcatgccatccgtaagatgcttttctgtgactggtgagtactcaaccaagtcattctgagaatagtgtatgcggcgaccgagttgctcttgcccggcgtcaatacgggataataccgcgccacatagcagaactttaaaagtgctcatcattggaaaacgttcttcggggcgaaaactctcaaggatcttaccgctgttgagatccagttcgatgtaacccactcgtgcacccaactgatcttcagcatcttttactttcaccagcgtttctgggtgagcaaaaacaggaaggcaaaatgccgcaaaaaagggaataagggcgacacggaaatgttgaatactcatactcttcctttttcaatattattgaagcatttatcagggttattgtctcatgagcggatacatatttgaatgtatttagaaaaataaacaaataggggttccgcgcacatttccccgaaaagtgccacctgacgtctaagaaaccattattatcatgacattaacctataaaaataggcgtatcacgaggccctttcgtc', NULL, 'Gift.or.Purchased'),
(3, 'pRSII313', NULL, '2013-05-28', '', 'integrative', 'HIS3', '', 'Amp', '', '', '', '', 'Bought from Addgene\r\n\r\nHIS3 has been modified to remove HindIII, KpnI, and PstI sites without altering the amino acid sequence of the His3 protein.\r\n', '', 'Lac Z', '', 'pRSII313.gb.gz', 'TCGCGCGTTTCGGTGATGACGGTGAAAACCTCTGACACATGCAGCTCCCGGAGACGGTCACAGCTTGTCTGTAAGCGGATGCCGGGAGCAGACAAGCCCGTCAGGGCGCGTCAGCGGGTGTTGGCGGGTGTCGGGGCTGGCTTAACTATGCGGCATCAGAGCAGATTGTACTGAGAGTGCACCATAAATTCCCGTTTTAAGAGCTTGGTGAGCGCTAGGAGTCACTGCCAGGTATCGTTTGAACACGGCATTAGTCAGGGAAGTCATAACACAGTCCTTTCCCGCAATTTTCTTTTTCTATTACTCTTGGCCTCCTCTAGTACACTCTATATTTTTTTATGCCTCGGTAATGATTTTCATTTTTTTTTTTCCACCTAGCGGATGACTCTTTTTTTTTCTTAGCGATTGGCATTATCACATAATGAATTATACATTATATAAAGTAATGTGATTTCTTCGAAGAATATACTAAAAAATGAGCAGGCAAGATAAACGAAGGCAAAGATGACAGAGCAGAAAGCCCTAGTAAAGCGTATTACAAATGAAACCAAGATTCAGATTGCGATCTCTTTAAAGGGTGGTCCCCTAGCGATAGAGCACTCGATCTTCCCAGAAAAAGAGGCAGAAGCAGTAGCAGAACAGGCCACACAATCGCAAGTGATTAACGTCCACACAGGTATAGGGTTTCTGGACCATATGATACATGCTCTGGCCAAGCATTCCGGCTGGTCGCTAATCGTTGAGTGCATTGGTGACTTACACATAGACGACCATCACACCACTGAAGACTGCGGGATTGCTCTCGGTCAAGCATTTAAAGAGGCCCTAGGGGCCGTGCGTGGAGTAAAAAGGTTTGGATCAGGATTTGCGCCTTTGGATGAGGCACTTTCCAGAGCGGTGGTAGATCTTTCGAACAGGCCGTACGCAGTTGTCGAACTTGGTTTGCAAAGGGAGAAAGTAGGAGATCTCTCTTGCGAGATGATCCCGCATTTTCTTGAAAGTTTTGCAGAGGCTAGCAGAATTACCCTCCACGTTGATTGTCTGCGAGGCAAGAATGATCATCACCGTAGTGAGAGTGCGTTCAAGGCTCTTGCGGTTGCCATAAGAGAAGCCACCTCGCCCAATGGTACAAACGATGTTCCCTCCACCAAAGGTGTTCTTATGTAGTGACACCGATTATTTAAAGTTGCAGCATACGATATATATACATGTGTATATATGTATACCTATGAATGTCAGTAAGTATGTATACGAACAGTATGATACTGAAGATGACAAGGTAATGCATCATTCTATACGTGTCATTCTGAACGAGGCGCGCTTTCCTTTTTTCTTTTTGCTTTTTCTTTTTTTTTCTCTTGAACTCGACGGATCTATGCGGTGTGAAATACCGCACAGATGCGTAAGGAGAAAATACCGCATCAGGAAATTGTAAGCGTTAATATTTTGTTAAAATTCGCGTTAAATTTTTGTTAAATCAGCTCATTTTTTAACCAATAGGCCGAAATCGGCAAAATCCCTTATAAATCAAAAGAATAGACCGAGATAGGGTTGAGTGTTGTTCCAGTTTGGAACAAGAGTCCACTATTAAAGAACGTGGACTCCAACGTCAAAGGGCGAAAAACCGTCTATCAGGGCGATGGCCCACTACGTGAACCATCACCCTAATCAAGTTTTTTGGGGTCGAGGTGCCGTAAAGCACTAAATCGGAACCCTAAAGGGAGCCCCCGATTTAGAGCTTGACGGGGAAAGCCGGCGAACGTGGCGAGAAAGGAAGGGAAGAAAGCGAAAGGAGCGGGCGCTAGGGCGCTGGCAAGTGTAGCGGTCACGCTGCGCGTAACCACCACACCCGCCGCGCTTAATGCGCCGCTACAGGGCGCGTCCATTCGCCATTCAGGCTGCGCAACTGTTGGGAAGGGCGATCGGTGCGGGCCTCTTCGCTATTACGCCAGCTGGCGAAAGGGGGATGTGCTGCAAGGCGATTAAGTTGGGTAACGCCAGGGTTTTCCCAGTCACGACGTTGTAAAACGACGGCCAGTGAATTGTAATACGACTCACTATAGGGCGAATTGGAGCTCCACCGCGGTGGCGGCCGCTCTAGAACTAGTGGATCCCCCGGGCTGCAGGAATTCGATATCAAGCTTATCGATACCGTCGACCTCGAGGGGGGGCCCGGTACCAGCTTTTGTTCCCTTTAGTGAGGGTTAATTTCGAGCTTGGCGTAATCATGGTCATAGCTGTTTCCTGTGTGAAATTGTTATCCGCTCACAATTCCACACAACATACGAGCCGGAAGCATAAAGTGTAAAGCCTGGGGTGCCTAATGAGTGAGCTAACTCACATTAATTGCGTTGCGCTCACTGCCCGCTTTCCAGTCGGGAAACCTGTCGTGCCAGCTGCATTAATGAATCGGCCAACGCGCGGGGAGAGGCGGTTTGCGTATTGGGCGCTCTTCCGCTTCCTCGCTCACTGACTCGCTGCGCTCGGTCGTTCGGCTGCGGCGAGCGGTATCAGCTCACTCAAAGGCGGTAATACGGTTATCCACAGAATCAGGGGATAACGCAGGAAAGAACATGTGAGCAAAAGGCCAGCAAAAGGCCAGGAACCGTAAAAAGGCCGCGTTGCTGGCGTTTTTCCATAGGCTCCGCCCCCCTGACGAGCATCACAAAAATCGACGCTCAAGTCAGAGGTGGCGAAACCCGACAGGACTATAAAGATACCAGGCGTTTCCCCCTGGAAGCTCCCTCGTGCGCTCTCCTGTTCCGACCCTGCCGCTTACCGGATACCTGTCCGCCTTTCTCCCTTCGGGAAGCGTGGCGCTTTCTCATAGCTCACGCTGTAGGTATCTCAGTTCGGTGTAGGTCGTTCGCTCCAAGCTGGGCTGTGTGCACGAACCCCCCGTTCAGCCCGACCGCTGCGCCTTATCCGGTAACTATCGTCTTGAGTCCAACCCGGTAAGACACGACTTATCGCCACTGGCAGCAGCCACTGGTAACAGGATTAGCAGAGCGAGGTATGTAGGCGGTGCTACAGAGTTCTTGAAGTGGTGGCCTAACTACGGCTACACTAGAAGAACAGTATTTGGTATCTGCGCTCTGCTGAAGCCAGTTACCTTCGGAAAAAGAGTTGGTAGCTCTTGATCCGGCAAACAAACCACCGCTGGTAGCGGTGGTTTTTTTGTTTGCAAGCAGCAGATTACGCGCAGAAAAAAAGGATCTCAAGAAGATCCTTTGATCTTTTCTACGGGGTCTGACGCTCAGTGGAACGAAAACTCACGTTAAGGGATTTTGGTCATGAGATTATCAAAAAGGATCTTCACCTAGATCCTTTTAAATTAAAAATGAAGTTTTAAATCAATCTAAAGTATATATGAGTAAACTTGGTCTGACAGTTACCAATGCTTAATCAGTGAGGCACCTATCTCAGCGATCTGTCTATTTCGTTCATCCATAGTTGCCTGACTCCCCGTCGTGTAGATAACTACGATACGGGAGGGCTTACCATCTGGCCCCAGTGCTGCAATGATACCGCGAGACCCACGCTCACCGGCTCCAGATTTATCAGCAATAAACCAGCCAGCCGGAAGGGCCGAGCGCAGAAGTGGTCCTGCAACTTTATCCGCCTCCATCCAGTCTATTAATTGTTGCCGGGAAGCTAGAGTAAGTAGTTCGCCAGTTAATAGTTTGCGCAACGTTGTTGCCATTGCTACAGGCATCGTGGTGTCACGCTCGTCGTTTGGTATGGCTTCATTCAGCTCCGGTTCCCAACGATCAAGGCGAGTTACATGATCCCCCATGTTGTGCAAAAAAGCGGTTAGCTCCTTCGGTCCTCCGATCGTTGTCAGAAGTAAGTTGGCCGCAGTGTTATCACTCATGGTTATGGCAGCACTGCATAATTCTCTTACTGTCATGCCATCCGTAAGATGCTTTTCTGTGACTGGTGAGTACTCAACCAAGTCATTCTGAGAATAGTGTATGCGGCGACCGAGTTGCTCTTGCCCGGCGTCAATACGGGATAATACCGCGCCACATAGCAGAACTTTAAAAGTGCTCATCATTGGAAAACGTTCTTCGGGGCGAAAACTCTCAAGGATCTTACCGCTGTTGAGATCCAGTTCGATGTAACCCACTCGTGCACCCAACTGATCTTCAGCATCTTTTACTTTCACCAGCGTTTCTGGGTGAGCAAAAACAGGAAGGCAAAATGCCGCAAAAAAGGGAATAAGGGCGACACGGAAATGTTGAATACTCATACTCTTCCTTTTTCAATATTATTGAAGCATTTATCAGGGTTATTGTCTCATGAGCGGATACATATTTGAATGTATTTAGAAAAATAAACAAATAGGGGTTCCGCGCACATTTCCCCGAAAAGTGCCACCTGggtccttttcatcacgtgctataaaaataattataatttaaattttttaatataaatatataaattaaaaatagaaagtaaaaaaagaaattaaagaaaaaatagtttttgttttccgaagatgtaaaagactctagggggatcgccaacaaatactaccttttatcttgctcttcctgctctcaggtattaatgccgaattgtttcatcttgtctgtgtagaagaccacacacgaaaatcctgtgattttacattttacttatcgttaatcgaatgtatatctatttaatctgcttttcttgtctaataaatatatatgtaaagtacgctttttgttgaaattttttaaacctttgtttatttttttttcttcattccgtaactcttctaccttctttatttactttctaaaatccaaatacaaaacataaaaataaataaacacagagtaaattcccaaattattccatcattaaaagatacgaggcgcgtgtaagttacaggcaagcgatcCGTCTAAGAAACCATTATTATCATGACATTAACCTATAAAAATAGGCGTATCACGAGGCCCTTTCGTC', NULL, 'Gift.or.Purchased'),
(4, 'pRSII323', NULL, '2013-05-29', '', '2-mu', 'HIS3', '', 'Amp', '', '', '', '', 'Bought from Addgene\r\n\r\nHIS3 has been modified to remove HindIII, KpnI, and PstI sites without altering the amino acid sequence of the His3 protein.\r\n\r\n2 micron origin is from YEplac195, which has had its XbaI site removed.', '', 'Lac Z', '', 'pRSII323.gb.gz', 'TCGCGCGTTTCGGTGATGACGGTGAAAACCTCTGACACATGCAGCTCCCGGAGACGGTCACAGCTTGTCTGTAAGCGGATGCCGGGAGCAGACAAGCCCGTCAGGGCGCGTCAGCGGGTGTTGGCGGGTGTCGGGGCTGGCTTAACTATGCGGCATCAGAGCAGATTGTACTGAGAGTGCACCATAAATTCCCGTTTTAAGAGCTTGGTGAGCGCTAGGAGTCACTGCCAGGTATCGTTTGAACACGGCATTAGTCAGGGAAGTCATAACACAGTCCTTTCCCGCAATTTTCTTTTTCTATTACTCTTGGCCTCCTCTAGTACACTCTATATTTTTTTATGCCTCGGTAATGATTTTCATTTTTTTTTTTCCACCTAGCGGATGACTCTTTTTTTTTCTTAGCGATTGGCATTATCACATAATGAATTATACATTATATAAAGTAATGTGATTTCTTCGAAGAATATACTAAAAAATGAGCAGGCAAGATAAACGAAGGCAAAGATGACAGAGCAGAAAGCCCTAGTAAAGCGTATTACAAATGAAACCAAGATTCAGATTGCGATCTCTTTAAAGGGTGGTCCCCTAGCGATAGAGCACTCGATCTTCCCAGAAAAAGAGGCAGAAGCAGTAGCAGAACAGGCCACACAATCGCAAGTGATTAACGTCCACACAGGTATAGGGTTTCTGGACCATATGATACATGCTCTGGCCAAGCATTCCGGCTGGTCGCTAATCGTTGAGTGCATTGGTGACTTACACATAGACGACCATCACACCACTGAAGACTGCGGGATTGCTCTCGGTCAAGCATTTAAAGAGGCCCTAGGGGCCGTGCGTGGAGTAAAAAGGTTTGGATCAGGATTTGCGCCTTTGGATGAGGCACTTTCCAGAGCGGTGGTAGATCTTTCGAACAGGCCGTACGCAGTTGTCGAACTTGGTTTGCAAAGGGAGAAAGTAGGAGATCTCTCTTGCGAGATGATCCCGCATTTTCTTGAAAGTTTTGCAGAGGCTAGCAGAATTACCCTCCACGTTGATTGTCTGCGAGGCAAGAATGATCATCACCGTAGTGAGAGTGCGTTCAAGGCTCTTGCGGTTGCCATAAGAGAAGCCACCTCGCCCAATGGTACAAACGATGTTCCCTCCACCAAAGGTGTTCTTATGTAGTGACACCGATTATTTAAAGTTGCAGCATACGATATATATACATGTGTATATATGTATACCTATGAATGTCAGTAAGTATGTATACGAACAGTATGATACTGAAGATGACAAGGTAATGCATCATTCTATACGTGTCATTCTGAACGAGGCGCGCTTTCCTTTTTTCTTTTTGCTTTTTCTTTTTTTTTCTCTTGAACTCGACGGATCTATGCGGTGTGAAATACCGCACAGATGCGTAAGGAGAAAATACCGCATCAGGAAATTGTAAGCGTTAATATTTTGTTAAAATTCGCGTTAAATTTTTGTTAAATCAGCTCATTTTTTAACCAATAGGCCGAAATCGGCAAAATCCCTTATAAATCAAAAGAATAGACCGAGATAGGGTTGAGTGTTGTTCCAGTTTGGAACAAGAGTCCACTATTAAAGAACGTGGACTCCAACGTCAAAGGGCGAAAAACCGTCTATCAGGGCGATGGCCCACTACGTGAACCATCACCCTAATCAAGTTTTTTGGGGTCGAGGTGCCGTAAAGCACTAAATCGGAACCCTAAAGGGAGCCCCCGATTTAGAGCTTGACGGGGAAAGCCGGCGAACGTGGCGAGAAAGGAAGGGAAGAAAGCGAAAGGAGCGGGCGCTAGGGCGCTGGCAAGTGTAGCGGTCACGCTGCGCGTAACCACCACACCCGCCGCGCTTAATGCGCCGCTACAGGGCGCGTCCATTCGCCATTCAGGCTGCGCAACTGTTGGGAAGGGCGATCGGTGCGGGCCTCTTCGCTATTACGCCAGCTGGCGAAAGGGGGATGTGCTGCAAGGCGATTAAGTTGGGTAACGCCAGGGTTTTCCCAGTCACGACGTTGTAAAACGACGGCCAGTGAATTGTAATACGACTCACTATAGGGCGAATTGGAGCTCCACCGCGGTGGCGGCCGCTCTAGAACTAGTGGATCCCCCGGGCTGCAGGAATTCGATATCAAGCTTATCGATACCGTCGACCTCGAGGGGGGGCCCGGTACCAGCTTTTGTTCCCTTTAGTGAGGGTTAATTTCGAGCTTGGCGTAATCATGGTCATAGCTGTTTCCTGTGTGAAATTGTTATCCGCTCACAATTCCACACAACATACGAGCCGGAAGCATAAAGTGTAAAGCCTGGGGTGCCTAATGAGTGAGCTAACTCACATTAATTGCGTTGCGCTCACTGCCCGCTTTCCAGTCGGGAAACCTGTCGTGCCAGCTGCATTAATGAATCGGCCAACGCGCGGGGAGAGGCGGTTTGCGTATTGGGCGCTCTTCCGCTTCCTCGCTCACTGACTCGCTGCGCTCGGTCGTTCGGCTGCGGCGAGCGGTATCAGCTCACTCAAAGGCGGTAATACGGTTATCCACAGAATCAGGGGATAACGCAGGAAAGAACATGTGAGCAAAAGGCCAGCAAAAGGCCAGGAACCGTAAAAAGGCCGCGTTGCTGGCGTTTTTCCATAGGCTCCGCCCCCCTGACGAGCATCACAAAAATCGACGCTCAAGTCAGAGGTGGCGAAACCCGACAGGACTATAAAGATACCAGGCGTTTCCCCCTGGAAGCTCCCTCGTGCGCTCTCCTGTTCCGACCCTGCCGCTTACCGGATACCTGTCCGCCTTTCTCCCTTCGGGAAGCGTGGCGCTTTCTCATAGCTCACGCTGTAGGTATCTCAGTTCGGTGTAGGTCGTTCGCTCCAAGCTGGGCTGTGTGCACGAACCCCCCGTTCAGCCCGACCGCTGCGCCTTATCCGGTAACTATCGTCTTGAGTCCAACCCGGTAAGACACGACTTATCGCCACTGGCAGCAGCCACTGGTAACAGGATTAGCAGAGCGAGGTATGTAGGCGGTGCTACAGAGTTCTTGAAGTGGTGGCCTAACTACGGCTACACTAGAAGAACAGTATTTGGTATCTGCGCTCTGCTGAAGCCAGTTACCTTCGGAAAAAGAGTTGGTAGCTCTTGATCCGGCAAACAAACCACCGCTGGTAGCGGTGGTTTTTTTGTTTGCAAGCAGCAGATTACGCGCAGAAAAAAAGGATCTCAAGAAGATCCTTTGATCTTTTCTACGGGGTCTGACGCTCAGTGGAACGAAAACTCACGTTAAGGGATTTTGGTCATGAGATTATCAAAAAGGATCTTCACCTAGATCCTTTTAAATTAAAAATGAAGTTTTAAATCAATCTAAAGTATATATGAGTAAACTTGGTCTGACAGTTACCAATGCTTAATCAGTGAGGCACCTATCTCAGCGATCTGTCTATTTCGTTCATCCATAGTTGCCTGACTCCCCGTCGTGTAGATAACTACGATACGGGAGGGCTTACCATCTGGCCCCAGTGCTGCAATGATACCGCGAGACCCACGCTCACCGGCTCCAGATTTATCAGCAATAAACCAGCCAGCCGGAAGGGCCGAGCGCAGAAGTGGTCCTGCAACTTTATCCGCCTCCATCCAGTCTATTAATTGTTGCCGGGAAGCTAGAGTAAGTAGTTCGCCAGTTAATAGTTTGCGCAACGTTGTTGCCATTGCTACAGGCATCGTGGTGTCACGCTCGTCGTTTGGTATGGCTTCATTCAGCTCCGGTTCCCAACGATCAAGGCGAGTTACATGATCCCCCATGTTGTGCAAAAAAGCGGTTAGCTCCTTCGGTCCTCCGATCGTTGTCAGAAGTAAGTTGGCCGCAGTGTTATCACTCATGGTTATGGCAGCACTGCATAATTCTCTTACTGTCATGCCATCCGTAAGATGCTTTTCTGTGACTGGTGAGTACTCAACCAAGTCATTCTGAGAATAGTGTATGCGGCGACCGAGTTGCTCTTGCCCGGCGTCAATACGGGATAATACCGCGCCACATAGCAGAACTTTAAAAGTGCTCATCATTGGAAAACGTTCTTCGGGGCGAAAACTCTCAAGGATCTTACCGCTGTTGAGATCCAGTTCGATGTAACCCACTCGTGCACCCAACTGATCTTCAGCATCTTTTACTTTCACCAGCGTTTCTGGGTGAGCAAAAACAGGAAGGCAAAATGCCGCAAAAAAGGGAATAAGGGCGACACGGAAATGTTGAATACTCATACTCTTCCTTTTTCAATATTATTGAAGCATTTATCAGGGTTATTGTCTCATGAGCGGATACATATTTGAATGTATTTAGAAAAATAAACAAATAGGGGTTCCGCGCACATTTCCCCGAAAAGTGCCACCTGAAcgaagcatctgtgcttcattttgtagaacaaaaatgcaacgcgagagcgctaatttttcaaacaaagaatctgagctgcatttttacagaacagaaatgcaacgcgaaagcgctattttaccaacgaagaatctgtgcttcatttttgtaaaacaaaaatgcaacgcgagagcgctaatttttcaaacaaagaatctgagctgcatttttacagaacagaaatgcaacgcgagagcgctattttaccaacaaagaatctatacttcttttttgttctacaaaaatgcatcccgagagcgctatttttctaacaaagcatcttagattactttttttctcctttgtgcgctctataatgcagtctcttgataactttttgcactgtaggtccgttaaggttagaagaaggctactttggtgtctattttctcttccataaaaaaagcctgactccacttcccgcgtttactgattactagcgaagctgcgggtgcattttttcaagataaaggcatccccgattatattctataccgatgtggattgcgcatactttgtgaacagaaagtgatagcgttgatgattcttcattggtcagaaaattatgaacggtttcttctattttgtctctatatactacgtataggaaatgtttacattttcgtattgttttcgattcactctatgaatagttcttactacaatttttttgtctaaagagtaatactagagataaacataaaaaatgtagaggtcgagtttagatgcaagttcaaggagcgaaaggtggatgggtaggttatatagggatatagcacagagatatatagcaaagagatacttttgagcaatgtttgtggaagcggtattcgcaatattttagtagctcgttacagtccggtgcgtttttggttttttgaaagtgcgtcttcagagcgcttttggttttcaaaagcgctctgaagttcctatactttctagCTAGagaataggaacttcggaataggaacttcaaagcgtttccgaaaacgagcgcttccgaaaatgcaacgcgagctgcgcacatacagctcactgttcacgtcgcacctatatctgcgtgttgcctgtatatatatatacatgagaagaacggcatagtgcgtgtttatgcttaaatgcgtacttatatgcgtctatttatgtaggatgaaaggtagtctagtacctcctgtgatattatcccattccatgcggggtatcgtatgcttccttcagcactaccctttagctgttctatatgctgccactcctcaattggattagtctcatccttcaatgctatcatttcctttgatattggatcaTCTAAGAAACCATTATTATCATGACATTAACCTATAAAAATAGGCGTATCACGAGGCCCTTTCGTC', NULL, 'Gift.or.Purchased'),
(5, 'pRSII423', NULL, '2013-05-29', '', '2-mu', 'HIS3', '', 'Amp', '', '', '', '', 'Bought from Addgene\r\n\r\nHIS3 has been modified to remove HindIII, KpnI, and PstI sites without altering the amino acid sequence of the His3 protein.\r\n\r\n2 micron replication origin is from YEplac195 and has had its XbaI site removed.', '', 'Lac Z', '', 'pRSII423.gb.gz', 'tcgcgcgtttcggtgatgacggtgaaaacctctgacacatgcagctcccggagacggtcacagcttgtctgtaagcggatgccgggagcagacaagcccgtcagggcgcgtcagcgggtgttggcgggtgtcggggctggcttaactatgcggcatcagagcagattgtactgagagtgcaccataaattcccgttttaagagcttggtgagcgctaggagtcactgccaggtatcgtttgaacacggcattagtcagggaagtcataacacagtcctttcccgcaattttctttttctattactcttggcctcctctagtacactctatatttttttatgcctcggtaatgattttcatttttttttttccAcctagcggatgactctttttttttcttagcgattggcattatcacataatgaattatacattatataaagtaatgtgatttcttcgaagaatatactaaaaaatgagcaggcaagataaacgaaggcaaagatgacagagcagaaagccctagtaaagcgtattacaaatgaaaccaagattcagattgcgatctctttaaagggtggtcccctagcgatagagcactcgatcttcccagaaaaagaggcagaagcagtagcagaacaggccacacaatcgcaagtgattaacgtccacacaggtatagggtttctggaccatatgatacatgctctggccaagcattccggctggtcgctaatcgttgagtgcattggtgacttacacatagacgaccatcacaccactgaagactgcgggattgctctcggtcaagcAtttaaagaggccctaGGggcCGTgcgtggagtaaaaaggtttggatcaggatttgcgcctttggatgaggcactttccagagcggtggtagatctttcgaacaggccgtacgcagttgtcgaacttggtttgcaaagggagaaagtaggagatctctcttgcgagatgatcccgcattttcttgaaagTtttgcagaggctagcagaattaccctccacgttgattgtctgcgaggcaagaatgatcatcaccgtagtgagagtgcgttcaaggctcttgcggttgccataagagaagccacctcgcccaatggtacAaacgatgttccctccaccaaaggtgttcttatgtagtgacaccgattatttaaagTtgcagcatacgatatatatacatgtgtatatatgtatacctatgaatgtcagtaagtatgtatacgaacagtatgatactgaagatgacaaggtaatgcatcattctatacgtgtcattctgaacgaggcgcgctttccttttttctttttgctttttctttttttttctcttgaactcgacggatctatgcggtgtgaaataccgcacagatgcgtaaggagaaaataccgcatcaggaaattgtaaGcgttaatattttgttaaaattcgcgttaaatttttgttaaatcagctcattttttaaccaataggccgaaatcggcaaaatcccttataaatcaaaagaatagaccgagatagggttgagtgttgttccagtttggaacaagagtccactattaaagaacgtggactccaacgtcaaagggcgaaaaaccgtctatcagggcgatggcccactacgtgaaccatcaccctaatcaagttttttggggtcgaggtgccgtaaagcactaaatcggaaccctaaagggagcccccgatttagagcttgacggggaaagccggcgaacgtggcgagaaaggaagggaagaaagcgaaaggagcgggcgctagggcgctggcaagtgtagcggtcacgctgcgcgtaaccaccacacccgccgcgcttaatgcgccgctacagggcgcgtccattcgccattcaggctgcgcaactgttgggaagggcgatcggtgcgggcctcttcgctattacgccagctggcgaaagggggatgtgctgcaaggcgattaagttgggtaacgccagggttttcccagtcacgacgttgtaaaacgacggccagtgagcgcgcgtaatacgactcactatagggcgaattgggtaccgggccccccctcgaggtcgacggtatcgataagcttgatatcgaattcctgcagcccgggggatccactagttctagagcggccgccaccgcggtggagctccagcttttgttccctttagtgagggttaattgcgcgcttggcgtaatcatggtcatagctgtttcctgtgtgaaattgttatccgctcacaattccacacaacataCgagccggaagcataaagtgtaaagcctggggtgcctaatgagtgagCtaactcacattaattgcgttgcgctcactgcccgctttccagtcgggaaacctgtcgtgccagctgcattaatgaatcggccaacgcgcggggagaggcggtttgcgtattgggcgctcttccgcttcctcgctcactgactcgctgcgctcggtcgttcggctgcggcgagcggtatcagctcactcaaaggcggtaatacggttatccacagaatcaggggataacgcaggaaagaacatgtgagcaaaaggccagcaaaaggccaggaaccgtaaaaaggccgcgttgctggcgtttttccataggctccgcccccctgacgagcatcacaaaaatcgacgctcaagtcagaggtggcgaaacccgacaggactataaagataccaggcgtttccccctggaagctccctcgtgcgctctcctgttccgaccctgccgcttaccggatacctgtccgcctttctcccttcgggaagcgtggcgctttctcatagctcacgctgtaggtatctcagttcggtgtaggtcgttcgctccaagctgggctgtgtgcacgaaccccccgttcagcccgaccgctgcgccttatccggtaactatcgtcttgagtccaacccggtaagacacgacttatcgccactggcagcagccactggtaacaggattagcagagcgaggtatgtaggcggtgctacagagttcttgaagtggtggcctaactacggctacactagaagAacagtatttggtatctgcgctctgctgaagccagttaccttcggaaaaagagttggtagctcttgatccggcaaacaaaccaccgctggtagcggtggtttttttgtttgcaagcagcagattacgcgcagaaaaaaaggatctcaagaagatcctttgatcttttctacggggtctgacgctcagtggaacgaaaactcacgttaagggattttggtcatgagattatcaaaaaggatcttcacctagatccttttaaattaaaaatgaagttttaaatcaatctaaagtatatatgagtaaacttggtctgacagttaccaatgcttaatcagtgaggcacctatctcagcgatctgtctatttcgttcatccatagttgcctgactccccgtcgtgtagataactacgatacgggagggcttaccatctggccccagtgctgcaatgataccgcgagacccacgctcaccggctccagatttatcagcaataaaccagccagccggaagggccgagcgcagaagtggtcctgcaactttatccgcctccatccagtctattaattgttgccgggaagctagagtaagtagttcgccagttaatagtttgcgcaacgttgttgccattgctacaggcatcgtggtgtcacgctcgtcgtttggtatggcttcattcagctccggttcccaacgatcaaggcgagttacatgatcccccatgttgtgcaaaaaagcggttagctccttcggtcctccgatcgttgtcagaagtaagttggccgcagtgttatcactcatggttatggcagcactgcataattctcttactgtcatgccatccgtaagatgcttttctgtgactggtgagtactcaaccaagtcattctgagaatagtgtatgcggcgaccgagttgctcttgcccggcgtcaatacgggataataccgcgccacatagcagaactttaaaagtgctcatcattggaaaacgttcttcggggcgaaaactctcaaggatcttaccgctgttgagatccagttcgatgtaacccactcgtgcacccaactgatcttcagcatcttttactttcaccagcgtttctgggtgagcaaaaacaggaaggcaaaatgccgcaaaaaagggaataagggcgacacggaaatgttgaatactcatactcttcctttttcaatattattgaagcatttatcagggttattgtctcatgagcggatacatatttgaatgtatttagaaaaataaacaaataggggttccgcgcacatttccccgaaaagtgccacctgaAcgaagcatctgtgcttcattttgtagaacaaaaatgcaacgcgagagcgctaatttttcaaacaaagaatctgagctgcatttttacagaacagaaatgcaacgcgaaagcgctattttaccaacgaagaatctgtgcttcatttttgtaaaacaaaaatgcaacgcgagagcgctaatttttcaaacaaagaatctgagctgcatttttacagaacagaaatgcaacgcgagagcgctattttaccaacaaagaatctatacttcttttttgttctacaaaaatgcatcccgagagcgctatttttctaacaaagcatcttagattactttttttctcctttgtgcgctctataatgcagtctcttgataactttttgcactgtaggtccgttaaggttagaagaaggctactttggtgtctattttctcttccataaaaaaagcctgactccacttcccgcgtttactgattactagcgaagctgcgggtgcattttttcaagataaaggcatccccgattatattctataccgatgtggattgcgcatactttgtgaacagaaagtgatagcgttgatgattcttcattggtcagaaaattatgaacggtttcttctattttgtctctatatactacgtataggaaatgtttacattttcgtattgttttcgattcactctatgaatagttcttactacaatttttttgtctaaagagtaatactagagataaacataaaaaatgtagaggtcgagtttagatgcaagttcaaggagcgaaaggtggatgggtaggttatatagggatatagcacagagatatatagcaaagagatacttttgagcaatgtttgtggaagcggtattcgcaatattttagtagctcgttacagtccggtgcgtttttggttttttgaaagtgcgtcttcagagcgcttttggttttcaaaagcgctctgaagttcctatactttctagCTAGagaataggaacttcggaataggaacttcaaagcgtttccgaaaacgagcgcttccgaaaatgcaacgcgagctgcgcacatacagctcactgttcacgtcgcacctatatctgcgtgttgcctgtatatatatatacatgagaagaacggcatagtgcgtgtttatgcttaaatgcgtacttatatgcgtctatttatgtaggatgaaaggtagtctagtacctcctgtgatattatcccattccatgcggggtatcgtatgcttccttcagcactaccctttagctgttctatatgctgccactcctcaattggattagtctcatccttcaatgctatcatttcctttgatattggatcatctaagaaaccattattatcatgacattaacctataaaaataggcgtatcacgaggccctttcgtc', NULL, 'Gift.or.Purchased');

-- --------------------------------------------------------

--
-- Table structure for table `pl_bacterial_selection`
--

CREATE TABLE IF NOT EXISTS `pl_bacterial_selection` (
  `type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pl_bacterial_selection`
--

INSERT INTO `pl_bacterial_selection` (`type`) VALUES
(''),
('Amp'),
('Chloramphenicol'),
('Kan');

-- --------------------------------------------------------

--
-- Table structure for table `pl_features`
--

CREATE TABLE IF NOT EXISTS `pl_features` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Sequence` longtext NOT NULL,
  `Date_` date DEFAULT NULL,
  `Description` longtext,
  `Comments` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Author` varchar(50) DEFAULT NULL,
  `Category` varchar(15) NOT NULL DEFAULT 'OTH',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Sequence` (`Sequence`(128)),
  KEY `Author` (`Author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=25 ;

--
-- Dumping data for table `pl_features`
--

INSERT INTO `pl_features` (`id`, `Sequence`, `Date_`, `Description`, `Comments`, `Author`, `Category`) VALUES
(1, 'CGCTTGCCTGTAACTTACACGCGCCTCGTATCTTTTAATGATGGAATAATTTGGGAATTTACTCTGTGTTTATTTATTTTTATGTTTTGTATTTGGATTTTAGAAAGTAAATAAAGAAGGTAGAAGAGTTACGGAATGAAGAAAAAAAAATAAACAAAGGTTTAAAAAATTTCAACAAAAAGCGTACTTTACATATATATTTATTAGACAAGAAAAGCAGATTAAATAGATATACATTCGATTAACGATAAGTAAAATGTAAAATCACAGGATTTTCGTGTGTGGTCTTCTACACAGACAAGATGAAACAATTCGGCATTAATACCTGAGAGCAGGAAGAGCAAGATAAAAGGTAGTATTTGTTGGCGATCCCCCTAGAGTCTTTTACATCTTCGGAAAACAAAAACTATTTTTTCTTTAATTTCTTTTTTTACTTTCTATTTTTAATTTATATATTTATATTAAAAAATTTAAATTATAATTATTTTTATAGCACGTGATGAAAAGGACC', '2013-06-11', 'CEN6/ARSH4', '', 'Gael.Y', 'ORI'),
(2, 'ATAACTTCGTATAATGTATGCTATACGAAGTTAT', '2013-06-11', 'LoxP', '', 'Gael.Y', 'OTH'),
(3, 'ATGTCTAAAGGTGAAGAATTATTCACTGGTGTTGTCCCAATTTTGGTTGAATTAGATGGTGATGTTAATGGTCACAAATTTTCTGTCTCCGGTGAAGGTGAAGGTGATGCTACTTACGGTAAATTGACCTTAAAATTTATTTGTACTACTGGTAAATTGCCAGTTCCATGGCCAACCTTAGTCACTACTTTCGGTTATGGTGTTCAATGTTTTGCTAGATACCCAGATCATATGAAACAACATGACTTTTTCAAGTCTGCCATGCCAGAAGGTTATGTTCAAGAAAGAACTATTTTTTTCAAAGATGACGGTAACTACAAGACCAGAGCTGAAGTCAAGTTTGAAGGTGATACCTTAGTTAATAGAATCGAATTAAAAGGTATTGATTTTAAAGAAGATGGTAACATTTTAGGTCACAAATTGGAATACAACTATAACTCTCACAATGTTTACATCATGGCTGACAAACAAAAGAATGGTATCAAAGTTAACTTCAAAATTAGACACAACATTGAAGATGGTTCTGTTCAATTAGCTGACCATTATCAACAAAATACTCCAATTGGTGATGGTCCAGTCTTGTTACCAGACAACCATTACTTATCCACTCAATCTGCCTTATCCAAAGATCCAAACGAAAAGAGAGACCACATGGTCTTGTTAGAATTTGTTACTGCTGCTGGTATTACCCATGGTATGGATGAATTGTACAAA', '2013-06-11', 'yEGFP3-CDS', '', 'Gael.Y', 'REP'),
(4, 'atgacagagcagaaagccctagtaaagcgtattacaaatgaaaccaagattcagattgcgatctctttaaagggtggtcccctagcgatagagcactcgatcttcccagaaaaagaggcagaagcagtagcagaacaggccacacaatcgcaagtgattaacgtccacacaggtatagggtttctggaccatatgatacatgctctggccaagcattccggctggtcgctaatcgttgagtgcattggtgacttacacatagacgaccatcacaccactgaagactgcgggattgctctcggtcaagcttttaaagaggccctactggcgcgtggagtaaaaaggtttggatcaggatttgcgcctttggatgaggcactttccagagcggtggtagatctttcgaacaggccgtacgcagttgtcgaacttggtttgcaaagggagaaagtaggagatctctcttgcgagatgatcccgcattttcttgaaagctttgcagaggctagcagaattaccctccacgttgattgtctgcgaggcaagaatgatcatcaccgtagtgagagtgcgttcaaggctcttgcggttgccataagagaagccacctcgcccaatggtaccaacgatgttccctccaccaaaggtgttcttatgtag', '2013-07-19', 'HIS3-CDS', '', 'Gael.Y', 'SEL'),
(5, 'cgttttaagagcttggtgagcgctaggagtcactgccaggtatcgtttgaacacggcattagtcagggaagtcataacacagtcctttcccgcaattttctttttctattactcttggcctcctctagtacactctatatttttttatgcctcggtaatgattttcatttttttttttcccctagcggatgactctttttttttcttagcgattggcattatcacataatgaattatacattatataaagtaatgtgatttcttcgaagaatatactaaaaaatgagcaggcaagataaacgaaggcaaag', '2013-07-19', 'HIS3-prom', '', 'Gael.Y', 'PRO'),
(6, 'tgacaccgattatttaaagctgcagcatacgatatatatacatgtgtatatatgtatacctatgaatgtcagtaagtatgtatacgaacagtatgatactgaagatgacaaggtaatgcatcattctatacgtgtcattctgaacgaggcgcgctttccttttttctttttgctttttctttttttttctcttgaactcga', '2013-07-19', 'HIS3-term', '', 'Gael.Y', 'TER');

-- --------------------------------------------------------

--
-- Table structure for table `pl_features_catname`
--

CREATE TABLE IF NOT EXISTS `pl_features_catname` (
  `Category` varchar(15) COLLATE utf8_general_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`Category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pl_features_catname`
--

INSERT INTO `pl_features_catname` (`Category`, `Name`) VALUES
('PRO', 'Promoters'),
('REG', 'Regulatory sequences'),
('TER', 'Terminators'),
('SEL', 'Selectable markers'),
('ORI', 'Replication origins'),
('REP', 'Reporter genes'),
('TAG', 'Affinity tags'),
('LOC', 'Localization sequences'),
('HYB', 'Hybrid genes'),
('OTH', 'Miscellaneous features');

-- --------------------------------------------------------

--
-- Table structure for table `pl_tag`
--

CREATE TABLE IF NOT EXISTS `pl_tag` (
  `type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pl_tag`
--

INSERT INTO `pl_tag` (`type`) VALUES
(''),
('FLAG'),
('FlAsH'),
('GST'),
('HA'),
('HIS'),
('Myc'),
('ProA'),
('TAP');

-- --------------------------------------------------------

--
-- Table structure for table `pl_type`
--

CREATE TABLE IF NOT EXISTS `pl_type` (
  `type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pl_type`
--

INSERT INTO `pl_type` (`type`) VALUES
(''),
('2-mu'),
('centromeric'),
('integrative');

-- --------------------------------------------------------

--
-- Table structure for table `pl_yeast_marker`
--

CREATE TABLE IF NOT EXISTS `pl_yeast_marker` (
  `type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pl_yeast_marker`
--

INSERT INTO `pl_yeast_marker` (`type`) VALUES
(''),
('ADE2'),
('bialaphos'),
('CaURA3'),
('HIS3'),
('HIS3MX6'),
('HphNT1'),
('HygromycinB'),
('Kan'),
('KanMX'),
('KanMX4'),
('KlLEU2'),
('KlTRP1'),
('KlURA3'),
('KlURA3MX4'),
('LEU2'),
('LYS2'),
('Nat'),
('NatMX'),
('NatNT2'),
('phleomycin'),
('spHIS5'),
('TRP1'),
('URA3');

-- --------------------------------------------------------

--
-- Table structure for table `pl_yeast_promoter`
--

CREATE TABLE IF NOT EXISTS `pl_yeast_promoter` (
  `type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pl_yeast_promoter`
--

INSERT INTO `pl_yeast_promoter` (`type`) VALUES
(''),
('ADH'),
('CUP1'),
('CYC1'),
('GAL'),
('GAL1'),
('GALL'),
('GALS'),
('GPD'),
('MET25'),
('TEF');

-- --------------------------------------------------------

--
-- Table structure for table `strains`
--

CREATE TABLE IF NOT EXISTS `strains` (
  `id` int(10) unsigned NOT NULL,
  `Name_` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Date_` date DEFAULT NULL,
  `Comments` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `General_Background` varchar(25) NOT NULL,
  `Mating_Type` varchar(25) DEFAULT NULL,
  `ADE2` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `HIS3` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LEU2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LYS2` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TRP1` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `URA3` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `HO_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `locus1` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `locus2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `locus3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Parental_strain` varchar(25) DEFAULT NULL,
  `Obtained_by` varchar(25) DEFAULT NULL,
  `Checkings` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `extrachromosomal_plasmid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Other_names` varchar(25) DEFAULT NULL,
  `Reference_` varchar(125) DEFAULT NULL,
  `locus4` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `locus5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Cytoplasmic_Character` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Last_modified` date DEFAULT NULL,
  `MET15` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Author` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Author` (`Author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `strains`
--

INSERT INTO `strains` (`id`, `Name_`, `Date_`, `Comments`, `General_Background`, `Mating_Type`, `ADE2`, `HIS3`, `LEU2`, `LYS2`, `TRP1`, `URA3`, `HO_`, `locus1`, `locus2`, `locus3`, `Parental_strain`, `Obtained_by`, `Checkings`, `extrachromosomal_plasmid`, `Other_names`, `Reference_`, `locus4`, `locus5`, `Cytoplasmic_Character`, `Last_modified`, `MET15`, `Author`) VALUES
(1, 'BY4700', '2005-02-01', 'Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.', 'S288c', 'MATa', NULL, NULL, NULL, NULL, NULL, 'ura3∆0', NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', NULL, 'Gift.or.Purchased'),
(2, 'BY4709', '2005-02-01', 'Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.', 'S288c', 'MATb', NULL, NULL, NULL, NULL, NULL, 'ura3∆0', NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', NULL, 'Gift.or.Purchased'),
(3, 'BY4719', '2005-02-01', 'Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.', 'S288c', 'MATa', NULL, NULL, NULL, NULL, 'trp1∆63', 'ura3∆0', NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', NULL, 'Gift.or.Purchased'),
(4, 'BY4724', '2005-02-01', 'Gift from Gottschling Lab. Strain from ', 'S288c', 'MATa', NULL, NULL, NULL, 'lys2∆0', NULL, 'ura3∆0', NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', NULL, 'Gift.or.Purchased'),
(5, 'BY4720', '2003-05-06', NULL, 'S288c', 'MATb', NULL, NULL, NULL, 'lys2∆0', 'trp1∆63', 'ura3∆0', NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann et al; Yeast 1998 14:115-132.', NULL, NULL, NULL, '2006-11-02', NULL, 'Gift.or.Purchased'),
(6, 'BY4716', NULL, 'Gift from Hartwell Lab, who got it from Brachmann et al. Yeast 1998 14:115-132.', 'S288c', 'MATb', NULL, NULL, NULL, 'lys2∆0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann et al. Yeast 1998 14:115-132.', NULL, NULL, NULL, '2006-11-02', NULL, 'Gift.or.Purchased'),
(7, 'BY4741', '2005-10-11', 'Gift from Gilson Lab. Strain from Brachmann Yeast 14:115-132, 1998.', 'S288c', 'MATa', NULL, 'his3∆1', 'leu2∆0', NULL, NULL, 'ura3∆0', NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', 'met15∆0', 'Gift.or.Purchased'),
(8, 'BY4742', '2005-10-11', 'Gift from Gilson Lab. Strain from Brachmann Yeast 14:115-132, 1998.', 'S288c', 'MATb', NULL, 'his3∆1', 'leu2∆0', 'lys2∆0', NULL, 'ura3∆0', NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', NULL, 'Gift.or.Purchased'),
(9, 'BY4706', '2005-11-03', 'Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.', 'S288c', 'MATa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', 'met15∆0', 'Gift.or.Purchased'),
(10, 'BY4707', '2005-11-03', 'Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.', 'S288c', 'MATb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', 'met15∆0', 'Gift.or.Purchased'),
(11, 'BY4710', '2005-11-03', 'Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.', 'S288c', 'MATa', NULL, NULL, NULL, NULL, 'trp1∆63', NULL, NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', NULL, 'Gift.or.Purchased'),
(12, 'BY4711', '2005-11-03', 'Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.', 'S288c', 'MATb', NULL, NULL, NULL, NULL, 'trp1∆63', NULL, NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', NULL, 'Gift.or.Purchased'),
(13, 'BY4712', '2005-11-03', 'Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.', 'S288c', 'MATa', NULL, NULL, 'leu2∆0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', NULL, 'Gift.or.Purchased'),
(14, 'BY4713', '2005-11-03', 'Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.', 'S288c', 'MATb', NULL, NULL, 'leu2∆0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', NULL, 'Gift.or.Purchased'),
(15, 'BY4714', '2005-11-03', 'Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.', 'S288c', 'MATa', NULL, 'his3∆200', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', NULL, 'Gift.or.Purchased'),
(16, 'BY4715', '2005-11-03', 'Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.', 'S288c', 'MATa', NULL, NULL, NULL, 'lys2∆0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', NULL, 'Gift.or.Purchased'),
(17, 'BY4717', '2005-11-03', 'Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.', 'S288c', 'MATa', 'ade2∆::hisG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', NULL, 'Gift.or.Purchased'),
(18, 'BY4725', '2005-11-03', 'Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.', 'S288c', 'MATa', 'ade2∆::hisG', NULL, NULL, NULL, NULL, 'ura3∆0', NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', NULL, 'Gift.or.Purchased'),
(19, 'BY4726', '2005-11-03', 'Gift from Gottschling Lab. Strain from Brachmann Yeast 14:115-132, 1998.', 'S288c', 'MATb', 'ade2∆::hisG', NULL, NULL, NULL, NULL, 'ura3∆0', NULL, NULL, NULL, NULL, NULL, 'Gift', NULL, NULL, NULL, 'Brachmann Yeast 14:115-132, 1998.', NULL, NULL, NULL, '2006-11-02', NULL, 'Gift.or.Purchased');

-- --------------------------------------------------------

--
-- Table structure for table `st_ADE2`
--

CREATE TABLE IF NOT EXISTS `st_ADE2` (
  `alleles` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`alleles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `st_ADE2`
--

INSERT INTO `st_ADE2` (`alleles`) VALUES
(''),
('ade2-1'),
('ade2-1/ADE2'),
('ade2-1/ade2-1'),
('ADE2.'),
('ade2/ade2'),
('ade2∆::hisG'),
('loxP-ADE2-loxP-HphMX'),
('unknown');

-- --------------------------------------------------------

--
-- Table structure for table `st_general_backgrounds`
--

CREATE TABLE IF NOT EXISTS `st_general_backgrounds` (
  `background` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`background`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `st_general_backgrounds`
--

INSERT INTO `st_general_backgrounds` (`background`) VALUES
('273614X'),
('322134S'),
('378604X'),
('A364A'),
('AJA2'),
('CBS2888_1'),
('CBS3093_1'),
('CBS403_1'),
('CBS7960_1'),
('CECT10109_1'),
('CECT10266_1'),
('CEN.PK'),
('CLIB154_1'),
('CLIB157_1'),
('CLIB192_1'),
('CLIB208_1'),
('CLIB215_1'),
('CLIB219_2'),
('CLIB272_2'),
('CLIB274_1'),
('CLIB294_1'),
('CLIB318_1'),
('CLIB324_2'),
('CLIB326_1'),
('CLIB328'),
('CLIB382_1'),
('CLIB413_1'),
('CLIB483_1'),
('DBVPG1373_1'),
('DBVPG1399_1'),
('DBVPG1788_1'),
('DBVPG1794_1'),
('DBVPG1853_1'),
('DBVPG3591_1'),
('DBVPG4651_1'),
('DBVPG6041_1'),
('DBVPG6861'),
('EM93_3'),
('FL100'),
('FL200'),
('FY3'),
('I14_a'),
('IL-01'),
('industrial'),
('JAY270'),
('JAY291'),
('K1_1'),
('K12_2'),
('L9-4A'),
('M22_a'),
('mixture'),
('NC-02'),
('PW5'),
('RM11'),
('RM12'),
('RM13'),
('RM3'),
('RM5'),
('RM9'),
('S288c'),
('SK1'),
('T73_1'),
('TL229S2.2'),
('UC1_a'),
('UC5'),
('UC8_1'),
('unknown'),
('V5'),
('VL1'),
('W303'),
('WE372_1'),
('Y10_a'),
('Y12_1'),
('Y3_a'),
('Y4_1'),
('Y5_1'),
('Y55'),
('Y6_b'),
('Y8_1'),
('Y9_4'),
('Y9J_1'),
('YJM269_a'),
('YJM280'),
('YJM320'),
('YJM326'),
('YJM413'),
('YJM421'),
('YJM428'),
('YJM434_1'),
('YJM436_a'),
('YJM440_d'),
('YJM454_a'),
('YJM653_1'),
('YJM678_1'),
('YJM789'),
('YJM978'),
('YJM981'),
('YPS1000_a'),
('YPS1009'),
('YPS163_a');

-- --------------------------------------------------------

--
-- Table structure for table `st_HIS3`
--

CREATE TABLE IF NOT EXISTS `st_HIS3` (
  `alleles` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`alleles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `st_HIS3`
--

INSERT INTO `st_HIS3` (`alleles`) VALUES
(''),
('his3'),
('his3-11,15'),
('his3-11,15/HIS3'),
('his3-11,15/his3-11,15'),
('HIS3.'),
('his3∆1'),
('his3∆1/HIS3'),
('his3∆1/his3∆1'),
('his3∆200'),
('his3∆200/HIS3'),
('his3∆200/his3∆200'),
('unknown');

-- --------------------------------------------------------

--
-- Table structure for table `st_LEU2`
--

CREATE TABLE IF NOT EXISTS `st_LEU2` (
  `alleles` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`alleles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `st_LEU2`
--

INSERT INTO `st_LEU2` (`alleles`) VALUES
(''),
('leu2'),
('leu2-3,112'),
('leu2-3,112/LEU2'),
('leu2-3,112/leu2-3,112'),
('leu2::hisG'),
('leu2::hisG/LEU2'),
('leu2::hisG/leu2::hisG'),
('LEU2.'),
('leu2∆(asp781-EcoRI)'),
('leu2∆(asp781-EcoRI)/LEU2'),
('leu2∆(asp781-EcoRI)/leu2∆(asp781-EcoRI)'),
('leu2∆0'),
('leu2∆0/LEU2'),
('leu2∆0/leu2∆0'),
('leu2∆1'),
('leu2∆1/LEU2'),
('leu2∆1/leu2∆1'),
('unknown');

-- --------------------------------------------------------

--
-- Table structure for table `st_LYS2`
--

CREATE TABLE IF NOT EXISTS `st_LYS2` (
  `alleles` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`alleles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `st_LYS2`
--

INSERT INTO `st_LYS2` (`alleles`) VALUES
(''),
('lys2'),
('lys2-128d'),
('LYS2.'),
('lys2/lys2'),
('lys2∆0'),
('lys2∆0::lox-ADEaru-xol'),
('lys2∆0/LYS2'),
('lys2∆0/lys2∆0'),
('lys2∆202'),
('lys2∆202/LYS2'),
('lys2∆202/lys2∆202'),
('unknown');

-- --------------------------------------------------------

--
-- Table structure for table `st_MAT`
--

CREATE TABLE IF NOT EXISTS `st_MAT` (
  `alleles` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`alleles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `st_MAT`
--

INSERT INTO `st_MAT` (`alleles`) VALUES
('MATa'),
('MATa/MATa'),
('MATa/MATa/MATb/MATb'),
('MATa/MATb'),
('MATb'),
('MATb/MATb'),
('MATb/MATb/MATa'),
('unknown');

-- --------------------------------------------------------

--
-- Table structure for table `st_MET15`
--

CREATE TABLE IF NOT EXISTS `st_MET15` (
  `alleles` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`alleles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `st_MET15`
--

INSERT INTO `st_MET15` (`alleles`) VALUES
(''),
('MET15.'),
('met15∆0'),
('met15∆0/MET15'),
('met15∆0/met15∆0'),
('unknown');

-- --------------------------------------------------------

--
-- Table structure for table `st_TRP1`
--

CREATE TABLE IF NOT EXISTS `st_TRP1` (
  `alleles` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`alleles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `st_TRP1`
--

INSERT INTO `st_TRP1` (`alleles`) VALUES
(''),
('trp1'),
('trp1-1'),
('trp1-1/TRP1'),
('trp1-1/trp1-1'),
('trp1-289'),
('trp1-289/TRP1'),
('trp1-289/trp1-289'),
('TRP1.'),
('trp1∆::KanMX4'),
('trp1∆::KanMX4/TRP1'),
('trp1∆::KanMX4/trp1∆::KanMX4'),
('trp1∆1'),
('trp1∆1/TRP1'),
('trp1∆1/trp1∆1'),
('trp1∆2'),
('trp1∆2/TRP1'),
('trp1∆2/trp1∆2'),
('trp1∆63'),
('trp1∆63/TRP1'),
('trp1∆63/trp1∆63'),
('unknown');

-- --------------------------------------------------------

--
-- Table structure for table `st_URA3`
--

CREATE TABLE IF NOT EXISTS `st_URA3` (
  `alleles` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`alleles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `st_URA3`
--

INSERT INTO `st_URA3` (`alleles`) VALUES
(''),
('unknown'),
('URA::CMV-tTA'),
('ura3'),
('ura3-1'),
('ura3-52'),
('ura3-52/URA3'),
('ura3-52/ura3-52'),
('ura3::KanMX'),
('ura3::KanMX/URA3'),
('URA3.'),
('ura3/ura3'),
('ura3∆::hphNT1'),
('ura3∆0'),
('ura3∆0::TRP1'),
('ura3∆0/URA3'),
('ura3∆0/ura3∆0');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE IF NOT EXISTS `visitors` (
  `login` varchar(20) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `target_table` varchar(40) NOT NULL,
  `mode` varchar(40) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`login`, `pwd`, `target_table`, `mode`) VALUES
('add', 'c1f9f01b503af30a9a3d55ca04fd1690', 'dyn', 'add'),
('edit', '4aa96e9b91aadc291aa9a9eaabfd61ff', 'dyn', 'edit'),
('superuser', '52d7aef81185625af3d8af159fbcb589', 'all', 'super'),
('view', '3343cc43daba25f43c6999f219db376b', 'all', 'view');

-- --------------------------------------------------------

--
-- Table structure for table `websession`
--

CREATE TABLE IF NOT EXISTS `websession` (
  `id_session` varchar(100) NOT NULL,
  `login` varchar(40) NOT NULL,
  `time_limit` decimal(10,0) NOT NULL,
  `target_table` varchar(40) DEFAULT NULL,
  `mode` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_session`),
  KEY `login` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `oligos`
--
ALTER TABLE `oligos`
  ADD CONSTRAINT `oligos_ibfk_1` FOREIGN KEY (`Author`) REFERENCES `lab_members` (`id`);

--
-- Constraints for table `plasmids`
--
ALTER TABLE `plasmids`
  ADD CONSTRAINT `plasmids_ibfk_1` FOREIGN KEY (`Author`) REFERENCES `lab_members` (`id`);

--
-- Constraints for table `pl_features`
--
ALTER TABLE `pl_features`
  ADD CONSTRAINT `pl_features_ibfk_1` FOREIGN KEY (`Author`) REFERENCES `lab_members` (`id`);

--
-- Constraints for table `strains`
--
ALTER TABLE `strains`
  ADD CONSTRAINT `strains_ibfk_1` FOREIGN KEY (`Author`) REFERENCES `lab_members` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
