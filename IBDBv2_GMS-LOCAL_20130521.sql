-- =====================================================================================
-- ICIS Schema
-- Copyright 2005-9 International Rice Research Institute (IRRI) and 
--  Centro Internacional de Mejoramiento de Maiz y Trigo (CIMMYT)
--
-- All rights reserved.
--
-- url cropwiki.irri.org/icis/
-- url cropforge.irri.org/
--
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
-- =======================================================================================
--
-- Authors - -- MCDHabito
-- 		* IRRI-CIMMYT CROP RESEARCH INFORMATICS LABORATORY
--		* Generation Challenge Programme
-- Description - create the icis GMS tables (ver 5.6) / IBDB GMS v1 LOCAL
--

-- storage ENGINE=MyISAM DEFAULT CHARSET=utf8
--


--
-- table structure for table 'atributs'
--
DROP TABLE IF EXISTS atributs; 
CREATE TABLE atributs (
  aid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,      
  gid INT NOT NULL DEFAULT 0,
  atype INT NOT NULL DEFAULT 0,
  auid INT NOT NULL DEFAULT 0,
  aval VARCHAR(255) NOT NULL DEFAULT '-',
  alocn INT DEFAULT 0,
  aref INT DEFAULT 0,
  adate INT DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX atributs_idx01 ON atributs (alocn);
CREATE INDEX atributs_idx02 ON atributs (atype);
CREATE INDEX atributs_idx03 ON atributs (auid);
CREATE INDEX atributs_idx04 ON atributs (gid);
--


--
-- table structure for table 'bibrefs'
--
DROP TABLE IF EXISTS bibrefs; 
CREATE TABLE bibrefs (
  refid INT NOT NULL DEFAULT 0,
  pubtype INT DEFAULT 0,
  pubdate INT DEFAULT 0,
  authors VARCHAR(100) NOT NULL DEFAULT '-',
  editors VARCHAR(100) NOT NULL DEFAULT '-',
  analyt VARCHAR(255) NOT NULL DEFAULT '-',
  monogr VARCHAR(255) NOT NULL DEFAULT '-',
  series VARCHAR(255) NOT NULL DEFAULT '-',
  volume VARCHAR(10) NOT NULL DEFAULT '-',
  issue VARCHAR(10) NOT NULL DEFAULT '-',
  pagecol VARCHAR(25) NOT NULL DEFAULT '-',
  publish VARCHAR(50) NOT NULL DEFAULT '-',
  pucity VARCHAR(30) NOT NULL DEFAULT '-',
  pucntry VARCHAR(75) NOT NULL DEFAULT '-',
  authorlist INT DEFAULT NULL,		-- new column: points to PERSONLIST.PERSONLISTID
  editorlist INT DEFAULT NULL,		-- new column: points to PERSONLIST.PERSONLISTID
  PRIMARY KEY (refid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX bibrefs_idx01 ON bibrefs (refid); 
CREATE INDEX bibrefs_idx02 ON bibrefs (authorlist);
--

--
-- table structure for table 'changes'
--
DROP TABLE IF EXISTS changes; 
CREATE TABLE changes (
  cid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ctable VARCHAR(16) NOT NULL DEFAULT '-',
  cfield VARCHAR(16) NOT NULL DEFAULT '-',
  crecord INT NOT NULL DEFAULT 0,
  cfrom INT DEFAULT 0,
  cto INT DEFAULT 0,
  cdate INT DEFAULT 0,
  ctime INT DEFAULT 0,
  cgroup VARCHAR(20) NOT NULL DEFAULT '-',
  cuid INT DEFAULT 0,
  cref INT DEFAULT 0,
  cstatus INT DEFAULT 0,
  cdesc VARCHAR(255) NOT NULL DEFAULT '-'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX changes_idx01 ON changes (cid,ctable,crecord,cstatus);
CREATE INDEX changes_idx02 ON changes (crecord);
CREATE INDEX changes_idx03 ON changes (cid);   -- added 20091103 mhabito: define regular index on column(s) with UNIQUE KEY constraint
--

--
-- table structure for table 'cntry'
--
DROP TABLE IF EXISTS cntry;
 CREATE TABLE cntry (
  cntryid INT NOT NULL DEFAULT 0,
  isonum INT DEFAULT 0,
  isotwo VARCHAR(2) NOT NULL DEFAULT '-',
  isothree VARCHAR(3) NOT NULL DEFAULT '-',
  faothree VARCHAR(3) NOT NULL DEFAULT '-',
  fips VARCHAR(2) NOT NULL DEFAULT '-',
  wb VARCHAR(3) NOT NULL DEFAULT '-',
  isofull VARCHAR(50) NOT NULL DEFAULT '-',
  isoabbr VARCHAR(25) NOT NULL DEFAULT '-',
  cont VARCHAR(10) NOT NULL DEFAULT '-',
  scntry INT DEFAULT 0,
  ecntry INT DEFAULT 0,
  cchange INT DEFAULT 0,
  PRIMARY KEY (cntryid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX cntry_idx01 ON cntry (cntryid);
CREATE INDEX cntry_idx02 ON cntry (isonum);
--
insert  into `cntry`(`cntryid`,`isonum`,`isotwo`,`isothree`,`faothree`,`fips`,`wb`,`isofull`,`isoabbr`,`cont`,`scntry`,`ecntry`,`cchange`) values (1,4,'AF','AFG','002','AF','AFG','Democratic Republic of Afghanistan','Afghanistan','Asia',19730000,0,0),(2,8,'AL','ALB','003','AL','ALB','Peoples Socialist Republic of Albania','Albania','Europe',19121128,0,0),(3,12,'DZ','DZA','004','AG','DZA','Peoples Democratic Republic of Algeria','Algeria','Africa',19620700,0,0),(4,16,'AS','ASM','005','AQ','-','American Samoa','American Samoa','Oceania',19290000,0,0),(5,20,'AD','AND','006','AN','-','Andorra','Andorra','Europe',0,0,0),(6,24,'AO','AGO','007','AO','AGO','Peoples Republic of Angola','Angola','Africa',19750000,0,0),(7,10,'AQ','ATA','030','AY','-','Antarctica','Antarctica','Antarctica',0,0,0),(8,28,'AG','ATG','008','AC','-','Antigua and Barbuda','Antigua and Barbuda','N-America',19670000,0,0),(9,32,'AR','ARG','009','AR','ARG','Argentine Republic','Argentina','S-America',0,0,0),(10,51,'AM','ARM','001','AM','-','Armenia','Armenia','Asia',19910921,0,0),(11,36,'AU','AUS','010','AS','AUS','Commonwealth of Australia','Australia','Oceania',19010000,0,0),(12,40,'AT','AUT','011','AU','AUT','Republic of Austria','Austria','Europe',19180000,0,0),(13,31,'AZ','AZE','052','AJ','-','Azerbaijan','Azerbaijan','Asia',19920000,0,0),(14,44,'BS','BHS','012','BF','-','Commonwealth of the Bahamas','Bahamas','N-America',19730700,0,0),(15,48,'BH','BHR','013','BA','-','State of Bahrain','Bahrain','Asia',19710000,0,0),(16,50,'BD','BGD','016','BG','BGD','Peoples Republic of Bangladesh','Bangladesh','Asia',19710000,0,0),(17,52,'BB','BRB','014','BB','-','Barbados','Barbados','N-America',19610000,0,0),(18,56,'BE','BEL','255','BE','BEL','Kingdom of Belgium','Belgium','Europe',0,0,0),(19,0,'-','-','015','-','-','Belgium And Luxembourg','Belgium-lux','Europe',0,0,0),(20,84,'BZ','BLZ','023','BH','BLZ','Belize','Belize','N-America',19810900,0,0),(21,204,'BJ','BEN','053','BN','BEN','Peoples Republic of Benin','Benin','Africa',19600800,0,0),(22,60,'BM','BMU','017','BD','-','Bermuda','Bermuda','N-America',19680000,0,0),(23,64,'BT','BTN','018','BT','BTN','Kingdom of Bhutan','Bhutan','Asia',19700000,0,0),(24,68,'BO','BOL','019','BL','BOL','Republic of Bolivia','Bolivia','S-America',19670000,0,0),(25,70,'BA','BIH','080','BK','-','Bosnia Hertzegovina','Bosnia and Herzegovina','Europe',19920520,0,0),(26,72,'BW','BWA','020','BC','BWA','Republic of Botswana','Botswana','Africa',19660000,0,0),(27,0,'AK','ALK','231','-','-','Alaska State Of The United States','Alaska','N-America',19590000,0,0),(28,74,'BV','BVT','031','BV','-','Bouvet Island','Bouvet Island','Antarctica',0,0,0),(29,76,'BR','BRA','021','BR','BRA','Federative Republic of Brazil','Brazil','S-America',0,0,0),(30,86,'IO','IOT','024','IO','-','Brithish Indian Ocean Territory','British Indian Ocean Terr','Africa',19650000,0,0),(31,96,'BN','BRN','026','BX','BRN','Brunei','Brunei Darussalam','Asia',19840000,0,0),(32,100,'BG','BGR','027','BU','BGR','Peoples Republic of Bulgaria','Bulgaria','Europe',19460000,0,0),(33,104,'MM','MMR','028','BM','-','Socialist Republic of the Union of Burma','Myanmar','Asia',19890000,0,0),(34,108,'BI','BDI','029','BY','BDI','Republic of Burundi','Burundi','Africa',19620000,0,0),(35,112,'BY','BLR','057','BO','-','Belarus','Belarus','Asia',19920000,0,0),(36,120,'CM','CMR','032','CM','CMR','United Republic of Cameroon','Cameroon','Africa',19600000,0,0),(37,124,'CA','CAN','033','CA','CAN','Canada','Canada','N-America',19820417,0,0),(38,128,'CT','CTE','034','-','-','Canton And Enderbury Islands','Canton-end Is','Oceania',19790000,0,0),(39,132,'CV','CPV','035','CV','-','Republic of Cape Verde','Cape Verde','Africa',19650000,0,0),(40,136,'KY','CYM','036','CJ','-','Cayman Islands','Cayman Islands','N-America',0,0,0),(41,140,'CF','CAF','037','CT','CAF','Central African Republic','Central African Republic','Africa',19600000,0,0),(42,148,'TD','TCD','039','CD','TCD','Republic of Chad','Chad','Africa',19600000,0,0),(43,152,'CL','CHL','040','CI','CHL','Republic of Chile','Chile','S-America',0,0,0),(44,156,'CN','CHN','0','CH','CHN','Peoples Republic of China (Inc. Taiwan)','China','Asia',19490000,0,0),(45,0,'-','-','041','-','-','China (excluding Taiwan)','China Exc Taiwan','Asia',19490000,0,0),(46,162,'CX','CXR','042','KT','-','Christmas Island','Christmas Island','Oceania',0,0,0),(47,166,'CC','CCK','043','CK','-','Cocos (Keeling) Islands','Cocos (Keeling) Islands','Oceania',0,0,0),(48,170,'CO','COL','044','CO','COL','Republic of Colombia','Colombia','S-America',0,0,0),(49,174,'KM','COM','045','CN','-','Federal and Islamic Republic of Comoros','Comoros','Africa',19750706,0,0),(50,178,'CG','COG','046','CF','COG','Peoples Republic of the Congo','Congo','Africa',19600000,0,0),(51,184,'CK','COK','047','CW','-','Cook Islands','Cook Islands','Oceania',19010000,0,0),(52,188,'CR','CRI','048','CS','CRI','Republic of Costa Rica','Costa Rica','N-America',0,0,0),(53,192,'CU','CUB','049','CU','CUB','Republic of Cuba','Cuba','N-America',0,0,0),(54,196,'CY','CYP','050','CY','CYP','Republic of Cyprus','Cyprus','Asia',19600000,0,0),(55,203,'CZ','CZE','167','EZ','-','Czech Republic','Czech Republic','Europe',19930000,0,0),(56,0,'CS','CSK','051','-','-','Czechoslovakia','Czechoslovakia','Europe',19921216,0,0),(57,208,'DK','DNK','054','DA','DNK','Kingdom of Denmark','Denmark','Europe',0,0,0),(58,262,'DJ','DJI','072','DJ','DJI','Republic of Djibouti','Djibouti','Africa',19770000,0,0),(59,212,'DM','DMA','055','DO','-','Commonwealth of Dominica','Dominica','N-America',19780000,0,0),(60,214,'DO','DOM','056','DR','DOM','Dominican Republic','Dominican Republic','N-America',0,0,0),(61,216,'NQ','ATN','0','-','-','Dronning Maud Land','Dronning Maud La','-',0,0,0),(62,626,'TL','TLS','176','TT','-','Timor-Leste','Timor-Leste','Asia',0,0,0),(63,218,'EC','ECU','058','EC','ECU','Republic of Ecuador','Ecuador','S-America',0,0,0),(64,818,'EG','EGY','059','EG','EGY','Arab Republic of Egypt','Egypt','Africa',19520000,0,0),(65,222,'SV','SLV','060','ES','SLV','Republic of El Salvador','El Salvador','N-America',0,0,0),(66,226,'GQ','GNQ','061','EK','GNQ','Republic of Equatorial Guinea','Equatorial Guinea','Africa',19680000,0,0),(67,232,'ER','ERI','178','ER','-','Eritrea','Eritrea','Africa',19930400,0,0),(68,233,'EE','EST','063','EN','-','Estonia Metropolitan','Estonia','Asia',19920628,0,0),(69,231,'ET','ETH','238','ET','ETH','Ethiopia','Ethiopia','Africa',19420000,0,0),(70,234,'FO','FRO','064','FO','-','Faeroe Islands','Faroe Islands','Europe',0,0,0),(71,238,'FK','FLK','065','FK','-','Falkland Islands (Malvinas)','Falkland Islands','S-America',0,0,0),(72,242,'FJ','FJI','066','FJ','-','Fiji','Fiji','Oceania',19700000,0,0),(73,246,'FI','FIN','067','FI','FIN','Republic of Finland','Finland','Europe',19190000,0,0),(74,250,'FR','FRA','068','FR','FRA','France Republic','France','Europe',0,0,0),(75,254,'GF','GUF','069','FG','GUF','French Guiana','French Guiana','S-America',0,0,0),(76,258,'PF','PYF','070','FP','-','French Polynesia','French Polynesia','Oceania',0,0,0),(77,266,'GA','GAB','074','GB','GAB','Gabonese Republic','Gabon','Africa',19600000,0,0),(78,270,'GM','GMB','075','GA','GMB','Republic of the Gambia','Gambia','Africa',19650000,0,0),(79,0,'-','-','076','-','-','Gaza Strip','Gaza Strip','Asia',0,0,0),(80,268,'GE','GEO','073','GG','-','Georgia','Georgia','Asia',19920000,0,0),(81,278,'DD','DDR','077','-','-','German Democratic Republic','Germany (East)','Europe',0,19901003,260),(82,280,'DE','DEU','078','-','-','German Federal Republic','Germany (West)','Europe',0,19901003,260),(83,288,'GH','GHA','081','GH','GHA','Republic of Ghana','Ghana','Africa',19570000,0,0),(84,292,'GI','GIB','082','GI','-','Gibraltar','Gibraltar','Europe',0,0,0),(85,300,'GR','GRC','084','GR','GRC','Greece Hellenic Republic','Greece','Europe',0,0,0),(86,304,'GL','GRL','085','GL','-','Greenland','Greenland','N-America',0,0,0),(87,308,'GD','GRD','086','GJ','-','Grenada','Grenada','N-America',19740207,0,0),(88,312,'GP','GLP','087','GP','-','Guadeloupe','Guadeloupe','N-America',19460000,0,0),(89,316,'GU','GUM','088','GQ','-','Guam','Guam','Oceania',0,0,0),(90,320,'GT','GTM','089','GT','GTM','Republic of Guatemala','Guatemala','N-America',0,0,0),(91,324,'GN','GIN','090','GV','GIN','Revolutionary Peoples Republic of Guinea','Guinea','Africa',19580000,0,0),(92,624,'GW','GNB','175','PU','GNB','Republic of Guinea-Bissau','Guinea-Bissau','Africa',19740000,0,0),(93,328,'GY','GUY','091','GY','GUY','Republic of Guyana','Guyana','S-America',0,0,0),(94,332,'HT','HTI','093','HA','HTI','Republic of Haiti','Haiti','N-America',0,0,0),(95,334,'HM','HMD','092','HM','-','Heard Island and McDonald Islands','Heard & McDonald Islands','Antarctica',0,0,0),(96,336,'VA','VAT','094','VT','-','Vatican City State (Holy See)','Holy See','Europe',0,0,0),(97,340,'HN','HND','095','HO','HND','Republic of Honduras','Honduras','N-America',0,0,0),(98,344,'HK','HKG','096','HK','-','Hong Kong','Hong Kong','Asia',0,0,0),(99,348,'HU','HUN','097','HU','HUN','Hungarian Peoples Republic','Hungary','Europe',19200000,0,0),(100,352,'IS','ISL','099','IC','ISL','Republic of Iceland','Iceland','Europe',0,0,0),(101,356,'IN','IND','100','IN','IND','Republic of India','India','Asia',19470000,0,0),(102,360,'ID','IDN','101','ID','IDN','Republic of Indonesia','Indonesia','Asia',19490000,0,0),(103,364,'IR','IRN','102','IR','IRN','Islamic Republic Iran','Iran, Islamic Republic Of','Asia',19250000,0,0),(104,368,'IQ','IRQ','103','IZ','IRQ','Republic+K239 of Iraq','Iraq','Asia',19580714,0,0),(105,372,'IE','IRL','104','EI','IRL','Ireland','Ireland','Europe',19480000,0,0),(106,376,'IL','ISR','105','IS','ISR','State of Israel','Israel','Asia',19480000,0,0),(107,380,'IT','ITA','106','IT','ITA','Italian Republic','Italy','Europe',0,0,0),(108,384,'CI','CIV','107','IV','CIV','Republic of Ivory Coast','Côte D\'Ivoire','Africa',19600000,0,0),(109,388,'JM','JAM','109','JM','JAM','Jamaica','Jamaica','N-America',19620000,0,0),(110,392,'JP','JPN','110','JA','JPN','Japan','Japan','Asia',0,0,0),(111,396,'JT','JTN','111','-','-','Johnston Island','Johnston Is','Oceania',0,0,0),(112,400,'JO','JOR','112','JO','JOR','Hashemite Kingdom of Jordan','Jordan','Asia',19210000,0,0),(113,116,'KH','KHM','115','CB','KHM','Kampuchea, Democratic','Cambodia','Asia',19530000,0,0),(114,404,'KE','KEN','114','KE','KEN','Republic of Kenya','Kenya','Africa',19631212,0,0),(115,296,'KI','KIR','083','KR','-','Kiribati','Kiribati','Oceania',19790700,0,0),(116,408,'KP','PRK','116','KN','PRK','Democratic Peoples Republic of Korea','Korea, DPR','Asia',0,0,0),(117,410,'KR','KOR','117','KS','KOR','Republic of Korea','Korea, Republic of','Asia',19480800,0,0),(118,414,'KW','KWT','118','KU','KWT','State of Kuwait','Kuwait','Asia',19610000,0,0),(119,417,'KG','KGZ','113','KG','-','Kyrgyzstan','Kyrgyzstan','Asia',19910000,0,0),(120,418,'LA','LAO','120','LA','LAO','Lao Peoples Democratic Republic','Lao PDR','Asia',19540000,0,0),(121,428,'LV','LVA','119','LG','-','Latvia','Latvia','Asia',19910821,0,0),(122,422,'LB','LBN','121','LE','LBN','Lebanese Republic','Lebanon','Asia',19460000,0,0),(123,426,'LS','LSO','122','LT','LSO','Kingdom of Lesotho','Lesotho','Africa',19660000,0,0),(124,430,'LR','LBR','123','LI','LBR','Republic of Liberia','Liberia','Africa',0,0,0),(125,434,'LY','LBY','124','LY','LBY','Socialist Peoples Libyan Arab Jamahiriya','Libya','Africa',19510000,0,0),(126,438,'LI','LIE','125','LS','-','Principality of Liechtenstein','Liechtenstein','Europe',0,0,0),(127,442,'LU','LUX','256','LU','LUX','Grand Duchy of Luxembourg','Luxembourg','Europe',0,0,0),(128,440,'LT','LTU','126','LH','-','Lithuania','Lithuania','Asia',19920000,0,0),(129,446,'MO','MAC','128','MC','-','Macau','Macao','Asia',0,0,0),(130,450,'MG','MDG','129','MA','MDG','Democratic Republic of Madagascar','Madagascar','Africa',19750000,0,0),(131,454,'MW','MWI','130','MI','MWI','Republic of Malawi','Malawi','Africa',19640706,0,0),(132,458,'MY','MYS','131','MY','MYS','Malaysia','Malaysia','Asia',19570000,0,0),(133,462,'MV','MDV','132','MV','-','Republic of Maldives','Maldives','Asia',19680000,0,0),(134,466,'ML','MLI','133','ML','MLI','Republic of Mali','Mali','Africa',19600000,0,0),(135,470,'MT','MLT','134','MT','-','Republic of Malta','Malta','Europe',19640000,0,0),(136,474,'MQ','MTQ','135','MB','-','Martinique','Martinique','N-America',0,0,0),(137,807,'MK','MKD','0','MK','-','Macedonia, the Former Yugoslav Republic Of','Macedonia','Europe',19920000,0,0),(138,478,'MR','MRT','136','MR','MRT','Islamic Republic of Mauritania','Mauritania','Africa',19600000,0,0),(139,480,'MU','MUS','137','MP','-','Mauritius','Mauritius','Africa',19680312,0,0),(140,484,'MX','MEX','138','MX','MEX','United Mexican States','Mexico','N-America',0,0,0),(141,583,'FM','FSM','145','FM','-','Federated States of Micronesia','Micronesia','Oceania',19910917,0,0),(142,488,'MI','MID','139','-','-','Midway Islands','Midway Is','Oceania',0,0,0),(143,492,'MC','MCO','140','MN','-','Principality of Monaco','Monaco','Europe',0,0,0),(144,496,'MN','MNG','141','MG','MNG','State of Mongolia','Mongolia','Asia',19920000,0,0),(145,498,'MD','MDA','146','MD','-','Moldova','Moldova, Republic of','Europe',19920000,0,0),(146,500,'MS','MSR','142','MH','-','Montserrat','Montserrat','N-America',0,0,0),(147,504,'MA','MAR','143','MO','MAR','Kingdom of Morocco','Morocco','Africa',19560000,0,0),(148,508,'MZ','MOZ','144','MZ','MOZ','Peoples Republic of Mozambique','Mozambique','Africa',19750000,0,0),(149,516,'NA','NAM','147','WA','NAM','Namibia','Namibia','Africa',19900000,0,0),(150,520,'NR','NRU','148','NR','-','Republic of Nauru','Nauru','Oceania',19680000,0,0),(151,524,'NP','NPL','149','NP','NPL','Kingdom of Nepal','Nepal','Asia',0,0,0),(152,528,'NL','NLD','150','NL','NLD','Kingdom of the Netherlands','Netherlands','Europe',0,0,0),(153,530,'AN','ANT','151','-','-','Netherlands Antilles','Antilles','N-America',0,0,0),(154,536,'NT','NTZ','152','-','-','Neutral Zone','Neutral Zone','Asia',0,0,0),(155,540,'NC','NCL','153','NC','-','New Caledonia','New Caledonia','Oceania',0,0,0),(156,554,'NZ','NZL','156','NZ','NZL','New Zealand','New Zealand','Oceania',19070000,0,0),(157,558,'NI','NIC','157','NU','NIC','Republic of Nicaragua','Nicaragua','N-America',0,0,0),(158,562,'NE','NER','158','NG','NER','Republic of the Niger','Niger','Africa',19600000,0,0),(159,566,'NG','NGA','159','NI','NGA','Federal Republic of Nigeria','Nigeria','Africa',19601000,0,0),(160,570,'NU','NIU','160','NE','-','Niue','Niue','Oceania',0,0,0),(161,574,'NF','NFK','161','NF','-','Norfolk Island','Norfolk Island','Oceania',0,0,0),(162,578,'NO','NOR','162','NO','NOR','Kingdom of Norway','Norway','Europe',19050000,0,0),(163,512,'OM','OMN','221','MU','OMN','Sultanate of Oman','Oman','Asia',0,0,0),(164,582,'PC','PCI','164','-','-','Pacific Islands','Pacific Is','Oceania',0,0,0),(165,586,'PK','PAK','165','PK','PAK','Islamic Republic of Pakistan','Pakistan','Asia',19470000,0,0),(166,275,'PS','PSE','076','WE','-','Palestinian Territory, Occupied','Palestine','Asia',0,0,0),(167,591,'PA','PAN','166','PM','PAN','Republic of Panama','Panama','N-America',19030000,0,0),(168,598,'PG','PNG','168','PP','PNG','Papua New Guinea','Papua New Guinea','Oceania',19750000,0,0),(169,600,'PY','PRY','169','PA','PRY','Republic of Paraguay','Paraguay','S-America',0,0,0),(170,604,'PE','PER','170','PE','PER','Republic of Peru','Peru','S-America',19460000,0,0),(171,608,'PH','PHL','171','RP','PHL','Republic of the Philippines','Philippines','Asia',0,0,0),(172,612,'PN','PCN','172','PC','-','Pitcairn Island','Pitcairn','Oceania',0,0,0),(173,616,'PL','POL','173','PL','POL','Polish Peoples Republic','Poland','Europe',19180000,0,0),(174,620,'PT','PRT','174','PO','PRT','Portuguese Republic','Portugal','Europe',0,0,0),(175,630,'PR','PRI','177','RQ','PRI','Puerto Rico','Puerto Rico','N-America',19470000,0,0),(176,634,'QA','QAT','179','QA','QAT','State of Qatar','Qatar','Asia',19710000,0,0),(177,638,'RE','REU','182','RE','-','Reunion','Réunion','Africa',0,0,0),(178,239,'GS','SGS','073','SX','-','South Georgia and the South Sandwich Islands','South Georgia','-',0,0,0),(179,642,'RO','ROU','183','RO','ROM','Socialist Republic of Romania','Romania','Europe',19480000,0,0),(180,643,'RU','RUS','185','RS','-','Russia Federation','Russian Federation','-',19920000,0,0),(181,646,'RW','RWA','184','RW','RWA','Rwandese Republic','Rwanda','Africa',19620000,0,0),(182,662,'LC','LCA','189','ST','-','Saint Lucia','Saint Lucia','N-America',19790000,0,0),(183,882,'WS','WSM','244','WS','-','Independent State of Western Samoa','Samoa','Oceania',19620000,0,0),(184,674,'SM','SMR','192','SM','-','Republic of San Marino','San Marino','Europe',0,0,0),(185,678,'ST','STP','193','TP','-','Democratic Republic of Sao Tome and Principe','Sao Tome and Principe','Africa',19750000,0,0),(186,682,'SA','SAU','194','SA','SAU','Kingdom of Saudi Arabia','Saudi Arabia','Asia',19260000,0,0),(187,686,'SN','SEN','195','SG','SEN','Republic of Senegal','Senegal','Africa',19600000,0,0),(188,690,'SC','SYC','196','SE','-','Republic of Seychelles','Seychelles','Africa',19760000,0,0),(189,694,'SL','SLE','197','SL','SLE','Republic of Sierra Leone','Sierra Leone','Africa',19610000,0,0),(190,702,'SG','SGP','200','SN','-','Republic of Singapore','Singapore','Asia',19651222,0,0),(191,703,'SK','SVK','199','LO','-','Slovakia','Slovakia','Europe',19930000,0,0),(192,705,'SI','SVN','198','SI','-','Slovenia','Slovenia','Europe',19920000,0,0),(193,90,'SB','SLB','025','BP','-','Solomon Islands','Solomon Islands','Oceania',19780000,0,0),(194,706,'SO','SOM','201','SO','SOM','Somali Democratic Republic','Somalia','Africa',19600700,0,0),(195,710,'ZA','ZAF','202','SF','ZAF','Republic of South Africa','South Africa','Africa',19610000,0,0),(196,724,'ES','ESP','203','SP','ESP','Spanish State','Spain','Europe',0,0,0),(197,144,'LK','LKA','038','CE','LKA','Democratic Socialist Republic of Sri Lanka','Sri Lanka','Asia',19480204,0,0),(198,654,'SH','SHN','187','SH','-','St. Helena','St. Helena','Africa',0,0,0),(199,659,'KN','KNA','188','SC','-','St. Kitts and Nevis','Saint Kitts And Nevis','N-America',19830919,0,0),(200,666,'PM','SPM','190','SB','-','St. Pierre and Miquelon','Saint Pierre And Miquelon','N-America',0,0,0),(201,670,'VC','VCT','191','VC','-','Saint Vincent and the Grenadines','St. Vincent','N-America',19790000,0,0),(202,729,'SD','SDN','206','SU','SDN','Democratic Republic of the Sudan','Sudan','Africa',19540000,0,0),(203,740,'SR','SUR','207','NS','SUR','Republic of Suriname','Suriname','S-America',19751100,0,0),(204,744,'SJ','SJM','260','SV','-','Svalbard and Jan Mayan Islands','Svalbard And Jan Mayen','Europe',0,0,0),(205,748,'SZ','SWZ','209','WZ','SWZ','Kingdom of Swaziland','Swaziland','Africa',19680000,0,0),(206,752,'SE','SWE','210','SW','SWE','Kingdom of Sweden','Sweden','Europe',0,0,0),(207,756,'CH','CHE','211','SZ','CHE','Swiss Confederation','Switzerland','Europe',0,0,0),(208,760,'SY','SYR','212','SY','SYR','Syrian arab Republic','Syrian Arab Republic','Asia',19460000,0,0),(209,158,'TW','TWN','214','TW','OAN','Chinese Taipei (Taiwan)','Chinese Taipei (Taiwan)','Asia',19490000,0,0),(210,762,'TJ','TJK','208','TI','-','Tajikistan','Tajikistan','Asia',19920000,0,0),(211,834,'TZ','TZA','215','TZ','TZA','United Republic of Tanzania','Tanzania','Africa',19610000,0,0),(212,764,'TH','THA','216','TH','THA','Kingdom of Thailand','Thailand','Asia',0,0,0),(213,768,'TG','TGO','217','TO','TGO','Togolese Republic','Togo','Africa',19600427,0,0),(214,772,'TK','TKL','218','TL','-','Tokelau','Tokelau','Oceania',0,0,0),(215,776,'TO','TON','219','TN','-','Kingdom of Tonga','Tonga','Oceania',19700000,0,0),(216,0,'TA','TRA','0','-','-','Transkei','Transkei','Africa',19760000,0,0),(217,780,'TT','TTO','220','TD','TTO','Republic of Trinidad and Tobago','Trinidad and Tobago','N-America',19760000,0,0),(218,788,'TN','TUN','222','TS','TUN','Republic of Tunisia','Tunisia','Africa',19560320,0,0),(219,792,'TR','TUR','223','TU','TUR','Republic of Turkey','Turkey','Asia',19230000,0,0),(220,796,'TC','TCA','224','TK','-','Turks and Caicos Islands','Turks and Caicos Islands','N-America',0,0,0),(221,795,'TM','TKM','213','TX','-','Turkmenistan','Turkmenistan','Asia',19920000,0,0),(222,798,'TV','TUV','227','TV','-','Tuvalu','Tuvalu','Africa',19780000,0,0),(223,810,'SU','SUN','228','UR','-','Union Of Soviet Socialist Republic','Ussr','Asia',19171107,19911225,0),(224,860,'UZ','UZB','235','UZ','-','Uzbekistan','Uzbekistan','Asia',19920000,0,0),(225,800,'UG','UGA','226','UG','UGA','Republic of Uganda','Uganda','Africa',19620000,0,0),(226,804,'UA','UKR','230','UP','-','Ukraine','Ukraine','Asia',19920000,0,0),(227,784,'AE','ARE','225','AE','ARE','United Arab Emirates','United Arab Emirates','Asia',19710000,0,0),(228,826,'GB','GBR','229','UK','GBR','United Kingdom of Great Britain & N Irland','United Kingdom','Europe',0,0,0),(229,840,'US','USA','231','US','USA','United States of America','United States','N-America',0,0,0),(230,849,'PU','PUS','164','-','-','United States Miscellaneous Pacific Islands','Us Pacific Is','Oceania',0,0,0),(231,854,'BF','BFA','233','UV','-','Burkina Faso','Burkina Faso','Africa',19840000,0,0),(232,858,'UY','URY','234','UY','URY','Eastern Republic of Uruguay','Uruguay','S-America',0,0,0),(233,548,'VU','VUT','155','NH','-','Vanuatu','Vanuatu','Oceania',19800000,0,0),(234,862,'VE','VEN','236','VE','VEN','Republic of Venezuela','Venezuela','S-America',0,0,0),(235,704,'VN','VNM','237','VM','VNM','Socialist Republic of Vietnam','Viet Nam','Asia',19760425,0,0),(236,92,'VG','VGB','239','VI','-','British Virgin Islands','Virgin Islands, British','N-America',0,0,0),(237,850,'VI','VIR','240','VQ','-','United States Virgin Islands','Virgin Islands, U.S.','N-America',19170000,0,0),(238,872,'WK','WAK','242','-','-','Wake Island','Wake Is','Oceania',0,0,0),(239,876,'WF','WLF','243','WF','-','Wallis and Futuna Islands','Wallis and Futuna','Oceania',19700000,0,0),(240,732,'EH','ESH','205','WI','-','Western Sahara','Western Sahara','Africa',0,0,0),(241,887,'YE','YEM','249','YM','YEM','Yemen Arab Republic','Yemen','Asia',19180000,0,0),(242,720,'YD','YMD','0','-','-','Peoples Democratic Republic Of Yemen','Yemen Democratic','Asia',19670000,0,0),(243,891,'YU','YUG','248','-','-','Socialist Federal Republic Of Yugoslavia','Yugoslavia','Europe',0,0,0),(244,180,'ZR','ZAR','250','CG','ZAR','Republic Of Zaire','Zaire','Africa',19600630,0,257),(245,894,'ZM','ZMB','251','ZA','ZMB','Republic of Zambia','Zambia','Africa',19640000,0,0),(246,716,'ZW','ZWE','181','ZI','ZWE','Zimbabwe','Zimbabwe','Africa',19650000,0,0),(247,191,'HR','HRV','098','HR','-','Croatia','Croatia','Europe',19901222,0,0),(248,398,'KZ','KAZ','108','KZ','-','Kazakhstan','Kazakhstan','Asia',19920000,0,0),(249,660,'AI','AIA','258','AV','-','ANGUILLA','Anguilla','N-America',0,0,0),(250,533,'AW','ABW','022','AA','-','Aruba','Aruba','N-America',19860000,0,0),(251,0,'-','-','186','-','-','Yugoslavia Fr','Yugoslavia Fr','Europe',19920000,0,243),(252,0,'-','-','0','-','-','Upper Volta','Upper Volta','Africa',19600000,0,231),(253,0,'-','-','0','BM','BUR','Burma','Burma','Asia',19480000,19890000,33),(254,116,'KH','KHM','115','CB','KHM','Cambodia','Cambodia','Asia',19530000,0,113),(255,499,'ME','MNE','0','MJ','-','Montenegro','Montenegro','Europe',0,0,0),(256,496,'MN','MNG','141','MG','MNG','Mongolian Peoples Republic','Mongolia','Asia',19240000,19920000,144),(257,180,'CD','COD','0','CG','-','Democratic Republic of the Congo','Congo','Africa',0,0,0),(258,249,'FX','FXX','0','-','-','Metropolitan France','-','-',0,0,0),(259,260,'TF','ATF','0','FS','-','French Southern Territories','French Southern Terr','-',0,0,0),(260,276,'DE','DEU','0','GM','-','Germany','Germany','Europe',19901003,0,0),(261,584,'MH','MHL','0','RM','-','Marshall Islands','Marshall Islands','-',0,0,0),(262,175,'YT','MYT','0','MF','-','Mayotte','Mayotte','-',0,0,0),(263,580,'MP','MNP','0','CQ','-','Northern Mariana Islands','Northern Mariana Islands','-',0,0,0),(264,585,'PW','PLW','0','PS','-','Palau','Palau','-',0,0,0),(265,581,'UM','UMI','0','-','-','United States minor Outlying Islands','US Minor Outlying Islands','-',0,0,0),(266,0,'-','-','0','PF','-','Paracel Islands','-','-',0,0,0),(267,0,'-','-','0','PG','-','Spratly Islands','-','-',0,0,0);


-- NEW:
-- table structure for table 'filelink'
--
DROP TABLE IF EXISTS filelink; 
CREATE TABLE filelink (
  fileid INT NOT NULL DEFAULT 0,
  filepath VARCHAR(255) NOT NULL DEFAULT '-',
  filename VARCHAR(255) NOT NULL DEFAULT '-',
  filetab VARCHAR(50) NOT NULL DEFAULT '-',
  filerec INT NOT NULL DEFAULT 0,
  filecat INT NOT NULL DEFAULT 0,
  filesubcat INT,
  remarks VARCHAR(255) DEFAULT '-',
  PRIMARY KEY (fileid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX filelink_idx01 on filelink(filepath);
CREATE INDEX filelink_idx02 on filelink(filename);








--
-- table structure for table 'georef'
--
DROP TABLE IF EXISTS georef; 
CREATE TABLE georef (
  locid INT NOT NULL DEFAULT 0,
  llpn INT DEFAULT 0,
  lat DOUBLE PRECISION DEFAULT 0,
  lon DOUBLE PRECISION DEFAULT 0,
  alt DOUBLE PRECISION  DEFAULT 0,
  llsource INT DEFAULT 0,   	-- new column, references udflds.fldno
  ll_fmt INT DEFAULT 0,		-- new column, references udflds.fldno
  ll_datum INT DEFAULT 0,		-- new column, references udflds.fldno
  ll_uncert double DEFAULT 0,		-- new column
  llref INT DEFAULT 0,		-- new column, references bibrefs.refid
  lldate INT DEFAULT 0,		-- new column
  lluid INT DEFAULT 0		-- new column, references users.userid
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX georef_idx01 on georef (locid);     -- do not define locid as primary key..create index instead.
--



--
-- table structure for table 'germplsm'
-- modified 20091216: added IWIS3 columns for schema defn to be superset.
--
DROP TABLE IF EXISTS germplsm; 
CREATE TABLE germplsm (
  gid INT NOT NULL DEFAULT 0 PRIMARY KEY,
  methn INT NOT NULL DEFAULT 0,
  gnpgs INT NOT NULL DEFAULT 0,
  gpid1 INT NOT NULL DEFAULT 0,
  gpid2 INT NOT NULL DEFAULT 0,
  germuid INT NOT NULL DEFAULT 0,
  lgid INT NOT NULL DEFAULT 0,
  glocn INT NOT NULL DEFAULT 0,
  gdate INT NOT NULL DEFAULT 0,
  gref INT NOT NULL DEFAULT 0,
  grplce INT NOT NULL DEFAULT 0,
  mgid INT DEFAULT 0,
  cid INT,				-- added 20091216 mhabito
  sid INT,				-- added 20091216 mhabito
  gchange INT                           -- added 20091216 mhabito
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX germplsm_idx01 ON germplsm (glocn);
CREATE INDEX germplsm_idx02 ON germplsm (gpid1);
CREATE INDEX germplsm_idx03 ON germplsm (gpid2);
CREATE INDEX germplsm_idx04 ON germplsm (germuid);
CREATE INDEX germplsm_idx05 ON germplsm (methn);
CREATE INDEX germplsm_idx06 ON germplsm (mgid);
CREATE INDEX germplsm_idx07 ON germplsm (germuid,lgid);
CREATE INDEX germplsm_idx08 ON germplsm (grplce);
CREATE INDEX germplsm_idx09 ON germplsm (lgid);   -- added 20091019 mhabito
CREATE INDEX germplsm_idx10 ON germplsm (gid);   -- added 20091020 mhabito (in addition to defining GID as unique key)
CREATE INDEX germplsm_idx11 on germplsm (cid);   -- added 20091216 mhabito
CREATE INDEX germplsm_idx12 on germplsm (sid);   -- added 20091216 mhabito



--
-- table structure for table 'instln'
--
DROP TABLE IF EXISTS instln; 
CREATE TABLE instln (
  instalid INT NOT NULL DEFAULT 0,
  admin INT NOT NULL DEFAULT 0,
  udate INT DEFAULT 0,
  ugid INT NOT NULL DEFAULT 0,
  ulocn INT DEFAULT 0,
  ucid INT NOT NULL DEFAULT 0,
  unid INT NOT NULL DEFAULT 0,
  uaid INT NOT NULL DEFAULT 0,
  uldid INT NOT NULL DEFAULT 0,
  umethn INT DEFAULT 0,
  ufldno INT DEFAULT 0,
  urefno INT DEFAULT 0,
  upid INT DEFAULT 0,
  idesc VARCHAR(255) NOT NULL DEFAULT '-',
  ulistid INT DEFAULT 0,
  dms_status INT DEFAULT 0,
  ulrecid INT DEFAULT 0,
  PRIMARY KEY (instalid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX instln_idx01 ON instln (admin);
CREATE INDEX instln_idx02 ON instln (instalid);
CREATE INDEX instln_idx03 ON instln (uaid);
CREATE INDEX instln_idx04 ON instln (ucid);
CREATE INDEX instln_idx05 ON instln (ugid);
CREATE INDEX instln_idx06 ON instln (uldid);
CREATE INDEX instln_idx07 ON instln (unid);
CREATE INDEX instln_idx08 ON instln (upid);
CREATE INDEX instln_idx09 ON instln (ulrecid);
--

--
-- table structure for table 'listdata'
--
DROP TABLE IF EXISTS listdata; 
CREATE TABLE listdata (
  listid INT NOT NULL DEFAULT 0,
  gid INT NOT NULL DEFAULT 0,                 -- moved before entryid 20090929 mhabito
  entryid INT NOT NULL DEFAULT 0,
  entrycd VARCHAR(47) NOT NULL DEFAULT '-',          
  source VARCHAR(255) NOT NULL DEFAULT '-',           
  desig VARCHAR(255) NOT NULL DEFAULT '-',
  grpname VARCHAR(255) NOT NULL DEFAULT '-',           
  lrecid INT NOT NULL DEFAULT 0,
  lrstatus INT NOT NULL DEFAULT 0,
  llrecid INT DEFAULT 0,
  PRIMARY KEY (listid,lrecid)                     
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX listdata_idx02 ON listdata (entrycd);
CREATE INDEX listdata_idx03 ON listdata (gid);
CREATE INDEX listdata_idx04 ON listdata (source);
CREATE INDEX listdata_idx05 ON listdata (listid,gid,lrstatus);
CREATE INDEX listdata_idx06 ON listdata (listid,entryid,lrstatus);
CREATE INDEX listdata_idx07 ON listdata (listid);
CREATE INDEX listdata_idx08 ON listdata (listid,lrecid); -- added 20091103 mhabito: define regular index on column(s) with UNIQUE KEY constraint
--


-- 
-- table structure for table 'listnms'
--
-- changes from v5.5:
-- 1) increased length of listname from 47 to 50
-- 2) increased length of listtype from 7 to 10
-- 3) new column PROJECTID
--
DROP TABLE IF EXISTS listnms;
 CREATE TABLE listnms (
  listid INT NOT NULL DEFAULT 0,
  listname VARCHAR(50) NOT NULL DEFAULT '-',   	-- increase length from 47 to 50
  listdate INT NOT NULL DEFAULT 0,
  listtype VARCHAR(10) NOT NULL DEFAULT 'LST',   -- increase length from 7 to 10
  listuid INT NOT NULL DEFAULT 0,
  listdesc VARCHAR(255) NOT NULL DEFAULT '-',
  lhierarchy INT DEFAULT 0,
  liststatus INT DEFAULT 1,
  sdate INT DEFAULT NULL,			-- new column: start date of list
  edate INT DEFAULT NULL,			-- new column: end date of list
  listlocn INT DEFAULT NULL,		-- new column: references location.locid
  listref INT DEFAULT NULL,			-- new column: references bibrefs.refid
  projectid INT DEFAULT 0,			-- new column: points to project managing the list			
  PRIMARY KEY (listid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX listnms_idx01 ON listnms (listid,lhierarchy);
CREATE INDEX listnms_idx02 ON listnms (listid);          -- added 20091103 mhabito: define regular index on column(s) with UNIQUE KEY constraint
--



--
-- table structure for table 'location'
--
DROP TABLE IF EXISTS location; 
CREATE TABLE location (
  locid INT NOT NULL DEFAULT 0,
  ltype INT NOT NULL DEFAULT 0,
  nllp INT NOT NULL DEFAULT 0,
  lname VARCHAR(60) NOT NULL DEFAULT '-',
  labbr VARCHAR(8) DEFAULT '-',
  snl3id INT NOT NULL DEFAULT 0,
  snl2id INT NOT NULL DEFAULT 0,
  snl1id INT NOT NULL DEFAULT 0,
  cntryid INT NOT NULL DEFAULT 0,
  lrplce INT NOT NULL DEFAULT 0,
  nnpid INT NOT NULL DEFAULT 0,		-- new column: LOCID of the nearest named place
  PRIMARY KEY (locid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX location_idx01 ON location (cntryid);
CREATE INDEX location_idx02 ON location (snl1id);
CREATE INDEX location_idx03 ON location (snl2id);
CREATE INDEX location_idx04 ON location (snl3id);
CREATE INDEX location_idx05 ON location (locid);         -- added 20091103 mhabito: define regular index on column(s) with UNIQUE KEY constraint
--



--
-- table structure for table 'locdes'
--
DROP TABLE IF EXISTS locdes; 
CREATE TABLE locdes (
  ldid INT NOT NULL DEFAULT 0,
  locid INT NOT NULL DEFAULT 0,
  dtype INT NOT NULL DEFAULT 0,
  duid INT NOT NULL DEFAULT 0,
  dval VARCHAR(255) NOT NULL DEFAULT '-',
  ddate INT NOT NULL DEFAULT 0,
  dref INT NOT NULL DEFAULT 0,
  PRIMARY KEY (ldid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX locdes_idx01 ON locdes (dtype);
CREATE INDEX locdes_idx02 ON locdes (duid);
CREATE INDEX locdes_idx03 ON locdes (locid);
CREATE INDEX locdes_idx04 ON locdes (ldid);
--


--
-- table structure for table 'methods'
--
DROP TABLE IF EXISTS methods; 
CREATE TABLE methods (
  mid INT NOT NULL DEFAULT 0,
  mtype VARCHAR(3) NOT NULL DEFAULT '-',
  mgrp VARCHAR(3) NOT NULL DEFAULT '-',
  mcode VARCHAR(8) NOT NULL DEFAULT '-',
  mname VARCHAR(50) NOT NULL DEFAULT '-',
  mdesc VARCHAR(255) NOT NULL DEFAULT '-',
  mref INT NOT NULL DEFAULT 0,
  mprgn INT NOT NULL DEFAULT 0,
  mfprg INT NOT NULL DEFAULT 0,
  mattr INT NOT NULL DEFAULT 0,
  geneq INT NOT NULL DEFAULT 0,
  muid INT NOT NULL DEFAULT 0,
  lmid INT NOT NULL DEFAULT 0,
  mdate INT NOT NULL DEFAULT 0,
  PRIMARY KEY (mid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX methods_idx01 ON methods (lmid);
CREATE INDEX methods_idx02 ON methods (mcode);
CREATE INDEX methods_idx03 ON methods (muid);
CREATE INDEX methods_idx04 ON methods (mid);		 -- added 20091103 mhabito: define regular index on column(s) with UNIQUE KEY constraint
--


--
-- table structure for table 'names'
--
DROP TABLE IF EXISTS names; 
CREATE TABLE names (
  nid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,          
  gid INT NOT NULL DEFAULT 0,
  ntype INT NOT NULL DEFAULT 0,
  nstat INT NOT NULL DEFAULT 0,
  nuid INT NOT NULL DEFAULT 0,
  nval VARCHAR(255) NOT NULL DEFAULT '-',
  nlocn INT NOT NULL DEFAULT 0,
  ndate INT NOT NULL DEFAULT 0,
  nref INT NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX names_idx01 ON names (gid);
CREATE INDEX names_idx02 ON names (nlocn);
CREATE INDEX names_idx03 ON names (nstat); 
CREATE INDEX names_idx04 ON names (ntype);
CREATE INDEX names_idx05 ON names (nuid);
CREATE INDEX names_idx06 ON names (nval);
CREATE INDEX names_idx07 ON names (nid);
--



--
-- new table
--
DROP TABLE IF EXISTS reflinks;
CREATE TABLE reflinks (
  brefid INT NOT NULL DEFAULT 0,
  btable varchar(50) NOT NULL DEFAULT '-',
  brecord INT NOT NULL DEFAULT 0,
  refdate varchar(50) DEFAULT NULL,
  refuid INT DEFAULT NULL, 
  reflinksid INT NOT NULL AUTO_INCREMENT PRIMARY KEY       -- new column
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



--
-- table structure for table 'progntrs'
--
DROP TABLE IF EXISTS progntrs;
 CREATE TABLE progntrs (
  gid INT NOT NULL DEFAULT 0,
  pno INT NOT NULL DEFAULT 0,
  pid INT NOT NULL DEFAULT 0,
  PRIMARY KEY (gid,pno)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX progntrs_idx01 ON progntrs (gid);
CREATE INDEX progntrs_idx02 ON progntrs (pid);
CREATE INDEX progntrs_idx03 ON progntrs (pno);
CREATE INDEX progntrs_idx04 ON progntrs (gid,pno);   -- added 20091103 mhabito: define regular index on column(s) with UNIQUE KEY constraint
--

--
-- table structure for table 'sndivs'
--
DROP TABLE IF EXISTS sndivs; 
CREATE TABLE sndivs (
  snlid INT NOT NULL DEFAULT 0,
  snlevel INT NOT NULL DEFAULT 0,
  cntryid INT NOT NULL DEFAULT 0,
  snliso VARCHAR(5) NOT NULL DEFAULT '-',
  snlfips VARCHAR(4) NOT NULL DEFAULT '-',
  isofull VARCHAR(60) NOT NULL DEFAULT '-',
  schange INT DEFAULT 0,
  PRIMARY KEY (snlid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX sndivs_idx01 ON sndivs (cntryid);
CREATE INDEX sndivs_idx02 on sndivs (snlid);        -- added 20091103 mhabito: define regular index on column(s) with UNIQUE KEY constraint
--


--
-- table structure for table 'udflds'
--
DROP TABLE IF EXISTS udflds; 
CREATE TABLE udflds (
  fldno INT NOT NULL DEFAULT 0,
  ftable VARCHAR(24) NOT NULL DEFAULT '-',
  ftype VARCHAR(12) NOT NULL DEFAULT '-',
  fcode VARCHAR(50) NOT NULL DEFAULT '-',
  fname VARCHAR(50) NOT NULL DEFAULT '-',
  ffmt VARCHAR(255) NOT NULL DEFAULT '-',
  fdesc VARCHAR(255) NOT NULL DEFAULT '-',
  lfldno INT NOT NULL DEFAULT 0,
  fuid INT NOT NULL DEFAULT 0,
  fdate INT NOT NULL DEFAULT 0,
  scaleid INT DEFAULT 0,
  PRIMARY KEY (fldno)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX udflds_idx01 ON udflds (fcode);
CREATE INDEX udflds_idx02 ON udflds (fuid);
CREATE INDEX udflds_idx03 ON udflds (scaleid);
CREATE INDEX udflds_idx04 on udflds (fldno);        -- added 20091103 mhabito: define regular index on column(s) with UNIQUE KEY constraint
--
insert  into `udflds`(`fldno`,`ftable`,`ftype`,`fcode`,`fname`,`ffmt`,`fdesc`,`lfldno`,`fuid`,`fdate`,`scaleid`) values (1,'NAMES','NAME','ACCNO','Germplasm bank accession ID','-','ID given to an accession by the genebank holding it. The location of the name and the location of the germplasm should both be the location of the holding genebank.',1,0,0,0),(2,'NAMES','NAME','CRSNM','Cross name','-','Name assigned to a cross. The location of the name and the location of the germplasm is the location where the cross was made, and the method of creation specifies the type of cross',2,0,0,0),(3,'NAMES','NAME','UNCRS','Unnamed cross','-','Pedigree notation for an unnamed cross. The location of the name and the location of the germplasm is the location where the cross was made, and the method of creation specifies the type of cross.',3,0,0,0),(4,'NAMES','NAME','RELNM','Release name','-','The official name assigned when the germplasm was formally released as a cultivar. The location of the germplasm is the region (often the country), where the cultivar was released.',4,0,0,0),(5,'NAMES','NAME','DRVNM','Derivative name','-','A name given to a line that was selected from a variable parent such as a segregating population.Often the name starts with a prefix the same as its parents name, and has a suffix indicating the selection.The name location is where the selection was made.',5,0,0,0),(6,'NAMES','NAME','CVNAM','Cultivar name','-','The name of a cultivar of any type – landrace, traditional, modern released cultivar. The location of the name is the location, typically a country, where the cultivar is grown',6,0,0,0),(7,'NAMES','ABBREVIATION','CVABR','Abbreviated cultivar name','-','-',14,0,0,0),(8,'NAMES','NAME','SPNAM','Species name','-','DO NOT USE! This is replaced with an attribute',0,0,0,0),(9,'NAMES','NAME','COLNO','Collector\'s number','-','ID assigned by a collector to a sample collected from a farm, market place etc, to identify the sample uniquely within the collecting mission. The location of the name is the location of the collecting mission.',0,0,0,0),(10,'NAMES','NAME','FACCN','Accession ID in other genebank','-','ID assigned by another genebank holding a copy of the same material. The location of the name is the location of the genebank holding the copy.',0,0,0,0),(11,'NAMES','NAME','ITEST','International testing number','-','ID assigned by the coordinator of an international variety testing network. The name location is the location of the network coordinator',0,0,0,0),(12,'NAMES','NAME','NTEST','National testing number','-','ID assigned by the coordinator of a national variety testing network. The name location is the location of the network coordinator',0,0,0,0),(13,'NAMES','NAME','LNAME','Line name','-','Name assigned normally to a bred line. ',0,0,0,0),(14,'NAMES','NAME','TACC','Temporary / quarantine ID','-','-',0,0,0,0),(15,'NAMES','NAME','ADVNM','Alternative derivative name','-','-',0,0,0,0),(16,'NAMES','NAME','ACVNM','Alternative cultivar name','-','-',0,0,0,0),(17,'NAMES','NAME','AABBR','Alternative abbreviation','-','-',0,0,0,0),(18,'NAMES','NAME','OLDMUT1','Old mutant name 1','-','-',0,0,0,0),(19,'NAMES','NAME','OLDMUT2','Old mutant name 2','-','-',0,0,0,0),(20,'NAMES','NAME','ELITE','Elite lines','-','-',0,0,0,0),(21,'NAMES','NAME','GACC','Management name','-','ID given to a sample created by a maintenance method within a management neighbourhood e.g. a generation of a genebank accession. Format in IRRI GRC is [ACCNO]:[YYYYXX], where [YYYYXX] is the year and season (DS or WS) of seed production',0,112,20060320,0),(22,'NAMES','NAME','DACCN','Donor\'s accession ID','-','For a germplasm sample obtained from a genebank, this records the accession ID assigned by the donating genebank to its own sample. The location of the name is the location of the donating genebank.',0,112,20060522,0),(23,'NAMES','NAME','LCNAM','Local common name','-','Local common name given to wild rice species',0,112,20060525,0),(24,'NAMES','NAME','HRDC','IRRI-HRDC code','-','HRDC Code assigned in IRRI',0,0,20080617,0),(25,'NAMES','NAME','GQNPC_ID','GQNPC Unique ID','-','GQNPC Unique sample identifier',0,0,20081027,0),(26,'NAMES','NAME','NCT','National rice cooperative testing project ID','-','National Rice Cooperative Testing Project ID',0,0,20090107,0),(27,'NAMES','NAME','TRN_ID','Transgenic event ID','-','Transgenic Event ID',0,0,20090312,0),(28,'NAMES','NAME','ALTCRSNM','Alternative cross name','-','-',2,0,0,0),(29,'NAMES','NAME','FL_CODE','IRRI micronutrient/salinity line code','-','-',2,0,0,0),(30,'NAMES','NAME','DEPRCTD','Deprecated name',' -',' Deprecated variant spelling',0,310,20100421,0),(31,'NAMES','NAME','SKEP','IRRI-Devgen SKEP project','-','IRRI-Devgen SKEP project',0,0,20090107,0),(103,'ATRIBUTS','ATTRIBUTE','NOTE','NOTES','-','NOTES CONCERNING GERMPLASM ORIGIN, DEVELOPMENT NOMENCLATURE OR CRONOLOGY',0,0,0,0),(104,'ATRIBUTS','ATTRIBUTE','RELEASE','RELEASE ATTRIBUTE','-','CULTIVAR TYPE (SEE CHAPTER 2 FOR TYPES)',0,0,0,0),(105,'ATRIBUTS','ATTRIBUTE','PROGM','INSTITUTE AND BREEDING PROGRAM','-','-',11,0,0,0),(106,'ATRIBUTS','ATTRIBUTE','DTFR','DATA TRANSFER COMMENT OR QUERY','-','-',0,0,0,0),(107,'ATRIBUTS','ATTRIBUTE','VGISO','Variety group (isozyme classification)','VARIETYGROUP,A,1','ISOZYME VARIETY GROUP',0,0,0,1547),(208,'ATRIBUTS','METHOD','BS','NO OF PLANTS BULKED AND TARGET TRAITS OR GENES','BSNO,5,I,1','-',8,0,0,0),(209,'ATRIBUTS','METHOD','IC','TARGET INTROGRESSION IN INTERSPECIFIC CROSS','ICTGT,,A,1','-',9,0,0,0),(210,'ATRIBUTS','METHOD','MT','AGENT OR METHOD OF INDUCED MUTATION','MTAGNT,,A,1','-',10,0,0,0),(211,'ATRIBUTS','METHOD','MATT','GENERAL METHOD ATTRIBUTE','-','Describe the method or agent employed in a specific instance of a method',0,0,0,0),(212,'ATRIBUTS','METHOD','RMA','RANDOM MATING ATTRIBUTE','NPS;4;I,1;PCT;5;I;NPS;MMTH','NPS=number of parents randomly mated; PCT= percent contribution of each parent; MMTH= intervention method to achieve random mating (male gametocide, male sterile gene, hand crossing)',0,0,0,0),(213,'ATRIBUTS','METHOD','MCOLL','METHODS OF COLLECTION','-','-',0,0,0,0),(214,'ATRIBUTS','METHOD','IMPORT','IMPORT ATTRIBUTE','-','TYPE OF GERMPLASM (SEE CHAPTER 2)',0,0,0,0),(215,'ATRIBUTS','METHOD','BLKM','BULKING METHOD','-','METHOD OF BULKING - EG BULKED EARS, EQUAL VOLUME, EQUAL WEIGHTS, EQUAL NO OF SEEDS',0,0,0,0),(216,'ATRIBUTS','METHOD','SUBSETA','SUBSET CROSS ATTRIBUTE','-','NO OF SETS AND METHOD OF BULKING',0,0,0,0),(221,'ATRIBUTS','METHOD','ST','TARGET TRAITS OR GENES','NOTGTS,5,I,1;TRAITS,\';\',A,NOTGTS','-',21,0,0,0),(222,'ATRIBUTS','ATTRIBUTE','CROPYEAR','SOURCE CROPYEAR','-','-',0,0,20041116,0),(223,'ATRIBUTS','PASSPORT','MLS_DATE','MLS DESIGNATION DATE','-','-',0,0,20041116,0),(224,'ATRIBUTS','PASSPORT','ORI_COUN','Country of Origin','-','-',0,0,20041116,-78),(225,'ATRIBUTS','ATTRIBUTE','GRSMPL','Grain sample','-','Sample state: PADDY, BROWN, MILLED, FLOUR',0,253,20130311,0),(301,'LOCDES','DTYPE','ALT','ALTITUDE ABOVE SEA LEVEL','ALT,6,A,1','ALTITUDE IN M ABOVE SEA LEVEL RIGHT JUSTIFIED',0,0,0,0),(302,'LOCDES','DTYPE','CHNLOC','FULL LOCATION NAME IN CHINESE','INST,15,A,1;SNL3,4,A,1;SNL2,4,A,1;SNL1,4,A,1;CNTABB;4,A,1','INST:FULL INSTITUTION NAME IN CHINESE,SNL1: PRIMARY SUBNATIONAL DIVISION (PROVINCE), SNL2: SECONDARY SUB-NATIONAL DIVISION(CITY), SNL3: TERIARY SUB-NATIONAL DIVISION (COUNTY OR TOWN), CNTABB: COUNTRY ABBREVIATION',0,0,0,0),(303,'LOCDES','DTYPE','ORIGINAL','ORIGINAL LOCATION DATA',' ','Data as originally provided, without validation, in format \"Field1=value;Field2=value…\"',0,298,20090424,0),(304,'LOCDES','DTYPE','LLANTN','LAT-LONG ANNOTATION',' ','Annotation of lat-long coordinates including georeferencing',0,298,20090527,0),(305,'LOCDES','DTYPE','LOCANTN','LOCATION ANNOTATION',' ','Annotation on interpretation of original text location data',0,298,20090528,0),(401,'LOCATION','LTYPE','CONT','CONTINENT','-','-',0,0,0,0),(402,'LOCATION','LTYPE','GREGN','GEOGRAPHICAL REGION','-','-',0,0,0,0),(403,'LOCATION','LTYPE','PREGN','GEOPOLITICAL REGION','-','-',0,0,0,0),(404,'LOCATION','LTYPE','EREGN','ECOLOGICAL REGION','-','-',0,0,0,0),(405,'LOCATION','LTYPE','COUNTRY','COUNTRY','-','-',0,0,0,0),(406,'LOCATION','LTYPE','PROV','FIRST SUB-NATIONAL DIVISION','-','-',0,0,0,0),(407,'LOCATION','LTYPE','DIST','SECOND SUB-NATIONAL DIVISION','-','-',0,0,0,0),(408,'LOCATION','LTYPE','MUN','THIRD SUB-NATIONAL DIVISION','-','-',0,0,0,0),(409,'LOCATION','LTYPE','COLL','GERMPLASM COLLECTION SITE','-','-',0,0,0,0),(410,'LOCATION','LTYPE','BREED','BREEDING LOCATION','-','-',0,0,0,0),(411,'LOCATION','LTYPE','IARC','INTERNATIONAL AGRICULTURAL RESEARCH CENTER','-','-',0,0,0,0),(412,'LOCATION','LTYPE','NARC','NATIONAL AGRICULTURAL RESEARCH CENTER','-','-',0,0,0,0),(413,'LOCATION','LTYPE','POPPLACE','POPULATED PLACE',' -','Name of a populated place (city, town, village)',0,298,20090424,0),(414,'LOCATION','LTYPE','COLLMISS','COLLECTING MISSION','-','Region covered by a collecting mission (This location type is necessary so that we can tie the NLocN of names of type COLLNO to their collecting mission)',0,298,20090424,0),(420,'USERS','UTYPE','CADMIN','CENTRAL DATABASE ADMINISTRATOR','-','-',0,0,0,0),(421,'USERS','UTYPE','GUEST','GUEST USER','-','-',0,0,0,0),(422,'USERS','UTYPE','LADMIN','LOCAL DATABASE ADMINISTRATOR','-','-',0,0,0,0),(423,'USERS','UTYPE','LUSER','LOCAL USER','-','-',0,0,0,0),(436,'BIBREFS','PUBTYPE','BOOK','PUBLISHED BOOK OR MONOGRAPH','-','-',0,0,0,0),(437,'BIBREFS','PUBTYPE','DBASE','COMPUTER DATABASE','-','-',0,0,0,0),(438,'BIBREFS','PUBTYPE','PCOM','PERSONAL COMMUNICATION','-','-',0,0,0,0),(439,'BIBREFS','PUBTYPE','ARTICLE','JOURNAL ARTICLE','-','-',0,0,0,0),(440,'BIBREFS','PUBTYPE','CHAPTER','CHAPTER OF A BOOK OR PROCEEDINGS','-','-',0,0,0,0),(441,'BIBREFS','PUBTYPE','TECHREP','INTERNAL TECHNICAL REPORT','-','-',0,0,0,0),(442,'BIBREFS','PUBTYPE','MAP','MAP','-','Reference to a paper map',0,298,20090424,0),(443,'BIBREFS','PUBTYPE','GAZ','DIGITAL GAZETTEER','-','Reference to a digital gazetteer',0,298,20090424,0),(601,'PERSONS','PROLE','PROLE','Test user','-','-',0,0,20051000,0),(602,'PERSONS','PROLE','DENTRY','Data entry','-','-',0,0,20051000,0),(603,'PERSONS','PROLE','RUNKNO','Unknown','-','-',0,0,20051000,0),(604,'PERSONS','PROLE','POTHER','Other','-','-',0,0,20051000,0),(605,'PERSONS','PROLE','FULCOL','Full collaborator','-','-',0,0,20051000,0),(606,'PERSONS','PROLE','INSREP','Institution representative','-','-',0,0,20051000,0),(621,'PERSONS','PSTATUS','ACTPOS','Active at post','-','-',0,0,20051000,0),(622,'PERSONS','PSTATUS','REALOC','Reallocated','-','-',0,0,20051000,0),(623,'PERSONS','PSTATUS','RETIRE','Retired','-','-',0,0,20051000,0),(624,'PERSONS','PSTATUS','PSTATUS','Test status','-','-',0,0,20051000,0),(625,'PERSONS','PSTATUS','PUNKNO','Unknown','-','-',0,0,20051000,0),(626,'INSTITUT','INSTYPE','AINTER','Int. Agricultural Center','-','(Discourage use - overlap with INTER)',0,0,0,0),(627,'INSTITUT','INSTYPE','GBANK','Gene Bank','-','-',0,0,0,0),(628,'INSTITUT','INSTYPE','UNIVER','University','-','-',0,0,0,0),(629,'INSTITUT','INSTYPE','INTER','International Center','-','-',0,0,0,0),(630,'INSTITUT','INSTYPE','NATION','National Center','-','-',0,0,0,0),(631,'INSTITUT','INSTYPE','ANATION','Nat. Agricultural Center','-','(Discourage use - overlap with NATION)',0,0,0,0),(632,'INSTITUT','INSTYPE','GOVERN','Governmental','-','(Discourage use - overlap with NATION)',0,0,0,0),(633,'INSTITUT','INSTYPE','PRCOMP','Private Company','-','-',0,0,0,0),(634,'INSTITUT','INSTYPE','DEPT','Department','-','Department with an institute.PINSID points to parent institute.Note on usage:for \"Institutes\" of type DEPT, the PINSID is the institute and the legal entity that enters into agreements with IRRI.For all other INSTYPE, INSTITID is the legal entity for SMTA',0,0,0,0),(635,'INSTITUT','INSTYPE','IUNKNO','Unknown','-','-',0,0,0,0),(636,'INSTITUT','INSTYPE','INDIV','Individual','-','Individual (e.g. farmer)',0,298,20090424,0),(637,'INSTITUT','INSTYPE','REGION','Regional organization','-',' ',0,298,20090424,0),(700,'LISTNMS','LISTTYPE','LST','GERMPLASM LISTS','-','-',0,0,0,0),(701,'LISTNMS','LISTTYPE','HB','HYBRIDIZATION BLOCK LIST','-','Hybridization Block List',0,0,0,0),(702,'LISTNMS','LISTTYPE','F1','F1 NURSERY LIST','-','F1 Nursery List',0,0,0,0),(703,'LISTNMS','LISTTYPE','F2','F2 NURSERY LIST','-','F2 Nursery List',0,0,0,0),(704,'LISTNMS','LISTTYPE','PN','PEDIGREE NURSERY LIST','-','Pedigree Nursery List',0,0,0,0),(705,'LISTNMS','LISTTYPE','OYT','OBSERVATIONAL YIELD TRIALS LIST','-','Observational Yield Trial List',0,0,0,0),(706,'LISTNMS','LISTTYPE','RYT','REPLICATED YIELD TRIALS LIST','-','Replicated Yield Trial List',0,0,0,0),(707,'LISTNMS','LISTTYPE','FOLDER','LIST FOLDER','-','Folder',0,0,0,0),(708,'LISTNMS','LISTTYPE','EXTACQ','EXTERNAL SEED ACQUISITION','-','List of incoming seeds acquired from outside IRRI, to be processed through SHU',0,0,0,0),(709,'LISTNMS','LISTTYPE','EXTREQ','EXTERNAL SEED REQUEST','-','A request for seed from outside IRRI, to be routed through SHU',0,0,0,0),(710,'LISTNMS','LISTTYPE','INTREQ','INTERNAL SEED REQUEST','-','A request for seed from within IRRI (therefore not needing SMTA, import permit, SHU etc)',0,298,20090421,0),(711,'LISTNMS','LISTTYPE','COLLMIS','COLLECTING MISSION',' -','The list is for a mission to collect germplasm',0,298,20090421,0),(712,'LISTNMS','LISTTYPE','INTACQ','INTERNAL SEED ACQUISITION','-','List of incoming seeds acquired from different organizational units within IRRI',0,298,20090527,0),(713,'LISTNMS','LISTTYPE','SI','SEED INCREASE',' -','List of seeds to be increased/multiplied',0,298,20090722,0),(714,'LISTNMS','LISTTYPE','SEEDSTCK','SEED STOCK',' -','Seed Inventory List',0,0,20100204,0),(715,'LISTNMS','LISTTYPE','TRNGENC','TRANSGENIC SEED LIST',' -','List of transgenic materials',0,0,20100204,0),(716,'LISTNMS','LISTINFO','GENERATION','GENERATION',' -','GENERATION',0,0,0,0),(717,'LISTNMS','LISTINFO','PROJECT','PROJECT',' -','PROJECT',0,0,0,0),(801,'FACTOR','DESCRIPTION','FDESC','Factor Description','Description','Description of Factor',0,117,20060234,0),(802,'VARIATE','DESCRIPTION','VDESC','Variate Description','Description','Description of Variate',0,117,20060234,0),(803,'FACTOR','STUDY','RSTUDY','Ralated Study','Studyid','The StudyID of the study related to the list',0,117,20060234,0),(901,'IMS_TRANSACTION','WITHDRAWAL','SEEDINC','Seed Increase','-','-',0,0,20080918,0),(1019,'NAMES','NAME','CIATGB','CIAT GERMPLASM BANK ACCESSION NUMBER','-','-',19,0,0,0),(1027,'NAMES','NAME','UNRES','UNRESOLVED NAME','-','-',27,0,0,0),(1107,'ATRIBUTS','ATTRIBUTE','IRGRP','IRRI CROSS GROUP/PROGRAM/DESCRIPTION','-','-',7,0,0,0),(1112,'ATRIBUTS','ATTRIBUTE','BRDR','IRRI BREEDER\'S INITIALS','-','-',12,0,0,0),(1113,'ATRIBUTS','ATTRIBUTE','CNLOG','HC CONVERTION LOG INFORMATION','-','-',13,0,0,0),(1115,'ATRIBUTS','ATTRIBUTE','INGER','INGER IRTP NUMBER, ORIGIN, VARIETY GROUP AND PHOTO','IRTP,5,I,1;ORIG,4,I,1;VARGP,2,I,1;PHOTO,2,I,1','-',15,0,0,0),(1117,'ATRIBUTS','ATTRIBUTE','COBJ','CROSS OBJECTIVES','-','-',17,0,0,0),(1118,'ATRIBUTS','ATTRIBUTE','ECO','CIAT ECOSYSTEMS','-','-',18,0,0,0),(1120,'ATRIBUTS','ATTRIBUTE','COLL','GERMPLASM COLLECTION ATTRIBUTE','ACCNO,10,A,1;SPECIES,\";\",A,1;MISSCODE,\";\",A,1;COLLECNO,\";\",A,1;DCCODE,\";\",A,1;SOURCE,\";\",A,1;DISO,\";\",A,1;','ACCESSION NO INCLUDING BANK ID; SPECIES NAME; COLLECTING MISSION CODE; COLLECTOR\'S SPECIMEN NO; DONOR\'S CODE; ENVIRONMENT WHERE COLLECTED(1=FARMLAND, 2=THRESHING, 3=FARM STORE, 4=VILLAGE MARKET,5=COMMECIAL MARKET,6=INSTITUTE,7=FIELD BORDER,8=WILD,9=OTHER)',20,0,0,0),(1122,'ATRIBUTS','ATTRIBUTE','IRGD','INTERNATIONAL RICE GENEALOGY DATABASE ATTRIBUTE','TYPE,1,A,1;STATUS,1,A,1;IRPROG,1,A,1;COUNTRY,15,A,1;REGION,25,A,1;STATION,25,A,1','TYPE OF VARIETY: N=POST IR8, O=PRE IR8, P=PROGENITOR, STATUS: R=RELEASED, E=ELITE BREEDING LINE, IRPROG: Y IF VARIETY HAS AN IRRI PROGENITOR N OTHERWISE; COUNTRY,  REGION AND STATION WHERE VARIETY WAS DEVELOPED OR RELEASED',22,0,0,0),(1123,'ATRIBUTS','ATTRIBUTE','PNDATA','IRRI PEDIGREE NURSERY DATA','PNCODE,5,A,1;ECOSYSTEM,1,A,1;SOURCE,12,A,1;NPLT,4,I,1;VG,1,I,1;FL,3,I,1;BL,1,I,1;BB1,1,A,1;BB2,1,A,1;BPH1,1,A,1;BPH2,1,A,1;BPH3,1,A,1;GLH,1,A,1;WBPH,1,A,1;AMY,2,I,1;GEL-TEMP,4,A,1;GRL,1,I,1;GRS,1,I,1;CLK,1,A,1;GRE,3,R,1;COMMENTS,254,A,1','PEDIGREE NURSERY CODE: MMMYY, WHERE MMM=3 LETTER CODE FOR MONTH, YY=YEAR;  ECOSYSTEM: R=RAINFED, A=IRRIGATED, U=UPLAND, D=DEEPWATER, C=COLD TOLERANCE, T=TIDAL; SOURCE I.D. WHERE SEEDS WERE TAKEN FROM; NPLT: NO. OF PLANTS SELECTED IF PLANT SELECTION, BLANK',23,0,0,0),(1126,'ATRIBUTS','ATTRIBUTE','F2DATA','IRRI F2 DATA','F2CODE,5,A,1;ECOSYSTEM,1,A,1;SEASON,1,A,1;SOURCE,12,A,1;NPLT,4,I,1','F2 POPULATION CODE: MMMYY, WHERE MMM=3 LETTER CODE FOR MONTH, YY=YEAR;  ECOSYSTEM: R=RAINFED, A=IRRIGATED, U=UPLAND, D=DEEPWATER, C=COLD TOLERANCE, T=TIDAL; PLANTING SEASON: D=DRY, W=WET; SOURCE I.D. WHERE SEEDS WERE TAKEN FROM; NPLT: IF SELECTED, THE NO.',26,0,0,0),(1127,'ATRIBUTS','ATTRIBUTE','FLDLOC','FIELD LOCATION','-','-',0,0,0,0),(1128,'ATRIBUTS','ATTRIBUTE','CATEGORY','CATEGORY','-','-',0,0,0,0),(1129,'ATRIBUTS','ATTRIBUTE','CRPYR','CROP YEAR','-','-',0,0,0,0),(1130,'ATRIBUTS','ATTRIBUTE','MTA','MTA NUMBER','-','-',0,0,0,0),(1131,'ATRIBUTS','PASSPORT','IPSTAT','IP STATUS','DATE','-',0,0,0,0),(1132,'ATRIBUTS','PASSPORT','VG','Variety group (old classification)','-','-',0,0,20041116,346),(1133,'ATRIBUTS','PASSPORT','SPP_CODE','Species group','-','-',0,194,20041116,526),(1134,'ATRIBUTS','PASSPORT','MISSION_','MISSION CODE','-','-',0,0,20041116,528),(1135,'ATRIBUTS','PASSPORT','COLL_SOU','COLLECTION SOURCE','-','-',0,0,20041116,527),(1136,'ATRIBUTS','PASSPORT','COLL_DAT','Collection Date','-','-',0,194,20041116,0),(1137,'ATRIBUTS','ATTRIBUTE','ACQ_DATE','Acquisition date','-','-',-2,0,20041116,0),(1138,'ATRIBUTS','ATTRIBUTE','SS_STATN','Source station','-','-',-63,0,20041116,0),(1139,'ATRIBUTS','PASSPORT','SAM_STO','Sample status (other)','-','-',-45,194,20041116,0),(1140,'ATRIBUTS','PASSPORT','SAM_TYPE','Type of sample','-','-',-46,0,20041116,544),(1141,'ATRIBUTS','PASSPORT','TAXNO','Taxonomy','-','-',-66,0,20041116,532),(1142,'ATRIBUTS','PASSPORT','SEN_FNAM','Sender first name','-','-',-53,0,20041116,0),(1143,'ATRIBUTS','PASSPORT','USAGE','Usage of variety collected','-','-',-72,0,20041116,533),(1144,'ATRIBUTS','PASSPORT','SampStat','Sample status (coded)','-','-',-73,194,20041116,534),(1145,'ATRIBUTS','PASSPORT','VAR_SAMP','Varietal sample','-','-',-75,0,20041116,536),(1146,'ATRIBUTS','PASSPORT','SAMP_ORI','Sample origin','-','-',-49,0,20041116,545),(1147,'ATRIBUTS','PASSPORT','BREEDSYS','Breeding system','-','-',-2068,0,20041116,530),(1148,'ATRIBUTS','PASSPORT','REM_SPE','Special characteristics','-','-',-43,0,20041116,541),(1149,'ATRIBUTS','PASSPORT','GROWER','Grower\'s name','-','-',-24,0,20041116,539),(1324,'LOCDES','DTYPE','INGERLOC','INGER LOCATION NUMBER','CNTY,3,I,1;INST,2,A,1;INSTN,4,I,1','CNTY: INGER COUNTRY NUMBER; INST: OLD INSTITUTE CODE; INSTN: NEW INGER INSTITUTE NUMBER',24,0,0,0),(1325,'LOCDES','DTYPE','CNTRY','ISO COUNTRY DESCRIPTORS','CCODE,4,I,1;FAOCODE,4,I,1;ISOCODE,4,I,1;CC2,3,A,1;TELEX,4,I,1;GEOR,3,A,1;ECOR,3,A,1;WHR,3,A,1;MZR,3,A,1;CNAME,,A,1','CCODE: COUNTRY CODE NUMBER, FAOCODE: FAO COUNTRY CODE NUMBER,ISOCODE: ISO COUNTRY CODE NUMBER,CC2: 2 LETTER COUNTRY CODE,TELEX: INT\'L TELEX NUMBER,GEOR: GEOGRAPHIC REGION,ECOR: ECONOMIC REGION,WHR WHEAT REGION,MZR: MAIZE REGION,CNAME: LONG COUNTRY NAME',25,0,0,0),(1400,'ATRIBUTS','PASSPORT','REM_SAM','Remark on sample status','-','-',-42,0,20041116,0),(1401,'LOCATION','LTYPE','INGER','INGER TEST SITE','-','-',0,0,0,0),(1402,'ATRIBUTS','PASSPORT','FAO_REM','Fao remarks','-','-',-21,0,20041116,0),(1403,'ATRIBUTS','PASSPORT','REM_OTH','Other observations of the collector','-','-',-39,0,20041116,541),(1500,'LOCATION','LTYPE','SSTORE','STORAGE OR SEED STOCK LOCATION','-','-',1500,0,0,0),(1501,'ATRIBUTS','PASSPORT','SOURCE_I','Source of information','-','Refers to the person or publication where the passport information was obtained',-2175,0,20041116,0),(1502,'ATRIBUTS','PASSPORT','WATER_DE','Water depth (m)','-','Approximate depth of water where sample was collected',-2122,0,20041116,0),(1503,'ATRIBUTS','PASSPORT','SPP_DIVE','Species diversity','-','Approximate number of species in the collection site',-2121,0,20041116,-75),(1504,'ATRIBUTS','PASSPORT','SHADE','Shading','-','Refers to the amount of exposure to the sun of the plant where sample was collected',-2120,0,20041116,-74),(1505,'ATRIBUTS','PASSPORT','SEED_PRO','Seed production','-','Seed production',-2119,0,20041116,0),(1506,'ATRIBUTS','PASSPORT','RATOON','Ratoon','-','Presence of tillers from nodes',-2117,0,20041116,-71),(1507,'ATRIBUTS','PASSPORT','POP_SIZE','Population size (sq. meters)','-','Population size in square meters, estimated visually at collection site\n',-2115,0,20041116,0),(1508,'ATRIBUTS','PASSPORT','GOWTHSTG','Growth stage','-','Growth stage of plant sampled during collection time',-2085,0,20041116,-64),(1509,'ATRIBUTS','PASSPORT','FLOWER','Flowering compared to o. sativa','-','Time of flowering of collected wild species sample compared to O. sativa',-2074,0,20041116,-63),(1510,'ATRIBUTS','PASSPORT','DIST2SAT','Distance to o. sativa field','-','Distance of collection site of wild species to the nearest O. sativa field',-2072,0,20041116,-61),(1511,'ATRIBUTS','PASSPORT','TRANS_DA','Transplanting date','-','Date sample was transplanted',-71,0,20041116,0),(1512,'ATRIBUTS','PASSPORT','TOPO_OTH','Topography (others)','-','-',-69,0,20041116,-46),(1513,'ATRIBUTS','PASSPORT','TOPO','Topography','-','Configuration of a surface including its relief and the position of its natural and man-made features',-68,0,20041116,-46),(1514,'ATRIBUTS','PASSPORT','TERRACED','Terraced culture','-','-',-67,0,20041116,-45),(1515,'ATRIBUTS','PASSPORT','SOW_DATE','Sowing date','-','Date sample was sown',-59,0,20041116,0),(1516,'ATRIBUTS','PASSPORT','SHIFT_CU','Shifting culture','-','Shifting culture',-58,0,20041116,-39),(1517,'ATRIBUTS','PASSPORT','SOIL_TEX','Soil texture','-','Relative proportions of sand, silt and clay in a sample',-57,0,20041116,-44),(1518,'ATRIBUTS','PASSPORT','SITE','Site','-','Topographical condition of a specific area where sample was collected',-56,0,20041116,-40),(1519,'ATRIBUTS','PASSPORT','SEED_FIL','Seed file presence','-','Presence of the original seed/ sample',-50,0,20041116,-79),(1520,'ATRIBUTS','PASSPORT','SAMP_MET','Sampling method','-','Sampling method',-48,0,20041116,-33),(1521,'ATRIBUTS','PASSPORT','SAMPMETO','Sampling method','-','Indicates how the collected material were sampled',-47,0,20041116,-33),(1522,'ATRIBUTS','PASSPORT','SAMPLE_T','Type of sample','-','Plant parts collected',-46,0,20041116,-38),(1523,'ATRIBUTS','PASSPORT','REM_PLAN','Plant characteristics','-','Plant characteristics as observed by the collector\n',-41,0,20041116,0),(1524,'ATRIBUTS','PASSPORT','REM_LAT_','Remark on lat/long (location)','-','Remark on lat/long (location)',-38,0,20041116,0),(1525,'ATRIBUTS','PASSPORT','REM_GRAI','Grain characteristics','-','Grain characteristics as observed by the collector\n',-37,0,20041116,0),(1526,'ATRIBUTS','PASSPORT','MNG_VAR','Meaning of variety name in english','-','Translation of the vernacular name into English',-33,0,20041116,-30),(1527,'ATRIBUTS','PASSPORT','MXEDSTND','Mixed_stand','-','-',-30,0,20041116,-29),(1528,'ATRIBUTS','PASSPORT','MAT','Maturity','-','-',-28,0,20041116,625),(1529,'ATRIBUTS','PASSPORT','LANG_VAR','Language of variety name','-','Language/dialect of the varietal name or vernacular name of wild species',-27,0,20041116,0),(1530,'ATRIBUTS','PASSPORT','HERB','Herbarium sample presence (y/n)','-','Indicates whether an herbarium sample was taken or not',-26,0,20041116,-27),(1531,'ATRIBUTS','PASSPORT','HARVDATE','Harvest date','-','Date variety was harvested',-25,0,20041116,0),(1532,'ATRIBUTS','PASSPORT','FUND','Funding agency','-','Source of funding',-23,0,20041116,0),(1533,'ATRIBUTS','PASSPORT','FREQ','Frequency','-','Frequency of occurrence of species/variety collected in an area',-22,0,20041116,-23),(1534,'ATRIBUTS','PASSPORT','ECOZONE','Ecological zone','-','Refers to the edaphic-climatic condition of the area',-17,0,20041116,-22),(1535,'ATRIBUTS','PASSPORT','ECOSYS','Ecological system','-','Refers to the environment where the sample was collected',-16,0,20041116,-21),(1536,'ATRIBUTS','PASSPORT','DRAINAGE','Drainage','-','Manner in which the waters pass off the surface of the land',-15,0,20041116,-20),(1537,'ATRIBUTS','PASSPORT','DBLETRNS','Double transplanting','-','-',-14,0,20041116,-19),(1538,'ATRIBUTS','PASSPORT','DIRECTSD','Direct seeding','-','-',-12,0,20041116,-17),(1539,'ATRIBUTS','PASSPORT','CULTTYPE','Cultural type','-','Rice ecosystem',-11,0,20041116,222),(1540,'ATRIBUTS','PASSPORT','STATUS_ACC','Accession status for distribution (i.e. AV or NA)','-','-',0,0,0,-1028),(1541,'ATRIBUTS','ATTRIBUTE','STRAIN','STRAIN','-','-',0,0,0,0),(1542,'ATRIBUTS','ATTRIBUTE','GENOTYPE','GENOTYPE','-','-',0,0,0,0),(1600,'GEOREF','LLSOURCE','GPS','GPS','-','Coordinates come from GPS',0,298,20090421,0),(1601,'GEOREF','LLSOURCE','MAP','MAP','-','Coordinates read from Map: Map ID should be in LLRef (PubType 442)',0,298,20090421,0),(1602,'GEOREF','LLSOURCE','GAZ','Digital gazetteer','-','Coordinates obtained by looking up location in digital gazetteer: Gazetteer ID should be in LLRef (PubType 443)',0,298,20090421,0),(1603,'GEOREF','LLSOURCE','CFORM','Collecting form','-','Coordinates were on collecting form with no information on the source of data. A scanned copy of the collecting form should be accessible through the GID and document/image management system',0,298,20090421,0),(1604,'GEOREF','LLSOURCE','DONOR','Donor','-','Coordinates were supplied by donor in documentation accompanying the shipment, with no information on how the donor obtained the data. A scanned copy of documents from the donor should be accessible through the GID and document/image management system',0,298,20090421,0),(1605,'GEOREF','LLSOURCE','CMISS','Collection mission report','-','Coordinates were in a report on a collecting mission, with no information on the source of the data. A scanned copy of the report should be accessible through the GID and document/image management system, with ID in LLRef',0,298,20090421,0),(1606,'GEOREF','LLSOURCE','DBASE','Another Database','-','Coordinates were obtained from another database with no information on its source. The database ID should be in LLRef (PubType 437)',0,298,20090421,0),(1607,'GEOREF','LL_FMT','D','Degrees','-','Original data provided to the nearest degree in the format D°H',0,298,20090421,0),(1608,'GEOREF','LL_FMT','DM','Degree-Minutes','-','Original data provided to the nearest minute, in the format D°M\'H',0,298,20090421,0),(1609,'GEOREF','LL_FMT','DMS','Degree-Minutes-Seconds','-','Original data provided to the nearest second in the format D°M\'S\"H',0,298,20090421,0),(1610,'GEOREF','LL_FMT','DD','Decimal Degrees','-','Original data provided in decimal degrees in the format D.DDDDD (negative for S and W)',0,298,20090421,0),(1611,'GEOREF','LL_FMT','DMM','Decimal Minutes','-','Original data provided in decimal minutes, in the format D°M.MMM\'H',0,298,20090421,0),(1612,'GEOREF','LL_FMT','DMSS','Decimal Seconds','-','Original data provided in decimsal seconds in the format D°M\'S.S\"H',0,298,20090421,0),(1613,'GEOREF','LL_DATUM','WGS84','WGS84','-','World Geodetic survey 1984',0,298,20090421,0),(1700,'ADDRESS','ADDRTYPE','MAIL','Mailing address','-','Preferred address for regular business mail (could be street address or PO box)',0,298,20090421,0),(1701,'ADDRESS','ADDRTYPE','PRIVATE','Private address','-','Preferred address for regular private mail',0,298,20090421,0),(1702,'ADDRESS','ADDRTYPE','SHIP','Shipping address','-','Shipping address',0,298,20090421,0),(1703,'ADDRESS','ADDRTYPE','ENTRY','Port of entry','-','Port of entry for international shipments into country',0,298,20090421,0),(1704,'ADDRESS','ADDRTYPE','COURIER','Courier deliveries','-','Address for courier delivery',0,298,20090421,0),(1705,'ADDRESS','ADDRTYPE','STREET','Street address','-','Actual physical address (even if not used for mail, shipping etc)',0,298,20090421,0),(1800,'EVENTMEM','MEMROLE','COLLECTOR','Collector','-','A member of a collecting team',0,298,20090422,0),(1801,'EVENTMEM','MEMROLE','DONOR','Donor','-','Donor of a batch of seed to IRRI',0,298,20090422,0),(1802,'EVENTMEM','MEMROLE','REQUESTOR','Person requesting seed','-','Person who places a seed request',0,298,20090422,0),(1803,'EVENTMEM','MEMROLE','RECIPIENT','Person receiving seed','-','Person who will be the final recipient of a shipment of seed',0,298,20090424,0),(1804,'EVENTMEM','MEMROLE','SUPERVISOR','Supervisor of requestor','-','Person who supervises requestor',0,298,20090424,0),(1805,'EVENTMEM','MEMROLE','AUTHORIZER','Authorizer of Requestor','-','Person who authorizes a shipment and the institution\'s acceptance of the SMTA',0,298,20090424,0),(1806,'EVENTMEM','MEMROLE','ADDRESSEE','Addressee of shipment','-','Person to whom a shipment is addressed',0,298,20090424,0),(1807,'EVENTMEM','MEMROLE','ENTRYPORT','Port of entry','-','Port of entry for a shipment into the country',0,298,20090424,0),(1910,'FILELINK','FILECAT','LEGAL DOC','Legal document','-','Legal document',0,298,20091221,0),(1911,'BIBREFS','PUBTYPE','PHYTO CERT','Phytosanitary Certificate','-','Phytosanitary Certificate',0,298,20091221,0),(1912,'BIBREFS','PUBTYPE','LETTER','Letter of Donation','-','Letter of Donation',0,298,20091221,0),(1913,'BIBREFS','PUBTYPE','SMTA','Standard Material Transfer Agreement','-','Standard Material Transfer Agreement',0,298,20091221,0),(1914,'BIBREFS','PUBTYPE','IMPORT PERMIT','Import permit','-','Import permit',0,298,20091221,0),(1920,'FILELINK','FILECAT','REPORT','Report or List','-','Report or List',0,298,20091221,0),(1921,'BIBREFS','PUBTYPE','SUMMARY REPORT','Summary Report','-','Summary Report',0,298,20091221,0),(1922,'BIBREFS','PUBTYPE','COLLECTING FORM','Collecting form','-','Collecting form',0,298,20091221,0),(1923,'BIBREFS','PUBTYPE','FIELDBOOK','Fieldbook','-','Fieldbook',0,298,20091221,0),(1924,'BIBREFS','PUBTYPE','SEEDLIST','Seedlist','-','Seedlist',0,298,20091221,0),(1930,'FILELINK','FILECAT','PHOTO','Photographs','-','Photographs',0,298,20091221,0),(1931,'BIBREFS','PUBTYPE','PHOTOSEEDS','Photo of seeds','-','Photo of seeds',0,298,20091221,0),(1932,'BIBREFS','PUBTYPE','PHOTOPLANTS','Photo of plants','-','Photo of plants',0,298,20091221,0),(1933,'BIBREFS','PUBTYPE','PHOTOFLOWER','Photo of flower','-','Photo of flower',0,298,20091221,0),(1934,'BIBREFS','PUBTYPE','PHOTOLIGULE','Photo of ligule','-','Photo of ligule',0,298,20091221,0),(1935,'BIBREFS','PUBTYPE','PHOTOCHROMOSOME','Photo of chromosome','-','Photo of chromosome',0,298,20091221,0),(1936,'ATRIBUTS','PASSPORT','VGDNA','Variety group (DNA classification)','-','-',-1,310,20120517,1548),(9998,'NAMES','NAME','TMPNAME','Internal ID code for CLOTHO','-','temp id',1,0,0,0),(9999,'ATRIBUTS','Deletion','DelAtt','Use this for deleted attributes','-','-',0,194,20070226,0);

--
-- table structure for table 'users'
--
DROP TABLE IF EXISTS users; 
CREATE TABLE users (
  userid INT NOT NULL DEFAULT 0,
  instalid INT NOT NULL DEFAULT 0,
  ustatus INT NOT NULL DEFAULT 0,
  uaccess INT NOT NULL DEFAULT 0,
  utype INT NOT NULL DEFAULT 0,
  uname VARCHAR(30) NOT NULL DEFAULT '-',
  upswd VARCHAR(30) NOT NULL DEFAULT '-',   -- increase length to 30: 20100422 mhabito
  personid INT NOT NULL DEFAULT 0,
  adate INT NOT NULL DEFAULT 0,
  cdate INT NOT NULL DEFAULT 0,
  PRIMARY KEY (userid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
CREATE INDEX users_idx01 ON users (instalid);
CREATE INDEX users_idx02 ON users (personid);
CREATE INDEX users_idx03 on users (userid);	   -- added 20091103 mhabito: define regular index on column(s) with UNIQUE KEY constraint
--



