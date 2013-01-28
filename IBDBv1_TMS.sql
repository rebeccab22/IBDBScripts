/*
*********************************************************************

IBDBv1 Trait Management System (TMS)

by
Generation Challenge Programme (GCP)
and CIMMYT.

-- This script is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This script is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this script; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

*********************************************************************
*/


/*Table structure for table `tmsconsistency_checks` */



DROP TABLE IF EXISTS `tmsconsistency_checks`;



CREATE TABLE `tmsconsistency_checks` (
  `implicationid` int(11) NOT NULL,
  `logicaloperator` varchar(1) NOT NULL,
  `traitid` int(11) NOT NULL,
  `scaleid` int(11) NOT NULL,
  `methodid` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `link` int(11) NOT NULL,
  PRIMARY KEY (`implicationid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



/*Table structure for table `tmscontinuous_conversion` */



DROP TABLE IF EXISTS `tmscontinuous_conversion`;



CREATE TABLE `tmscontinuous_conversion` (
  `transid` int(10) NOT NULL DEFAULT '0',
  `operator` varchar(1) DEFAULT NULL,
  `factor` double DEFAULT NULL,
  PRIMARY KEY (`transid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



/*Table structure for table `tmscontinuous_function` */



DROP TABLE IF EXISTS `tmscontinuous_function`;



CREATE TABLE `tmscontinuous_function` (
  `transid` int(10) NOT NULL DEFAULT '0',
  `function` varchar(255) DEFAULT NULL,
  `funabbr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



/*Table structure for table `tmsdiscrete_conversion` */



DROP TABLE IF EXISTS `tmsdiscrete_conversion`;



CREATE TABLE `tmsdiscrete_conversion` (
  `transid` int(10) NOT NULL DEFAULT '0',
  `value1` double DEFAULT NULL,
  `value2` double DEFAULT NULL,
  PRIMARY KEY (`transid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



/*Table structure for table `tmsmeasuredin` */



DROP TABLE IF EXISTS `tmsmeasuredin`;



CREATE TABLE `tmsmeasuredin` (
  `measuredinid` int(11) NOT NULL,
  `traitid` int(11) NOT NULL,
  `scaleid` int(11) NOT NULL,
  `standardscale` varchar(50) DEFAULT NULL,
  `report` varchar(50) DEFAULT NULL,
  `formula` varchar(50) DEFAULT NULL,
  `tmethid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



/*Table structure for table `tmsmethod` */



DROP TABLE IF EXISTS `tmsmethod`;



CREATE TABLE `tmsmethod` (
  `tmethid` int(11) NOT NULL,
  `tmname` varchar(50) NOT NULL,
  `tmabbr` varchar(6) DEFAULT NULL,
  `tmdesc` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



/*Table structure for table `tmsscalecon` */



DROP TABLE IF EXISTS `tmsscalecon`;



CREATE TABLE `tmsscalecon` (
  `tmsscaleconid` int(11) NOT NULL,
  `measuredinid` int(11) NOT NULL,
  `slevel` double NOT NULL,
  `elevel` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



/*Table structure for table `tmsscaledis` */



DROP TABLE IF EXISTS `tmsscaledis`;



CREATE TABLE `tmsscaledis` (
  `tmsscaledisid` int(11) NOT NULL,
  `measuredinid` int(11) NOT NULL,
  `valuename` varchar(20) DEFAULT NULL,
  `valdesc` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



/*Table structure for table `tmsscales` */



DROP TABLE IF EXISTS `tmsscales`;



CREATE TABLE `tmsscales` (
  `scaleid` int(11) NOT NULL,
  `scname` varchar(50) DEFAULT NULL,
  `sctype` varchar(1) DEFAULT NULL,
  `ontology` varchar(50) DEFAULT NULL,
  `dtype` varchar(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



/*Table structure for table `tmstraits` */



DROP TABLE IF EXISTS `tmstraits`;



CREATE TABLE `tmstraits` (
  `tid` int(11) DEFAULT NULL,
  `traitid` int(11) NOT NULL,
  `trname` varchar(50) DEFAULT NULL,
  `trabbr` varchar(8) DEFAULT NULL,
  `trdesc` varchar(255) DEFAULT NULL,
  `tnstat` int(11) DEFAULT NULL,
  `traitgroup` varchar(50) DEFAULT NULL,
  `ontology` varchar(50) DEFAULT NULL,
  `traittype` char(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



/*Table structure for table `tmstransformations` */



DROP TABLE IF EXISTS `tmstransformations`;



CREATE TABLE `tmstransformations` (
  `transid` int(10) NOT NULL DEFAULT '0',
  `fromscaleid` int(10) DEFAULT NULL,
  `toscaleid` int(10) DEFAULT NULL,
  `transtype` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`transid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;