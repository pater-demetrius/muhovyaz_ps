# SQL Manager 2010 for MySQL 4.5.1.3
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : muhovyaz_ps


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `muhovyaz_ps`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `muhovyaz_ps`;

#
# Structure for the `ps_access` table :
#

CREATE TABLE `ps_access` (
  `id_profile` int(10) unsigned NOT NULL,
  `id_tab` int(10) unsigned NOT NULL,
  `view` int(11) NOT NULL,
  `add` int(11) NOT NULL,
  `edit` int(11) NOT NULL,
  `delete` int(11) NOT NULL,
  PRIMARY KEY (`id_profile`,`id_tab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_accessory` table :
#

CREATE TABLE `ps_accessory` (
  `id_product_1` int(10) unsigned NOT NULL,
  `id_product_2` int(10) unsigned NOT NULL,
  KEY `accessory_product` (`id_product_1`,`id_product_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_address` table :
#

CREATE TABLE `ps_address` (
  `id_address` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(10) unsigned NOT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned NOT NULL DEFAULT '0',
  `id_manufacturer` int(10) unsigned NOT NULL DEFAULT '0',
  `id_supplier` int(10) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(32) NOT NULL,
  `company` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `address1` varchar(128) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `postcode` varchar(12) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `other` text,
  `phone` varchar(16) DEFAULT NULL,
  `phone_mobile` varchar(16) DEFAULT NULL,
  `vat_number` varchar(32) DEFAULT NULL,
  `dni` varchar(16) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_address`),
  KEY `address_customer` (`id_customer`),
  KEY `id_country` (`id_country`),
  KEY `id_state` (`id_state`),
  KEY `id_manufacturer` (`id_manufacturer`),
  KEY `id_supplier` (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_address_format` table :
#

CREATE TABLE `ps_address_format` (
  `id_country` int(10) unsigned NOT NULL,
  `format` varchar(255) NOT NULL DEFAULT '',
  KEY `country` (`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `ps_alias` table :
#

CREATE TABLE `ps_alias` (
  `id_alias` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `search` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_alias`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_attachment` table :
#

CREATE TABLE `ps_attachment` (
  `id_attachment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(40) NOT NULL,
  `file_name` varchar(128) NOT NULL,
  `mime` varchar(64) NOT NULL,
  PRIMARY KEY (`id_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_attachment_lang` table :
#

CREATE TABLE `ps_attachment_lang` (
  `id_attachment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id_attachment`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_attribute` table :
#

CREATE TABLE `ps_attribute` (
  `id_attribute` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_attribute_group` int(10) unsigned NOT NULL,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_attribute`),
  KEY `attribute_group` (`id_attribute_group`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_attribute_group` table :
#

CREATE TABLE `ps_attribute_group` (
  `id_attribute_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_color_group` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_attribute_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_attribute_group_lang` table :
#

CREATE TABLE `ps_attribute_group_lang` (
  `id_attribute_group` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `public_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_attribute_group`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_attribute_impact` table :
#

CREATE TABLE `ps_attribute_impact` (
  `id_attribute_impact` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_attribute` int(11) unsigned NOT NULL,
  `weight` float NOT NULL,
  `price` decimal(17,2) NOT NULL,
  PRIMARY KEY (`id_attribute_impact`),
  UNIQUE KEY `id_product` (`id_product`,`id_attribute`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_attribute_lang` table :
#

CREATE TABLE `ps_attribute_lang` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_lang`),
  KEY `id_lang` (`id_lang`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_carrier` table :
#

CREATE TABLE `ps_carrier` (
  `id_carrier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tax_rules_group` int(10) unsigned DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_handling` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `range_behavior` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_module` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_free` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_external` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `need_range` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_module_name` varchar(64) DEFAULT NULL,
  `shipping_method` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_carrier`),
  KEY `deleted` (`deleted`,`active`),
  KEY `id_tax_rules_group` (`id_tax_rules_group`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_carrier_group` table :
#

CREATE TABLE `ps_carrier_group` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  UNIQUE KEY `id_carrier` (`id_carrier`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_carrier_lang` table :
#

CREATE TABLE `ps_carrier_lang` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `delay` varchar(128) DEFAULT NULL,
  UNIQUE KEY `shipper_lang_index` (`id_lang`,`id_carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_carrier_zone` table :
#

CREATE TABLE `ps_carrier_zone` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_cart` table :
#

CREATE TABLE `ps_cart` (
  `id_cart` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned NOT NULL,
  `id_address_invoice` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_guest` int(10) unsigned NOT NULL,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `recyclable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `gift` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift_message` text,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_cart`),
  KEY `cart_customer` (`id_customer`),
  KEY `id_address_delivery` (`id_address_delivery`),
  KEY `id_address_invoice` (`id_address_invoice`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_lang` (`id_lang`),
  KEY `id_currency` (`id_currency`),
  KEY `id_guest` (`id_guest`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_cart_discount` table :
#

CREATE TABLE `ps_cart_discount` (
  `id_cart` int(10) unsigned NOT NULL,
  `id_discount` int(10) unsigned NOT NULL,
  KEY `cart_discount_index` (`id_cart`,`id_discount`),
  KEY `id_discount` (`id_discount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_cart_product` table :
#

CREATE TABLE `ps_cart_product` (
  `id_cart` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  KEY `cart_product_index` (`id_cart`,`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_category` table :
#

CREATE TABLE `ps_category` (
  `id_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `level_depth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nleft` int(10) unsigned NOT NULL DEFAULT '0',
  `nright` int(10) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`),
  KEY `category_parent` (`id_parent`),
  KEY `nleftright` (`nleft`,`nright`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_category_group` table :
#

CREATE TABLE `ps_category_group` (
  `id_category` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  UNIQUE KEY `category_group_index` (`id_category`,`id_group`),
  KEY `id_category` (`id_category`),
  KEY `id_group` (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_category_lang` table :
#

CREATE TABLE `ps_category_lang` (
  `id_category` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  UNIQUE KEY `category_lang_index` (`id_category`,`id_lang`),
  KEY `category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_category_product` table :
#

CREATE TABLE `ps_category_product` (
  `id_category` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `category_product_index` (`id_category`,`id_product`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_cms` table :
#

CREATE TABLE `ps_cms` (
  `id_cms` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_category` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cms`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_cms_block` table :
#

CREATE TABLE `ps_cms_block` (
  `id_cms_block` int(10) unsigned NOT NULL,
  `id_cms_category` int(10) unsigned NOT NULL,
  `name` varchar(40) NOT NULL,
  `location` tinyint(1) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `display_store` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_cms_block`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_cms_block_lang` table :
#

CREATE TABLE `ps_cms_block_lang` (
  `id_cms_block` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '''''',
  PRIMARY KEY (`id_cms_block`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_cms_block_page` table :
#

CREATE TABLE `ps_cms_block_page` (
  `id_cms_block_page` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_block` int(10) unsigned NOT NULL,
  `id_cms` int(10) unsigned NOT NULL,
  `is_category` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id_cms_block_page`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_cms_category` table :
#

CREATE TABLE `ps_cms_category` (
  `id_cms_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `level_depth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cms_category`),
  KEY `category_parent` (`id_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_cms_category_lang` table :
#

CREATE TABLE `ps_cms_category_lang` (
  `id_cms_category` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  UNIQUE KEY `category_lang_index` (`id_cms_category`,`id_lang`),
  KEY `category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_cms_lang` table :
#

CREATE TABLE `ps_cms_lang` (
  `id_cms` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `meta_title` varchar(128) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `content` longtext,
  `link_rewrite` varchar(128) NOT NULL,
  PRIMARY KEY (`id_cms`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_configuration` table :
#

CREATE TABLE `ps_configuration` (
  `id_configuration` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `value` text,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_configuration`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_configuration_lang` table :
#

CREATE TABLE `ps_configuration_lang` (
  `id_configuration` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` text,
  `date_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_configuration`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_connections` table :
#

CREATE TABLE `ps_connections` (
  `id_connections` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_guest` int(10) unsigned NOT NULL,
  `id_page` int(10) unsigned NOT NULL,
  `ip_address` bigint(20) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_connections`),
  KEY `id_guest` (`id_guest`),
  KEY `date_add` (`date_add`),
  KEY `id_page` (`id_page`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_connections_page` table :
#

CREATE TABLE `ps_connections_page` (
  `id_connections` int(10) unsigned NOT NULL,
  `id_page` int(10) unsigned NOT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id_connections`,`id_page`,`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_connections_source` table :
#

CREATE TABLE `ps_connections_source` (
  `id_connections_source` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_connections` int(10) unsigned NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  `request_uri` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_connections_source`),
  KEY `connections` (`id_connections`),
  KEY `orderby` (`date_add`),
  KEY `http_referer` (`http_referer`),
  KEY `request_uri` (`request_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_contact` table :
#

CREATE TABLE `ps_contact` (
  `id_contact` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `customer_service` tinyint(1) NOT NULL DEFAULT '0',
  `position` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_contact`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_contact_lang` table :
#

CREATE TABLE `ps_contact_lang` (
  `id_contact` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text,
  UNIQUE KEY `contact_lang_index` (`id_contact`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_country` table :
#

CREATE TABLE `ps_country` (
  `id_country` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_zone` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL DEFAULT '0',
  `iso_code` varchar(3) NOT NULL,
  `call_prefix` int(10) NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `contains_states` tinyint(1) NOT NULL DEFAULT '0',
  `need_identification_number` tinyint(1) NOT NULL DEFAULT '0',
  `need_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `zip_code_format` varchar(12) NOT NULL DEFAULT '''''',
  `display_tax_label` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_country`),
  KEY `country_iso_code` (`iso_code`),
  KEY `country_` (`id_zone`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_country_lang` table :
#

CREATE TABLE `ps_country_lang` (
  `id_country` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  UNIQUE KEY `country_lang_index` (`id_country`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_county` table :
#

CREATE TABLE `ps_county` (
  `id_county` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `id_state` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_county`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_county_zip_code` table :
#

CREATE TABLE `ps_county_zip_code` (
  `id_county` int(11) NOT NULL,
  `from_zip_code` int(11) NOT NULL,
  `to_zip_code` int(11) NOT NULL,
  PRIMARY KEY (`id_county`,`from_zip_code`,`to_zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_currency` table :
#

CREATE TABLE `ps_currency` (
  `id_currency` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `iso_code` varchar(3) NOT NULL DEFAULT '0',
  `iso_code_num` varchar(3) NOT NULL DEFAULT '0',
  `sign` varchar(8) NOT NULL,
  `blank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `format` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `conversion_rate` decimal(13,6) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_currency`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_customer` table :
#

CREATE TABLE `ps_customer` (
  `id_customer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_gender` int(10) unsigned NOT NULL,
  `id_default_group` int(10) unsigned NOT NULL DEFAULT '1',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `birthday` date DEFAULT NULL,
  `newsletter` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ip_registration_newsletter` varchar(15) DEFAULT NULL,
  `newsletter_date_add` datetime DEFAULT NULL,
  `optin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `note` text,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_customer`),
  KEY `customer_email` (`email`),
  KEY `customer_login` (`email`,`passwd`),
  KEY `id_customer_passwd` (`id_customer`,`passwd`),
  KEY `id_gender` (`id_gender`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_customer_group` table :
#

CREATE TABLE `ps_customer_group` (
  `id_customer` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_customer`,`id_group`),
  KEY `customer_login` (`id_group`),
  KEY `id_customer` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_customer_message` table :
#

CREATE TABLE `ps_customer_message` (
  `id_customer_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer_thread` int(11) DEFAULT NULL,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `message` text NOT NULL,
  `file_name` varchar(18) DEFAULT NULL,
  `ip_address` int(11) DEFAULT NULL,
  `user_agent` varchar(128) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_customer_message`),
  KEY `id_customer_thread` (`id_customer_thread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_customer_thread` table :
#

CREATE TABLE `ps_customer_thread` (
  `id_customer_thread` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `id_contact` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned DEFAULT NULL,
  `id_order` int(10) unsigned DEFAULT NULL,
  `id_product` int(10) unsigned DEFAULT NULL,
  `status` enum('open','closed','pending1','pending2') NOT NULL DEFAULT 'open',
  `email` varchar(128) NOT NULL,
  `token` varchar(12) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_customer_thread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_customization` table :
#

CREATE TABLE `ps_customization` (
  `id_customization` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product_attribute` int(10) unsigned NOT NULL DEFAULT '0',
  `id_cart` int(10) unsigned NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `quantity_refunded` int(11) NOT NULL DEFAULT '0',
  `quantity_returned` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_customization`,`id_cart`,`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_customization_field` table :
#

CREATE TABLE `ps_customization_field` (
  `id_customization_field` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_customization_field`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_customization_field_lang` table :
#

CREATE TABLE `ps_customization_field_lang` (
  `id_customization_field` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_customization_field`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_customized_data` table :
#

CREATE TABLE `ps_customized_data` (
  `id_customization` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `index` int(3) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_customization`,`type`,`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_date_range` table :
#

CREATE TABLE `ps_date_range` (
  `id_date_range` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_start` datetime NOT NULL,
  `time_end` datetime NOT NULL,
  PRIMARY KEY (`id_date_range`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_delivery` table :
#

CREATE TABLE `ps_delivery` (
  `id_delivery` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `id_range_price` int(10) unsigned DEFAULT NULL,
  `id_range_weight` int(10) unsigned DEFAULT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  `price` decimal(17,2) NOT NULL,
  PRIMARY KEY (`id_delivery`),
  KEY `id_zone` (`id_zone`),
  KEY `id_carrier` (`id_carrier`,`id_zone`),
  KEY `id_range_price` (`id_range_price`),
  KEY `id_range_weight` (`id_range_weight`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_discount` table :
#

CREATE TABLE `ps_discount` (
  `id_discount` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_discount_type` int(10) unsigned NOT NULL,
  `behavior_not_exhausted` tinyint(3) DEFAULT '1',
  `id_customer` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  `id_currency` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `value` decimal(17,2) NOT NULL DEFAULT '0.00',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity_per_user` int(10) unsigned NOT NULL DEFAULT '1',
  `cumulable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cumulable_reduction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `minimal` decimal(17,2) DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cart_display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_discount`),
  KEY `discount_name` (`name`),
  KEY `discount_customer` (`id_customer`),
  KEY `id_discount_type` (`id_discount_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_discount_category` table :
#

CREATE TABLE `ps_discount_category` (
  `id_category` int(11) unsigned NOT NULL,
  `id_discount` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_category`,`id_discount`),
  KEY `discount` (`id_discount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_discount_lang` table :
#

CREATE TABLE `ps_discount_lang` (
  `id_discount` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  PRIMARY KEY (`id_discount`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_discount_type` table :
#

CREATE TABLE `ps_discount_type` (
  `id_discount_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_discount_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_discount_type_lang` table :
#

CREATE TABLE `ps_discount_type_lang` (
  `id_discount_type` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_discount_type`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_editorial` table :
#

CREATE TABLE `ps_editorial` (
  `id_editorial` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `body_home_logo_link` varchar(255) NOT NULL,
  PRIMARY KEY (`id_editorial`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_editorial_lang` table :
#

CREATE TABLE `ps_editorial_lang` (
  `id_editorial` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `body_title` varchar(255) NOT NULL,
  `body_subheading` varchar(255) NOT NULL,
  `body_paragraph` text NOT NULL,
  `body_logo_subheading` varchar(255) NOT NULL,
  PRIMARY KEY (`id_editorial`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_employee` table :
#

CREATE TABLE `ps_employee` (
  `id_employee` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_profile` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL DEFAULT '0',
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stats_date_from` date DEFAULT NULL,
  `stats_date_to` date DEFAULT NULL,
  `bo_color` varchar(32) DEFAULT NULL,
  `bo_theme` varchar(32) DEFAULT NULL,
  `bo_uimode` enum('hover','click') DEFAULT 'click',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_employee`),
  KEY `employee_login` (`email`,`passwd`),
  KEY `id_employee_passwd` (`id_employee`,`passwd`),
  KEY `id_profile` (`id_profile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_feature` table :
#

CREATE TABLE `ps_feature` (
  `id_feature` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_feature`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_feature_lang` table :
#

CREATE TABLE `ps_feature_lang` (
  `id_feature` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_feature`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_feature_product` table :
#

CREATE TABLE `ps_feature_product` (
  `id_feature` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_feature_value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_feature`,`id_product`),
  KEY `id_feature_value` (`id_feature_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_feature_value` table :
#

CREATE TABLE `ps_feature_value` (
  `id_feature_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_feature` int(10) unsigned NOT NULL,
  `custom` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`),
  KEY `feature` (`id_feature`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_feature_value_lang` table :
#

CREATE TABLE `ps_feature_value_lang` (
  `id_feature_value` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_group` table :
#

CREATE TABLE `ps_group` (
  `id_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reduction` decimal(17,2) NOT NULL DEFAULT '0.00',
  `price_display_method` tinyint(4) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_group_lang` table :
#

CREATE TABLE `ps_group_lang` (
  `id_group` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  UNIQUE KEY `attribute_lang_index` (`id_group`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_group_reduction` table :
#

CREATE TABLE `ps_group_reduction` (
  `id_group_reduction` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_group` int(10) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  `reduction` decimal(4,3) NOT NULL,
  PRIMARY KEY (`id_group_reduction`),
  UNIQUE KEY `id_group` (`id_group`,`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_guest` table :
#

CREATE TABLE `ps_guest` (
  `id_guest` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_operating_system` int(10) unsigned DEFAULT NULL,
  `id_web_browser` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned DEFAULT NULL,
  `javascript` tinyint(1) DEFAULT '0',
  `screen_resolution_x` smallint(5) unsigned DEFAULT NULL,
  `screen_resolution_y` smallint(5) unsigned DEFAULT NULL,
  `screen_color` tinyint(3) unsigned DEFAULT NULL,
  `sun_java` tinyint(1) DEFAULT NULL,
  `adobe_flash` tinyint(1) DEFAULT NULL,
  `adobe_director` tinyint(1) DEFAULT NULL,
  `apple_quicktime` tinyint(1) DEFAULT NULL,
  `real_player` tinyint(1) DEFAULT NULL,
  `windows_media` tinyint(1) DEFAULT NULL,
  `accept_language` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id_guest`),
  KEY `id_customer` (`id_customer`),
  KEY `id_operating_system` (`id_operating_system`),
  KEY `id_web_browser` (`id_web_browser`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_help_access` table :
#

CREATE TABLE `ps_help_access` (
  `id_help_access` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) NOT NULL,
  `version` varchar(8) NOT NULL,
  PRIMARY KEY (`id_help_access`),
  UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_hook` table :
#

CREATE TABLE `ps_hook` (
  `id_hook` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text,
  `position` tinyint(1) NOT NULL DEFAULT '1',
  `live_edit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_hook`),
  UNIQUE KEY `hook_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_hook_module` table :
#

CREATE TABLE `ps_hook_module` (
  `id_module` int(10) unsigned NOT NULL,
  `id_hook` int(10) unsigned NOT NULL,
  `position` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_hook`),
  KEY `id_hook` (`id_hook`),
  KEY `id_module` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_hook_module_exceptions` table :
#

CREATE TABLE `ps_hook_module_exceptions` (
  `id_hook_module_exceptions` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_module` int(10) unsigned NOT NULL,
  `id_hook` int(10) unsigned NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_hook_module_exceptions`),
  KEY `id_module` (`id_module`),
  KEY `id_hook` (`id_hook`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_image` table :
#

CREATE TABLE `ps_image` (
  `id_image` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `position` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `cover` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_image`),
  UNIQUE KEY `product_position` (`id_product`,`position`),
  KEY `image_product` (`id_product`),
  KEY `id_product_cover` (`id_product`,`cover`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_image_lang` table :
#

CREATE TABLE `ps_image_lang` (
  `id_image` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `legend` varchar(128) DEFAULT NULL,
  UNIQUE KEY `image_lang_index` (`id_image`,`id_lang`),
  KEY `id_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_image_type` table :
#

CREATE TABLE `ps_image_type` (
  `id_image_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `products` tinyint(1) NOT NULL DEFAULT '1',
  `categories` tinyint(1) NOT NULL DEFAULT '1',
  `manufacturers` tinyint(1) NOT NULL DEFAULT '1',
  `suppliers` tinyint(1) NOT NULL DEFAULT '1',
  `scenes` tinyint(1) NOT NULL DEFAULT '1',
  `stores` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_image_type`),
  KEY `image_type_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_import_match` table :
#

CREATE TABLE `ps_import_match` (
  `id_import_match` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `match` text NOT NULL,
  `skip` int(2) NOT NULL,
  PRIMARY KEY (`id_import_match`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_lang` table :
#

CREATE TABLE `ps_lang` (
  `id_lang` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `iso_code` char(2) NOT NULL,
  `language_code` char(5) NOT NULL,
  PRIMARY KEY (`id_lang`),
  KEY `lang_iso_code` (`iso_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_linksmenutop` table :
#

CREATE TABLE `ps_linksmenutop` (
  `id_link` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `new_window` tinyint(1) NOT NULL,
  `link` varchar(128) NOT NULL,
  PRIMARY KEY (`id_link`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=DYNAMIC;

#
# Structure for the `ps_linksmenutop_lang` table :
#

CREATE TABLE `ps_linksmenutop_lang` (
  `id_link` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `label` varchar(128) NOT NULL,
  KEY `id_link` (`id_link`,`id_lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=DYNAMIC;

#
# Structure for the `ps_log` table :
#

CREATE TABLE `ps_log` (
  `id_log` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `severity` tinyint(1) NOT NULL,
  `error_code` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `object_type` varchar(32) DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_manufacturer` table :
#

CREATE TABLE `ps_manufacturer` (
  `id_manufacturer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_manufacturer`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_manufacturer_lang` table :
#

CREATE TABLE `ps_manufacturer_lang` (
  `id_manufacturer` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `short_description` varchar(254) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_manufacturer`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_memcached_servers` table :
#

CREATE TABLE `ps_memcached_servers` (
  `id_memcached_server` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(254) NOT NULL,
  `port` int(11) unsigned NOT NULL,
  `weight` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_memcached_server`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_message` table :
#

CREATE TABLE `ps_message` (
  `id_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cart` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `message` text NOT NULL,
  `private` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_message`),
  KEY `message_order` (`id_order`),
  KEY `id_cart` (`id_cart`),
  KEY `id_customer` (`id_customer`),
  KEY `id_employee` (`id_employee`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_message_readed` table :
#

CREATE TABLE `ps_message_readed` (
  `id_message` int(10) unsigned NOT NULL,
  `id_employee` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_message`,`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_meta` table :
#

CREATE TABLE `ps_meta` (
  `id_meta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page` varchar(64) NOT NULL,
  PRIMARY KEY (`id_meta`),
  KEY `meta_name` (`page`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_meta_lang` table :
#

CREATE TABLE `ps_meta_lang` (
  `id_meta` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `url_rewrite` varchar(254) NOT NULL,
  PRIMARY KEY (`id_meta`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_module` table :
#

CREATE TABLE `ps_module` (
  `id_module` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_module`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_module_country` table :
#

CREATE TABLE `ps_module_country` (
  `id_module` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_module_currency` table :
#

CREATE TABLE `ps_module_currency` (
  `id_module` int(10) unsigned NOT NULL,
  `id_currency` int(11) NOT NULL,
  PRIMARY KEY (`id_module`,`id_currency`),
  KEY `id_module` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_module_group` table :
#

CREATE TABLE `ps_module_group` (
  `id_module` int(10) unsigned NOT NULL,
  `id_group` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_operating_system` table :
#

CREATE TABLE `ps_operating_system` (
  `id_operating_system` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_operating_system`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_order_detail` table :
#

CREATE TABLE `ps_order_detail` (
  `id_order_detail` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_attribute_id` int(10) unsigned DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_in_stock` int(10) NOT NULL DEFAULT '0',
  `product_quantity_refunded` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_return` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_reinjected` int(10) unsigned NOT NULL DEFAULT '0',
  `product_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reduction_percent` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reduction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `group_reduction` decimal(10,2) NOT NULL DEFAULT '0.00',
  `product_quantity_discount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `product_ean13` varchar(13) DEFAULT NULL,
  `product_upc` varchar(12) DEFAULT NULL,
  `product_reference` varchar(32) DEFAULT NULL,
  `product_supplier_reference` varchar(32) DEFAULT NULL,
  `product_weight` float NOT NULL,
  `tax_name` varchar(16) NOT NULL,
  `tax_rate` decimal(10,3) NOT NULL DEFAULT '0.000',
  `ecotax` decimal(21,6) NOT NULL DEFAULT '0.000000',
  `ecotax_tax_rate` decimal(5,3) NOT NULL DEFAULT '0.000',
  `discount_quantity_applied` tinyint(1) NOT NULL DEFAULT '0',
  `download_hash` varchar(255) DEFAULT NULL,
  `download_nb` int(10) unsigned DEFAULT '0',
  `download_deadline` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_order_detail`),
  KEY `order_detail_order` (`id_order`),
  KEY `product_id` (`product_id`),
  KEY `product_attribute_id` (`product_attribute_id`),
  KEY `id_order_id_order_detail` (`id_order`,`id_order_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_order_discount` table :
#

CREATE TABLE `ps_order_discount` (
  `id_order_discount` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(10) unsigned NOT NULL,
  `id_discount` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` decimal(17,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_order_discount`),
  KEY `order_discount_order` (`id_order`),
  KEY `id_discount` (`id_discount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_order_history` table :
#

CREATE TABLE `ps_order_history` (
  `id_order_history` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_employee` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `id_order_state` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_history`),
  KEY `order_history_order` (`id_order`),
  KEY `id_employee` (`id_employee`),
  KEY `id_order_state` (`id_order_state`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_order_message` table :
#

CREATE TABLE `ps_order_message` (
  `id_order_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_message`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_order_message_lang` table :
#

CREATE TABLE `ps_order_message_lang` (
  `id_order_message` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id_order_message`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_order_return` table :
#

CREATE TABLE `ps_order_return` (
  `id_order_return` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `question` text NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order_return`),
  KEY `order_return_customer` (`id_customer`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_order_return_detail` table :
#

CREATE TABLE `ps_order_return_detail` (
  `id_order_return` int(10) unsigned NOT NULL,
  `id_order_detail` int(10) unsigned NOT NULL,
  `id_customization` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_return`,`id_order_detail`,`id_customization`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_order_return_state` table :
#

CREATE TABLE `ps_order_return_state` (
  `id_order_return_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_order_return_state`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_order_return_state_lang` table :
#

CREATE TABLE `ps_order_return_state_lang` (
  `id_order_return_state` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  UNIQUE KEY `order_state_lang_index` (`id_order_return_state`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_order_slip` table :
#

CREATE TABLE `ps_order_slip` (
  `id_order_slip` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT '1.000000',
  `id_customer` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `shipping_cost` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order_slip`),
  KEY `order_slip_customer` (`id_customer`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_order_slip_detail` table :
#

CREATE TABLE `ps_order_slip_detail` (
  `id_order_slip` int(10) unsigned NOT NULL,
  `id_order_detail` int(10) unsigned NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_slip`,`id_order_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_order_state` table :
#

CREATE TABLE `ps_order_state` (
  `id_order_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice` tinyint(1) unsigned DEFAULT '0',
  `send_email` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `color` varchar(32) DEFAULT NULL,
  `unremovable` tinyint(1) unsigned NOT NULL,
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logable` tinyint(1) NOT NULL DEFAULT '0',
  `delivery` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_state`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_order_state_lang` table :
#

CREATE TABLE `ps_order_state_lang` (
  `id_order_state` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `template` varchar(64) NOT NULL,
  UNIQUE KEY `order_state_lang_index` (`id_order_state`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_orders` table :
#

CREATE TABLE `ps_orders` (
  `id_order` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_cart` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned NOT NULL,
  `id_address_invoice` int(10) unsigned NOT NULL,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `payment` varchar(255) NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT '1.000000',
  `module` varchar(255) DEFAULT NULL,
  `recyclable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift_message` text,
  `shipping_number` varchar(32) DEFAULT NULL,
  `total_discounts` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_paid` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_paid_real` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_products` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_products_wt` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_shipping` decimal(17,2) NOT NULL DEFAULT '0.00',
  `carrier_tax_rate` decimal(10,3) NOT NULL DEFAULT '0.000',
  `total_wrapping` decimal(17,2) NOT NULL DEFAULT '0.00',
  `invoice_number` int(10) unsigned NOT NULL DEFAULT '0',
  `delivery_number` int(10) unsigned NOT NULL DEFAULT '0',
  `invoice_date` datetime NOT NULL,
  `delivery_date` datetime NOT NULL,
  `valid` int(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_customer` (`id_customer`),
  KEY `id_cart` (`id_cart`),
  KEY `invoice_number` (`invoice_number`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_lang` (`id_lang`),
  KEY `id_currency` (`id_currency`),
  KEY `id_address_delivery` (`id_address_delivery`),
  KEY `id_address_invoice` (`id_address_invoice`),
  KEY `date_add` (`date_add`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_pack` table :
#

CREATE TABLE `ps_pack` (
  `id_product_pack` int(10) unsigned NOT NULL,
  `id_product_item` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product_pack`,`id_product_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_page` table :
#

CREATE TABLE `ps_page` (
  `id_page` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_page_type` int(10) unsigned NOT NULL,
  `id_object` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_page`),
  KEY `id_page_type` (`id_page_type`),
  KEY `id_object` (`id_object`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_page_type` table :
#

CREATE TABLE `ps_page_type` (
  `id_page_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_page_type`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_page_viewed` table :
#

CREATE TABLE `ps_page_viewed` (
  `id_page` int(10) unsigned NOT NULL,
  `id_date_range` int(10) unsigned NOT NULL,
  `counter` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_page`,`id_date_range`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_pagenotfound` table :
#

CREATE TABLE `ps_pagenotfound` (
  `id_pagenotfound` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request_uri` varchar(256) NOT NULL,
  `http_referer` varchar(256) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_pagenotfound`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_payment_cc` table :
#

CREATE TABLE `ps_payment_cc` (
  `id_payment_cc` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(10) unsigned DEFAULT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_id` varchar(254) DEFAULT NULL,
  `card_number` varchar(254) DEFAULT NULL,
  `card_brand` varchar(254) DEFAULT NULL,
  `card_expiration` char(7) DEFAULT NULL,
  `card_holder` varchar(254) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_payment_cc`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_product` table :
#

CREATE TABLE `ps_product` (
  `id_product` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_supplier` int(10) unsigned DEFAULT NULL,
  `id_manufacturer` int(10) unsigned DEFAULT NULL,
  `id_tax_rules_group` int(10) unsigned NOT NULL,
  `id_category_default` int(10) unsigned DEFAULT NULL,
  `id_color_default` int(10) unsigned DEFAULT NULL,
  `on_sale` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `online_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ean13` varchar(13) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `quantity` int(10) NOT NULL DEFAULT '0',
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unity` varchar(255) DEFAULT NULL,
  `unit_price_ratio` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `additional_shipping_cost` decimal(20,2) NOT NULL DEFAULT '0.00',
  `reference` varchar(32) DEFAULT NULL,
  `supplier_reference` varchar(32) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `width` float NOT NULL DEFAULT '0',
  `height` float NOT NULL DEFAULT '0',
  `depth` float NOT NULL DEFAULT '0',
  `weight` float NOT NULL DEFAULT '0',
  `out_of_stock` int(10) unsigned NOT NULL DEFAULT '2',
  `quantity_discount` tinyint(1) DEFAULT '0',
  `customizable` tinyint(2) NOT NULL DEFAULT '0',
  `uploadable_files` tinyint(4) NOT NULL DEFAULT '0',
  `text_fields` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `available_for_order` tinyint(1) NOT NULL DEFAULT '1',
  `condition` enum('new','used','refurbished') NOT NULL DEFAULT 'new',
  `show_price` tinyint(1) NOT NULL DEFAULT '1',
  `indexed` tinyint(1) NOT NULL DEFAULT '0',
  `cache_is_pack` tinyint(1) NOT NULL DEFAULT '0',
  `cache_has_attachments` tinyint(1) NOT NULL DEFAULT '0',
  `cache_default_attribute` int(10) unsigned DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `product_supplier` (`id_supplier`),
  KEY `product_manufacturer` (`id_manufacturer`),
  KEY `id_category_default` (`id_category_default`),
  KEY `id_color_default` (`id_color_default`),
  KEY `date_add` (`date_add`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_product_attachment` table :
#

CREATE TABLE `ps_product_attachment` (
  `id_product` int(10) unsigned NOT NULL,
  `id_attachment` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_product_attribute` table :
#

CREATE TABLE `ps_product_attribute` (
  `id_product_attribute` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `supplier_reference` varchar(32) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `ean13` varchar(13) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `quantity` int(10) NOT NULL DEFAULT '0',
  `weight` float NOT NULL DEFAULT '0',
  `unit_price_impact` decimal(17,2) NOT NULL DEFAULT '0.00',
  `default_on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product_attribute`),
  KEY `product_attribute_product` (`id_product`),
  KEY `reference` (`reference`),
  KEY `supplier_reference` (`supplier_reference`),
  KEY `product_default` (`id_product`,`default_on`),
  KEY `id_product_id_product_attribute` (`id_product_attribute`,`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_product_attribute_combination` table :
#

CREATE TABLE `ps_product_attribute_combination` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_product_attribute`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_product_attribute_image` table :
#

CREATE TABLE `ps_product_attribute_image` (
  `id_product_attribute` int(10) unsigned NOT NULL,
  `id_image` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_attribute`,`id_image`),
  KEY `id_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_product_country_tax` table :
#

CREATE TABLE `ps_product_country_tax` (
  `id_product` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `id_tax` int(11) NOT NULL,
  UNIQUE KEY `id_product` (`id_product`,`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_product_download` table :
#

CREATE TABLE `ps_product_download` (
  `id_product_download` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `display_filename` varchar(255) DEFAULT NULL,
  `physically_filename` varchar(255) DEFAULT NULL,
  `date_deposit` datetime NOT NULL,
  `date_expiration` datetime DEFAULT NULL,
  `nb_days_accessible` int(10) unsigned DEFAULT NULL,
  `nb_downloadable` int(10) unsigned DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product_download`),
  KEY `product_active` (`id_product`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_product_group_reduction_cache` table :
#

CREATE TABLE `ps_product_group_reduction_cache` (
  `id_product` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `reduction` decimal(4,3) NOT NULL,
  PRIMARY KEY (`id_product`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_product_lang` table :
#

CREATE TABLE `ps_product_lang` (
  `id_product` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `description_short` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `available_now` varchar(255) DEFAULT NULL,
  `available_later` varchar(255) DEFAULT NULL,
  UNIQUE KEY `product_lang_index` (`id_product`,`id_lang`),
  KEY `id_lang` (`id_lang`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_product_sale` table :
#

CREATE TABLE `ps_product_sale` (
  `id_product` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `sale_nbr` int(10) unsigned NOT NULL DEFAULT '0',
  `date_upd` date NOT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_product_tag` table :
#

CREATE TABLE `ps_product_tag` (
  `id_product` int(10) unsigned NOT NULL,
  `id_tag` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_tag`),
  KEY `id_tag` (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_profile` table :
#

CREATE TABLE `ps_profile` (
  `id_profile` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_profile`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_profile_lang` table :
#

CREATE TABLE `ps_profile_lang` (
  `id_lang` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_profile`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_quick_access` table :
#

CREATE TABLE `ps_quick_access` (
  `id_quick_access` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `new_window` tinyint(1) NOT NULL DEFAULT '0',
  `link` varchar(128) NOT NULL,
  PRIMARY KEY (`id_quick_access`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_quick_access_lang` table :
#

CREATE TABLE `ps_quick_access_lang` (
  `id_quick_access` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_quick_access`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_range_price` table :
#

CREATE TABLE `ps_range_price` (
  `id_range_price` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_range_price`),
  UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_range_weight` table :
#

CREATE TABLE `ps_range_weight` (
  `id_range_weight` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_range_weight`),
  UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_referrer` table :
#

CREATE TABLE `ps_referrer` (
  `id_referrer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `passwd` varchar(32) DEFAULT NULL,
  `http_referer_regexp` varchar(64) DEFAULT NULL,
  `http_referer_like` varchar(64) DEFAULT NULL,
  `request_uri_regexp` varchar(64) DEFAULT NULL,
  `request_uri_like` varchar(64) DEFAULT NULL,
  `http_referer_regexp_not` varchar(64) DEFAULT NULL,
  `http_referer_like_not` varchar(64) DEFAULT NULL,
  `request_uri_regexp_not` varchar(64) DEFAULT NULL,
  `request_uri_like_not` varchar(64) DEFAULT NULL,
  `base_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `percent_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `click_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `cache_visitors` int(11) DEFAULT NULL,
  `cache_visits` int(11) DEFAULT NULL,
  `cache_pages` int(11) DEFAULT NULL,
  `cache_registrations` int(11) DEFAULT NULL,
  `cache_orders` int(11) DEFAULT NULL,
  `cache_sales` decimal(17,2) DEFAULT NULL,
  `cache_reg_rate` decimal(5,4) DEFAULT NULL,
  `cache_order_rate` decimal(5,4) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_referrer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_referrer_cache` table :
#

CREATE TABLE `ps_referrer_cache` (
  `id_connections_source` int(11) unsigned NOT NULL,
  `id_referrer` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_connections_source`,`id_referrer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_required_field` table :
#

CREATE TABLE `ps_required_field` (
  `id_required_field` int(11) NOT NULL AUTO_INCREMENT,
  `object_name` varchar(32) NOT NULL,
  `field_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_required_field`),
  KEY `object_name` (`object_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_scene` table :
#

CREATE TABLE `ps_scene` (
  `id_scene` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_scene`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_scene_category` table :
#

CREATE TABLE `ps_scene_category` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_scene`,`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_scene_lang` table :
#

CREATE TABLE `ps_scene_lang` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_scene`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_scene_products` table :
#

CREATE TABLE `ps_scene_products` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `x_axis` int(4) NOT NULL,
  `y_axis` int(4) NOT NULL,
  `zone_width` int(3) NOT NULL,
  `zone_height` int(3) NOT NULL,
  PRIMARY KEY (`id_scene`,`id_product`,`x_axis`,`y_axis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_search_engine` table :
#

CREATE TABLE `ps_search_engine` (
  `id_search_engine` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server` varchar(64) NOT NULL,
  `getvar` varchar(16) NOT NULL,
  PRIMARY KEY (`id_search_engine`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_search_index` table :
#

CREATE TABLE `ps_search_index` (
  `id_product` int(11) unsigned NOT NULL,
  `id_word` int(11) unsigned NOT NULL,
  `weight` smallint(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_word`,`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_search_word` table :
#

CREATE TABLE `ps_search_word` (
  `id_word` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `word` varchar(15) NOT NULL,
  PRIMARY KEY (`id_word`),
  UNIQUE KEY `id_lang` (`id_lang`,`word`)
) ENGINE=InnoDB AUTO_INCREMENT=1874 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_sekeyword` table :
#

CREATE TABLE `ps_sekeyword` (
  `id_sekeyword` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(256) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_sekeyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_specific_price` table :
#

CREATE TABLE `ps_specific_price` (
  `id_specific_price` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `id_shop` tinyint(3) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `price` decimal(20,6) NOT NULL,
  `from_quantity` smallint(5) unsigned NOT NULL,
  `reduction` decimal(20,6) NOT NULL,
  `reduction_type` enum('amount','percentage') NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  PRIMARY KEY (`id_specific_price`),
  KEY `id_product` (`id_product`,`id_shop`,`id_currency`,`id_country`,`id_group`,`from_quantity`,`from`,`to`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_specific_price_priority` table :
#

CREATE TABLE `ps_specific_price_priority` (
  `id_specific_price_priority` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `priority` varchar(80) NOT NULL,
  PRIMARY KEY (`id_specific_price_priority`,`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_state` table :
#

CREATE TABLE `ps_state` (
  `id_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(11) unsigned NOT NULL,
  `id_zone` int(11) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `iso_code` char(4) NOT NULL,
  `tax_behavior` smallint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_state`),
  KEY `id_country` (`id_country`),
  KEY `id_zone` (`id_zone`)
) ENGINE=InnoDB AUTO_INCREMENT=784 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_statssearch` table :
#

CREATE TABLE `ps_statssearch` (
  `id_statssearch` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) NOT NULL,
  `results` int(6) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_statssearch`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_stock_mvt` table :
#

CREATE TABLE `ps_stock_mvt` (
  `id_stock_mvt` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned DEFAULT NULL,
  `id_product_attribute` int(11) unsigned DEFAULT NULL,
  `id_order` int(11) unsigned DEFAULT NULL,
  `id_stock_mvt_reason` int(11) unsigned NOT NULL,
  `id_employee` int(11) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_stock_mvt`),
  KEY `id_order` (`id_order`),
  KEY `id_product` (`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`),
  KEY `id_stock_mvt_reason` (`id_stock_mvt_reason`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_stock_mvt_reason` table :
#

CREATE TABLE `ps_stock_mvt_reason` (
  `id_stock_mvt_reason` int(11) NOT NULL AUTO_INCREMENT,
  `sign` tinyint(1) NOT NULL DEFAULT '1',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_stock_mvt_reason`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_stock_mvt_reason_lang` table :
#

CREATE TABLE `ps_stock_mvt_reason_lang` (
  `id_stock_mvt_reason` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_stock_mvt_reason`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_store` table :
#

CREATE TABLE `ps_store` (
  `id_store` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(10) unsigned NOT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `address1` varchar(128) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `postcode` varchar(12) NOT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  `hours` varchar(254) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `fax` varchar(16) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `note` text,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_store`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_subdomain` table :
#

CREATE TABLE `ps_subdomain` (
  `id_subdomain` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id_subdomain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_supplier` table :
#

CREATE TABLE `ps_supplier` (
  `id_supplier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_supplier_lang` table :
#

CREATE TABLE `ps_supplier_lang` (
  `id_supplier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_tab` table :
#

CREATE TABLE `ps_tab` (
  `id_tab` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) NOT NULL,
  `class_name` varchar(64) NOT NULL,
  `module` varchar(64) DEFAULT NULL,
  `position` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_tab`),
  KEY `class_name` (`class_name`),
  KEY `id_parent` (`id_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_tab_lang` table :
#

CREATE TABLE `ps_tab_lang` (
  `id_tab` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_tab`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_tag` table :
#

CREATE TABLE `ps_tag` (
  `id_tag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_tag`),
  KEY `tag_name` (`name`),
  KEY `id_lang` (`id_lang`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_tax` table :
#

CREATE TABLE `ps_tax` (
  `id_tax` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(10,3) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tax`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_tax_lang` table :
#

CREATE TABLE `ps_tax_lang` (
  `id_tax` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  UNIQUE KEY `tax_lang_index` (`id_tax`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_tax_rule` table :
#

CREATE TABLE `ps_tax_rule` (
  `id_tax_rule` int(11) NOT NULL AUTO_INCREMENT,
  `id_tax_rules_group` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `id_county` int(11) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `state_behavior` int(11) NOT NULL,
  `county_behavior` int(11) NOT NULL,
  PRIMARY KEY (`id_tax_rule`),
  UNIQUE KEY `tax_rule` (`id_tax_rules_group`,`id_country`,`id_state`,`id_county`),
  KEY `id_tax_rules_group` (`id_tax_rules_group`),
  KEY `id_tax` (`id_tax`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_tax_rules_group` table :
#

CREATE TABLE `ps_tax_rules_group` (
  `id_tax_rules_group` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`id_tax_rules_group`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_timezone` table :
#

CREATE TABLE `ps_timezone` (
  `id_timezone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_timezone`)
) ENGINE=InnoDB AUTO_INCREMENT=561 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_web_browser` table :
#

CREATE TABLE `ps_web_browser` (
  `id_web_browser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_web_browser`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_webservice_account` table :
#

CREATE TABLE `ps_webservice_account` (
  `id_webservice_account` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `description` text,
  `class_name` varchar(50) NOT NULL DEFAULT 'WebserviceRequest',
  `is_module` tinyint(2) NOT NULL DEFAULT '0',
  `module_name` varchar(50) DEFAULT NULL,
  `active` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_webservice_account`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_webservice_permission` table :
#

CREATE TABLE `ps_webservice_permission` (
  `id_webservice_permission` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(50) NOT NULL,
  `method` enum('GET','POST','PUT','DELETE','HEAD') NOT NULL,
  `id_webservice_account` int(11) NOT NULL,
  PRIMARY KEY (`id_webservice_permission`),
  UNIQUE KEY `resource_2` (`resource`,`method`,`id_webservice_account`),
  KEY `resource` (`resource`),
  KEY `method` (`method`),
  KEY `id_webservice_account` (`id_webservice_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Structure for the `ps_zone` table :
#

CREATE TABLE `ps_zone` (
  `id_zone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_zone`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=COMPACT;

#
# Data for the `ps_access` table  (LIMIT 0,500)
#

INSERT INTO `ps_access` (`id_profile`, `id_tab`, `view`, `add`, `edit`, `delete`) VALUES
  (1,1,1,1,1,1),
  (1,2,1,1,1,1),
  (1,3,1,1,1,1),
  (1,4,1,1,1,1),
  (1,5,1,1,1,1),
  (1,6,1,1,1,1),
  (1,7,1,1,1,1),
  (1,8,1,1,1,1),
  (1,9,1,1,1,1),
  (1,10,1,1,1,1),
  (1,11,1,1,1,1),
  (1,12,1,1,1,1),
  (1,13,1,1,1,1),
  (1,14,1,1,1,1),
  (1,15,1,1,1,1),
  (1,16,1,1,1,1),
  (1,17,1,1,1,1),
  (1,18,1,1,1,1),
  (1,19,1,1,1,1),
  (1,20,1,1,1,1),
  (1,21,1,1,1,1),
  (1,22,1,1,1,1),
  (1,23,1,1,1,1),
  (1,24,1,1,1,1),
  (1,26,1,1,1,1),
  (1,27,1,1,1,1),
  (1,28,1,1,1,1),
  (1,29,1,1,1,1),
  (1,30,1,1,1,1),
  (1,31,1,1,1,1),
  (1,32,1,1,1,1),
  (1,33,1,1,1,1),
  (1,34,1,1,1,1),
  (1,35,1,1,1,1),
  (1,36,1,1,1,1),
  (1,37,1,1,1,1),
  (1,38,1,1,1,1),
  (1,39,1,1,1,1),
  (1,40,1,1,1,1),
  (1,41,1,1,1,1),
  (1,42,1,1,1,1),
  (1,43,1,1,1,1),
  (1,44,1,1,1,1),
  (1,46,1,1,1,1),
  (1,47,1,1,1,1),
  (1,48,1,1,1,1),
  (1,49,1,1,1,1),
  (1,51,1,1,1,1),
  (1,52,1,1,1,1),
  (1,53,1,1,1,1),
  (1,54,1,1,1,1),
  (1,55,1,1,1,1),
  (1,56,1,1,1,1),
  (1,57,1,1,1,1),
  (1,58,1,1,1,1),
  (1,59,1,1,1,1),
  (1,60,1,1,1,1),
  (1,61,1,1,1,1),
  (1,62,1,1,1,1),
  (1,63,1,1,1,1),
  (1,64,1,1,1,1),
  (1,65,1,1,1,1),
  (1,66,1,1,1,1),
  (1,67,1,1,1,1),
  (1,68,1,1,1,1),
  (1,69,1,1,1,1),
  (1,70,1,1,1,1),
  (1,71,1,1,1,1),
  (1,72,1,1,1,1),
  (1,73,1,1,1,1),
  (1,80,1,1,1,1),
  (1,81,1,1,1,1),
  (1,82,1,1,1,1),
  (1,83,1,1,1,1),
  (1,84,1,1,1,1),
  (1,85,1,1,1,1),
  (1,86,1,1,1,1),
  (1,87,1,1,1,1),
  (1,88,1,1,1,1),
  (2,1,1,1,1,1),
  (2,2,1,1,1,1),
  (2,3,1,1,1,1),
  (2,4,0,0,0,0),
  (2,5,1,1,1,1),
  (2,6,0,0,0,0),
  (2,7,0,0,0,0),
  (2,8,0,0,0,0),
  (2,9,0,0,0,0),
  (2,10,0,0,0,0),
  (2,11,0,0,0,0),
  (2,12,1,1,1,1),
  (2,13,1,1,1,1),
  (2,14,0,0,0,0),
  (2,15,0,0,0,0),
  (2,16,0,0,0,0),
  (2,17,1,1,1,1),
  (2,18,0,0,0,0),
  (2,19,0,0,0,0),
  (2,20,1,1,1,1),
  (2,21,1,1,1,1),
  (2,22,0,0,0,0),
  (2,23,0,0,0,0),
  (2,24,0,0,0,0),
  (2,26,0,0,0,0),
  (2,27,0,0,0,0),
  (2,28,0,0,0,0),
  (2,29,0,0,0,0),
  (2,30,0,0,0,0),
  (2,31,0,0,0,0),
  (2,32,0,0,0,0),
  (2,33,0,0,0,0),
  (2,34,1,1,1,1),
  (2,35,0,0,0,0),
  (2,36,0,0,0,0),
  (2,37,0,0,0,0),
  (2,38,0,0,0,0),
  (2,39,0,0,0,0),
  (2,40,0,0,0,0),
  (2,41,0,0,0,0),
  (2,42,1,1,1,1),
  (2,43,0,0,0,0),
  (2,44,0,0,0,0),
  (2,46,0,0,0,0),
  (2,47,1,1,1,1),
  (2,48,0,0,0,0),
  (2,49,1,1,1,1),
  (2,51,0,0,0,0),
  (2,52,0,0,0,0),
  (2,53,0,0,0,0),
  (2,54,0,0,0,0),
  (2,55,1,1,1,1),
  (2,56,0,0,0,0),
  (2,57,0,0,0,0),
  (2,58,0,0,0,0),
  (2,59,1,1,1,1),
  (2,60,1,1,1,1),
  (2,61,0,0,0,0),
  (2,62,0,0,0,0),
  (2,63,0,0,0,0),
  (2,64,0,0,0,0),
  (2,65,0,0,0,0),
  (2,66,0,0,0,0),
  (2,67,0,0,0,0),
  (2,68,0,0,0,0),
  (2,69,0,0,0,0),
  (2,70,0,0,0,0),
  (2,71,0,0,0,0),
  (2,72,0,0,0,0),
  (2,73,1,1,1,1),
  (2,80,0,0,0,0),
  (2,81,0,0,0,0),
  (2,82,0,0,0,0),
  (2,83,0,0,0,0),
  (2,84,0,0,0,0),
  (2,85,0,0,0,0),
  (2,86,0,0,0,0),
  (2,87,0,0,0,0),
  (2,88,1,1,1,1),
  (3,1,1,1,1,1),
  (3,2,0,0,0,0),
  (3,3,0,0,0,0),
  (3,4,0,0,0,0),
  (3,5,0,0,0,0),
  (3,6,0,0,0,0),
  (3,7,0,0,0,0),
  (3,8,0,0,0,0),
  (3,9,1,0,0,0),
  (3,10,0,0,0,0),
  (3,11,0,0,0,0),
  (3,12,0,0,0,0),
  (3,13,0,0,0,0),
  (3,14,0,0,0,0),
  (3,15,0,0,0,0),
  (3,16,0,0,0,0),
  (3,17,0,0,0,0),
  (3,18,0,0,0,0),
  (3,19,0,0,0,0),
  (3,20,0,0,0,0),
  (3,21,0,0,0,0),
  (3,22,0,0,0,0),
  (3,23,0,0,0,0),
  (3,24,0,0,0,0),
  (3,26,0,0,0,0),
  (3,27,0,0,0,0),
  (3,28,0,0,0,0),
  (3,29,0,0,0,0),
  (3,30,0,0,0,0),
  (3,31,0,0,0,0),
  (3,32,1,1,1,1),
  (3,33,1,1,1,1),
  (3,34,0,0,0,0),
  (3,35,0,0,0,0),
  (3,36,0,0,0,0),
  (3,37,0,0,0,0),
  (3,38,0,0,0,0),
  (3,39,0,0,0,0),
  (3,40,0,0,0,0),
  (3,41,0,0,0,0),
  (3,42,0,0,0,0),
  (3,43,1,0,0,0),
  (3,44,0,0,0,0),
  (3,46,0,0,0,0),
  (3,47,0,0,0,0),
  (3,48,0,0,0,0),
  (3,49,0,0,0,0),
  (3,51,0,0,0,0),
  (3,52,0,0,0,0),
  (3,53,0,0,0,0),
  (3,54,0,0,0,0),
  (3,55,0,0,0,0),
  (3,56,0,0,0,0),
  (3,57,1,1,1,1),
  (3,58,0,0,0,0),
  (3,59,0,0,0,0),
  (3,60,0,0,0,0),
  (3,61,0,0,0,0),
  (3,62,0,0,0,0),
  (3,63,0,0,0,0),
  (3,64,0,0,0,0),
  (3,65,0,0,0,0),
  (3,66,0,0,0,0),
  (3,67,0,0,0,0),
  (3,68,0,0,0,0),
  (3,69,0,0,0,0),
  (3,70,0,0,0,0),
  (3,71,0,0,0,0),
  (3,72,0,0,0,0),
  (3,73,0,0,0,0),
  (3,80,0,0,0,0),
  (3,81,0,0,0,0),
  (3,82,0,0,0,0),
  (3,83,0,0,0,0),
  (3,84,0,0,0,0),
  (3,85,0,0,0,0),
  (3,86,0,0,0,0),
  (3,87,0,0,0,0),
  (3,88,1,1,1,1),
  (4,1,1,1,1,1),
  (4,2,1,1,1,1),
  (4,3,1,1,1,1),
  (4,4,0,0,0,0),
  (4,5,0,0,0,0),
  (4,6,1,1,1,1),
  (4,7,0,0,0,0),
  (4,8,0,0,0,0),
  (4,9,0,0,0,0),
  (4,10,1,0,0,0),
  (4,11,0,0,0,0),
  (4,12,1,1,1,1),
  (4,13,0,0,0,0),
  (4,14,0,0,0,0),
  (4,15,0,0,0,0),
  (4,16,0,0,0,0),
  (4,17,0,0,0,0),
  (4,18,0,0,0,0),
  (4,19,0,0,0,0),
  (4,20,0,0,0,0),
  (4,21,0,0,0,0),
  (4,22,0,0,0,0),
  (4,23,0,0,0,0),
  (4,24,0,0,0,0),
  (4,26,0,0,0,0),
  (4,27,0,0,0,0),
  (4,28,0,0,0,0),
  (4,29,0,0,0,0),
  (4,30,0,0,0,0),
  (4,31,0,0,0,0),
  (4,32,0,0,0,0),
  (4,33,0,0,0,0),
  (4,34,0,0,0,0),
  (4,35,0,0,0,0),
  (4,36,0,0,0,0),
  (4,37,0,0,0,0),
  (4,38,0,0,0,0),
  (4,39,0,0,0,0),
  (4,40,0,0,0,0),
  (4,41,0,0,0,0),
  (4,42,1,1,1,1),
  (4,43,1,0,0,0),
  (4,44,0,0,0,0),
  (4,46,0,0,0,0),
  (4,47,0,0,0,0),
  (4,48,0,0,0,0),
  (4,49,1,1,1,1),
  (4,51,0,0,0,0),
  (4,52,0,0,0,0),
  (4,53,0,0,0,0),
  (4,54,1,1,1,1),
  (4,55,0,0,0,0),
  (4,56,0,0,0,0),
  (4,57,0,0,0,0),
  (4,58,0,0,0,0),
  (4,59,1,1,1,1),
  (4,60,0,0,0,0),
  (4,61,0,0,0,0),
  (4,62,1,1,1,1),
  (4,63,1,1,1,1),
  (4,64,0,0,0,0),
  (4,65,1,1,1,1),
  (4,66,0,0,0,0),
  (4,67,0,0,0,0),
  (4,68,0,0,0,0),
  (4,69,0,0,0,0),
  (4,70,0,0,0,0),
  (4,71,0,0,0,0),
  (4,72,0,0,0,0),
  (4,73,0,0,0,0),
  (4,80,0,0,0,0),
  (4,81,0,0,0,0),
  (4,82,1,1,1,1),
  (4,83,0,0,0,0),
  (4,84,0,0,0,0),
  (4,85,0,0,0,0),
  (4,86,0,0,0,0),
  (4,87,0,0,0,0),
  (4,88,1,1,1,1);
COMMIT;

#
# Data for the `ps_address` table  (LIMIT 0,500)
#

INSERT INTO `ps_address` (`id_address`, `id_country`, `id_state`, `id_customer`, `id_manufacturer`, `id_supplier`, `alias`, `company`, `lastname`, `firstname`, `address1`, `address2`, `postcode`, `city`, `other`, `phone`, `phone_mobile`, `vat_number`, `dni`, `date_add`, `date_upd`, `active`, `deleted`) VALUES
  (1,21,5,0,1,0,'manufacturer',NULL,'JOBS','STEVE','1 Infinite Loop',NULL,'95014','Cupertino',NULL,'(800) 275-2273',NULL,NULL,NULL,'2011-03-19 20:04:50','2011-03-19 20:04:50',1,0),
  (2,8,0,1,0,0,'Mon adresse','My Company','DOE','John','16, Main street','2nd floor','75000','Paris ',NULL,'0102030405',NULL,NULL,NULL,'2011-03-19 20:04:50','2011-03-19 20:04:50',1,0),
  (3,177,754,2,0,0,'Мой адрес','','Никифорцев','Дмитрий','ул 2 пер Римского-Корсакова 7 кв. 15','','630054','Новсибирск','тест','','','','','2011-03-27 22:57:32','2011-03-27 22:57:32',1,0),
  (4,177,742,2,0,0,'Дом','','Никифорцев','Дмитрий','ул Машиностроителей 47Б кв.4','','650052','Юрга','домой','','','','','2011-03-29 01:06:12','2011-03-29 01:06:12',1,0),
  (5,177,724,2,0,0,'ккк','','Никифорцев','Дмитрий','ул Гусарова 30-138','','660130','г.Красноярск','','','','','','2011-03-29 01:09:26','2011-03-29 01:09:26',1,0),
  (6,177,770,3,0,0,'Мой адрес','','lhlkhj','kkjhkljh','fffffffffffffffffffffffffffffffffff','','650054','Томск','','','','','','2011-04-01 00:50:45','2011-04-01 00:50:45',1,0);
COMMIT;

#
# Data for the `ps_address_format` table  (LIMIT 0,500)
#

INSERT INTO `ps_address_format` (`id_country`, `format`) VALUES
  (177,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone');
COMMIT;

#
# Data for the `ps_alias` table  (LIMIT 0,500)
#

INSERT INTO `ps_alias` (`id_alias`, `alias`, `search`, `active`) VALUES
  (3,'ipdo','ipod',1),
  (4,'piod','ipod',1);
COMMIT;

#
# Data for the `ps_attribute` table  (LIMIT 0,500)
#

INSERT INTO `ps_attribute` (`id_attribute`, `id_attribute_group`, `color`) VALUES
  (1,1,NULL),
  (2,1,NULL),
  (3,2,'#D2D6D5'),
  (4,2,'#008CB7'),
  (5,2,'#F3349E'),
  (6,2,'#93D52D'),
  (7,2,'#FD9812'),
  (8,1,NULL),
  (9,1,NULL),
  (10,3,NULL),
  (11,3,NULL),
  (12,1,NULL),
  (13,1,NULL),
  (14,2,'#000000'),
  (15,1,''),
  (16,1,''),
  (17,1,''),
  (18,2,'#7800F0'),
  (19,2,'#F6EF04'),
  (20,2,'#F60409');
COMMIT;

#
# Data for the `ps_attribute_group` table  (LIMIT 0,500)
#

INSERT INTO `ps_attribute_group` (`id_attribute_group`, `is_color_group`) VALUES
  (1,0),
  (2,1),
  (3,0);
COMMIT;

#
# Data for the `ps_attribute_group_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_attribute_group_lang` (`id_attribute_group`, `id_lang`, `name`, `public_name`) VALUES
  (1,1,'Disk space','Disk space'),
  (1,6,'Disk space','Disk space'),
  (2,1,'Color','Color'),
  (2,6,'Color','Color'),
  (3,1,'ICU','Processor'),
  (3,6,'ICU','Processor');
COMMIT;

#
# Data for the `ps_attribute_impact` table  (LIMIT 0,500)
#

INSERT INTO `ps_attribute_impact` (`id_attribute_impact`, `id_product`, `id_attribute`, `weight`, `price`) VALUES
  (1,1,2,0,60.00),
  (2,1,5,0,0.00),
  (3,1,16,0,50.00),
  (4,1,15,0,0.00),
  (5,1,4,0,0.00),
  (6,1,19,0,0.00),
  (7,1,3,0,0.00),
  (8,1,14,0,0.00),
  (9,1,7,0,0.00),
  (10,1,20,0,0.00),
  (11,1,6,0,0.00),
  (12,1,18,0,0.00);
COMMIT;

#
# Data for the `ps_attribute_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_attribute_lang` (`id_attribute`, `id_lang`, `name`) VALUES
  (1,1,'2GB'),
  (1,6,'2GB'),
  (2,1,'4GB'),
  (2,6,'4GB'),
  (3,1,'Metal'),
  (3,6,'Metal'),
  (4,1,'Blue'),
  (4,6,'Blue'),
  (5,1,'Pink'),
  (5,6,'Pink'),
  (6,1,'Green'),
  (6,6,'Green'),
  (7,1,'Orange'),
  (7,6,'Orange'),
  (8,1,'Optional 64GB solid-state drive'),
  (8,6,'Optional 64GB solid-state drive'),
  (9,1,'80GB Parallel ATA Drive @ 4200 rpm'),
  (9,6,'80GB Parallel ATA Drive @ 4200 rpm'),
  (10,1,'1.60GHz Intel Core 2 Duo'),
  (10,6,'1.60GHz Intel Core 2 Duo'),
  (11,1,'1.80GHz Intel Core 2 Duo'),
  (11,6,'1.80GHz Intel Core 2 Duo'),
  (12,1,'80GB: 20,000 Songs'),
  (12,6,'80GB: 20,000 Songs'),
  (13,1,'160GB: 40,000 Songs'),
  (13,6,'160GB: 40,000 Songs'),
  (14,1,'Black'),
  (14,6,'Black'),
  (15,1,'8Go'),
  (15,6,'8Go'),
  (16,1,'16Go'),
  (16,6,'16Go'),
  (17,1,'32Go'),
  (17,6,'32Go'),
  (18,1,'Purple'),
  (18,6,'Purple'),
  (19,1,'Yellow'),
  (19,6,'Yellow'),
  (20,1,'Red'),
  (20,6,'Red');
COMMIT;

#
# Data for the `ps_carrier` table  (LIMIT 0,500)
#

INSERT INTO `ps_carrier` (`id_carrier`, `id_tax_rules_group`, `name`, `url`, `active`, `deleted`, `shipping_handling`, `range_behavior`, `is_module`, `is_free`, `shipping_external`, `need_range`, `external_module_name`, `shipping_method`) VALUES
  (1,0,'0',NULL,0,0,0,0,0,0,0,0,NULL,0),
  (2,1,'My carrier',NULL,0,0,1,0,0,0,0,0,NULL,0),
  (3,0,'Почта России','http://www.russianpost.ru/rp/servise/ru/home/postuslug/trackingpo',1,1,1,0,0,0,0,0,'',0),
  (4,0,'Почта России','http://www.russianpost.ru/rp/servise/ru/home/postuslug/trackingpo',1,1,1,0,0,0,0,0,'',0),
  (5,0,'Почта России','http://www.russianpost.ru/rp/servise/ru/home/postuslug/trackingpo',1,1,1,0,0,0,0,0,'',0),
  (6,0,'Почта России','http://www.russianpost.ru/rp/servise/ru/home/postuslug/trackingpo',1,1,1,0,0,0,0,0,'',0),
  (7,0,'Почта России','http://www.russianpost.ru/rp/servise/ru/home/postuslug/trackingpo',1,0,1,0,0,0,0,0,'',0);
COMMIT;

#
# Data for the `ps_carrier_group` table  (LIMIT 0,500)
#

INSERT INTO `ps_carrier_group` (`id_carrier`, `id_group`) VALUES
  (1,1),
  (2,1),
  (7,1);
COMMIT;

#
# Data for the `ps_carrier_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_carrier_lang` (`id_carrier`, `id_lang`, `delay`) VALUES
  (1,1,'Pick up in-store'),
  (2,1,'Delivery next day!'),
  (3,1,'7-14 дней'),
  (4,1,'7-14 дней'),
  (5,1,'7-14 дней'),
  (6,1,'7-14 дней'),
  (1,6,'Забрать в магазине'),
  (2,6,'Доставка на следующий день'),
  (3,6,'7-14 дней'),
  (4,6,'7-14 дней'),
  (5,6,'7-14 дней'),
  (6,6,'7-14 дней'),
  (7,6,'доставка 7-14 дней');
COMMIT;

#
# Data for the `ps_carrier_zone` table  (LIMIT 0,500)
#

INSERT INTO `ps_carrier_zone` (`id_carrier`, `id_zone`) VALUES
  (1,1),
  (2,1),
  (2,2),
  (5,1),
  (6,1),
  (6,2),
  (6,3),
  (6,4),
  (6,5),
  (6,6),
  (6,7),
  (6,8),
  (7,1),
  (7,2),
  (7,3),
  (7,4),
  (7,5),
  (7,6),
  (7,7),
  (7,8);
COMMIT;

#
# Data for the `ps_cart` table  (LIMIT 0,500)
#

INSERT INTO `ps_cart` (`id_cart`, `id_carrier`, `id_lang`, `id_address_delivery`, `id_address_invoice`, `id_currency`, `id_customer`, `id_guest`, `secure_key`, `recyclable`, `gift`, `gift_message`, `date_add`, `date_upd`) VALUES
  (1,2,2,6,6,1,1,1,'47ce86627c1f3c792a80773c5d2deaf8',1,0,NULL,'2011-03-19 20:04:49','2011-03-19 20:04:49'),
  (2,7,6,3,3,4,2,4,'1e07aa70516bf7d326a239a246ecf709',1,0,'','2011-03-22 17:16:30','2011-03-31 00:11:26'),
  (3,7,6,4,4,4,2,2,'1e07aa70516bf7d326a239a246ecf709',1,0,'','2011-03-23 23:22:57','2011-03-30 00:23:42'),
  (4,7,6,5,5,4,2,2,'1e07aa70516bf7d326a239a246ecf709',1,0,'','2011-03-30 00:49:10','2011-03-30 00:49:38'),
  (5,7,6,4,4,4,2,2,'1e07aa70516bf7d326a239a246ecf709',1,0,'','2011-03-30 23:17:11','2011-03-30 23:55:49'),
  (6,7,6,5,5,4,2,2,'1e07aa70516bf7d326a239a246ecf709',1,0,'','2011-03-30 23:53:59','2011-03-30 23:54:15'),
  (7,7,6,5,5,4,2,2,'1e07aa70516bf7d326a239a246ecf709',1,0,'','2011-03-31 00:19:48','2011-03-31 00:20:36'),
  (8,7,6,3,3,4,2,2,'1e07aa70516bf7d326a239a246ecf709',1,0,'','2011-04-01 00:18:51','2011-04-01 00:39:46'),
  (9,7,6,6,6,4,3,5,'7a001b1ec15bfbc9397319b84ea2df3b',1,0,'','2011-04-01 00:46:01','2011-04-01 00:51:17'),
  (10,7,6,3,3,4,2,2,'1e07aa70516bf7d326a239a246ecf709',1,0,'','2011-06-03 20:42:33','2011-06-03 20:42:43'),
  (11,7,6,3,3,4,2,2,'1e07aa70516bf7d326a239a246ecf709',1,0,'','2011-06-03 22:03:59','2011-06-03 23:41:15');
COMMIT;

#
# Data for the `ps_cart_product` table  (LIMIT 0,500)
#

INSERT INTO `ps_cart_product` (`id_cart`, `id_product`, `id_product_attribute`, `quantity`, `date_add`) VALUES
  (1,7,23,1,'2011-03-19 20:04:49'),
  (1,9,0,1,'2011-03-19 20:04:49'),
  (2,2,8,3,'2011-03-22 17:16:35'),
  (2,6,0,1,'2011-03-22 17:18:13'),
  (3,9,0,1,'2011-03-23 23:22:57'),
  (4,2,8,1,'2011-03-30 00:49:10'),
  (4,1,31,1,'2011-03-30 00:49:14'),
  (5,1,31,2,'2011-03-30 23:17:11'),
  (5,7,19,1,'2011-03-30 23:18:36'),
  (6,1,31,1,'2011-03-30 23:53:59'),
  (6,2,8,1,'2011-03-30 23:54:01'),
  (7,1,31,1,'2011-03-31 00:19:48'),
  (7,2,8,1,'2011-03-31 00:19:52'),
  (8,1,31,1,'2011-04-01 00:18:51'),
  (8,2,8,1,'2011-04-01 00:18:54'),
  (9,1,31,1,'2011-04-01 00:46:01'),
  (9,7,19,1,'2011-04-01 00:46:04'),
  (10,1,31,1,'2011-06-03 20:42:34'),
  (10,2,8,1,'2011-06-03 20:42:36'),
  (10,7,19,1,'2011-06-03 20:42:38'),
  (11,5,13,1,'2011-06-03 22:03:59'),
  (11,8,0,1,'2011-06-03 22:04:26');
COMMIT;

#
# Data for the `ps_category` table  (LIMIT 0,500)
#

INSERT INTO `ps_category` (`id_category`, `id_parent`, `level_depth`, `nleft`, `nright`, `active`, `date_add`, `date_upd`, `position`) VALUES
  (1,0,0,1,8,1,'2011-03-19 20:04:46','2011-03-19 20:04:46',0),
  (2,1,1,2,3,1,'2011-03-19 20:04:50','2011-03-19 20:04:50',0),
  (3,1,1,3,4,1,'2011-03-19 20:04:50','2011-03-19 20:04:50',1),
  (4,1,1,4,5,1,'2011-03-19 20:04:50','2011-03-19 20:04:50',2);
COMMIT;

#
# Data for the `ps_category_group` table  (LIMIT 0,500)
#

INSERT INTO `ps_category_group` (`id_category`, `id_group`) VALUES
  (1,1),
  (2,1),
  (3,1),
  (4,1);
COMMIT;

#
# Data for the `ps_category_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_category_lang` (`id_category`, `id_lang`, `name`, `description`, `link_rewrite`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
  (1,1,'Home','','home',NULL,NULL,NULL),
  (1,6,'Home','','home',NULL,NULL,NULL),
  (2,1,'iPods','Now that you can buy movies from the iTunes Store and sync them to your iPod, the whole world is your theater.','music-ipods','','',''),
  (2,6,'iPods','Now that you can buy movies from the iTunes Store and sync them to your iPod, the whole world is your theater.','music-ipods','','',''),
  (3,1,'Accessories','Wonderful accessories for your iPod','accessories-ipod','','',''),
  (3,6,'Accessories','Wonderful accessories for your iPod','accessories-ipod','','',''),
  (4,1,'Laptops','The latest Intel processor, a bigger hard drive, plenty of memory, and even more new features all fit inside just one liberating inch. The new Mac laptops have the performance, power, and connectivity of a desktop computer. Without the desk part.','laptops','Apple laptops','Apple laptops MacBook Air','Powerful and chic Apple laptops'),
  (4,6,'Laptops','The latest Intel processor, a bigger hard drive, plenty of memory, and even more new features all fit inside just one liberating inch. The new Mac laptops have the performance, power, and connectivity of a desktop computer. Without the desk part.','laptops','Apple laptops','Apple laptops MacBook Air','Powerful and chic Apple laptops');
COMMIT;

#
# Data for the `ps_category_product` table  (LIMIT 0,500)
#

INSERT INTO `ps_category_product` (`id_category`, `id_product`, `position`) VALUES
  (1,1,0),
  (1,2,1),
  (1,6,2),
  (1,7,3),
  (2,1,0),
  (2,2,1),
  (2,7,2),
  (3,8,0),
  (3,9,1),
  (4,5,0),
  (4,6,1);
COMMIT;

#
# Data for the `ps_cms` table  (LIMIT 0,500)
#

INSERT INTO `ps_cms` (`id_cms`, `id_cms_category`, `position`, `active`) VALUES
  (1,1,0,1),
  (2,1,1,1),
  (3,1,2,1),
  (4,1,3,0),
  (5,1,4,0);
COMMIT;

#
# Data for the `ps_cms_block` table  (LIMIT 0,500)
#

INSERT INTO `ps_cms_block` (`id_cms_block`, `id_cms_category`, `name`, `location`, `position`, `display_store`) VALUES
  (1,1,'',0,0,1),
  (2,1,'',0,1,0);
COMMIT;

#
# Data for the `ps_cms_block_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_cms_block_lang` (`id_cms_block`, `id_lang`, `name`) VALUES
  (1,1,'Information'),
  (2,1,''),
  (2,6,'Информация');
COMMIT;

#
# Data for the `ps_cms_block_page` table  (LIMIT 0,500)
#

INSERT INTO `ps_cms_block_page` (`id_cms_block_page`, `id_cms_block`, `id_cms`, `is_category`) VALUES
  (1,1,1,0),
  (2,1,2,0),
  (3,1,3,0),
  (4,1,4,0),
  (5,1,5,0),
  (10,2,1,0),
  (11,2,2,0),
  (12,2,3,0);
COMMIT;

#
# Data for the `ps_cms_category` table  (LIMIT 0,500)
#

INSERT INTO `ps_cms_category` (`id_cms_category`, `id_parent`, `level_depth`, `active`, `date_add`, `date_upd`, `position`) VALUES
  (1,0,0,1,'2011-03-19 20:04:47','2011-03-19 20:04:47',0),
  (2,1,1,1,'2011-03-20 14:15:51','2011-03-20 14:15:51',0);
COMMIT;

#
# Data for the `ps_cms_category_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_cms_category_lang` (`id_cms_category`, `id_lang`, `name`, `description`, `link_rewrite`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
  (1,1,'Home','','home',NULL,NULL,NULL),
  (1,6,'Home','','home',NULL,NULL,NULL),
  (2,1,'Статьи','','articles','','',''),
  (2,6,'Статьи','Статьи посвященные ловли рыбы нахлыстом и вязанию нахлыстовых мушек.','articles','Статьи о нахлысте','','Статьи посвященные ловли рыбы нахлыстом и вязанию нахлыстовых мушек.');
COMMIT;

#
# Data for the `ps_cms_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_cms_lang` (`id_cms`, `id_lang`, `meta_title`, `meta_description`, `meta_keywords`, `content`, `link_rewrite`) VALUES
  (1,1,'Delivery','Our terms and conditions of delivery','conditions, delivery, delay, shipment, pack','<h2>Shipments and returns</h2>\r\n<h3>Your pack shipment</h3>\r\n<p>Packages are generally dispatched within 2 days after receipt of payment and are shipped via UPS with tracking and drop-off without signature. If you prefer delivery by UPS Extra with required signature, an additional cost will be applied, so please contact us before choosing this method. Whichever shipment choice you make, we will provide you with a link to track your package online.</p>\r\n<p>Shipping fees include handling and packing fees as well as postage costs. Handling fees are fixed, whereas transport fees vary according to total weight of the shipment. We advise you to group your items in one order. We cannot group two distinct orders placed separately, and shipping fees will apply to each of them. Your package will be dispatched at your own risk, but special care is taken to protect fragile objects.<br /><br />Boxes are amply sized and your items are well-protected.</p>','delivery'),
  (1,6,'Доставка','Наши сроки и условия доставки','условия, доставка','<h2>Доставка</h2>\r\n<p>Доставка заказов нашим клиентам производится несколькими способами,   выбор одного из этих способов осуществляется заказчиком при оформлении   заказа.</p>\r\n<p>Виды способов доставки:</p>\r\n<h5>Обычная почта:</h5>\r\n<ul>\r\nЭто самый экономичный способ доставки. Для европейской части России, Урала и Западной Сибири – это оптимальный выбор.\r\n<li>Доставка осуществляется примерно в течение 7-14 дней. </li>\r\n<li>Стоимость почтовой доставки может изменяться от места назначения,  веса и  объёма заказа. В среднем она состовляет 200 руб. Доставка АВИА стоит в 1.8-2 раза   больше наземной и в ряд городов не осуществляется. Отправка   негабаритного груза (удилищ, тубусов) требует специальной упаковки и   обходится дороже. Оценочную стоимость посылки можно ставить 1/2 суммы   заказа. </li>\r\n</ul>\r\n<h5>Курьерская доставка по регионам:</h5>\r\n<ul>\r\nЭто самый дорогостоящий, но самый быстрый способ доставки.  Обычно он  применяется для срочной доставки негабаритного и  дорогостоящего заказа.  Как правило – это удилища. Стоимость такой  доставки от 400 до 2000  руб.\r\n<li>Доставка курьерской службой осуществляется в течение 3-5 дней.</li>\r\n</ul>\r\n<h5>Альтернативный способ доставки:</h5>\r\n<ul>\r\n<li>Возможны варианты, которые следует обсудить по e-mail: shop@muhovyaz.ru</li>\r\n</ul>','delivery'),
  (2,1,'Legal Notice','Legal notice','notice, legal, credits','<h2>Legal</h2>\r\n<h3>Credits</h3>\r\n<p>Concept and production:</p>\r\n<p>This Web site was created using <a href=\"http://www.prestashop.com\">PrestaShop</a>™ open-source software.</p>','legal-notice'),
  (2,6,'Соглашение','Соглашение','уведомления, документы, соглашение','<h2>Соглашение о пользовании услугами Интернет магазина Muhovyaz.ru</h2>\r\n<p> </p>\r\n<p style=\"text-align: justify;\">Настоящее  соглашение, далее  \"Соглашение\", заключается между Интернет-магазином  Muhovyaz.ru,  имеющим адрес в сети Интернет http://muhovyaz.ru, далее   \"Интернет-магазин\" или \"Сайт\", и пользователем услуг Интернет-магазина,   далее \"Покупатель\", и определяет условия приобретения товаров через   Сайт.</p>\r\n<h3 style=\"text-align: justify;\"><br />1.Основные положения</h3>\r\n<p style=\"text-align: justify;\">1.1.  Настоящее Соглашение заключается  между Покупателем и Интернет-магазином  в момент оформления заказа.  Покупатель подтверждает свое согласие с  условиями, установленными  настоящим Соглашением.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">1.2.  Настоящие Соглашение, а также  информация о товаре, представленная на  Сайте, являются публичной офертой  в соответствии со ст.435 и ч.2 ст.437  ГК РФ.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">1.3. К  отношениям между Покупателем и  Интернет-магазином применяются положения  ГК РФ о розничной купле-продаже  (§ 2 глава 30), а также Закон РФ \"О  защите прав потребителей\" от  07.02.1992 № 2300-1 и иные правовые акты,  принятые в соответствии с  ними.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">1.4.  Покупателем может быть любое  физическое или юридическое лицо, способное  принять и оплатить заказанный  им товар в порядке и на условиях,  установленныx настоящим Соглашением,  на территории Российской  Федерации.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">1.5. Интернет-магазин оставляет за собой право вносить изменения в настоящее Соглашение.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">1.6.  Настоящее Соглашение должно  рассматриваться в том виде, как оно  опубликовано на Сайте, и должно  применяться и толковаться в  соответствии с законодательством Российской  Федерации.</p>\r\n<h3 style=\"text-align: justify;\"><br />2. Информация о товаре</h3>\r\n<p style=\"text-align: justify;\">2.1. Товар представлен на Сайте через фото-образцы, являющиеся собственностью Интернет-магазина.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">2.2. Товар может отличатся от фото-образцов, но  обязательно будет соответствовать характеристикам выбранной позиции.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">2.3. Каждый фото-образец сопровождается текстовой информацией: ценой и описанием товара.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">2.4. По  просьбе Покупателя менеджер  Интернет-магазина может предоставить (по  телефону или посредством  электронной почты) прочую информацию,  необходимую и достаточную, с точки  зрения Покупателя, для принятия им  решения о покупке товара.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">2.5.  Указанная на Сайте цена товара  может быть изменена Интернет-магазином в  одностороннем порядке, но не  после того, когда заказ уже сделан  Покупателем.</p>\r\n<h3 style=\"text-align: justify;\"><br />3. Порядок приобретения товара</h3>\r\n<p style=\"text-align: justify;\">3.1.  Покупатель вправе оформить заказ на  любой товар, представленный на  Сайте. Каждый товар может быть заказан в  любом количестве. Заказ может  быть оформлен Покупателем следующими  способами: сделан по телефону или  оформлен самостоятельно на Сайте.  Подробности оформления заказа через  Сайт описаны в разделе \"Доставка\".</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">3.2.  После оформления заказа на e-mail  Покупателя отправляется счет,  подтверждающий принятие заказа, с  указанием наименований выбранных  товаров и общей суммы заказа,  являющийся неотъемлемой частью настоящего  Соглашения. Далее менеджер  Интернет-магазина связывается с Покупателем  (по телефону или посредством  электронной почты) для получения  подтверждения заказа.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">3.3.  При отсутствии товара на складе  менеджер Интернет-магазина обязан  поставить в известность об этом  Покупателя (по телефону или посредством  электронной почты).</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">3.4.  Покупатель вправе сделать  предварительный заказ на временно  отсутствующий на складе товар путем  внесения предоплаты в порядке,  оговоренном с менеджером  Интернет-магазина. При предоплате товара заказ  обрабатывается только  после внесения предоплаты.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">3.5. При отсутствии товара Покупатель вправе заменить его другим товаром либо аннулировать заказ.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">3.6.  Покупатель вправе отказаться от  заказанного товара в любое время до его  отправки Покупателю,  заблаговременно поставив в известность об этом  Интернет-магазин (по  телефону или посредством электронной почты).</p>\r\n<h3 style=\"text-align: justify;\"><br />4. Доставка и приемка-передача товара</h3>\r\n<p style=\"text-align: justify;\">4.1.  Доставка товара, заказанного в  Интернет-магазине, в согласованном  количестве и ассортименте,  осуществляется службой доставки в люые  регионы Российской Федерации.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">4.2.  Возможность доставки товара в отдаленные регионы имеющие ограниченную  доступность (сроки, стоимость и т.п.) оговаривается отдельно в каждом  случае.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">4.3. Расходы по доставке товара указанны  в счете выставленным при оформлении заказа, кроме случаев указанных в п.4.2.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">4.4. Отправка и доставка заказанного товара производится в оговоренные с Покупателем сроки.</p>\r\n<h3 style=\"text-align: justify;\"><br />5. Оплата товара</h3>\r\n<p style=\"text-align: justify;\">5.1.  Способы оплаты товара указаны на  Сайте в разделе \"Оплата\". Порядок и  условия оплаты заказанного товара  оговариваются Покупателем с  менеджером Интернет-магазина.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">5.2.  При безналичном расчете Покупатель  вносит стопроцентную предоплату  товара путем перечисления денег на  расчетный счет Интернет-магазина.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">5.3.  При получении товара посылкой с наложенны платяжом Покупатель вносит  оплату при получении посылки в кассу компании осуществившей доставку, а  так же процент взымаемый службой доставки за перевод денег на счет  Интернет-магазина.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">5.4. Товар оплачивается только в рублях.</p>\r\n<h3 style=\"text-align: justify;\"><br />6. Возврат товара</h3>\r\n<p style=\"text-align: justify;\">6.1.  Покупатель вправе отказаться от  товара после его получения в течение  семи дней. Возврат товара  надлежащего качества возможен в случае, если  сохранены его товарный вид,  потребительские свойства, а также документ,  подтверждающий факт и  условия покупки указанного товара.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">6.2.  Покупатель не вправе отказаться от  товара надлежащего качества,  имеющего индивидуально-определенные  свойства, если указанный товар  может быть использован исключительно  приобретающим его Покупателем.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<p style=\"text-align: justify;\">6.3.  При отказе Покупателя от товара  Интернет-магазин возвращает ему  денежную сумму, уплаченную за товар, за  вычетом суммы расходов  Интернет-магазина, связанных с доставкой товара  Покупателю и вывозом  товара от Покупателя, не позднее, чем через десять  дней со дня  предъявления Покупателем соответствующего требования.</p>\r\n<h3 style=\"text-align: justify;\"><br />7. Прочее</h3>\r\n<p style=\"text-align: justify;\">7.1.  Интернет-магазин оставляет за собой  право расширять и сокращать  товарное предложение на Сайте, регулировать  доступ к покупке любых  товаров, а также приостанавливать или прекращать  продажу любых товаров  по своему собственному усмотрению.</p>','notice'),
  (3,1,'Terms and conditions of use','Our terms and conditions of use','conditions, terms, use, sell','<h2>Your terms and conditions of use</h2>\r\n<h3>Rule 1</h3>\r\n<p>Here is the rule 1 content</p>\r\n<h3>Rule 2</h3>\r\n<p>Here is the rule 2 content</p>\r\n<h3>Rule 3</h3>\r\n<p>Here is the rule 3 content</p>','terms-and-conditions-of-use'),
  (3,6,'О магазине','Нахлыстовый интернет-магазин \"Муховяз\"','информация','<h2>О магазине</h2>\r\n<p><strong>Добро пожаловать в интернет-магазин нахлыстовых товаров «Муховяз».</strong></p>\r\n<p>У нас Вы можете купить нахлыстовые мушки и материалы для вязания мушек.<br />Теперь все самое необходимое для рыбалки нахлыстом можно купить не выходя из дома.<br />Если у Вас возникли какие-то вопросы, по работе магазина или товару, пишите на адрес <a href=\"mailto:shop@muhovyaz.ru\" target=\"_blank\">shop@muhovyaz.ru</a></p>','about'),
  (4,1,'About us','Learn more about us','about us, informations','<h2>About us</h2>\r\n<h3>Our company</h3>\r\n<p>Our company</p>\r\n<h3>Our team</h3>\r\n<p>Our team</p>\r\n<h3>Informations</h3>\r\n<p>Informations</p>','about-us'),
  (4,6,'About us','Learn more about us','about us, informations','<h2>About us</h2>\r\n<h3>Our company</h3>\r\n<p>Our company</p>\r\n<h3>Our team</h3>\r\n<p>Our team</p>\r\n<h3>Informations</h3>\r\n<p>Informations</p>','about-us'),
  (5,1,'Secure payment','Our secure payment mean','secure payment, ssl, visa, mastercard, paypal','<h2>Secure payment</h2>\r\n<h3>Our secure payment</h3><p>With SSL</p>\r\n<h3>Using Visa/Mastercard/Paypal</h3><p>About this services</p>','secure-payment'),
  (5,6,'Secure payment','Our secure payment mean','secure payment, ssl, visa, mastercard, paypal','<h2>Secure payment</h2>\r\n<h3>Our secure payment</h3><p>With SSL</p>\r\n<h3>Using Visa/Mastercard/Paypal</h3><p>About this services</p>','secure-payment');
COMMIT;

#
# Data for the `ps_configuration` table  (LIMIT 0,500)
#

INSERT INTO `ps_configuration` (`id_configuration`, `name`, `value`, `date_add`, `date_upd`) VALUES
  (1,'PS_LANG_DEFAULT','6','2011-03-19 20:04:46','2011-03-20 12:54:55'),
  (2,'PS_CURRENCY_DEFAULT','4','2011-03-19 20:04:46','2011-03-19 21:09:54'),
  (3,'PS_COUNTRY_DEFAULT','177','2011-03-19 20:04:46','2011-03-22 00:38:23'),
  (4,'PS_REWRITING_SETTINGS','0','2011-03-19 20:04:46','2011-05-31 14:07:50'),
  (5,'PS_ORDER_OUT_OF_STOCK','0','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (6,'PS_LAST_QTIES','0','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (7,'PS_CART_REDIRECT','1','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (8,'PS_HELPBOX','1','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (9,'PS_CONDITIONS','0','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (10,'PS_RECYCLABLE_PACK','0','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (11,'PS_GIFT_WRAPPING','0','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (12,'PS_GIFT_WRAPPING_PRICE','0','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (13,'PS_STOCK_MANAGEMENT','1','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (14,'PS_NAVIGATION_PIPE','>','2011-03-19 20:04:46','2011-03-20 11:58:19'),
  (15,'PS_PRODUCTS_PER_PAGE','10','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (16,'PS_PURCHASE_MINIMUM','0','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (17,'PS_PRODUCTS_ORDER_WAY','0','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (18,'PS_PRODUCTS_ORDER_BY','4','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (19,'PS_DISPLAY_QTIES','0','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (20,'PS_SHIPPING_HANDLING','0','2011-03-19 20:04:46','2011-03-22 17:23:11'),
  (21,'PS_SHIPPING_FREE_PRICE','0','2011-03-19 20:04:46','2011-03-22 17:23:11'),
  (22,'PS_SHIPPING_FREE_WEIGHT','0','2011-03-19 20:04:46','2011-03-22 17:23:11'),
  (23,'PS_SHIPPING_METHOD','0','2011-03-19 20:04:46','2011-03-22 17:23:11'),
  (24,'PS_TAX','0','2011-03-19 20:04:46','2011-03-22 17:14:01'),
  (25,'PS_SHOP_ENABLE','1','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (26,'PS_NB_DAYS_NEW_PRODUCT','20','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (27,'PS_SSL_ENABLED','0','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (28,'PS_WEIGHT_UNIT','кг','2011-03-19 20:04:46','2011-03-19 21:09:45'),
  (29,'PS_BLOCK_CART_AJAX','1','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (30,'PS_ORDER_RETURN','0','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (31,'PS_ORDER_RETURN_NB_DAYS','7','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (32,'PS_MAIL_TYPE','3','2011-03-19 20:04:46','2011-03-20 23:00:19'),
  (33,'PS_PRODUCT_PICTURE_MAX_SIZE','131072','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (34,'PS_PRODUCT_PICTURE_WIDTH','64','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (35,'PS_PRODUCT_PICTURE_HEIGHT','64','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (36,'PS_INVOICE_PREFIX','IN','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (37,'PS_INVOICE_NUMBER','1','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (38,'PS_DELIVERY_PREFIX','DE','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (39,'PS_DELIVERY_NUMBER','5','2011-03-19 20:04:46','2011-06-03 23:58:43'),
  (40,'PS_INVOICE','1','2011-03-19 20:04:46','2011-03-22 00:50:06'),
  (41,'PS_PASSWD_TIME_BACK','360','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (42,'PS_PASSWD_TIME_FRONT','360','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (43,'PS_DISP_UNAVAILABLE_ATTR','1','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (44,'PS_VOUCHERS','0','2011-03-19 20:04:46','2011-03-22 00:47:08'),
  (45,'PS_SEARCH_MINWORDLEN','3','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (46,'PS_SEARCH_BLACKLIST','','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (47,'PS_SEARCH_WEIGHT_PNAME','6','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (48,'PS_SEARCH_WEIGHT_REF','10','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (49,'PS_SEARCH_WEIGHT_SHORTDESC','1','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (50,'PS_SEARCH_WEIGHT_DESC','1','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (51,'PS_SEARCH_WEIGHT_CNAME','3','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (52,'PS_SEARCH_WEIGHT_MNAME','3','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (53,'PS_SEARCH_WEIGHT_TAG','4','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (54,'PS_SEARCH_WEIGHT_ATTRIBUTE','2','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (55,'PS_SEARCH_WEIGHT_FEATURE','2','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (56,'PS_SEARCH_AJAX','1','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (57,'PS_TIMEZONE','Asia/Novosibirsk','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (58,'PS_THEME_V11','0','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (59,'PRESTASTORE_LIVE','1','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (60,'PS_TIN_ACTIVE','0','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (61,'PS_SHOW_ALL_MODULES','0','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (62,'PS_BACKUP_ALL','1','2011-03-19 20:04:46','2011-03-20 21:59:29'),
  (63,'PS_1_3_UPDATE_DATE','2011-03-19 20:04:46','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (64,'PS_PRICE_ROUND_MODE','2','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (65,'PS_1_3_2_UPDATE_DATE','2011-03-19 20:04:46','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (66,'PS_CONDITIONS_CMS_ID','0','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (67,'TRACKING_DIRECT_TRAFFIC','0','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (68,'PS_META_KEYWORDS','0','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (69,'PS_DISPLAY_JQZOOM','0','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (70,'PS_VOLUME_UNIT','л','2011-03-19 20:04:46','2011-03-19 21:09:45'),
  (71,'PS_CIPHER_ALGORITHM','1','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (72,'PS_ATTRIBUTE_CATEGORY_DISPLAY','1','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (73,'PS_CUSTOMER_SERVICE_FILE_UPLOAD','0','2011-03-19 20:04:46','2011-03-21 00:15:11'),
  (74,'PS_CUSTOMER_SERVICE_SIGNATURE','','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (75,'PS_BLOCK_BESTSELLERS_DISPLAY','0','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (76,'PS_BLOCK_NEWPRODUCTS_DISPLAY','0','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (77,'PS_BLOCK_SPECIALS_DISPLAY','0','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (78,'PS_STOCK_MVT_REASON_DEFAULT','3','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (79,'PS_COMPARATOR_MAX_ITEM','3','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (80,'PS_ORDER_PROCESS_TYPE','1','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (81,'PS_SPECIFIC_PRICE_PRIORITIES','id_shop;id_currency;id_country;id_group','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (82,'PS_TAX_DISPLAY','0','2011-03-19 20:04:46','2011-03-22 17:14:01'),
  (83,'PS_SMARTY_FORCE_COMPILE','1','2011-03-19 20:04:46','2011-05-31 14:05:16'),
  (84,'PS_DISTANCE_UNIT','км','2011-03-19 20:04:46','2011-03-19 21:09:45'),
  (85,'PS_STORES_DISPLAY_CMS','1','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (86,'PS_STORES_DISPLAY_FOOTER','0','2011-03-19 20:04:46','2011-03-20 23:37:02'),
  (87,'PS_STORES_SIMPLIFIED','0','2011-03-19 20:04:46','2011-03-20 23:37:02'),
  (88,'SHOP_LOGO_WIDTH','298','2011-03-19 20:04:46','2011-05-31 14:07:03'),
  (89,'SHOP_LOGO_HEIGHT','75','2011-03-19 20:04:46','2011-05-31 14:07:03'),
  (90,'EDITORIAL_IMAGE_WIDTH','545','2011-03-19 20:04:46','2011-03-20 23:23:38'),
  (91,'EDITORIAL_IMAGE_HEIGHT','150','2011-03-19 20:04:46','2011-03-20 23:23:38'),
  (92,'PS_STATSDATA_CUSTOMER_PAGESVIEWS','0','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (93,'PS_STATSDATA_PAGESVIEWS','0','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (94,'PS_STATSDATA_PLUGINS','0','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (95,'PS_GEOLOCATION_ENABLED','0','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (96,'PS_ALLOWED_COUNTRIES','AF;ZA;AX;AL;DZ;DE;AD;AO;AI;AQ;AG;AN;SA;AR;AM;AW;AU;AT;AZ;BS;BH;BD;BB;BY;BE;BZ;BJ;BM;BT;BO;BA;BW;BV;BR;BN;BG;BF;MM;BI;KY;KH;CM;CA;CV;CF;CL;CN;CX;CY;CC;CO;KM;CG;CD;CK;KR;KP;CR;CI;HR;CU;DK;DJ;DM;EG;IE;SV;AE;EC;ER;ES;EE;ET;FK;FO;FJ;FI;FR;GA;GM;GE;GS;GH;GI;GR;GD;GL;GP;GU;GT;GG;GN;GQ;GW;GY;GF;HT;HM;HN;HK;HU;IM;MU;VG;VI;IN;ID;IR;IQ;IS;IL;IT;JM;JP;JE;JO;KZ;KE;KG;KI;KW;LA;LS;LV;LB;LR;LY;LI;LT;LU;MO;MK;MG;MY;MW;MV;ML;MT;MP;MA;MH;MQ;MR;YT;MX;FM;MD;MC;MN;ME;MS;MZ;NA;NR;NP;NI;NE;NG;NU;NF;NO;NC;NZ;IO;OM;UG;UZ;PK;PW;PS;PA;PG;PY;NL;PE;PH;PN;PL;PF;PR;PT;QA;DO;CZ;RE;RO;GB;RU;RW;EH;BL;KN;SM;MF;PM;VA;VC;LC;SB;WS;AS;ST;SN;RS;SC;SL;SG;SK;SI;SO;SD;LK;SE;CH;SR;SJ;SZ;SY;TJ;TW;TZ;TD;TF;TH;TL;TG;TK;TO;TT;TN;TM;TC;TR;TV;UA;UY;US;VU;VE;VN;WF;YE;ZM;ZW','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (97,'PS_GEOLOCATION_BEHAVIOR','0','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (98,'PS_LOCALE_LANGUAGE','ru','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (99,'PS_LOCALE_COUNTRY','RU','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (100,'PS_ATTACHMENT_MAXIMUM_SIZE','2','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (101,'PS_SMARTY_CACHE','0','2011-03-19 20:04:46','2011-05-31 14:05:16'),
  (102,'PS_DIMENSION_UNIT','см','2011-03-19 20:04:46','2011-03-19 21:09:45'),
  (103,'PS_FORCE_SMARTY_2','0','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (104,'PS_GUEST_CHECKOUT_ENABLED','1','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (105,'PS_DISPLAY_SUPPLIERS','0','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (106,'PS_CATALOG_MODE','0','2011-03-19 20:04:46','2011-03-20 23:00:00'),
  (107,'PS_GEOLOCATION_WHITELIST','209.185.108;209.185.253;209.85.238;209.85.238.11;209.85.238.4;216.239.33.96;216.239.33.97;216.239.33.98;216.239.33.99;216.239.37.98;216.239.37.99;216.239.39.98;216.239.39.99;216.239.41.96;216.239.41.97;216.239.41.98;216.239.41.99;216.239.45.4;216.239.46;216.239.51.96;216.239.51.97;216.239.51.98;216.239.51.99;216.239.53.98;216.239.53.99;216.239.57.96;216.239.57.97;216.239.57.98;216.239.57.99;216.239.59.98;216.239.59.99;216.33.229.163;64.233.173.193;64.233.173.194;64.233.173.195;64.233.173.196;64.233.173.197;64.233.173.198;64.233.173.199;64.233.173.200;64.233.173.201;64.233.173.202;64.233.173.203;64.233.173.204;64.233.173.205;64.233.173.206;64.233.173.207;64.233.173.208;64.233.173.209;64.233.173.210;64.233.173.211;64.233.173.212;64.233.173.213;64.233.173.214;64.233.173.215;64.233.173.216;64.233.173.217;64.233.173.218;64.233.173.219;64.233.173.220;64.233.173.221;64.233.173.222;64.233.173.223;64.233.173.224;64.233.173.225;64.233.173.226;64.233.173.227;64.233.173.228;64.233.173.229;64.233.173.230;64.233.173.231;64.233.173.232;64.233.173.233;64.233.173.234;64.233.173.235;64.233.173.236;64.233.173.237;64.233.173.238;64.233.173.239;64.233.173.240;64.233.173.241;64.233.173.242;64.233.173.243;64.233.173.244;64.233.173.245;64.233.173.246;64.233.173.247;64.233.173.248;64.233.173.249;64.233.173.250;64.233.173.251;64.233.173.252;64.233.173.253;64.233.173.254;64.233.173.255;64.68.80;64.68.81;64.68.82;64.68.83;64.68.84;64.68.85;64.68.86;64.68.87;64.68.88;64.68.89;64.68.90.1;64.68.90.10;64.68.90.11;64.68.90.12;64.68.90.129;64.68.90.13;64.68.90.130;64.68.90.131;64.68.90.132;64.68.90.133;64.68.90.134;64.68.90.135;64.68.90.136;64.68.90.137;64.68.90.138;64.68.90.139;64.68.90.14;64.68.90.140;64.68.90.141;64.68.90.142;64.68.90.143;64.68.90.144;64.68.90.145;64.68.90.146;64.68.90.147;64.68.90.148;64.68.90.149;64.68.90.15;64.68.90.150;64.68.90.151;64.68.90.152;64.68.90.153;64.68.90.154;64.68.90.155;64.68.90.156;64.68.90.157;64.68.90.158;64.68.90.159;64.68.90.16;64.68.90.160;64.68.90.161;64.68.90.162;64.68.90.163;64.68.90.164;64.68.90.165;64.68.90.166;64.68.90.167;64.68.90.168;64.68.90.169;64.68.90.17;64.68.90.170;64.68.90.171;64.68.90.172;64.68.90.173;64.68.90.174;64.68.90.175;64.68.90.176;64.68.90.177;64.68.90.178;64.68.90.179;64.68.90.18;64.68.90.180;64.68.90.181;64.68.90.182;64.68.90.183;64.68.90.184;64.68.90.185;64.68.90.186;64.68.90.187;64.68.90.188;64.68.90.189;64.68.90.19;64.68.90.190;64.68.90.191;64.68.90.192;64.68.90.193;64.68.90.194;64.68.90.195;64.68.90.196;64.68.90.197;64.68.90.198;64.68.90.199;64.68.90.2;64.68.90.20;64.68.90.200;64.68.90.201;64.68.90.202;64.68.90.203;64.68.90.204;64.68.90.205;64.68.90.206;64.68.90.207;64.68.90.208;64.68.90.21;64.68.90.22;64.68.90.23;64.68.90.24;64.68.90.25;64.68.90.26;64.68.90.27;64.68.90.28;64.68.90.29;64.68.90.3;64.68.90.30;64.68.90.31;64.68.90.32;64.68.90.33;64.68.90.34;64.68.90.35;64.68.90.36;64.68.90.37;64.68.90.38;64.68.90.39;64.68.90.4;64.68.90.40;64.68.90.41;64.68.90.42;64.68.90.43;64.68.90.44;64.68.90.45;64.68.90.46;64.68.90.47;64.68.90.48;64.68.90.49;64.68.90.5;64.68.90.50;64.68.90.51;64.68.90.52;64.68.90.53;64.68.90.54;64.68.90.55;64.68.90.56;64.68.90.57;64.68.90.58;64.68.90.59;64.68.90.6;64.68.90.60;64.68.90.61;64.68.90.62;64.68.90.63;64.68.90.64;64.68.90.65;64.68.90.66;64.68.90.67;64.68.90.68;64.68.90.69;64.68.90.7;64.68.90.70;64.68.90.71;64.68.90.72;64.68.90.73;64.68.90.74;64.68.90.75;64.68.90.76;64.68.90.77;64.68.90.78;64.68.90.79;64.68.90.8;64.68.90.80;64.68.90.9;64.68.91;64.68.92;66.249.64;66.249.65;66.249.66;66.249.67;66.249.68;66.249.69;66.249.70;66.249.71;66.249.72;66.249.73;66.249.78;66.249.79;72.14.199;8.6.48','2011-03-19 20:04:46','2011-03-19 20:04:46'),
  (108,'PS_LOGS_BY_EMAIL','3','2011-03-19 20:04:46','2011-03-20 13:23:59'),
  (109,'PS_COOKIE_CHECKIP','1','2011-03-19 20:04:46','2011-03-21 00:59:30'),
  (110,'PS_STORES_CENTER_LAT','25.948969','2011-03-19 20:04:46','2011-03-20 23:37:02'),
  (111,'PS_STORES_CENTER_LONG','-80.226439','2011-03-19 20:04:46','2011-03-20 23:37:02'),
  (112,'PS_HOMEPAGE_PHP_SELF','index.php','2011-03-19 20:04:46','2011-05-31 14:07:50'),
  (113,'PS_USE_ECOTAX','0','2011-03-19 20:04:46','2011-03-22 17:14:01'),
  (114,'PS_CANONICAL_REDIRECT','1','2011-03-19 20:04:46','2011-05-31 14:07:50'),
  (115,'PS_CARRIER_DEFAULT','7','2011-03-19 20:04:47','2011-03-26 00:51:46'),
  (116,'PS_TAX_ADDRESS_TYPE','id_address_delivery','2011-03-19 20:04:47','2011-03-22 17:14:01'),
  (117,'MB_PAY_TO_EMAIL','testmerchant@moneybookers.com','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (118,'MB_SECRET_WORD','mbtest','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (119,'MB_HIDE_LOGIN','1','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (120,'MB_ID_LOGO','1','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (121,'MB_ID_LOGO_WALLET','1','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (122,'MB_PARAMETERS','1','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (123,'MB_PARAMETERS_2','1','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (124,'MB_DISPLAY_MODE','0','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (125,'MB_CANCEL_URL','http://www.yoursite.com','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (126,'MB_LOCAL_METHODS','2','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (127,'MB_INTER_METHODS','5','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (128,'BANK_WIRE_CURRENCIES','2,1','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (129,'CHEQUE_CURRENCIES','2,1','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (130,'PRODUCTS_VIEWED_NBR','2','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (131,'BLOCK_CATEG_DHTML','1','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (132,'BLOCK_CATEG_MAX_DEPTH','3','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (133,'MANUFACTURER_DISPLAY_FORM','0','2011-03-19 20:04:48','2011-03-20 22:51:26'),
  (134,'MANUFACTURER_DISPLAY_TEXT','1','2011-03-19 20:04:48','2011-03-20 22:51:26'),
  (135,'MANUFACTURER_DISPLAY_TEXT_NB','10','2011-03-19 20:04:48','2011-03-20 22:51:26'),
  (136,'NEW_PRODUCTS_NBR','5','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (137,'PS_TOKEN_ENABLE','1','2011-03-19 20:04:48','2011-03-21 00:59:30'),
  (138,'PS_STATS_RENDER','graphxmlswfcharts','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (139,'PS_STATS_OLD_CONNECT_AUTO_CLEAN','never','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (140,'PS_STATS_GRID_RENDER','gridhtml','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (141,'BLOCKTAGS_NBR','10','2011-03-19 20:04:48','2011-03-22 00:07:07'),
  (142,'CHECKUP_DESCRIPTIONS_LT','100','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (143,'CHECKUP_DESCRIPTIONS_GT','400','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (144,'CHECKUP_IMAGES_LT','1','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (145,'CHECKUP_IMAGES_GT','2','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (146,'CHECKUP_SALES_LT','1','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (147,'CHECKUP_SALES_GT','2','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (148,'CHECKUP_STOCK_LT','1','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (149,'CHECKUP_STOCK_GT','3','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (150,'FOOTER_CMS','0_1|0_2|0_3','2011-03-19 20:04:48','2011-03-20 23:36:04'),
  (151,'FOOTER_BLOCK_ACTIVATION','on','2011-03-19 20:04:48','2011-03-20 23:36:05'),
  (152,'BLOCKADVERT_LINK','0','2011-03-19 20:04:48','2011-03-19 20:04:48'),
  (154,'PS_BASE_DISTANCE_UNIT','m','2011-03-19 21:09:45','2011-03-19 21:09:45'),
  (155,'PS_SHOP_DOMAIN','muhovyaz.dev','2011-03-19 20:09:31','2011-05-31 14:07:50'),
  (156,'PS_SHOP_DOMAIN_SSL','muhovyaz.dev','2011-03-19 20:09:31','2011-05-31 14:07:50'),
  (157,'PS_INSTALL_VERSION','1.4.0.17','2011-03-19 20:09:31','2011-03-19 20:09:31'),
  (158,'PS_SHOP_NAME','Муховяз','2011-03-19 20:09:31','2011-06-03 20:45:42'),
  (159,'PS_SHOP_EMAIL','shop@muhovyaz.ru','2011-03-19 20:09:31','2011-06-03 20:45:43'),
  (160,'PS_MAIL_METHOD','1','2011-03-19 20:09:31','2011-03-20 23:00:19'),
  (161,'PS_SHOP_ACTIVITY','20','2011-03-19 20:09:31','2011-03-19 20:09:31'),
  (162,'PS_SHOP_COUNTRY','Российская Федерация','2011-03-20 02:17:29','2011-06-03 20:45:42'),
  (163,'PS_SHOP_STATE','Новосибирская область','2011-03-20 02:17:29','2011-06-03 20:45:42'),
  (164,'PS_SHOP_DETAILS','Нахлыстовый интернет-магазин \"Муховяз\". Купить: нахлыстовые мушки, материалы для вязания нахлыстовых мушек, товары для нахлыста, рыболовные товары.','2011-03-20 02:17:29','2011-06-03 20:45:43'),
  (165,'PS_SHOP_ADDR1','','2011-03-20 02:17:29','2011-06-03 20:45:42'),
  (166,'PS_SHOP_ADDR2','','2011-03-20 02:17:29','2011-06-03 20:45:42'),
  (167,'PS_SHOP_CODE','','2011-03-20 02:17:29','2011-06-03 20:45:43'),
  (168,'PS_SHOP_CITY','','2011-03-20 02:17:29','2011-06-03 20:45:43'),
  (169,'PS_SHOP_COUNTRY_ID','177','2011-03-20 02:17:29','2011-06-03 20:45:43'),
  (170,'PS_SHOP_STATE_ID','754','2011-03-20 02:17:29','2011-06-03 20:45:43'),
  (171,'PS_SHOP_PHONE','','2011-03-20 02:17:30','2011-06-03 20:45:43'),
  (172,'PS_SHOP_FAX','','2011-03-20 02:17:30','2011-06-03 20:45:43'),
  (173,'PS_LOGO','','2011-03-20 11:58:19','2011-03-20 11:58:19'),
  (174,'PS_LOGO_MAIL','','2011-03-20 11:58:19','2011-03-20 11:58:19'),
  (175,'PS_LOGO_INVOICE','','2011-03-20 11:58:19','2011-03-20 11:58:19'),
  (176,'PS_FAVICON','','2011-03-20 11:58:19','2011-03-20 11:58:19'),
  (177,'PS_STORES_ICON','','2011-03-20 11:58:19','2011-03-20 11:58:19'),
  (178,'PS_HTACCESS_CACHE_CONTROL','1','2011-03-20 14:09:56','2011-03-22 23:07:16'),
  (179,'PS_HTACCESS_SPECIFIC','','2011-03-20 14:09:56','2011-03-22 23:07:16'),
  (180,'WATERMARK_TRANSPARENCY','60','2011-03-20 16:37:29','2011-03-20 16:37:29'),
  (181,'WATERMARK_Y_ALIGN','bottom','2011-03-20 16:37:29','2011-03-20 16:37:29'),
  (182,'WATERMARK_X_ALIGN','right','2011-03-20 16:37:29','2011-03-20 16:37:29'),
  (183,'PS_MAINTENANCE_IP','','2011-03-20 22:17:08','2011-03-21 00:59:30'),
  (184,'PS_GIFT_WRAPPING_TAX','0','2011-03-20 22:17:09','2011-03-21 00:59:30'),
  (185,'PS_CART_FOLLOWING','0','2011-03-20 22:17:09','2011-03-21 00:59:30'),
  (186,'PS_HIDE_OPTIMIZATION_TIPS','0','2011-03-20 22:17:09','2011-06-03 15:07:33'),
  (187,'HOME_FEATURED_NBR','8','2011-03-20 22:30:24','2011-03-20 22:30:24'),
  (188,'CROSSSELLING_DISPLAY_PRICE','0','2011-03-20 22:44:07','2011-03-20 22:44:07'),
  (190,'PS_IMAGE_GENERATION_METHOD','0','2011-03-20 23:00:00','2011-03-20 23:00:00'),
  (191,'PS_MAIL_EMAIL_MESSAGE','2','2011-03-20 23:00:19','2011-03-20 23:00:19'),
  (192,'SMTP_CONTAINER','','2011-03-20 23:00:19','2011-03-20 23:00:19'),
  (193,'PS_MAIL_DOMAIN','','2011-03-20 23:00:19','2011-03-20 23:00:19'),
  (194,'PS_MAIL_SERVER','','2011-03-20 23:00:19','2011-03-20 23:00:19'),
  (195,'PS_MAIL_USER','','2011-03-20 23:00:19','2011-03-20 23:00:19'),
  (196,'PS_MAIL_PASSWD','','2011-03-20 23:00:19','2011-03-20 23:00:19'),
  (197,'PS_MAIL_SMTP_ENCRYPTION','off','2011-03-20 23:00:19','2011-03-20 23:00:19'),
  (198,'PS_MAIL_SMTP_PORT','0','2011-03-20 23:00:19','2011-03-20 23:00:19'),
  (199,'SMTP_CONTAINER_END','','2011-03-20 23:00:19','2011-03-20 23:00:19'),
  (200,'__PS_BASE_URI__','/','2011-03-20 23:02:04','2011-05-31 14:07:50'),
  (201,'PS_STORES_DISPLAY_SITEMAP','0','2011-03-20 23:37:02','2011-03-20 23:37:02'),
  (202,'MOD_BLOCKTOPMENU_ITEMS','LNK1,CMS1,CMS2,CMS3','2011-03-21 01:00:42','2011-03-23 00:03:40'),
  (203,'MOD_BLOCKTOPMENU_SEARCH','','2011-03-21 01:00:42','2011-03-23 00:03:40'),
  (204,'BANK_WIRE_DETAILS','Для оплаты Вы можете воспользоваться терминалами, находящимися в отделениях Альфа-Банка. В которых нужно просто ввести номер счета. Процент за оплату через терминал Альфа-Банка не взимается.\r\nИли же Вы можете произвести оплату денежным переводом на указанный счет в ближайшем отделении любого банка. ','2011-03-21 08:38:09','2011-04-05 23:48:09'),
  (205,'BANK_WIRE_OWNER','Никифорцев Дмитрий Игоревич','2011-03-21 08:38:09','2011-04-05 23:48:09'),
  (206,'BANK_WIRE_ADDRESS','Банк получателя: ОАО «Альфа-Банк», г. Москва\r\nИНН: 7728168971\r\nБИК: 044525593\r\nК/С: 30101810200000000593\r\nНаименования получателя: Никифорцев Дмитрий Игоревич\r\n№ счета получателя: 40817810508010016861','2011-03-21 08:38:09','2011-04-05 23:48:09'),
  (207,'PS_INVOICE_START_NUMBER','0','2011-03-22 00:50:06','2011-03-22 00:50:06'),
  (208,'PS_IMG_UPDATE_TIME','1306836932','2011-05-31 17:15:32','2011-05-31 17:15:32'),
  (209,'TS_TAB1_ENV_API','production','2011-05-31 17:17:02','2011-06-03 19:53:18'),
  (210,'PS_SHOW_TYPE_MODULES_1','allModules','2011-05-31 17:17:49','2011-06-01 01:11:23'),
  (211,'PS_SHOW_COUNTRY_MODULES_1','0','2011-05-31 17:17:49','2011-06-01 01:11:23'),
  (212,'PS_SHOW_INSTALLED_MODULES_1','installedUninstalled','2011-05-31 17:17:49','2011-06-01 01:11:23'),
  (213,'PS_SHOW_ENABLED_MODULES_1','enabledDisabled','2011-05-31 17:17:49','2011-06-01 01:11:23'),
  (215,'PS_BACKUP_DROP_TABLE','1','2011-06-03 13:07:08','2011-06-03 13:07:08'),
  (216,'PS_NEED_REBUILD_INDEX','1','2011-06-03 15:07:33','2011-06-03 15:07:33'),
  (217,'PS_VERSION_DB','1.4.2.5','2011-06-03 15:07:33','2011-06-03 15:07:33');
COMMIT;

#
# Data for the `ps_configuration_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_configuration_lang` (`id_configuration`, `id_lang`, `value`, `date_upd`) VALUES
  (36,1,'IN','2011-03-21 18:49:42'),
  (36,6,'СФ','2011-03-21 18:49:42'),
  (38,1,'DE','2011-03-21 18:48:30'),
  (38,6,'ТН','2011-03-21 18:48:30'),
  (46,1,'a|the|of|on|in|and|to','2011-03-19 20:04:46'),
  (68,1,'0','2011-03-19 20:04:46'),
  (74,1,'Dear Customer,\\r\\n\\r\\nRegards,\\r\\nCustomer service','2011-03-20 18:14:48'),
  (74,6,'','2011-03-20 18:14:48');
COMMIT;

#
# Data for the `ps_connections` table  (LIMIT 0,500)
#

INSERT INTO `ps_connections` (`id_connections`, `id_guest`, `id_page`, `ip_address`, `date_add`, `http_referer`) VALUES
  (1,1,1,2130706433,'2011-03-19 20:04:49','http://www.prestashop.com'),
  (2,2,1,2130706433,'2011-03-20 02:10:57',''),
  (3,3,2,2130706433,'2011-03-20 02:10:57',''),
  (4,2,2,2130706433,'2011-03-20 11:56:41',''),
  (5,2,2,2130706433,'2011-03-21 23:44:18',''),
  (6,2,1,2130706433,'2011-03-22 17:05:50',''),
  (7,2,1,2130706433,'2011-03-22 17:06:28',''),
  (8,2,1,2130706433,'2011-03-22 17:56:48',''),
  (9,2,1,2130706433,'2011-03-22 22:05:22',''),
  (10,2,1,2130706433,'2011-03-22 22:59:03',''),
  (11,2,1,2130706433,'2011-03-22 23:05:33',''),
  (12,2,1,2130706433,'2011-03-22 23:32:30',''),
  (13,2,1,2130706433,'2011-03-23 00:21:41',''),
  (14,2,14,2130706433,'2011-03-24 00:41:00',''),
  (15,2,14,2130706433,'2011-03-24 08:20:41',''),
  (16,2,2,2130706433,'2011-03-29 23:33:56',''),
  (17,2,1,2130706433,'2011-03-30 00:49:05',''),
  (18,2,1,2130706433,'2011-03-30 23:52:04',''),
  (19,2,1,2130706433,'2011-03-30 23:53:31',''),
  (20,2,1,2130706433,'2011-03-31 00:19:17',''),
  (21,2,1,2130706433,'2011-04-01 00:17:52',''),
  (22,5,14,2130706433,'2011-04-01 00:45:57',''),
  (23,6,25,2130706433,'2011-04-01 00:51:50',''),
  (24,14,1,2130706433,'2011-05-31 12:11:54',''),
  (25,15,1,2130706433,'2011-05-31 12:12:15',''),
  (26,7,1,2130706433,'2011-05-31 12:19:18',''),
  (27,7,1,2130706433,'2011-05-31 14:08:01',''),
  (28,15,1,2130706433,'2011-05-31 17:09:32',''),
  (29,7,1,2130706433,'2011-05-31 17:12:18',''),
  (30,2,1,2130706433,'2011-05-31 23:13:26',''),
  (31,2,1,2130706433,'2011-06-01 00:50:29',''),
  (32,9,1,2130706433,'2011-06-01 01:00:04',''),
  (33,2,1,2130706433,'2011-06-01 01:21:15',''),
  (34,10,1,2130706433,'2011-06-01 01:22:10',''),
  (35,2,1,2130706433,'2011-06-01 21:45:23',''),
  (36,9,1,2130706433,'2011-06-01 21:45:29',''),
  (37,9,1,2130706433,'2011-06-01 22:32:29',''),
  (38,9,1,2130706433,'2011-06-03 19:58:14',''),
  (39,2,8,2130706433,'2011-06-03 20:18:02',''),
  (40,12,1,2130706433,'2011-06-03 20:51:08',''),
  (41,2,4,2130706433,'2011-06-03 22:48:11',''),
  (42,2,4,2130706433,'2011-06-03 23:19:30',''),
  (43,12,2,2130706433,'2011-06-03 23:45:55',''),
  (44,2,2,2130706433,'2011-06-04 00:03:51',''),
  (45,13,2,2130706433,'2011-06-07 00:02:45','');
COMMIT;

#
# Data for the `ps_contact` table  (LIMIT 0,500)
#

INSERT INTO `ps_contact` (`id_contact`, `email`, `customer_service`, `position`) VALUES
  (1,'admin@muhovyaz.ru',1,0),
  (2,'shop@muhovyaz.ru',1,0);
COMMIT;

#
# Data for the `ps_contact_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_contact_lang` (`id_contact`, `id_lang`, `name`, `description`) VALUES
  (1,1,'Webmaster','If a technical problem occurs on this website'),
  (1,6,'Вебмастер','Если происходят технические проблемы на этом сайте.'),
  (2,1,'Customer service','For any question about a product, an order'),
  (2,6,'Обслуживание покупателей','Для вопросов о товарах и заказах.');
COMMIT;

#
# Data for the `ps_country` table  (LIMIT 0,500)
#

INSERT INTO `ps_country` (`id_country`, `id_zone`, `id_currency`, `iso_code`, `call_prefix`, `active`, `contains_states`, `need_identification_number`, `need_zip_code`, `zip_code_format`, `display_tax_label`) VALUES
  (177,7,0,'RU',7,1,1,0,1,'NNNNNN',1);
COMMIT;

#
# Data for the `ps_country_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_country_lang` (`id_country`, `id_lang`, `name`) VALUES
  (177,1,'Russian Federation'),
  (177,6,'Российская Федерация');
COMMIT;

#
# Data for the `ps_currency` table  (LIMIT 0,500)
#

INSERT INTO `ps_currency` (`id_currency`, `name`, `iso_code`, `iso_code_num`, `sign`, `blank`, `format`, `decimals`, `conversion_rate`, `deleted`, `active`) VALUES
  (1,'Euro','EUR','978','€',1,2,1,0.024851,0,0),
  (2,'Dollar','USD','840','$',0,1,1,0.035040,0,0),
  (3,'Pound','GBP','826','£',0,1,1,0.021620,0,0),
  (4,'Ruble','RUB','643','руб',1,2,1,1.000000,0,1);
COMMIT;

#
# Data for the `ps_customer` table  (LIMIT 0,500)
#

INSERT INTO `ps_customer` (`id_customer`, `id_gender`, `id_default_group`, `firstname`, `lastname`, `email`, `passwd`, `last_passwd_gen`, `birthday`, `newsletter`, `ip_registration_newsletter`, `newsletter_date_add`, `optin`, `secure_key`, `note`, `active`, `is_guest`, `deleted`, `date_add`, `date_upd`) VALUES
  (1,1,1,'John','DOE','pub@prestashop.com','d678e82908a84c2c303689fc5452919a','2011-03-19 20:04:49','1970-01-15',1,NULL,NULL,1,'47ce86627c1f3c792a80773c5d2deaf8',NULL,1,0,0,'2011-03-19 20:04:49','2011-03-19 20:04:49'),
  (2,9,1,'Дмитрий','Никифорцев','dimyan@gmail.com','ccae296b56d358ef51e849f0efa12b31','2011-03-27 16:57:32',NULL,1,'127.0.0.1','2011-03-27 22:57:32',0,'1e07aa70516bf7d326a239a246ecf709',NULL,1,0,0,'2011-03-27 22:57:32','2011-03-27 22:57:32'),
  (3,9,1,'kkjhkljh','lhlkhj','muhovyaz@gmail.com','d383f97cfe935349f79ada7374582be4','2011-03-31 18:50:45',NULL,0,NULL,NULL,0,'7a001b1ec15bfbc9397319b84ea2df3b',NULL,1,1,0,'2011-04-01 00:50:45','2011-04-01 00:50:45');
COMMIT;

#
# Data for the `ps_customer_group` table  (LIMIT 0,500)
#

INSERT INTO `ps_customer_group` (`id_customer`, `id_group`) VALUES
  (1,1),
  (2,1),
  (3,1);
COMMIT;

#
# Data for the `ps_delivery` table  (LIMIT 0,500)
#

INSERT INTO `ps_delivery` (`id_delivery`, `id_carrier`, `id_range_price`, `id_range_weight`, `id_zone`, `price`) VALUES
  (1,2,NULL,1,1,5.00),
  (2,2,NULL,1,2,5.00),
  (4,2,1,NULL,1,5.00),
  (5,2,1,NULL,2,5.00),
  (6,5,2,NULL,1,200.00),
  (8,6,3,NULL,1,200.00),
  (9,6,3,NULL,2,200.00),
  (10,6,3,NULL,3,200.00),
  (11,6,3,NULL,4,200.00),
  (12,6,3,NULL,5,200.00),
  (13,6,3,NULL,6,200.00),
  (14,6,3,NULL,7,200.00),
  (15,6,3,NULL,8,200.00),
  (16,7,4,NULL,1,200.00),
  (17,7,4,NULL,2,200.00),
  (18,7,4,NULL,3,200.00),
  (19,7,4,NULL,4,200.00),
  (20,7,4,NULL,5,200.00),
  (21,7,4,NULL,6,200.00),
  (22,7,4,NULL,7,200.00),
  (23,7,4,NULL,8,200.00);
COMMIT;

#
# Data for the `ps_discount_type` table  (LIMIT 0,500)
#

INSERT INTO `ps_discount_type` (`id_discount_type`) VALUES
  (1),
  (2),
  (3);
COMMIT;

#
# Data for the `ps_discount_type_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_discount_type_lang` (`id_discount_type`, `id_lang`, `name`) VALUES
  (1,1,'Discount on order (%)'),
  (1,6,'Скидка на заказ в %'),
  (2,1,'Discount on order (amount)'),
  (2,6,'Скидка на заказ (суммой)'),
  (3,1,'Free shipping'),
  (3,6,'Бесплатная доставка');
COMMIT;

#
# Data for the `ps_editorial` table  (LIMIT 0,500)
#

INSERT INTO `ps_editorial` (`id_editorial`, `body_home_logo_link`) VALUES
  (1,'http://www.muhovyaz.ru');
COMMIT;

#
# Data for the `ps_editorial_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_editorial_lang` (`id_editorial`, `id_lang`, `body_title`, `body_subheading`, `body_paragraph`, `body_logo_subheading`) VALUES
  (1,1,'Lorem ipsum dolor sit amet','Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>','Excepteur sint prestashop cupidatat non proident'),
  (1,6,'Добро пожаловать в интернет-магазин нахлыстовых товаров','','<p>У нас Вы можете купить нахлыстовые мушки и материалы для вязания мушек.<br />Теперь все самое необходимое для рыбалки нахлыстом можно купить не выходя из дома.<br />Если у Вас возникли какие-то вопросы, по работе магазина или товару, пишите на адрес <a href=\"mailto:shop@muhovyaz.ru\">shop@muhovyaz.ru</a></p>','');
COMMIT;

#
# Data for the `ps_employee` table  (LIMIT 0,500)
#

INSERT INTO `ps_employee` (`id_employee`, `id_profile`, `id_lang`, `lastname`, `firstname`, `email`, `passwd`, `last_passwd_gen`, `stats_date_from`, `stats_date_to`, `bo_color`, `bo_theme`, `bo_uimode`, `active`) VALUES
  (1,1,6,'Никифорцев','Дмитрий','muhovyaz@gmail.com','55f645b789ed58d6734902faacc7887e','2011-03-19 03:09:55','2011-01-01','2011-12-31','','oldschool','click',1);
COMMIT;

#
# Data for the `ps_feature` table  (LIMIT 0,500)
#

INSERT INTO `ps_feature` (`id_feature`) VALUES
  (1),
  (2),
  (3),
  (4),
  (5);
COMMIT;

#
# Data for the `ps_feature_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_feature_lang` (`id_feature`, `id_lang`, `name`) VALUES
  (1,1,'Height'),
  (1,6,'Height'),
  (2,1,'Width'),
  (2,6,'Width'),
  (3,1,'Depth'),
  (3,6,'Depth'),
  (4,1,'Weight'),
  (4,6,'Weight'),
  (5,1,'Headphone'),
  (5,6,'Headphone');
COMMIT;

#
# Data for the `ps_feature_product` table  (LIMIT 0,500)
#

INSERT INTO `ps_feature_product` (`id_feature`, `id_product`, `id_feature_value`) VALUES
  (1,1,11),
  (1,2,15),
  (1,7,23),
  (2,1,12),
  (2,2,16),
  (2,7,24),
  (3,1,14),
  (3,2,18),
  (3,7,26),
  (4,1,13),
  (4,2,17),
  (4,7,25),
  (5,1,10),
  (5,2,10),
  (5,7,9);
COMMIT;

#
# Data for the `ps_feature_value` table  (LIMIT 0,500)
#

INSERT INTO `ps_feature_value` (`id_feature_value`, `id_feature`, `custom`) VALUES
  (9,5,NULL),
  (10,5,NULL),
  (11,1,1),
  (12,2,1),
  (13,4,1),
  (14,3,1),
  (15,1,1),
  (16,2,1),
  (17,4,1),
  (18,3,1),
  (23,1,1),
  (24,2,1),
  (25,4,1),
  (26,3,1);
COMMIT;

#
# Data for the `ps_feature_value_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_feature_value_lang` (`id_feature_value`, `id_lang`, `value`) VALUES
  (9,1,'Jack stereo'),
  (9,6,'Jack stereo'),
  (10,1,'Mini-jack stereo'),
  (10,6,'Mini-jack stereo'),
  (11,1,'2.75 in'),
  (11,6,'2.75 in'),
  (12,1,'2.06 in'),
  (12,6,'2.06 in'),
  (13,1,'49.2 g'),
  (13,6,'49.2 g'),
  (14,1,'0.26 in'),
  (14,6,'0.26 in'),
  (15,1,'1.07 in'),
  (15,6,'1.07 in'),
  (16,1,'1.62 in'),
  (16,6,'1.62 in'),
  (17,1,'15.5 g'),
  (17,6,'15.5 g'),
  (18,1,'0.41 in (clip included)'),
  (18,6,'0.41 in (clip included)'),
  (23,1,'4.33 in'),
  (23,6,'4.33 in'),
  (24,1,'2.76 in'),
  (24,6,'2.76 in'),
  (25,1,'120g'),
  (25,6,'120g'),
  (26,1,'0.31 in'),
  (26,6,'0.31 in');
COMMIT;

#
# Data for the `ps_group` table  (LIMIT 0,500)
#

INSERT INTO `ps_group` (`id_group`, `reduction`, `price_display_method`, `date_add`, `date_upd`) VALUES
  (1,0.00,0,'2011-03-19 20:04:47','2011-03-19 20:04:47');
COMMIT;

#
# Data for the `ps_group_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_group_lang` (`id_group`, `id_lang`, `name`) VALUES
  (1,1,'Default'),
  (1,6,'По умолчанию');
COMMIT;

#
# Data for the `ps_guest` table  (LIMIT 0,500)
#

INSERT INTO `ps_guest` (`id_guest`, `id_operating_system`, `id_web_browser`, `id_customer`, `javascript`, `screen_resolution_x`, `screen_resolution_y`, `screen_color`, `sun_java`, `adobe_flash`, `adobe_director`, `apple_quicktime`, `real_player`, `windows_media`, `accept_language`) VALUES
  (1,1,3,1,1,1680,1050,32,1,1,0,1,1,0,'en-us'),
  (2,2,8,2,0,0,0,0,0,0,0,0,0,0,'ru'),
  (3,2,3,0,0,0,0,0,0,0,0,0,0,0,'ru-ru'),
  (5,2,8,3,0,0,0,0,0,0,0,0,0,0,'ru'),
  (6,2,8,0,0,0,0,0,0,0,0,0,0,0,'ru'),
  (7,4,0,0,0,0,0,0,0,0,0,0,0,0,'ru-ru'),
  (9,2,0,0,0,0,0,0,0,0,0,0,0,0,'ru'),
  (10,2,4,0,0,0,0,0,0,0,0,0,0,0,'ru'),
  (12,2,0,0,0,0,0,0,0,0,0,0,0,0,'ru'),
  (13,2,3,0,0,0,0,0,0,0,0,0,0,0,'ru-ru');
COMMIT;

#
# Data for the `ps_hook` table  (LIMIT 0,500)
#

INSERT INTO `ps_hook` (`id_hook`, `name`, `title`, `description`, `position`, `live_edit`) VALUES
  (1,'payment','Payment',NULL,1,1),
  (2,'newOrder','New orders',NULL,0,0),
  (3,'paymentConfirm','Payment confirmation',NULL,0,0),
  (4,'paymentReturn','Payment return',NULL,0,0),
  (5,'updateQuantity','Quantity update','Quantity is updated only when the customer effectively <b>place</b> his order.',0,0),
  (6,'rightColumn','Right column blocks',NULL,1,1),
  (7,'leftColumn','Left column blocks',NULL,1,1),
  (8,'home','Homepage content',NULL,1,1),
  (9,'header','Header of pages','A hook which allow you to do things in the header of each pages',1,0),
  (10,'cart','Cart creation and update',NULL,0,0),
  (11,'authentication','Successful customer authentication',NULL,0,0),
  (12,'addproduct','Product creation',NULL,0,0),
  (13,'updateproduct','Product Update',NULL,0,0),
  (14,'top','Top of pages','A hook which allow you to do things a the top of each pages.',1,0),
  (15,'extraRight','Extra actions on the product page (right column).',NULL,0,0),
  (16,'deleteproduct','Product deletion','This hook is called when a product is deleted',0,0),
  (17,'productfooter','Product footer','Add new blocks under the product description',1,1),
  (18,'invoice','Invoice','Add blocks to invoice (order)',1,0),
  (19,'updateOrderStatus','Order''s status update event','Launch modules when the order''s status of an order change.',0,0),
  (20,'adminOrder','Display in Back-Office, tab AdminOrder','Launch modules when the tab AdminOrder is displayed on back-office.',0,0),
  (21,'footer','Footer','Add block in footer',1,0),
  (22,'PDFInvoice','PDF Invoice','Allow the display of extra informations into the PDF invoice',0,0),
  (23,'adminCustomers','Display in Back-Office, tab AdminCustomers','Launch modules when the tab AdminCustomers is displayed on back-office.',0,0),
  (24,'orderConfirmation','Order confirmation page','Called on order confirmation page',0,0),
  (25,'createAccount','Successful customer create account','Called when new customer create account successfuled',0,0),
  (26,'customerAccount','Customer account page display in front office','Display on page account of the customer',1,0),
  (27,'orderSlip','Called when a order slip is created','Called when a quantity of one product change in an order.',0,0),
  (28,'productTab','Tabs on product page','Called on order product page tabs',0,0),
  (29,'productTabContent','Content of tabs on product page','Called on order product page tabs',0,0),
  (30,'shoppingCart','Shopping cart footer','Display some specific informations on the shopping cart page',0,0),
  (31,'createAccountForm','Customer account creation form','Display some information on the form to create a customer account',1,0),
  (32,'AdminStatsModules','Stats - Modules',NULL,1,0),
  (33,'GraphEngine','Graph Engines',NULL,0,0),
  (34,'orderReturn','Product returned',NULL,0,0),
  (35,'productActions','Product actions','Put new action buttons on product page',1,0),
  (36,'backOfficeHome','Administration panel homepage',NULL,1,0),
  (37,'GridEngine','Grid Engines',NULL,0,0),
  (38,'watermark','Watermark',NULL,0,0),
  (39,'cancelProduct','Product cancelled','This hook is called when you cancel a product in an order',0,0),
  (40,'extraLeft','Extra actions on the product page (left column).',NULL,0,0),
  (41,'productOutOfStock','Product out of stock','Make action while product is out of stock',1,0),
  (42,'updateProductAttribute','Product attribute update',NULL,0,0),
  (43,'extraCarrier','Extra carrier (module mode)',NULL,0,0),
  (44,'shoppingCartExtra','Shopping cart extra button','Display some specific informations',1,0),
  (45,'search','Search',NULL,0,0),
  (46,'backBeforePayment','Redirect in order process','Redirect user to the module instead of displaying payment modules',0,0),
  (47,'updateCarrier','Carrier Update','This hook is called when a carrier is updated',0,0),
  (48,'postUpdateOrderStatus','Post update of order status',NULL,0,0),
  (49,'createAccountTop','Block above the form for create an account',NULL,1,0),
  (50,'backOfficeHeader','Administration panel header',NULL,0,0),
  (51,'backOfficeTop','Administration panel hover the tabs',NULL,1,0),
  (52,'backOfficeFooter','Administration panel footer',NULL,1,0),
  (53,'deleteProductAttribute','Product Attribute Deletion',NULL,0,0),
  (54,'processCarrier','Carrier Process',NULL,0,0),
  (55,'orderDetail','Order Detail','To set the follow-up in smarty when order detail is called',0,0),
  (56,'beforeCarrier','Before carrier list','This hook is display before the carrier list on Front office',1,0),
  (57,'orderDetailDisplayed','Order detail displayed','Displayed on order detail on front office',1,0),
  (58,'paymentCCAdded','Payment CC added','Payment CC added',0,0),
  (59,'extraProductComparison','Extra Product Comparison','Extra Product Comparison',0,0),
  (60,'categoryAddition','Category creation','',0,0),
  (61,'categoryUpdate','Category modification','',0,0),
  (62,'categoryDeletion','Category removal','',0,0),
  (63,'beforeAuthentication','Before Authentication','Before authentication',0,0),
  (64,'paymentTop','Top of payment page','Top of payment page',0,0),
  (65,'afterCreateHtaccess','After htaccess creation','After htaccess creation',0,0),
  (66,'myAccountBlock','My account block','Display extra informations inside the \"my account\" block',1,0),
  (67,'afterSaveAdminMeta','After save configuration in AdminMeta','After save configuration in AdminMeta',0,0);
COMMIT;

#
# Data for the `ps_hook_module` table  (LIMIT 0,500)
#

INSERT INTO `ps_hook_module` (`id_module`, `id_hook`, `position`) VALUES
  (1,8,2),
  (4,1,2),
  (4,4,2),
  (5,8,1),
  (5,9,5),
  (6,1,1),
  (6,4,1),
  (8,2,1),
  (8,6,4),
  (8,9,6),
  (8,19,1),
  (9,6,1),
  (9,9,3),
  (10,7,1),
  (10,9,7),
  (10,60,1),
  (10,61,1),
  (10,62,1),
  (10,67,1),
  (12,6,6),
  (12,7,3),
  (12,9,12),
  (12,21,1),
  (14,7,2),
  (14,9,11),
  (15,6,2),
  (15,9,4),
  (16,6,3),
  (16,9,9),
  (18,9,1),
  (18,14,2),
  (19,14,1),
  (20,6,5),
  (20,9,8),
  (21,7,5),
  (21,9,13),
  (22,9,10),
  (22,14,3),
  (24,7,4),
  (24,9,2),
  (25,11,1),
  (25,21,2),
  (25,25,1),
  (26,32,1),
  (27,32,2),
  (28,32,3),
  (30,32,4),
  (31,32,5),
  (32,32,6),
  (33,32,7),
  (34,33,1),
  (35,33,2),
  (36,33,3),
  (37,33,4),
  (39,37,1),
  (40,32,8),
  (41,20,2),
  (41,32,9),
  (42,14,4),
  (42,32,10),
  (43,14,5),
  (43,32,11),
  (44,32,12),
  (45,32,13),
  (46,32,15),
  (47,32,14),
  (48,32,16),
  (49,32,17),
  (50,32,18),
  (51,32,19),
  (51,45,1),
  (52,32,20),
  (53,32,21),
  (55,32,22),
  (58,38,1),
  (59,9,14),
  (59,17,1),
  (63,14,6),
  (65,1,3),
  (65,4,3),
  (66,50,1);
COMMIT;

#
# Data for the `ps_image` table  (LIMIT 0,500)
#

INSERT INTO `ps_image` (`id_image`, `id_product`, `position`, `cover`) VALUES
  (15,5,1,1),
  (16,5,2,0),
  (17,5,3,0),
  (18,6,4,0),
  (19,6,5,0),
  (20,6,1,1),
  (24,7,1,1),
  (26,7,2,0),
  (27,7,3,0),
  (29,7,4,0),
  (30,7,5,0),
  (32,7,6,0),
  (33,8,1,1),
  (36,9,1,1),
  (37,1,1,1),
  (38,1,2,0),
  (39,1,3,0),
  (40,1,4,0),
  (41,1,5,0),
  (42,1,6,0),
  (44,1,7,0),
  (45,1,8,0),
  (46,2,1,1),
  (47,2,2,0),
  (48,2,3,0),
  (49,2,4,0);
COMMIT;

#
# Data for the `ps_image_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_image_lang` (`id_image`, `id_lang`, `legend`) VALUES
  (10,1,'luxury-cover-for-ipod-video'),
  (11,1,'cover'),
  (12,1,'myglove-ipod-nano'),
  (13,1,'myglove-ipod-nano'),
  (14,1,'myglove-ipod-nano'),
  (15,1,'MacBook Air'),
  (15,6,'MacBook Air'),
  (16,1,'MacBook Air'),
  (16,6,'MacBook Air'),
  (17,1,'MacBook Air'),
  (17,6,'MacBook Air'),
  (18,1,'MacBook Air'),
  (18,6,'MacBook Air'),
  (19,1,'MacBook Air'),
  (19,6,'MacBook Air'),
  (20,1,' MacBook Air SuperDrive'),
  (20,6,' MacBook Air SuperDrive'),
  (24,1,'iPod touch'),
  (24,6,'iPod touch'),
  (26,1,'iPod touch'),
  (26,6,'iPod touch'),
  (27,1,'iPod touch'),
  (27,6,'iPod touch'),
  (29,1,'iPod touch'),
  (29,6,'iPod touch'),
  (30,1,'iPod touch'),
  (30,6,'iPod touch'),
  (32,1,'iPod touch'),
  (32,6,'iPod touch'),
  (33,1,'housse-portefeuille-en-cuir'),
  (33,6,'housse-portefeuille-en-cuir'),
  (36,1,'Shure SE210 Sound-Isolating Earphones for iPod and iPhone'),
  (36,6,'Shure SE210 Sound-Isolating Earphones for iPod and iPhone'),
  (37,1,'iPod Nano'),
  (37,6,'iPod Nano'),
  (38,1,'iPod Nano'),
  (38,6,'iPod Nano'),
  (39,1,'iPod Nano'),
  (39,6,'iPod Nano'),
  (40,1,'iPod Nano'),
  (40,6,'iPod Nano'),
  (41,1,'iPod Nano'),
  (41,6,'iPod Nano'),
  (42,1,'iPod Nano'),
  (42,6,'iPod Nano'),
  (44,1,'iPod Nano'),
  (44,6,'iPod Nano'),
  (45,1,'iPod Nano'),
  (45,6,'iPod Nano'),
  (46,1,'iPod shuffle'),
  (46,6,'iPod shuffle'),
  (47,1,'iPod shuffle'),
  (47,6,'iPod shuffle'),
  (48,1,'iPod shuffle'),
  (48,6,'iPod shuffle'),
  (49,1,'iPod shuffle'),
  (49,6,'iPod shuffle');
COMMIT;

#
# Data for the `ps_image_type` table  (LIMIT 0,500)
#

INSERT INTO `ps_image_type` (`id_image_type`, `name`, `width`, `height`, `products`, `categories`, `manufacturers`, `suppliers`, `scenes`, `stores`) VALUES
  (1,'small',45,45,1,1,1,1,0,1),
  (2,'medium',80,80,1,1,1,1,0,1),
  (3,'large',300,300,1,1,1,1,0,1),
  (4,'thickbox',600,600,1,0,0,0,0,1),
  (5,'category',500,150,0,1,0,0,0,1),
  (6,'home',129,129,1,0,0,0,0,1),
  (7,'large_scene',556,200,0,0,0,0,1,1),
  (8,'thumb_scene',161,58,0,0,0,0,1,1);
COMMIT;

#
# Data for the `ps_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_lang` (`id_lang`, `name`, `active`, `iso_code`, `language_code`) VALUES
  (1,'English (English)',0,'en','en-us'),
  (6,'Russian',1,'ru','ru');
COMMIT;

#
# Data for the `ps_linksmenutop` table  (LIMIT 0,500)
#

INSERT INTO `ps_linksmenutop` (`id_link`, `new_window`, `link`) VALUES
  (1,0,'http://muhovyaz.ru');
COMMIT;

#
# Data for the `ps_linksmenutop_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_linksmenutop_lang` (`id_link`, `id_lang`, `label`) VALUES
  (1,6,'Главная');
COMMIT;

#
# Data for the `ps_manufacturer` table  (LIMIT 0,500)
#

INSERT INTO `ps_manufacturer` (`id_manufacturer`, `name`, `date_add`, `date_upd`, `active`) VALUES
  (1,'Apple Computer, Inc','2011-03-19 20:04:50','2011-03-19 20:04:50',1),
  (2,'Shure Incorporated','2011-03-19 20:04:50','2011-03-19 20:04:50',1);
COMMIT;

#
# Data for the `ps_manufacturer_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_manufacturer_lang` (`id_manufacturer`, `id_lang`, `description`, `short_description`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
  (1,1,NULL,NULL,NULL,NULL,NULL),
  (1,6,NULL,NULL,NULL,NULL,NULL),
  (2,1,NULL,NULL,NULL,NULL,NULL),
  (2,6,NULL,NULL,NULL,NULL,NULL);
COMMIT;

#
# Data for the `ps_message` table  (LIMIT 0,500)
#

INSERT INTO `ps_message` (`id_message`, `id_cart`, `id_customer`, `id_employee`, `id_order`, `message`, `private`, `date_add`) VALUES
  (1,3,2,0,2,'ну бля пиздец заказ',0,'2011-03-30 00:24:00'),
  (2,5,2,0,6,'гщшгощог',0,'2011-03-30 23:50:52'),
  (3,7,2,0,4,'sdfdf',0,'2011-03-31 00:20:41'),
  (4,8,2,0,0,'ghghhg',0,'2011-04-01 00:19:21'),
  (5,9,3,0,5,'ссссссссссс',0,'2011-04-01 00:51:00');
COMMIT;

#
# Data for the `ps_meta` table  (LIMIT 0,500)
#

INSERT INTO `ps_meta` (`id_meta`, `page`) VALUES
  (1,'404'),
  (2,'best-sales'),
  (3,'contact-form'),
  (4,'index'),
  (5,'manufacturer'),
  (6,'new-products'),
  (7,'password'),
  (8,'prices-drop'),
  (9,'sitemap'),
  (10,'supplier'),
  (11,'address'),
  (12,'addresses'),
  (13,'authentication'),
  (14,'cart'),
  (15,'discount'),
  (16,'history'),
  (17,'identity'),
  (18,'my-account'),
  (19,'order-follow'),
  (20,'order-slip'),
  (21,'order'),
  (22,'search'),
  (23,'stores'),
  (24,'order-opc'),
  (25,'guest-tracking');
COMMIT;

#
# Data for the `ps_meta_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_meta_lang` (`id_meta`, `id_lang`, `title`, `description`, `keywords`, `url_rewrite`) VALUES
  (1,1,'404 error','This page cannot be found','error, 404, not found','page-not-found'),
  (1,6,'Ошибка 404','Страница которую вы запросили не найдена','Ошибка 404, страница не найдена','page-not-found'),
  (2,1,'Best sales','Our best sales','best sales','best-sales'),
  (2,6,'Лидеры продаж','Наши лидеры продаж','лучшие продажи','best-sales'),
  (3,1,'Contact us','Use our form to contact us','contact, form, e-mail','contact-us'),
  (3,6,'Связаться с нами','Используйте форму обратной связи','контакты, форма, e-mail','contact-us'),
  (4,1,'','Shop powered by PrestaShop','shop, prestashop',''),
  (4,6,'Всё для нахлыста и вязания нахлыстовых мушек','Нахлыстовый интернет-магазин \"Муховяз\"','рыбалка нахлыстом,ловля нахлыстом,нахлыстовые мушки,сухие мушки,стримеры,нимфы,мокрые мушки.',''),
  (5,1,'Manufacturers','Manufacturers list','manufacturer','manufacturers'),
  (5,6,'Производители','Список производителей','производителя','производители'),
  (6,1,'New products','Our new products','new, products','new-products'),
  (6,6,'Новинки','Наши новые товары','новинки, товары','new-products'),
  (7,1,'Forgot your password','Enter your e-mail address used to register in goal to get e-mail with your new password','forgot, password, e-mail, new, reset','password-recovery'),
  (7,6,'Восстановление пароля','Введите адрес электронной почты, использованный при регистрации, для получения e-mail с новым паролем','восстановление, пароль, e-mail, новый, сброс','password-recovery'),
  (8,1,'Prices drop','Our special products','special, prices drop','prices-drop'),
  (8,6,'Prices drop','Наши специальные предложения','спецпредложения, распродажа','prices-drop'),
  (9,1,'Sitemap','Lost ? Find what your are looking for','sitemap','sitemap'),
  (9,6,'Карта сайта','Потерялись? Найдите, что искали','sitemap','sitemap'),
  (10,1,'Suppliers','Suppliers list','supplier','supplier'),
  (10,6,'Поставщики','Список поставщиков','supplier','supplier'),
  (11,1,'Address','','','address'),
  (11,6,'Адрес','','','address'),
  (12,1,'Addresses','','','addresses'),
  (12,6,'Адреса','','','addresses'),
  (13,1,'Authentication','','','authentication'),
  (13,6,'Авторизация','','','authentication'),
  (14,1,'Cart','','','cart'),
  (14,6,'Корзина','','','cart'),
  (15,1,'Discount','','','discount'),
  (15,6,'Скидка','','','discount'),
  (16,1,'Order history','','','order-history'),
  (16,6,'История заказов','','','order-history'),
  (17,1,'Identity','','','identity'),
  (17,6,'Идентификация','','','identity'),
  (18,1,'My account','','','my-account'),
  (18,6,'Мой аккаунт','','','my-account'),
  (19,1,'Order follow','','','order-follow'),
  (19,6,'Порядок заказа','','','order-follow'),
  (20,1,'Order slip','','','order-slip'),
  (20,6,'Бланк заказа','','','order-slip'),
  (21,1,'Order','','','order'),
  (21,6,'Заказ','','','order'),
  (22,1,'Search','','','search'),
  (22,6,'Поиск','','','search'),
  (23,1,'Stores','','','stores'),
  (23,6,'Магазины','','','stores'),
  (24,1,'Order','','','quick-order'),
  (24,6,'Заказ','','','quick-order'),
  (25,1,'Guest tracking','','','guest-tracking'),
  (25,6,'Guest tracking','','','guest-tracking');
COMMIT;

#
# Data for the `ps_module` table  (LIMIT 0,500)
#

INSERT INTO `ps_module` (`id_module`, `name`, `active`) VALUES
  (1,'homefeatured',1),
  (2,'gsitemap',1),
  (4,'moneybookers',0),
  (5,'editorial',1),
  (6,'bankwire',1),
  (8,'blockbestsellers',1),
  (9,'blockcart',1),
  (10,'blockcategories',1),
  (12,'blockcms',1),
  (14,'blockmanufacturer',1),
  (15,'blockmyaccount',1),
  (16,'blocknewproducts',1),
  (18,'blockpermanentlinks',1),
  (19,'blocksearch',1),
  (20,'blockspecials',1),
  (21,'blocktags',1),
  (22,'blockuserinfo',1),
  (24,'blockviewed',1),
  (25,'statsdata',1),
  (26,'statsvisits',1),
  (27,'statssales',1),
  (28,'statsregistrations',1),
  (30,'statspersonalinfos',1),
  (31,'statslive',1),
  (32,'statsequipment',1),
  (33,'statscatalog',1),
  (34,'graphvisifire',1),
  (35,'graphxmlswfcharts',1),
  (36,'graphgooglechart',1),
  (37,'graphartichow',1),
  (39,'gridhtml',1),
  (40,'statsbestcustomers',1),
  (41,'statsorigin',1),
  (42,'pagesnotfound',1),
  (43,'sekeywords',1),
  (44,'statsproduct',1),
  (45,'statsbestproducts',1),
  (46,'statsbestcategories',1),
  (47,'statsbestvouchers',1),
  (48,'statsbestsuppliers',1),
  (49,'statscarrier',1),
  (50,'statsnewsletter',1),
  (51,'statssearch',1),
  (52,'statscheckup',1),
  (53,'statsstock',1),
  (55,'statsforecast',1),
  (57,'themeinstallator',1),
  (58,'watermark',0),
  (59,'crossselling',1),
  (63,'blocktopmenu',1),
  (65,'cashondelivery',1),
  (66,'localizator',0),
  (67,'maileditor',1);
COMMIT;

#
# Data for the `ps_module_country` table  (LIMIT 0,500)
#

INSERT INTO `ps_module_country` (`id_module`, `id_country`) VALUES
  (6,177),
  (65,177);
COMMIT;

#
# Data for the `ps_module_currency` table  (LIMIT 0,500)
#

INSERT INTO `ps_module_currency` (`id_module`, `id_currency`) VALUES
  (6,4);
COMMIT;

#
# Data for the `ps_module_group` table  (LIMIT 0,500)
#

INSERT INTO `ps_module_group` (`id_module`, `id_group`) VALUES
  (4,1),
  (6,1),
  (65,1);
COMMIT;

#
# Data for the `ps_operating_system` table  (LIMIT 0,500)
#

INSERT INTO `ps_operating_system` (`id_operating_system`, `name`) VALUES
  (1,'Windows XP'),
  (2,'Windows Vista'),
  (3,'MacOsX'),
  (4,'Linux');
COMMIT;

#
# Data for the `ps_order_detail` table  (LIMIT 0,500)
#

INSERT INTO `ps_order_detail` (`id_order_detail`, `id_order`, `product_id`, `product_attribute_id`, `product_name`, `product_quantity`, `product_quantity_in_stock`, `product_quantity_refunded`, `product_quantity_return`, `product_quantity_reinjected`, `product_price`, `reduction_percent`, `reduction_amount`, `group_reduction`, `product_quantity_discount`, `product_ean13`, `product_upc`, `product_reference`, `product_supplier_reference`, `product_weight`, `tax_name`, `tax_rate`, `ecotax`, `ecotax_tax_rate`, `discount_quantity_applied`, `download_hash`, `download_nb`, `download_deadline`) VALUES
  (1,1,7,23,'iPod touch - Capacité: 32Go',1,0,0,0,0,392.140500,0.00,0.000000,0.00,0.000000,NULL,NULL,NULL,NULL,0,'TVA 19.6%',19.600,0.000000,0.000,0,'',0,'0000-00-00 00:00:00'),
  (2,1,9,0,'Écouteurs à isolation sonore Shure SE210',1,0,0,0,0,124.581900,0.00,0.000000,0.00,0.000000,NULL,NULL,NULL,NULL,0,'TVA 19.6%',19.600,0.000000,0.000,0,'',0,'0000-00-00 00:00:00'),
  (3,2,9,0,'Shure SE210 Sound-Isolating Earphones for iPod and iPhone',1,1,0,0,0,124.581940,0.00,0.000000,0.00,0.000000,NULL,NULL,NULL,NULL,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00'),
  (4,3,2,8,'iPod shuffle - Color : Green',1,1,0,0,0,66.053500,0.00,0.000000,0.00,0.000000,NULL,NULL,NULL,NULL,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00'),
  (5,3,1,31,'iPod Nano - Color : Black, Disk space : 16Go',1,1,0,0,0,166.387960,5.00,0.000000,0.00,158.070000,NULL,NULL,NULL,NULL,0.5,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00'),
  (6,4,1,31,'iPod Nano - Color : Black, Disk space : 16Go',1,1,0,0,0,166.387960,5.00,0.000000,0.00,158.070000,NULL,NULL,NULL,NULL,0.5,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00'),
  (7,4,2,8,'iPod shuffle - Color : Green',1,1,0,0,0,66.053500,0.00,0.000000,0.00,0.000000,NULL,NULL,NULL,NULL,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00'),
  (8,5,1,31,'iPod Nano - Color : Black, Disk space : 16Go',1,1,0,0,0,166.387960,5.00,0.000000,0.00,158.070000,NULL,NULL,NULL,NULL,0.5,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00'),
  (9,5,7,19,'iPod touch - Disk space : 8Go',1,1,0,0,0,241.638796,0.00,0.000000,0.00,0.000000,NULL,NULL,NULL,NULL,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00'),
  (10,6,1,31,'iPod Nano - Color : Black, Disk space : 16Go',2,2,0,0,0,166.387960,5.00,0.000000,0.00,0.000000,NULL,NULL,NULL,NULL,0.5,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00'),
  (11,6,7,19,'iPod touch - Disk space : 8Go',1,1,0,0,0,241.638796,0.00,0.000000,0.00,0.000000,NULL,NULL,NULL,NULL,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00'),
  (12,7,1,31,'iPod Nano - Color : Black, Disk space : 16Go',1,1,0,0,0,166.387960,5.00,0.000000,0.00,158.070000,NULL,NULL,NULL,NULL,0.5,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00'),
  (13,7,2,8,'iPod shuffle - Color : Green',1,1,0,0,0,66.053500,0.00,0.000000,0.00,0.000000,NULL,NULL,NULL,NULL,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00'),
  (14,7,7,19,'iPod touch - Disk space : 8Go',1,1,0,0,0,241.638796,0.00,0.000000,0.00,0.000000,NULL,NULL,NULL,NULL,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00'),
  (15,8,5,13,'MacBook Air - Color : Metal, Disk space : Optional 64GB solid-state drive, Processor : 1.60GHz Intel Core 2 Duo',1,1,0,0,0,1504.180602,0.00,0.000000,0.00,0.000000,NULL,NULL,NULL,NULL,1.36,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00'),
  (16,8,8,0,'Belkin Leather Folio for iPod nano - Black / Chocolate',1,1,0,0,0,25.041806,0.00,0.000000,0.00,0.000000,NULL,NULL,NULL,NULL,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00');
COMMIT;

#
# Data for the `ps_order_history` table  (LIMIT 0,500)
#

INSERT INTO `ps_order_history` (`id_order_history`, `id_employee`, `id_order`, `id_order_state`, `date_add`) VALUES
  (1,0,1,1,'2011-03-19 20:04:50'),
  (2,0,2,10,'2011-03-30 00:47:02'),
  (3,0,3,3,'2011-03-30 00:50:13'),
  (4,0,4,10,'2011-03-31 00:20:57'),
  (5,0,5,3,'2011-04-01 00:51:28'),
  (6,1,2,2,'2011-04-02 02:35:50'),
  (7,0,6,10,'2011-04-02 02:40:24'),
  (8,1,2,10,'2011-04-02 02:41:22'),
  (9,0,7,3,'2011-06-03 20:43:46'),
  (10,0,8,10,'2011-06-03 23:41:41'),
  (11,1,8,10,'2011-06-03 23:57:57'),
  (12,1,8,3,'2011-06-03 23:58:43');
COMMIT;

#
# Data for the `ps_order_message` table  (LIMIT 0,500)
#

INSERT INTO `ps_order_message` (`id_order_message`, `date_add`) VALUES
  (1,'2011-03-19 20:04:51');
COMMIT;

#
# Data for the `ps_order_message_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_order_message_lang` (`id_order_message`, `id_lang`, `name`, `message`) VALUES
  (1,1,'Delay','Hi,\n\nUnfortunately, an item on your order is currently out of stock. This may cause a slight delay in delivery.\nPlease accept our apologies and rest assured that we are working hard to rectify this.\n\nBest regards,'),
  (1,6,'Задержка','Здравствуйте!\r\n\r\nК сожалению, один или несколько товаров из вашего заказа в настоящее время отсутствует на складе. Это может вызвать небольшую задержку доставки заказа.\r\nПожалуйста, примите наши извинения. Мы прикладываем все усилия, чтобы исправить ситуацию как можно быстрее.\r\n\r\nС наилучшими пожеланиями, \r\nМуховяз\r\n');
COMMIT;

#
# Data for the `ps_order_return_state` table  (LIMIT 0,500)
#

INSERT INTO `ps_order_return_state` (`id_order_return_state`, `color`) VALUES
  (1,'#ADD8E6'),
  (2,'#EEDDFF'),
  (3,'#DDFFAA'),
  (4,'#FFD3D3'),
  (5,'#FFFFBB');
COMMIT;

#
# Data for the `ps_order_return_state_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_order_return_state_lang` (`id_order_return_state`, `id_lang`, `name`) VALUES
  (1,1,'Waiting for confirmation'),
  (1,6,'Ожидание подтверждения'),
  (2,1,'Waiting for package'),
  (2,6,'Ожидает упаковки '),
  (3,1,'Package received'),
  (3,6,'Товар получен'),
  (4,1,'Return denied'),
  (4,6,'Отмена возврата'),
  (5,1,'Return completed'),
  (5,6,'Возврат выполнен');
COMMIT;

#
# Data for the `ps_order_state` table  (LIMIT 0,500)
#

INSERT INTO `ps_order_state` (`id_order_state`, `invoice`, `send_email`, `color`, `unremovable`, `hidden`, `logable`, `delivery`) VALUES
  (1,1,1,'lightblue',1,0,0,0),
  (2,1,1,'#DDEEFF',1,0,1,0),
  (3,1,1,'#FFDD99',1,0,1,1),
  (4,1,1,'#EEDDFF',1,0,1,1),
  (5,1,0,'#DDFFAA',1,0,1,1),
  (6,0,1,'#DADADA',1,0,0,0),
  (7,1,1,'#FFFFBB',1,0,0,0),
  (8,0,1,'#FFDFDF',1,0,0,0),
  (9,1,1,'#FFD3D3',1,0,0,0),
  (10,1,1,'lightblue',1,0,0,0),
  (11,0,0,'lightblue',1,0,0,0),
  (12,0,0,'lightblue',1,0,0,0);
COMMIT;

#
# Data for the `ps_order_state_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_order_state_lang` (`id_order_state`, `id_lang`, `name`, `template`) VALUES
  (1,1,'Awaiting cheque payment','cheque'),
  (1,6,'Ждем оплату по чеку','cheque'),
  (2,1,'Payment accepted','payment'),
  (2,6,'Оплата получена','payment'),
  (3,1,'Preparation in progress','preparation'),
  (3,6,'Заказ получен','preparation'),
  (4,1,'Shipped','shipped'),
  (4,6,'Отправлен','shipped'),
  (5,1,'Delivered',''),
  (5,6,'Доставлен',''),
  (6,1,'Canceled','order_canceled'),
  (6,6,'Отменен','order_canceled'),
  (7,1,'Refund','refund'),
  (7,6,'Возврат','refund'),
  (8,1,'Payment error','payment_error'),
  (8,6,'Ошибка оплаты','payment_error'),
  (9,1,'On backorder','outofstock'),
  (9,6,'Задержка отгрузки','outofstock'),
  (10,1,'Awaiting bank wire payment','bankwire'),
  (10,6,'Ожидание оплаты банковским переводом','bankwire'),
  (11,1,'Awaiting PayPal payment',''),
  (11,6,'Ожидание оплаты PayPal',''),
  (12,1,'Payment remotely accepted',''),
  (12,2,'Paiement à distance accepté',''),
  (12,3,'Payment remotely accepted',''),
  (12,4,'Payment remotely accepted',''),
  (12,5,'Payment remotely accepted','');
COMMIT;

#
# Data for the `ps_orders` table  (LIMIT 0,500)
#

INSERT INTO `ps_orders` (`id_order`, `id_carrier`, `id_lang`, `id_customer`, `id_cart`, `id_currency`, `id_address_delivery`, `id_address_invoice`, `secure_key`, `payment`, `conversion_rate`, `module`, `recyclable`, `gift`, `gift_message`, `shipping_number`, `total_discounts`, `total_paid`, `total_paid_real`, `total_products`, `total_products_wt`, `total_shipping`, `carrier_tax_rate`, `total_wrapping`, `invoice_number`, `delivery_number`, `invoice_date`, `delivery_date`, `valid`, `date_add`, `date_upd`) VALUES
  (1,2,2,1,1,1,2,2,'47ce86627c1f3c792a80773c5d2deaf8','Chèque',1.000000,'cheque',0,0,'','',0.00,625.98,625.98,516.72,618.00,7.98,0.000,0.00,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2011-03-19 20:04:50','2011-03-19 20:04:50'),
  (2,7,6,2,3,4,4,4,'1e07aa70516bf7d326a239a246ecf709','Банковский перевод',1.000000,'bankwire',1,0,'','',0.00,324.58,324.58,124.58,124.58,200.00,0.000,0.00,3,0,'2011-04-02 02:35:50','0000-00-00 00:00:00',0,'2011-03-30 00:47:01','2011-04-02 02:41:22'),
  (3,7,6,2,4,4,5,5,'1e07aa70516bf7d326a239a246ecf709','Оплата наличными при получении',1.000000,'cashondelivery',1,0,'','',0.00,424.12,424.12,224.12,224.12,200.00,0.000,0.00,1,1,'2011-03-30 00:50:13','2011-03-30 00:50:13',1,'2011-03-30 00:50:13','2011-03-30 00:50:13'),
  (4,7,6,2,7,4,5,5,'1e07aa70516bf7d326a239a246ecf709','Банковский перевод',1.000000,'bankwire',1,0,'','',0.00,424.12,424.12,224.12,224.12,200.00,0.000,0.00,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2011-03-31 00:20:56','2011-03-31 00:20:57'),
  (5,7,6,3,9,4,6,6,'7a001b1ec15bfbc9397319b84ea2df3b','Оплата наличными при получении',1.000000,'cashondelivery',1,0,'','',0.00,599.71,599.71,399.71,399.71,200.00,0.000,0.00,2,2,'2011-04-01 00:51:27','2011-04-01 00:51:27',1,'2011-04-01 00:51:27','2011-04-01 00:51:27'),
  (6,7,6,2,5,4,4,4,'1e07aa70516bf7d326a239a246ecf709','Банковский перевод',1.000000,'bankwire',1,0,'','',0.00,757.78,757.78,557.78,557.78,200.00,0.000,0.00,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2011-04-02 02:40:23','2011-04-02 02:40:24'),
  (7,7,6,2,10,4,3,3,'1e07aa70516bf7d326a239a246ecf709','Оплата наличными при получении',1.000000,'cashondelivery',1,0,'','',0.00,665.76,665.76,465.76,465.76,200.00,0.000,0.00,4,3,'2011-06-03 20:43:46','2011-06-03 20:43:46',1,'2011-06-03 20:43:45','2011-06-03 20:43:46'),
  (8,7,6,2,11,4,3,3,'1e07aa70516bf7d326a239a246ecf709','Банковский перевод',1.000000,'bankwire',1,0,'','',0.00,1729.22,1729.22,1529.22,1529.22,200.00,0.000,0.00,5,4,'2011-06-03 23:41:41','2011-06-03 23:58:43',1,'2011-06-03 23:41:41','2011-06-03 23:58:43');
COMMIT;

#
# Data for the `ps_page` table  (LIMIT 0,500)
#

INSERT INTO `ps_page` (`id_page`, `id_page_type`, `id_object`) VALUES
  (1,15,NULL),
  (2,16,NULL),
  (3,2,4),
  (4,2,3),
  (5,2,2),
  (6,17,NULL),
  (7,18,NULL),
  (8,19,NULL),
  (9,1,9),
  (10,2,1),
  (11,20,NULL),
  (12,21,NULL),
  (13,22,NULL),
  (14,23,NULL),
  (15,1,2),
  (16,1,1),
  (17,24,NULL),
  (18,25,NULL),
  (19,26,NULL),
  (20,27,NULL),
  (21,28,NULL),
  (22,29,NULL),
  (23,30,NULL),
  (24,31,NULL),
  (25,32,NULL),
  (26,33,NULL),
  (27,34,NULL),
  (28,35,NULL);
COMMIT;

#
# Data for the `ps_page_type` table  (LIMIT 0,500)
#

INSERT INTO `ps_page_type` (`id_page_type`, `name`) VALUES
  (1,'product.php'),
  (2,'category.php'),
  (3,'order.php'),
  (4,'manufacturer.php'),
  (5,'index.php'),
  (6,'supplier.php'),
  (7,'cms.php'),
  (8,'search.php'),
  (9,'stores.php'),
  (10,'prices-drop.php'),
  (11,'best-sales.php'),
  (12,'contact-form.php'),
  (13,'authentication.php'),
  (14,'sitemap.php'),
  (15,'index.php'),
  (16,'404.php'),
  (17,'sitemap.php'),
  (18,'prices-drop.php'),
  (19,'authentication.php'),
  (20,'cms.php'),
  (21,'stores.php'),
  (22,'contact-form.php'),
  (23,'order-opc.php'),
  (24,'search.php'),
  (25,'new-products.php'),
  (26,'my-account.php'),
  (27,'identity.php'),
  (28,'addresses.php'),
  (29,'history.php'),
  (30,'address.php'),
  (31,'modules/bankwire/payment.php'),
  (32,'order-confirmation.php'),
  (33,'modules/cashondelivery/validation.php'),
  (34,'guest-tracking.php'),
  (35,'products-comparison.php');
COMMIT;

#
# Data for the `ps_pagenotfound` table  (LIMIT 0,500)
#

INSERT INTO `ps_pagenotfound` (`id_pagenotfound`, `request_uri`, `http_referer`, `date_add`) VALUES
  (1,'/admin','http://muhovyaz.dev/install/','2011-03-19 20:10:33'),
  (2,'/favicon.ico','','2011-03-19 20:11:38'),
  (3,'/favicon.ico','','2011-03-19 20:11:38'),
  (4,'/favicon.ico','','2011-03-19 20:11:40'),
  (5,'/modules/editorial/editorial.css','http://muhovyaz.dev/','2011-03-20 05:48:59'),
  (6,'/modules/blockmyaccount/blockmyaccount.css','http://muhovyaz.dev/','2011-03-20 05:48:59'),
  (7,'/modules/blockcart/blockcart.css','http://muhovyaz.dev/','2011-03-20 05:48:59'),
  (8,'/modules/blockspecials/blockspecials.css','http://muhovyaz.dev/','2011-03-20 05:49:00'),
  (9,'/modules/blockmanufacturer/blockmanufacturer.css','http://muhovyaz.dev/','2011-03-20 05:49:00'),
  (10,'/modules/blockpaymentlogo/blockpaymentlogo.css','http://muhovyaz.dev/','2011-03-20 05:49:00'),
  (11,'/modules/blockbestsellers/blockbestsellers.css','http://muhovyaz.dev/','2011-03-20 05:49:00'),
  (12,'/modules/blockviewed/blockviewed.css','http://muhovyaz.dev/','2011-03-20 05:49:00'),
  (13,'/modules/blocklanguages/blocklanguages.css','http://muhovyaz.dev/','2011-03-20 05:49:00'),
  (14,'/modules/blockpermanentlinks/blockpermanentlinks.css','http://muhovyaz.dev/','2011-03-20 05:49:00'),
  (15,'/modules/blockcms/blockcms.css','http://muhovyaz.dev/','2011-03-20 05:49:00'),
  (16,'/modules/blockuserinfo/blockuserinfo.css','http://muhovyaz.dev/','2011-03-20 05:49:00'),
  (17,'/modules/blocknewproducts/blocknewproducts.css','http://muhovyaz.dev/','2011-03-20 05:49:01'),
  (18,'/modules/blockcurrencies/blockcurrencies.css','http://muhovyaz.dev/','2011-03-20 05:49:01'),
  (19,'/modules/blockcategories/blockcategories.css','http://muhovyaz.dev/','2011-03-20 05:49:01'),
  (20,'/modules/blocktags/blocktags.css','http://muhovyaz.dev/','2011-03-20 05:49:08'),
  (21,'/themes/theme001/css/modules/blockstore/blockstore.css','http://muhovyaz.dev/','2011-03-20 05:49:08'),
  (22,'/themes/theme001/css/product_list.css','http://muhovyaz.dev/','2011-03-20 05:49:08'),
  (23,'/modules/blocksearch/blocksearch.css','http://muhovyaz.dev/','2011-03-20 05:49:09'),
  (24,'/modules/blockadvertising/blockadvertising.css','http://muhovyaz.dev/','2011-03-20 05:49:09'),
  (25,'/js/jquery/jquery-1.2.6.pack.js','http://muhovyaz.dev/','2011-03-20 05:49:10'),
  (26,'/js/jquery/jquery.hotkeys-0.7.8-packed.js','http://muhovyaz.dev/','2011-03-20 05:49:10'),
  (27,'/modules/blockcurrencies/blockcurrencies.js','http://muhovyaz.dev/','2011-03-20 05:49:10'),
  (28,'/js/jquery/jquery-1.2.6.pack.js','http://muhovyaz.dev/','2011-03-20 05:49:12'),
  (29,'/js/jquery/jquery.hotkeys-0.7.8-packed.js','http://muhovyaz.dev/','2011-03-20 05:49:13'),
  (30,'/modules/blockcurrencies/blockcurrencies.js','http://muhovyaz.dev/','2011-03-20 05:49:13'),
  (31,'/themes/theme001/css/category.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:20'),
  (32,'/modules/blockspecials/blockspecials.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:21'),
  (33,'/themes/theme001/css/product_list.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:21'),
  (34,'/modules/blockpermanentlinks/blockpermanentlinks.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:21'),
  (35,'/modules/blockviewed/blockviewed.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:21'),
  (36,'/modules/blockcart/blockcart.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:21'),
  (37,'/modules/blockbestsellers/blockbestsellers.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:22'),
  (38,'/modules/editorial/editorial.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:22'),
  (39,'/modules/blockmyaccount/blockmyaccount.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:22'),
  (40,'/modules/blockpaymentlogo/blockpaymentlogo.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:22'),
  (41,'/modules/blocklanguages/blocklanguages.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:23'),
  (42,'/modules/blocknewproducts/blocknewproducts.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:23'),
  (43,'/themes/theme001/css/modules/blockstore/blockstore.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:23'),
  (44,'/modules/blockcategories/blockcategories.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:23'),
  (45,'/modules/blocktags/blocktags.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:23'),
  (46,'/modules/blockcurrencies/blockcurrencies.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:23'),
  (47,'/modules/blockuserinfo/blockuserinfo.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:23'),
  (48,'/modules/blockcms/blockcms.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:23'),
  (49,'/js/jquery/jquery-1.2.6.pack.js','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:23'),
  (50,'/modules/blockadvertising/blockadvertising.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:23'),
  (51,'/modules/blockmanufacturer/blockmanufacturer.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:24'),
  (52,'/modules/blocksearch/blocksearch.css','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:24'),
  (53,'/js/jquery/jquery.hotkeys-0.7.8-packed.js','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:24'),
  (54,'/themes/theme001/js/products-comparison.js','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:24'),
  (55,'/modules/blockcurrencies/blockcurrencies.js','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:25'),
  (56,'/js/jquery/jquery-1.2.6.pack.js','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:25'),
  (57,'/js/jquery/jquery.hotkeys-0.7.8-packed.js','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:26'),
  (58,'/themes/theme001/js/products-comparison.js','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:26'),
  (59,'/modules/blockcurrencies/blockcurrencies.js','http://muhovyaz.dev/category.php?id_category=2','2011-03-20 05:49:27'),
  (60,'/favicon.ico','','2011-03-20 05:56:17'),
  (61,'/favicon.ico','','2011-03-20 05:56:17'),
  (62,'/favicon.ico','','2011-03-20 05:56:21'),
  (63,'/modules/blockmyaccount/blockmyaccount.css','http://muhovyaz.dev/','2011-03-20 05:59:06'),
  (64,'/modules/blocklanguages/blocklanguages.css','http://muhovyaz.dev/','2011-03-20 05:59:06'),
  (65,'/modules/blockpermanentlinks/blockpermanentlinks.css','http://muhovyaz.dev/','2011-03-20 05:59:06'),
  (66,'/modules/blockbestsellers/blockbestsellers.css','http://muhovyaz.dev/','2011-03-20 05:59:07'),
  (67,'/modules/blockcart/blockcart.css','http://muhovyaz.dev/','2011-03-20 05:59:07'),
  (68,'/modules/blockcategories/blockcategories.css','http://muhovyaz.dev/','2011-03-20 05:59:07'),
  (69,'/modules/blockviewed/blockviewed.css','http://muhovyaz.dev/','2011-03-20 05:59:07'),
  (70,'/modules/blockcurrencies/blockcurrencies.css','http://muhovyaz.dev/','2011-03-20 05:59:07'),
  (71,'/modules/blockspecials/blockspecials.css','http://muhovyaz.dev/','2011-03-20 05:59:07'),
  (72,'/modules/blockuserinfo/blockuserinfo.css','http://muhovyaz.dev/','2011-03-20 05:59:08'),
  (73,'/modules/blocknewproducts/blocknewproducts.css','http://muhovyaz.dev/','2011-03-20 05:59:08'),
  (74,'/modules/blockcms/blockcms.css','http://muhovyaz.dev/','2011-03-20 05:59:08'),
  (75,'/modules/blocktags/blocktags.css','http://muhovyaz.dev/','2011-03-20 05:59:08'),
  (76,'/modules/blockmanufacturer/blockmanufacturer.css','http://muhovyaz.dev/','2011-03-20 05:59:08'),
  (77,'/modules/blockpaymentlogo/blockpaymentlogo.css','http://muhovyaz.dev/','2011-03-20 05:59:08'),
  (78,'/modules/editorial/editorial.css','http://muhovyaz.dev/','2011-03-20 05:59:08'),
  (79,'/themes/free2/css/modules/blockstore/blockstore.css','http://muhovyaz.dev/','2011-03-20 05:59:08'),
  (80,'/modules/blocksearch/blocksearch.css','http://muhovyaz.dev/','2011-03-20 05:59:08'),
  (81,'/themes/free2/css/product_list.css','http://muhovyaz.dev/','2011-03-20 05:59:09'),
  (82,'/modules/blockadvertising/blockadvertising.css','http://muhovyaz.dev/','2011-03-20 05:59:09'),
  (83,'/js/jquery/jquery.hotkeys-0.7.8-packed.js','http://muhovyaz.dev/','2011-03-20 05:59:09'),
  (84,'/js/jquery/jquery-1.2.6.pack.js','http://muhovyaz.dev/','2011-03-20 05:59:09'),
  (85,'/js/jquery/jquery-1.2.6.pack.js','http://muhovyaz.dev/','2011-03-20 05:59:10'),
  (86,'/js/jquery/jquery.hotkeys-0.7.8-packed.js','http://muhovyaz.dev/','2011-03-20 05:59:11'),
  (87,'/modules/blockviewed/blockviewed.css','http://muhovyaz.dev/','2011-03-20 06:00:06'),
  (88,'/modules/blockpaymentlogo/blockpaymentlogo.css','http://muhovyaz.dev/','2011-03-20 06:00:06'),
  (89,'/modules/blockpermanentlinks/blockpermanentlinks.css','http://muhovyaz.dev/','2011-03-20 06:00:06'),
  (90,'/modules/blockcart/blockcart.css','http://muhovyaz.dev/','2011-03-20 06:00:06'),
  (91,'/modules/blockuserinfo/blockuserinfo.css','http://muhovyaz.dev/','2011-03-20 06:00:06'),
  (92,'/modules/editorial/editorial.css','http://muhovyaz.dev/','2011-03-20 06:00:07'),
  (93,'/modules/blockmyaccount/blockmyaccount.css','http://muhovyaz.dev/','2011-03-20 06:00:07'),
  (94,'/modules/blockcurrencies/blockcurrencies.css','http://muhovyaz.dev/','2011-03-20 06:00:07'),
  (95,'/modules/blocklanguages/blocklanguages.css','http://muhovyaz.dev/','2011-03-20 06:00:07'),
  (96,'/modules/blocknewproducts/blocknewproducts.css','http://muhovyaz.dev/','2011-03-20 06:00:07'),
  (97,'/modules/blockmanufacturer/blockmanufacturer.css','http://muhovyaz.dev/','2011-03-20 06:00:08'),
  (98,'/modules/blockcms/blockcms.css','http://muhovyaz.dev/','2011-03-20 06:00:08'),
  (99,'/modules/blockbestsellers/blockbestsellers.css','http://muhovyaz.dev/','2011-03-20 06:00:08'),
  (100,'/modules/blockadvertising/blockadvertising.css','http://muhovyaz.dev/','2011-03-20 06:00:09'),
  (101,'/themes/unzip_1st/css/modules/blockstore/blockstore.css','http://muhovyaz.dev/','2011-03-20 06:00:09'),
  (102,'/modules/blockspecials/blockspecials.css','http://muhovyaz.dev/','2011-03-20 06:00:09'),
  (103,'/modules/blocktags/blocktags.css','http://muhovyaz.dev/','2011-03-20 06:00:09'),
  (104,'/js/jquery/jquery.hotkeys-0.7.8-packed.js','http://muhovyaz.dev/','2011-03-20 06:00:09'),
  (105,'/modules/blockcategories/blockcategories.css','http://muhovyaz.dev/','2011-03-20 06:00:09'),
  (106,'/themes/unzip_1st/css/product_list.css','http://muhovyaz.dev/','2011-03-20 06:00:09'),
  (107,'/modules/blocksearch/blocksearch.css','http://muhovyaz.dev/','2011-03-20 06:00:09'),
  (108,'/js/jquery/jquery-1.2.6.pack.js','http://muhovyaz.dev/','2011-03-20 06:00:09'),
  (109,'/js/jquery/jquery-1.2.6.pack.js','http://muhovyaz.dev/','2011-03-20 06:00:10'),
  (110,'/js/jquery/jquery.hotkeys-0.7.8-packed.js','http://muhovyaz.dev/','2011-03-20 06:00:11'),
  (111,'/modules/blockpaymentlogo/blockpaymentlogo.css','http://muhovyaz.dev/','2011-03-20 06:01:17'),
  (112,'/modules/blockpermanentlinks/blockpermanentlinks.css','http://muhovyaz.dev/','2011-03-20 06:01:17'),
  (113,'/modules/blockviewed/blockviewed.css','http://muhovyaz.dev/','2011-03-20 06:01:18'),
  (114,'/modules/blockcart/blockcart.css','http://muhovyaz.dev/','2011-03-20 06:01:18'),
  (115,'/modules/editorial/editorial.css','http://muhovyaz.dev/','2011-03-20 06:01:18'),
  (116,'/modules/blockcategories/blockcategories.css','http://muhovyaz.dev/','2011-03-20 06:01:18'),
  (117,'/modules/blockcurrencies/blockcurrencies.css','http://muhovyaz.dev/','2011-03-20 06:01:18'),
  (118,'/modules/blockuserinfo/blockuserinfo.css','http://muhovyaz.dev/','2011-03-20 06:01:18'),
  (119,'/modules/blockspecials/blockspecials.css','http://muhovyaz.dev/','2011-03-20 06:01:18'),
  (120,'/modules/blockmyaccount/blockmyaccount.css','http://muhovyaz.dev/','2011-03-20 06:01:19'),
  (121,'/modules/blocknewproducts/blocknewproducts.css','http://muhovyaz.dev/','2011-03-20 06:01:19'),
  (122,'/modules/blockbestsellers/blockbestsellers.css','http://muhovyaz.dev/','2011-03-20 06:01:19'),
  (123,'/modules/blocklanguages/blocklanguages.css','http://muhovyaz.dev/','2011-03-20 06:01:19'),
  (124,'/modules/blockcms/blockcms.css','http://muhovyaz.dev/','2011-03-20 06:01:19'),
  (125,'/js/jquery/jquery.hotkeys-0.7.8-packed.js','http://muhovyaz.dev/','2011-03-20 06:01:20'),
  (126,'/modules/blockmanufacturer/blockmanufacturer.css','http://muhovyaz.dev/','2011-03-20 06:01:20'),
  (127,'/js/jquery/jquery-1.2.6.pack.js','http://muhovyaz.dev/','2011-03-20 06:01:20'),
  (128,'/modules/blocksearch/blocksearch.css','http://muhovyaz.dev/','2011-03-20 06:01:20'),
  (129,'/modules/blocktags/blocktags.css','http://muhovyaz.dev/','2011-03-20 06:01:20'),
  (130,'/themes/free1/css/modules/blockstore/blockstore.css','http://muhovyaz.dev/','2011-03-20 06:01:20'),
  (131,'/modules/blockadvertising/blockadvertising.css','http://muhovyaz.dev/','2011-03-20 06:01:20'),
  (132,'/themes/free1/css/product_list.css','http://muhovyaz.dev/','2011-03-20 06:01:21'),
  (133,'/js/jquery/jquery-1.2.6.pack.js','http://muhovyaz.dev/','2011-03-20 06:01:22'),
  (134,'/js/jquery/jquery.hotkeys-0.7.8-packed.js','http://muhovyaz.dev/','2011-03-20 06:01:22'),
  (135,'/modules/blockcms/blockcms.css','http://muhovyaz.dev/','2011-03-20 18:56:02'),
  (136,'/modules/blockmyaccount/blockmyaccount.css','http://muhovyaz.dev/','2011-03-20 18:56:02'),
  (137,'/themes/assembly/css/product_list.css','http://muhovyaz.dev/','2011-03-20 18:56:02'),
  (138,'/modules/blockpermanentlinks/blockpermanentlinks.css','http://muhovyaz.dev/','2011-03-20 18:56:02'),
  (139,'/modules/blockmanufacturer/blockmanufacturer.css','http://muhovyaz.dev/','2011-03-20 18:56:02'),
  (140,'/modules/blockcart/blockcart.css','http://muhovyaz.dev/','2011-03-20 18:56:02'),
  (141,'/modules/blockcategories/blockcategories.css','http://muhovyaz.dev/','2011-03-20 18:56:02'),
  (142,'/modules/blockuserinfo/blockuserinfo.css','http://muhovyaz.dev/','2011-03-20 18:56:02'),
  (143,'/modules/blocknewproducts/blocknewproducts.css','http://muhovyaz.dev/','2011-03-20 18:56:03'),
  (144,'/modules/crossselling/crossselling.css','http://muhovyaz.dev/','2011-03-20 18:56:03'),
  (145,'/modules/blocktags/blocktags.css','http://muhovyaz.dev/','2011-03-20 18:56:03'),
  (146,'/modules/blockviewed/blockviewed.css','http://muhovyaz.dev/','2011-03-20 18:56:03'),
  (147,'/modules/editorial/editorial.css','http://muhovyaz.dev/','2011-03-20 18:56:04'),
  (148,'/modules/blockbestsellers/blockbestsellers.css','http://muhovyaz.dev/','2011-03-20 18:56:04'),
  (149,'/modules/blockspecials/blockspecials.css','http://muhovyaz.dev/','2011-03-20 18:56:05'),
  (150,'/modules/blocksearch/blocksearch.css','http://muhovyaz.dev/','2011-03-20 18:56:05'),
  (151,'/modules/blockadvertising/blockadvertising.css','http://muhovyaz.dev/','2011-03-20 18:56:05'),
  (152,'/js/jquery/jquery-1.2.6.pack.js','http://muhovyaz.dev/','2011-03-20 18:56:05'),
  (153,'/js/jquery/jquery.hotkeys-0.7.8-packed.js','http://muhovyaz.dev/','2011-03-20 18:56:06'),
  (154,'/js/jquery/jquery-1.2.6.pack.js','http://muhovyaz.dev/','2011-03-20 18:56:13'),
  (155,'/js/jquery/jquery.hotkeys-0.7.8-packed.js','http://muhovyaz.dev/','2011-03-20 18:56:13'),
  (156,'/modules/blockpermanentlinks/blockpermanentlinks.css','http://muhovyaz.dev/','2011-03-20 18:57:29'),
  (157,'/themes/assembly/css/product_list.css','http://muhovyaz.dev/','2011-03-20 18:57:29'),
  (158,'/modules/blockviewed/blockviewed.css','http://muhovyaz.dev/','2011-03-20 18:57:29'),
  (159,'/modules/blockbestsellers/blockbestsellers.css','http://muhovyaz.dev/','2011-03-20 18:57:30'),
  (160,'/modules/blockspecials/blockspecials.css','http://muhovyaz.dev/','2011-03-20 18:57:30'),
  (161,'/modules/crossselling/crossselling.css','http://muhovyaz.dev/','2011-03-20 18:57:30'),
  (162,'/modules/blockcms/blockcms.css','http://muhovyaz.dev/','2011-03-20 18:57:30'),
  (163,'/modules/blockmanufacturer/blockmanufacturer.css','http://muhovyaz.dev/','2011-03-20 18:57:30'),
  (164,'/modules/blockcart/blockcart.css','http://muhovyaz.dev/','2011-03-20 18:57:30'),
  (165,'/modules/blocktags/blocktags.css','http://muhovyaz.dev/','2011-03-20 18:57:30'),
  (166,'/modules/blockcategories/blockcategories.css','http://muhovyaz.dev/','2011-03-20 18:57:31'),
  (167,'/modules/blockuserinfo/blockuserinfo.css','http://muhovyaz.dev/','2011-03-20 18:57:32'),
  (168,'/modules/blocknewproducts/blocknewproducts.css','http://muhovyaz.dev/','2011-03-20 18:57:32'),
  (169,'/modules/editorial/editorial.css','http://muhovyaz.dev/','2011-03-20 18:57:32'),
  (170,'/modules/blocksearch/blocksearch.css','http://muhovyaz.dev/','2011-03-20 18:57:33'),
  (171,'/modules/blockmyaccount/blockmyaccount.css','http://muhovyaz.dev/','2011-03-20 18:57:33'),
  (172,'/modules/blockadvertising/blockadvertising.css','http://muhovyaz.dev/','2011-03-20 18:57:33'),
  (173,'/js/jquery/jquery.hotkeys-0.7.8-packed.js','http://muhovyaz.dev/','2011-03-20 18:57:33'),
  (174,'/js/jquery/jquery-1.2.6.pack.js','http://muhovyaz.dev/','2011-03-20 18:57:33'),
  (175,'/js/jquery/jquery-1.2.6.pack.js','http://muhovyaz.dev/','2011-03-20 18:57:40'),
  (176,'/js/jquery/jquery.hotkeys-0.7.8-packed.js','http://muhovyaz.dev/','2011-03-20 18:57:41'),
  (177,'/themes/muhovyaz/img/button-medium.ng','http://muhovyaz.dev/themes/muhovyaz/css/global.css','2011-03-21 17:17:21'),
  (178,'/themes/muhovyaz/img/button-medium.','http://muhovyaz.dev/themes/muhovyaz/css/global.css','2011-03-21 17:17:22'),
  (179,'/themes/muhovyaz/img/button-medium.gi','http://muhovyaz.dev/themes/muhovyaz/css/global.css','2011-03-21 17:17:24'),
  (180,'/favicon.ico','','2011-03-21 17:43:53'),
  (181,'/favicon.ico','','2011-03-21 17:43:54'),
  (182,'/favicon.ico','','2011-03-21 17:43:57'),
  (183,'/undefined/','http://muhovyaz.dev/?live_edit&ad=adm&liveToken=6b3f58cb2269aa4a676626b0ba9dc40a6fdca838','2011-03-21 18:27:00'),
  (184,'/favicon.ico','','2011-03-22 11:06:39'),
  (185,'/favicon.ico','','2011-03-22 11:06:53'),
  (186,'/modules/blockpermanentlinks/blockpermanentlinks.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:50:59'),
  (187,'/themes/assembly/css/addresses.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:50:59'),
  (188,'/themes/assembly/css/order-opc.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:50:59'),
  (189,'/modules/blockcart/blockcart.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:50:59'),
  (190,'/modules/blockmyaccount/blockmyaccount.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:00'),
  (191,'/modules/blockviewed/blockviewed.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:00'),
  (192,'/modules/editorial/editorial.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:01'),
  (193,'/modules/blockcategories/blockcategories.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:01'),
  (194,'/modules/blockbestsellers/blockbestsellers.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:02'),
  (195,'/modules/blockuserinfo/blockuserinfo.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:02'),
  (196,'/modules/blockspecials/blockspecials.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:02'),
  (197,'/modules/blocknewproducts/blocknewproducts.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:02'),
  (198,'/modules/blockcms/blockcms.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:03'),
  (199,'/modules/blockmanufacturer/blockmanufacturer.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:03'),
  (200,'/modules/crossselling/crossselling.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:04'),
  (201,'/modules/blocktags/blocktags.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:04'),
  (202,'/themes/assembly/css/product_list.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:04'),
  (203,'/modules/blocksearch/blocksearch.css','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:04'),
  (204,'/js/jquery/jquery-1.2.6.pack.js','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:05'),
  (205,'/js/jquery/jquery.hotkeys-0.7.8-packed.js','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:05'),
  (206,'/themes/assembly/js/cart-summary.js','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:06'),
  (207,'/themes/assembly/js/order-opc.js','http://muhovyaz.dev/order-opc.php','2011-03-22 15:51:06'),
  (208,'/modules/blockbestsellers/blockbestsellers.css','http://muhovyaz.dev/','2011-03-22 15:51:32'),
  (209,'/modules/blockviewed/blockviewed.css','http://muhovyaz.dev/','2011-03-22 15:51:32'),
  (210,'/modules/blockmyaccount/blockmyaccount.css','http://muhovyaz.dev/','2011-03-22 15:51:33'),
  (211,'/modules/blockpermanentlinks/blockpermanentlinks.css','http://muhovyaz.dev/','2011-03-22 15:51:33'),
  (212,'/modules/editorial/editorial.css','http://muhovyaz.dev/','2011-03-22 15:51:33'),
  (213,'/modules/blockcart/blockcart.css','http://muhovyaz.dev/','2011-03-22 15:51:33'),
  (214,'/modules/blockspecials/blockspecials.css','http://muhovyaz.dev/','2011-03-22 15:51:34'),
  (215,'/modules/blockcategories/blockcategories.css','http://muhovyaz.dev/','2011-03-22 15:51:34'),
  (216,'/modules/blockuserinfo/blockuserinfo.css','http://muhovyaz.dev/','2011-03-22 15:51:35'),
  (217,'/modules/blockcms/blockcms.css','http://muhovyaz.dev/','2011-03-22 15:51:35'),
  (218,'/modules/blocknewproducts/blocknewproducts.css','http://muhovyaz.dev/','2011-03-22 15:51:35'),
  (219,'/modules/blockmanufacturer/blockmanufacturer.css','http://muhovyaz.dev/','2011-03-22 15:51:35'),
  (220,'/modules/blocktags/blocktags.css','http://muhovyaz.dev/','2011-03-22 15:51:36'),
  (221,'/modules/blocksearch/blocksearch.css','http://muhovyaz.dev/','2011-03-22 15:51:37'),
  (222,'/js/jquery/jquery.hotkeys-0.7.8-packed.js','http://muhovyaz.dev/','2011-03-22 15:51:37'),
  (223,'/modules/crossselling/crossselling.css','http://muhovyaz.dev/','2011-03-22 15:51:37'),
  (224,'/themes/assembly/css/product_list.css','http://muhovyaz.dev/','2011-03-22 15:51:37'),
  (225,'/js/jquery/jquery-1.2.6.pack.js','http://muhovyaz.dev/','2011-03-22 15:51:37'),
  (226,'/ru/','http://muhovyaz.dev/ru/','2011-03-22 17:06:55'),
  (227,'/js/tinymce/jscripts/tiny_mce/jquery.tinymce.js','http://muhovyaz.dev/adm/index.php?tab=AdminModules&token=1f1bd7d8801dc0b695fb134b951cc708&configure=maileditor&file=account.html','2011-03-23 02:35:57'),
  (228,'/js/tinymce/jscripts/tiny_mce/jquery.tinymce.js','http://muhovyaz.dev/adm/index.php?tab=AdminModules&token=1f1bd7d8801dc0b695fb134b951cc708&configure=maileditor&file=test.html','2011-03-23 02:36:27'),
  (229,'/js/tinymce/jscripts/tiny_mce/jquery.tinymce.js','http://muhovyaz.dev/adm/index.php?tab=AdminModules&token=1f1bd7d8801dc0b695fb134b951cc708&configure=maileditor&file=contact.html','2011-03-23 02:38:54'),
  (230,'/js/tinymce/jscripts/tiny_mce/jquery.tinymce.js','http://muhovyaz.dev/adm/index.php?tab=AdminModules&token=1f1bd7d8801dc0b695fb134b951cc708&configure=maileditor&file=contact.html','2011-03-23 02:39:14'),
  (231,'/js/tinymce/jscripts/tiny_mce/jquery.tinymce.js','http://muhovyaz.dev/adm/index.php?tab=AdminModules&token=1f1bd7d8801dc0b695fb134b951cc708&configure=maileditor&file=cheque.html','2011-03-23 02:39:20'),
  (232,'/js/tinymce/jscripts/tiny_mce/jquery.tinymce.js','http://muhovyaz.dev/adm/index.php?tab=AdminModules&token=1f1bd7d8801dc0b695fb134b951cc708&configure=maileditor&file=account.html','2011-03-23 02:46:53'),
  (233,'/js/tinymce/jscripts/tiny_mce/jquery.tinymce.js','http://muhovyaz.dev/adm/index.php?tab=AdminModules&token=1f1bd7d8801dc0b695fb134b951cc708&configure=maileditor&file=bankwire.html','2011-03-23 02:47:01'),
  (234,'/js/tinymce/jscripts/tiny_mce/jquery.tinymce.js','http://muhovyaz.dev/adm/index.php?tab=AdminModules&token=1f1bd7d8801dc0b695fb134b951cc708&configure=maileditor&file=bankwire.html','2011-03-23 16:18:05'),
  (235,'/favicon.ico','','2011-03-29 16:33:31'),
  (236,'/favicon.ico','','2011-03-29 16:33:31'),
  (237,'/favicon.ico','','2011-03-29 16:33:34'),
  (238,'/modules/bankform/form.php?id_order=8','','2011-06-03 16:45:29'),
  (239,'/modules/bankform/form.php?id_order=8','','2011-06-03 16:45:56'),
  (240,'/mails/ru/%7Bshop_logo%7D','http://muhovyaz.dev/mails/ru/bankwire.html','2011-06-03 17:03:22'),
  (241,'/favicon.ico','','2011-06-03 17:03:24'),
  (242,'/favicon.ico','','2011-06-06 17:02:17');
COMMIT;

#
# Data for the `ps_product` table  (LIMIT 0,500)
#

INSERT INTO `ps_product` (`id_product`, `id_supplier`, `id_manufacturer`, `id_tax_rules_group`, `id_category_default`, `id_color_default`, `on_sale`, `online_only`, `ean13`, `upc`, `ecotax`, `quantity`, `minimal_quantity`, `price`, `wholesale_price`, `unity`, `unit_price_ratio`, `additional_shipping_cost`, `reference`, `supplier_reference`, `location`, `width`, `height`, `depth`, `weight`, `out_of_stock`, `quantity_discount`, `customizable`, `uploadable_files`, `text_fields`, `active`, `available_for_order`, `condition`, `show_price`, `indexed`, `cache_is_pack`, `cache_has_attachments`, `cache_default_attribute`, `date_add`, `date_upd`) VALUES
  (1,1,1,1,2,2,0,0,'0',NULL,0.000000,794,1,124.581940,70.000000,NULL,0.000000,0.00,'','',NULL,0,0,0,0.5,2,0,0,0,0,1,1,'new',1,1,0,0,31,'2011-03-19 20:04:50','2011-03-19 20:04:50'),
  (2,1,1,1,2,0,0,0,'0',NULL,0.000000,97,1,66.053500,33.000000,NULL,0.000000,0.00,'','',NULL,0,0,0,0,2,0,0,0,0,1,1,'new',1,1,0,0,8,'2011-03-19 20:04:50','2011-03-19 20:04:50'),
  (5,1,1,1,4,0,0,0,'0',NULL,0.000000,273,1,1504.180602,1000.000000,NULL,0.000000,0.00,'',NULL,NULL,0,0,0,1.36,2,0,0,0,0,1,1,'new',1,1,0,0,13,'2011-03-19 20:04:50','2011-03-19 20:04:50'),
  (6,1,1,1,4,0,0,0,'0',NULL,0.000000,250,1,1170.568561,0.000000,NULL,0.000000,0.00,'',NULL,NULL,0,0,0,0.75,2,0,0,0,0,1,1,'new',1,1,0,0,0,'2011-03-19 20:04:50','2011-03-19 20:04:50'),
  (7,0,0,1,2,0,0,0,'',NULL,0.000000,177,1,241.638796,200.000000,NULL,0.000000,0.00,'',NULL,NULL,0,0,0,0,2,0,0,0,0,1,1,'new',1,1,0,0,19,'2011-03-19 20:04:50','2011-03-19 20:04:50'),
  (8,0,0,1,3,0,0,1,'',NULL,0.000000,0,1,25.041806,0.000000,NULL,0.000000,0.00,'',NULL,NULL,0,0,0,0,2,0,0,0,0,1,1,'new',1,1,0,0,0,'2011-03-19 20:04:50','2011-03-19 20:04:50'),
  (9,2,2,1,3,0,0,1,'',NULL,0.000000,0,1,124.581940,0.000000,NULL,0.000000,0.00,'',NULL,NULL,0,0,0,0,2,0,0,0,0,1,1,'new',1,1,0,0,0,'2011-03-19 20:04:50','2011-03-19 20:04:50');
COMMIT;

#
# Data for the `ps_product_attribute` table  (LIMIT 0,500)
#

INSERT INTO `ps_product_attribute` (`id_product_attribute`, `id_product`, `reference`, `supplier_reference`, `location`, `ean13`, `upc`, `wholesale_price`, `price`, `ecotax`, `quantity`, `weight`, `unit_price_impact`, `default_on`, `minimal_quantity`) VALUES
  (7,2,'','',NULL,'',NULL,0.000000,0.000000,0.000000,10,0,0.00,0,1),
  (8,2,'','',NULL,'',NULL,0.000000,0.000000,0.000000,17,0,0.00,1,1),
  (9,2,'','',NULL,'',NULL,0.000000,0.000000,0.000000,30,0,0.00,0,1),
  (10,2,'','',NULL,'',NULL,0.000000,0.000000,0.000000,40,0,0.00,0,1),
  (12,5,'',NULL,NULL,'',NULL,0.000000,751.672241,0.000000,100,0,0.00,0,1),
  (13,5,'',NULL,NULL,'',NULL,0.000000,0.000000,0.000000,98,0,0.00,1,1),
  (14,5,'',NULL,NULL,'',NULL,0.000000,225.752508,0.000000,50,0,0.00,0,1),
  (15,5,'',NULL,NULL,'',NULL,0.000000,977.424749,0.000000,25,0,0.00,0,1),
  (19,7,'',NULL,NULL,'',NULL,0.000000,0.000000,0.000000,47,0,0.00,1,1),
  (22,7,'',NULL,NULL,'',NULL,0.000000,75.250836,0.000000,60,0,0.00,0,1),
  (23,7,'',NULL,NULL,'',NULL,0.000000,150.501672,0.000000,70,0,0.00,0,1),
  (25,1,'','',NULL,'',NULL,0.000000,41.806020,0.000000,50,0,0.00,0,4),
  (26,1,'','',NULL,'',NULL,0.000000,0.000000,0.000000,50,0,0.00,0,1),
  (27,1,'','',NULL,'',NULL,0.000000,41.806020,0.000000,50,0,0.00,0,1),
  (28,1,'','',NULL,'',NULL,0.000000,0.000000,0.000000,50,0,0.00,0,1),
  (29,1,'','',NULL,'',NULL,0.000000,41.806020,0.000000,50,0,0.00,0,1),
  (30,1,'','',NULL,'',NULL,0.000000,0.000000,0.000000,50,0,0.00,0,1),
  (31,1,'','',NULL,'',NULL,0.000000,41.806020,0.000000,44,0,0.00,1,1),
  (32,1,'','',NULL,'',NULL,0.000000,0.000000,0.000000,50,0,0.00,0,1),
  (33,1,'','',NULL,'',NULL,0.000000,41.806020,0.000000,50,0,0.00,0,1),
  (34,1,'','',NULL,'',NULL,0.000000,0.000000,0.000000,50,0,0.00,0,1),
  (35,1,'','',NULL,'',NULL,0.000000,41.806020,0.000000,50,0,0.00,0,1),
  (36,1,'','',NULL,'',NULL,0.000000,0.000000,0.000000,50,0,0.00,0,1),
  (39,1,'','',NULL,'',NULL,0.000000,41.806020,0.000000,50,0,0.00,0,1),
  (40,1,'','',NULL,'',NULL,0.000000,0.000000,0.000000,50,0,0.00,0,1),
  (41,1,'','',NULL,'',NULL,0.000000,41.806020,0.000000,50,0,0.00,0,1),
  (42,1,'','',NULL,'',NULL,0.000000,0.000000,0.000000,50,0,0.00,0,1);
COMMIT;

#
# Data for the `ps_product_attribute_combination` table  (LIMIT 0,500)
#

INSERT INTO `ps_product_attribute_combination` (`id_attribute`, `id_product_attribute`) VALUES
  (3,9),
  (3,12),
  (3,13),
  (3,14),
  (3,15),
  (3,29),
  (3,30),
  (4,7),
  (4,25),
  (4,26),
  (5,10),
  (5,35),
  (5,36),
  (6,8),
  (6,39),
  (6,40),
  (7,33),
  (7,34),
  (8,13),
  (8,15),
  (9,12),
  (9,14),
  (10,12),
  (10,13),
  (11,14),
  (11,15),
  (14,31),
  (14,32),
  (15,19),
  (15,26),
  (15,28),
  (15,30),
  (15,32),
  (15,34),
  (15,36),
  (15,40),
  (15,42),
  (16,22),
  (16,25),
  (16,27),
  (16,29),
  (16,31),
  (16,33),
  (16,35),
  (16,39),
  (16,41),
  (17,23),
  (18,41),
  (18,42),
  (19,27),
  (19,28);
COMMIT;

#
# Data for the `ps_product_attribute_image` table  (LIMIT 0,500)
#

INSERT INTO `ps_product_attribute_image` (`id_product_attribute`, `id_image`) VALUES
  (7,46),
  (8,47),
  (9,49),
  (10,48),
  (12,0),
  (13,0),
  (14,0),
  (15,0),
  (19,0),
  (22,0),
  (23,0),
  (25,38),
  (26,38),
  (27,45),
  (28,45),
  (29,44),
  (30,44),
  (31,37),
  (32,37),
  (33,40),
  (34,40),
  (35,41),
  (36,41),
  (39,39),
  (40,39),
  (41,42),
  (42,42);
COMMIT;

#
# Data for the `ps_product_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_product_lang` (`id_product`, `id_lang`, `description`, `description_short`, `link_rewrite`, `meta_description`, `meta_keywords`, `meta_title`, `name`, `available_now`, `available_later`) VALUES
  (1,1,'<p><strong><span style=\"font-size: small;\">Curved ahead of the curve.</span></strong></p>\r\n<p>For those about to rock, we give you nine amazing colors. But that''s only part of the story. Feel the curved, all-aluminum and glass design and you won''t want to put iPod nano down.</p>\r\n<p><strong><span style=\"font-size: small;\">Great looks. And brains, too.</span></strong></p>\r\n<p>The new Genius feature turns iPod nano into your own highly intelligent, personal DJ. It creates playlists by finding songs in your library that go great together.</p>\r\n<p><strong><span style=\"font-size: small;\">Made to move with your moves.</span></strong></p>\r\n<p>The accelerometer comes to iPod nano. Give it a shake to shuffle your music. Turn it sideways to view Cover Flow. And play games designed with your moves in mind.</p>','<p>New design. New features. Now in 8GB and 16GB. iPod nano rocks like never before.</p>','ipod-nano','','','','iPod Nano','In stock',''),
  (1,6,'<p><strong><span style=\"font-size: small;\">Curved ahead of the curve.</span></strong></p>\r\n<p>For those about to rock, we give you nine amazing colors. But that''s only part of the story. Feel the curved, all-aluminum and glass design and you won''t want to put iPod nano down.</p>\r\n<p><strong><span style=\"font-size: small;\">Great looks. And brains, too.</span></strong></p>\r\n<p>The new Genius feature turns iPod nano into your own highly intelligent, personal DJ. It creates playlists by finding songs in your library that go great together.</p>\r\n<p><strong><span style=\"font-size: small;\">Made to move with your moves.</span></strong></p>\r\n<p>The accelerometer comes to iPod nano. Give it a shake to shuffle your music. Turn it sideways to view Cover Flow. And play games designed with your moves in mind.</p>','<p>New design. New features. Now in 8GB and 16GB. iPod nano rocks like never before.</p>','ipod-nano','','','','iPod Nano','In stock',''),
  (2,1,'<p><span style=\"font-size: small;\"><strong>Instant attachment.</strong></span></p>\r\n<p>Wear up to 500 songs on your sleeve. Or your belt. Or your gym shorts. iPod shuffle is a badge of musical devotion. Now in new, more brilliant colors.</p>\r\n<p><span style=\"font-size: small;\"><strong>Feed your iPod shuffle.</strong></span></p>\r\n<p>iTunes is your entertainment superstore. It’s your ultra-organized music collection and jukebox. And it’s how you load up your iPod shuffle in one click.</p>\r\n<p><span style=\"font-size: small;\"><strong>Beauty and the beat.</strong></span></p>\r\n<p>Intensely colorful anodized aluminum complements the simple design of iPod shuffle. Now in blue, green, pink, red, and original silver.</p>','<p>iPod shuffle, the world’s most wearable music player, now clips on in more vibrant blue, green, pink, and red.</p>','ipod-shuffle','','','','iPod shuffle','In stock',''),
  (2,6,'<p><span style=\"font-size: small;\"><strong>Instant attachment.</strong></span></p>\r\n<p>Wear up to 500 songs on your sleeve. Or your belt. Or your gym shorts. iPod shuffle is a badge of musical devotion. Now in new, more brilliant colors.</p>\r\n<p><span style=\"font-size: small;\"><strong>Feed your iPod shuffle.</strong></span></p>\r\n<p>iTunes is your entertainment superstore. It’s your ultra-organized music collection and jukebox. And it’s how you load up your iPod shuffle in one click.</p>\r\n<p><span style=\"font-size: small;\"><strong>Beauty and the beat.</strong></span></p>\r\n<p>Intensely colorful anodized aluminum complements the simple design of iPod shuffle. Now in blue, green, pink, red, and original silver.</p>','<p>iPod shuffle, the world’s most wearable music player, now clips on in more vibrant blue, green, pink, and red.</p>','ipod-shuffle','','','','iPod shuffle','In stock',''),
  (5,1,'<p>MacBook Air is nearly as thin as your index finger. Practically every detail that could be streamlined has been. Yet it still has a 13.3-inch widescreen LED display, full-size keyboard, and large multi-touch trackpad. It’s incomparably portable without the usual ultraportable screen and keyboard compromises.</p><p>The incredible thinness of MacBook Air is the result of numerous size- and weight-shaving innovations. From a slimmer hard drive to strategically hidden I/O ports to a lower-profile battery, everything has been considered and reconsidered with thinness in mind.</p><p>MacBook Air is designed and engineered to take full advantage of the wireless world. A world in which 802.11n Wi-Fi is now so fast and so available, people are truly living untethered — buying and renting movies online, downloading software, and sharing and storing files on the web. </p>','MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don’t lose inches and pounds overnight. It’s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.','macbook-air','','','','MacBook Air','',NULL),
  (5,6,'<p>MacBook Air is nearly as thin as your index finger. Practically every detail that could be streamlined has been. Yet it still has a 13.3-inch widescreen LED display, full-size keyboard, and large multi-touch trackpad. It’s incomparably portable without the usual ultraportable screen and keyboard compromises.</p><p>The incredible thinness of MacBook Air is the result of numerous size- and weight-shaving innovations. From a slimmer hard drive to strategically hidden I/O ports to a lower-profile battery, everything has been considered and reconsidered with thinness in mind.</p><p>MacBook Air is designed and engineered to take full advantage of the wireless world. A world in which 802.11n Wi-Fi is now so fast and so available, people are truly living untethered — buying and renting movies online, downloading software, and sharing and storing files on the web. </p>','MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don’t lose inches and pounds overnight. It’s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.','macbook-air','','','','MacBook Air','',NULL),
  (6,1,'Every MacBook has a larger hard drive, up to 250GB, to store growing media collections and valuable data.<br /><br />The 2.4GHz MacBook models now include 2GB of memory standard — perfect for running more of your favorite applications smoothly.','MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.','macbook','','','','MacBook','',NULL),
  (6,6,'Every MacBook has a larger hard drive, up to 250GB, to store growing media collections and valuable data.<br /><br />The 2.4GHz MacBook models now include 2GB of memory standard — perfect for running more of your favorite applications smoothly.','MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.','macbook','','','','MacBook','',NULL),
  (7,1,'<h3>Five new hands-on applications</h3>\r\n<p>View rich HTML email with photos as well as PDF, Word, and Excel attachments. Get maps, directions, and real-time traffic information. Take notes and read stock and weather reports.</p>\r\n<h3>Touch your music, movies, and more</h3>\r\n<p>The revolutionary Multi-Touch technology built into the gorgeous 3.5-inch display lets you pinch, zoom, scroll, and flick with your fingers.</p>\r\n<h3>Internet in your pocket</h3>\r\n<p>With the Safari web browser, see websites the way they were designed to be seen and zoom in and out with a tap.<sup>2</sup> And add Web Clips to your Home screen for quick access to favorite sites.</p>\r\n<h3>What''s in the box</h3>\r\n<ul>\r\n<li><span></span>iPod touch</li>\r\n<li><span></span>Earphones</li>\r\n<li><span></span>USB 2.0 cable</li>\r\n<li><span></span>Dock adapter</li>\r\n<li><span></span>Polishing cloth</li>\r\n<li><span></span>Stand</li>\r\n<li><span></span>Quick Start guide</li>\r\n</ul>','<ul>\r\n<li>Revolutionary Multi-Touch interface</li>\r\n<li>3.5-inch widescreen color display</li>\r\n<li>Wi-Fi (802.11b/g)</li>\r\n<li>8 mm thin</li>\r\n<li>Safari, YouTube, Mail, Stocks, Weather, Notes, iTunes Wi-Fi Music Store, Maps</li>\r\n</ul>','ipod-touch','','','','iPod touch','',NULL),
  (7,6,'<h3>Five new hands-on applications</h3>\r\n<p>View rich HTML email with photos as well as PDF, Word, and Excel attachments. Get maps, directions, and real-time traffic information. Take notes and read stock and weather reports.</p>\r\n<h3>Touch your music, movies, and more</h3>\r\n<p>The revolutionary Multi-Touch technology built into the gorgeous 3.5-inch display lets you pinch, zoom, scroll, and flick with your fingers.</p>\r\n<h3>Internet in your pocket</h3>\r\n<p>With the Safari web browser, see websites the way they were designed to be seen and zoom in and out with a tap.<sup>2</sup> And add Web Clips to your Home screen for quick access to favorite sites.</p>\r\n<h3>What''s in the box</h3>\r\n<ul>\r\n<li><span></span>iPod touch</li>\r\n<li><span></span>Earphones</li>\r\n<li><span></span>USB 2.0 cable</li>\r\n<li><span></span>Dock adapter</li>\r\n<li><span></span>Polishing cloth</li>\r\n<li><span></span>Stand</li>\r\n<li><span></span>Quick Start guide</li>\r\n</ul>','<ul>\r\n<li>Revolutionary Multi-Touch interface</li>\r\n<li>3.5-inch widescreen color display</li>\r\n<li>Wi-Fi (802.11b/g)</li>\r\n<li>8 mm thin</li>\r\n<li>Safari, YouTube, Mail, Stocks, Weather, Notes, iTunes Wi-Fi Music Store, Maps</li>\r\n</ul>','ipod-touch','','','','iPod touch','',NULL),
  (8,1,'<p>Lorem ipsum</p>','<p>Lorem ipsum</p>','belkin-leather-folio-for-ipod-nano-black-chocolate','','','','Belkin Leather Folio for iPod nano - Black / Chocolate','',NULL),
  (8,6,'<p>Lorem ipsum</p>','<p>Lorem ipsum</p>','belkin-leather-folio-for-ipod-nano-black-chocolate','','','','Belkin Leather Folio for iPod nano - Black / Chocolate','',NULL),
  (9,1,'<div class=\"product-overview-full\">Using Hi-Definition MicroSpeakers to deliver full-range audio, the ergonomic and lightweight design of the SE210 earphones is ideal for premium on-the-go listening on your iPod or iPhone. They offer the most accurate audio reproduction from both portable and home stereo audio sources--for the ultimate in precision highs and rich low end. In addition, the flexible design allows you to choose the most comfortable fit from a variety of wearing positions. <br /> <br /> <strong>Features </strong> <br /> \r\n<ul>\r\n<li>Sound-isolating design </li>\r\n<li> Hi-Definition MicroSpeaker with a single balanced armature driver </li>\r\n<li> Detachable, modular cable so you can make the cable longer or shorter depending on your activity </li>\r\n<li> Connector compatible with earphone ports on both iPod and iPhone </li>\r\n</ul>\r\n<strong>Specifications </strong><br /> \r\n<ul>\r\n<li>Speaker type: Hi-Definition MicroSpeaker </li>\r\n<li> Frequency range: 25Hz-18.5kHz </li>\r\n<li> Impedance (1kHz): 26 Ohms </li>\r\n<li> Sensitivity (1mW): 114 dB SPL/mW </li>\r\n<li> Cable length (with extension): 18.0 in./45.0 cm (54.0 in./137.1 cm) </li>\r\n</ul>\r\n<strong>In the box</strong><br /> \r\n<ul>\r\n<li>Shure SE210 earphones </li>\r\n<li> Extension cable (36.0 in./91.4 cm) </li>\r\n<li> Three pairs foam earpiece sleeves (small, medium, large) </li>\r\n<li> Three pairs soft flex earpiece sleeves (small, medium, large) </li>\r\n<li> One pair triple-flange earpiece sleeves </li>\r\n<li> Carrying case </li>\r\n</ul>\r\nWarranty<br /> Two-year limited <br />(For details, please visit <br />www.shure.com/PersonalAudio/CustomerSupport/ProductReturnsAndWarranty/index.htm.) <br /><br /> Mfr. Part No.: SE210-A-EFS <br /><br />Note: Products sold through this website that do not bear the Apple Brand name are serviced and supported exclusively by their manufacturers in accordance with terms and conditions packaged with the products. Apple''s Limited Warranty does not apply to products that are not Apple-branded, even if packaged or sold with Apple products. Please contact the manufacturer directly for technical support and customer service.</div>','<p>Evolved from personal monitor technology road-tested by pro musicians and perfected by Shure engineers, the lightweight and stylish SE210 delivers full-range audio that''s free from outside noise.</p>','ecouteurs-a-isolation-sonore-shure-se210-blanc','','','','Shure SE210 Sound-Isolating Earphones for iPod and iPhone','',NULL),
  (9,6,'<div class=\"product-overview-full\">Using Hi-Definition MicroSpeakers to deliver full-range audio, the ergonomic and lightweight design of the SE210 earphones is ideal for premium on-the-go listening on your iPod or iPhone. They offer the most accurate audio reproduction from both portable and home stereo audio sources--for the ultimate in precision highs and rich low end. In addition, the flexible design allows you to choose the most comfortable fit from a variety of wearing positions. <br /> <br /> <strong>Features </strong> <br /> \r\n<ul>\r\n<li>Sound-isolating design </li>\r\n<li> Hi-Definition MicroSpeaker with a single balanced armature driver </li>\r\n<li> Detachable, modular cable so you can make the cable longer or shorter depending on your activity </li>\r\n<li> Connector compatible with earphone ports on both iPod and iPhone </li>\r\n</ul>\r\n<strong>Specifications </strong><br /> \r\n<ul>\r\n<li>Speaker type: Hi-Definition MicroSpeaker </li>\r\n<li> Frequency range: 25Hz-18.5kHz </li>\r\n<li> Impedance (1kHz): 26 Ohms </li>\r\n<li> Sensitivity (1mW): 114 dB SPL/mW </li>\r\n<li> Cable length (with extension): 18.0 in./45.0 cm (54.0 in./137.1 cm) </li>\r\n</ul>\r\n<strong>In the box</strong><br /> \r\n<ul>\r\n<li>Shure SE210 earphones </li>\r\n<li> Extension cable (36.0 in./91.4 cm) </li>\r\n<li> Three pairs foam earpiece sleeves (small, medium, large) </li>\r\n<li> Three pairs soft flex earpiece sleeves (small, medium, large) </li>\r\n<li> One pair triple-flange earpiece sleeves </li>\r\n<li> Carrying case </li>\r\n</ul>\r\nWarranty<br /> Two-year limited <br />(For details, please visit <br />www.shure.com/PersonalAudio/CustomerSupport/ProductReturnsAndWarranty/index.htm.) <br /><br /> Mfr. Part No.: SE210-A-EFS <br /><br />Note: Products sold through this website that do not bear the Apple Brand name are serviced and supported exclusively by their manufacturers in accordance with terms and conditions packaged with the products. Apple''s Limited Warranty does not apply to products that are not Apple-branded, even if packaged or sold with Apple products. Please contact the manufacturer directly for technical support and customer service.</div>','<p>Evolved from personal monitor technology road-tested by pro musicians and perfected by Shure engineers, the lightweight and stylish SE210 delivers full-range audio that''s free from outside noise.</p>','ecouteurs-a-isolation-sonore-shure-se210-blanc','','','','Shure SE210 Sound-Isolating Earphones for iPod and iPhone','',NULL);
COMMIT;

#
# Data for the `ps_product_sale` table  (LIMIT 0,500)
#

INSERT INTO `ps_product_sale` (`id_product`, `quantity`, `sale_nbr`, `date_upd`) VALUES
  (1,6,6,'2011-06-03'),
  (2,4,4,'2011-06-03'),
  (5,1,1,'2011-06-03'),
  (7,4,4,'2011-06-03'),
  (8,1,1,'2011-06-03');
COMMIT;

#
# Data for the `ps_product_tag` table  (LIMIT 0,500)
#

INSERT INTO `ps_product_tag` (`id_product`, `id_tag`) VALUES
  (1,5),
  (1,6),
  (1,7),
  (1,8),
  (1,28),
  (1,29),
  (1,30),
  (1,31),
  (1,32),
  (2,6),
  (2,18),
  (2,28),
  (2,30),
  (2,33),
  (2,34),
  (5,8),
  (5,19),
  (5,20),
  (5,21),
  (6,5),
  (6,8),
  (6,22),
  (6,32),
  (6,35),
  (6,36),
  (7,23),
  (7,24),
  (7,37),
  (9,25),
  (9,26),
  (9,27);
COMMIT;

#
# Data for the `ps_profile` table  (LIMIT 0,500)
#

INSERT INTO `ps_profile` (`id_profile`) VALUES
  (1),
  (2),
  (3),
  (4);
COMMIT;

#
# Data for the `ps_profile_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_profile_lang` (`id_lang`, `id_profile`, `name`) VALUES
  (1,1,'Administrator'),
  (1,2,'Logistician'),
  (1,3,'Translator'),
  (1,4,'Salesman'),
  (6,1,'Администратор'),
  (6,2,'Менеджер по закупкам'),
  (6,3,'Переводчик'),
  (6,4,'Менеджер по продажам');
COMMIT;

#
# Data for the `ps_quick_access` table  (LIMIT 0,500)
#

INSERT INTO `ps_quick_access` (`id_quick_access`, `new_window`, `link`) VALUES
  (1,0,'index.php'),
  (2,1,'../'),
  (3,0,'index.php?tab=AdminCatalog&addcategory'),
  (4,0,'index.php?tab=AdminCatalog&addproduct'),
  (5,0,'index.php?tab=AdminDiscounts&adddiscount');
COMMIT;

#
# Data for the `ps_quick_access_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_quick_access_lang` (`id_quick_access`, `id_lang`, `name`) VALUES
  (1,1,'Home'),
  (1,6,'Главная'),
  (2,1,'My Shop'),
  (2,6,'Мой магазин'),
  (3,1,'New category'),
  (3,6,'Новая категория'),
  (4,1,'New product'),
  (4,6,'Новый продукт'),
  (5,1,'New voucher'),
  (5,6,'Новый купон');
COMMIT;

#
# Data for the `ps_range_price` table  (LIMIT 0,500)
#

INSERT INTO `ps_range_price` (`id_range_price`, `id_carrier`, `delimiter1`, `delimiter2`) VALUES
  (1,4,0.000000,50000.000000),
  (2,5,0.000000,50000.000000),
  (3,6,0.000000,50000.000000),
  (4,7,0.000000,50000.000000);
COMMIT;

#
# Data for the `ps_range_weight` table  (LIMIT 0,500)
#

INSERT INTO `ps_range_weight` (`id_range_weight`, `id_carrier`, `delimiter1`, `delimiter2`) VALUES
  (1,4,0.000000,10000.000000),
  (2,5,0.000000,10000.000000),
  (3,6,0.000000,10000.000000),
  (4,7,0.000000,10000.000000);
COMMIT;

#
# Data for the `ps_scene` table  (LIMIT 0,500)
#

INSERT INTO `ps_scene` (`id_scene`, `active`) VALUES
  (1,1),
  (2,1),
  (3,1);
COMMIT;

#
# Data for the `ps_scene_category` table  (LIMIT 0,500)
#

INSERT INTO `ps_scene_category` (`id_scene`, `id_category`) VALUES
  (1,2),
  (2,2),
  (3,4);
COMMIT;

#
# Data for the `ps_scene_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_scene_lang` (`id_scene`, `id_lang`, `name`) VALUES
  (1,1,'The iPods Nano'),
  (1,6,'The iPods Nano'),
  (2,1,'The iPods'),
  (2,6,'The iPods'),
  (3,1,'The MacBooks'),
  (3,6,'The MacBooks');
COMMIT;

#
# Data for the `ps_scene_products` table  (LIMIT 0,500)
#

INSERT INTO `ps_scene_products` (`id_scene`, `id_product`, `x_axis`, `y_axis`, `zone_width`, `zone_height`) VALUES
  (1,1,6,12,30,175),
  (1,1,38,12,30,170),
  (1,1,76,14,41,169),
  (1,1,123,13,49,169),
  (1,1,180,13,59,168),
  (1,1,244,14,66,169),
  (1,1,318,14,69,168),
  (1,1,394,14,73,168),
  (1,1,474,15,72,166),
  (2,1,340,31,46,151),
  (2,2,389,137,51,46),
  (2,7,111,83,161,108),
  (3,5,198,47,137,92),
  (3,6,50,47,128,84),
  (3,6,355,37,151,103);
COMMIT;

#
# Data for the `ps_search_engine` table  (LIMIT 0,500)
#

INSERT INTO `ps_search_engine` (`id_search_engine`, `server`, `getvar`) VALUES
  (1,'google','q'),
  (2,'aol','q'),
  (3,'yandex','text'),
  (4,'ask.com','q'),
  (5,'nhl.com','q'),
  (6,'yahoo','p'),
  (7,'baidu','wd'),
  (8,'lycos','query'),
  (9,'exalead','q'),
  (10,'search.live','q'),
  (11,'voila','rdata'),
  (12,'altavista','q'),
  (13,'bing','q'),
  (14,'daum','q'),
  (15,'eniro','search_word'),
  (16,'naver','query'),
  (17,'msn','q'),
  (18,'netscape','query'),
  (19,'cnn','query'),
  (20,'about','terms'),
  (21,'mamma','query'),
  (22,'alltheweb','q'),
  (23,'virgilio','qs'),
  (24,'alice','qs'),
  (25,'najdi','q'),
  (26,'mama','query'),
  (27,'seznam','q'),
  (28,'onet','qt'),
  (29,'szukacz','q'),
  (30,'yam','k'),
  (31,'pchome','q'),
  (32,'kvasir','q'),
  (33,'sesam','q'),
  (34,'ozu','q'),
  (35,'terra','query'),
  (36,'mynet','q'),
  (37,'ekolay','q'),
  (38,'rambler','words');
COMMIT;

#
# Data for the `ps_search_index` table  (LIMIT 0,500)
#

INSERT INTO `ps_search_index` (`id_product`, `id_word`, `weight`) VALUES
  (1,1,14),
  (1,2,14),
  (1,3,2),
  (1,4,1),
  (1,5,1),
  (1,6,1),
  (1,7,1),
  (1,8,1),
  (1,9,1),
  (1,10,2),
  (1,11,1),
  (1,12,1),
  (1,13,1),
  (1,14,1),
  (1,16,2),
  (1,17,1),
  (1,18,1),
  (1,19,1),
  (1,21,1),
  (1,22,1),
  (1,23,1),
  (1,24,1),
  (1,26,1),
  (1,27,1),
  (1,29,1),
  (1,30,1),
  (1,31,2),
  (1,32,1),
  (1,34,1),
  (1,35,1),
  (1,36,1),
  (1,37,1),
  (1,38,5),
  (1,39,1),
  (1,41,1),
  (1,42,1),
  (1,43,1),
  (1,44,1),
  (1,45,1),
  (1,46,1),
  (1,47,2),
  (1,48,1),
  (1,49,1),
  (1,50,1),
  (1,51,2),
  (1,52,2),
  (1,53,1),
  (1,54,1),
  (1,55,1),
  (1,56,1),
  (1,57,1),
  (1,58,1),
  (1,59,1),
  (1,60,1),
  (1,61,1),
  (1,62,1),
  (1,63,1),
  (1,64,1),
  (1,65,1),
  (1,66,1),
  (1,67,3),
  (1,68,3),
  (1,70,4),
  (1,71,16),
  (1,72,4),
  (1,73,4),
  (1,74,4),
  (1,75,4),
  (1,76,4),
  (1,77,4),
  (1,78,4),
  (1,80,2),
  (1,81,2),
  (1,1249,3),
  (1,1250,1),
  (1,1251,1),
  (1,1252,1),
  (1,1253,1),
  (1,1254,2),
  (1,1255,1),
  (1,1256,1),
  (1,1257,1),
  (1,1258,1),
  (1,1259,1),
  (1,1289,1),
  (1,1290,1),
  (1,1291,3),
  (1,1292,3),
  (1,1293,16),
  (1,1329,2),
  (1,1330,2),
  (1,1331,2),
  (1,1332,2),
  (1,1333,10),
  (1,1334,10),
  (1,1335,3),
  (1,1336,2),
  (1,1337,1),
  (1,1338,1),
  (1,1339,1),
  (1,1340,5),
  (1,1341,1),
  (1,1342,1),
  (1,1343,1),
  (1,1344,1),
  (1,1345,1),
  (1,1346,2),
  (1,1347,1),
  (1,1348,5),
  (1,1349,1),
  (1,1350,1),
  (1,1351,1),
  (1,1352,1),
  (1,1353,1),
  (1,1354,2),
  (1,1355,2),
  (1,1356,1),
  (1,1357,1),
  (1,1358,1),
  (1,1359,1),
  (1,1369,2),
  (1,1370,1),
  (1,1371,1),
  (1,1372,1),
  (1,1373,1),
  (1,1374,1),
  (1,1375,1),
  (1,1376,1),
  (1,1377,1),
  (1,1378,1),
  (1,1379,1),
  (1,1380,2),
  (1,1381,1),
  (1,1382,1),
  (1,1383,1),
  (1,1384,1),
  (1,1385,1),
  (1,1386,1),
  (1,1387,1),
  (1,1388,5),
  (1,1389,1),
  (1,1390,1),
  (1,1391,1),
  (1,1392,1),
  (1,1393,1),
  (1,1394,1),
  (1,1395,1),
  (1,1396,1),
  (1,1397,1),
  (1,1398,1),
  (1,1399,1),
  (1,1400,1),
  (1,1401,2),
  (1,1402,2),
  (1,1403,1),
  (1,1404,1),
  (1,1405,1),
  (1,1406,1),
  (1,1407,1),
  (1,1408,1),
  (1,1409,1),
  (1,1410,1),
  (1,1411,1),
  (1,1412,1),
  (1,1413,1),
  (1,1414,1),
  (1,1415,1),
  (1,1416,1),
  (1,1417,3),
  (1,1418,7),
  (1,1419,3),
  (1,1420,3),
  (1,1421,4),
  (1,1422,16),
  (1,1423,16),
  (1,1424,4),
  (1,1425,4),
  (1,1426,4),
  (1,1427,4),
  (1,1428,4),
  (1,1429,4),
  (1,1430,4),
  (1,1431,2),
  (1,1432,2),
  (1,1433,2),
  (1,1434,2),
  (1,1435,2),
  (1,1436,2),
  (2,1,15),
  (2,3,1),
  (2,19,1),
  (2,38,7),
  (2,45,1),
  (2,56,15),
  (2,57,2),
  (2,67,3),
  (2,68,3),
  (2,70,2),
  (2,73,4),
  (2,76,4),
  (2,77,4),
  (2,80,2),
  (2,81,2),
  (2,237,1),
  (2,238,1),
  (2,239,1),
  (2,241,1),
  (2,242,2),
  (2,243,1),
  (2,247,1),
  (2,248,1),
  (2,249,1),
  (2,250,1),
  (2,251,1),
  (2,252,1),
  (2,253,1),
  (2,254,1),
  (2,255,1),
  (2,257,1),
  (2,258,1),
  (2,259,1),
  (2,260,1),
  (2,261,1),
  (2,262,1),
  (2,263,1),
  (2,264,1),
  (2,265,1),
  (2,266,1),
  (2,267,1),
  (2,268,1),
  (2,269,1),
  (2,270,1),
  (2,271,1),
  (2,272,1),
  (2,273,1),
  (2,274,1),
  (2,276,1),
  (2,277,1),
  (2,1249,1),
  (2,1250,3),
  (2,1254,1),
  (2,1291,3),
  (2,1292,3),
  (2,1333,11),
  (2,1335,1),
  (2,1336,1),
  (2,1338,3),
  (2,1340,5),
  (2,1348,3),
  (2,1355,1),
  (2,1358,1),
  (2,1388,7),
  (2,1396,1),
  (2,1406,11),
  (2,1407,2),
  (2,1417,3),
  (2,1418,3),
  (2,1419,3),
  (2,1420,3),
  (2,1421,4),
  (2,1425,2),
  (2,1428,4),
  (2,1429,4),
  (2,1431,2),
  (2,1432,2),
  (2,1539,2),
  (2,1710,1),
  (2,1750,2),
  (2,1751,1),
  (2,1752,1),
  (2,1753,1),
  (2,1754,1),
  (2,1790,2),
  (2,1791,2),
  (2,1792,2),
  (2,1793,2),
  (2,1794,2),
  (2,1795,2),
  (2,1796,1),
  (2,1797,1),
  (2,1798,1),
  (2,1799,1),
  (2,1800,1),
  (2,1801,1),
  (2,1802,2),
  (2,1803,1),
  (2,1804,1),
  (2,1805,1),
  (2,1806,1),
  (2,1807,1),
  (2,1808,1),
  (2,1830,1),
  (2,1831,1),
  (2,1832,1),
  (2,1833,1),
  (2,1834,1),
  (2,1835,1),
  (2,1836,1),
  (2,1837,1),
  (2,1838,1),
  (2,1839,1),
  (2,1840,1),
  (2,1841,1),
  (2,1842,1),
  (2,1843,1),
  (2,1844,1),
  (2,1845,1),
  (2,1846,1),
  (2,1847,1),
  (2,1848,1),
  (2,1849,1),
  (2,1850,1),
  (2,1851,1),
  (2,1852,1),
  (2,1853,1),
  (2,1854,1),
  (2,1855,1),
  (2,1856,1),
  (2,1857,2),
  (2,1858,2),
  (2,1870,2),
  (2,1871,2),
  (2,1872,2),
  (2,1873,2),
  (5,3,1),
  (5,38,1),
  (5,47,1),
  (5,51,2),
  (5,65,1),
  (5,68,3),
  (5,69,3),
  (5,70,8),
  (5,85,1),
  (5,88,1),
  (5,90,2),
  (5,95,2),
  (5,103,2),
  (5,109,1),
  (5,114,1),
  (5,118,1),
  (5,124,2),
  (5,131,2),
  (5,146,7),
  (5,147,3),
  (5,148,8),
  (5,162,1),
  (5,163,1),
  (5,173,11),
  (5,181,2),
  (5,190,1),
  (5,223,3),
  (5,224,3),
  (5,225,8),
  (5,237,2),
  (5,283,2),
  (5,340,2),
  (5,348,1),
  (5,354,1),
  (5,371,1),
  (5,387,10),
  (5,388,1),
  (5,389,1),
  (5,390,1),
  (5,391,1),
  (5,392,1),
  (5,393,1),
  (5,394,1),
  (5,395,1),
  (5,396,1),
  (5,397,1),
  (5,398,2),
  (5,399,1),
  (5,400,1),
  (5,401,1),
  (5,402,2),
  (5,403,2),
  (5,404,1),
  (5,405,1),
  (5,406,1),
  (5,407,1),
  (5,408,1),
  (5,409,1),
  (5,410,1),
  (5,411,1),
  (5,412,1),
  (5,413,1),
  (5,414,1),
  (5,415,1),
  (5,416,1),
  (5,417,1),
  (5,418,1),
  (5,419,2),
  (5,420,1),
  (5,421,1),
  (5,422,1),
  (5,423,1),
  (5,424,1),
  (5,425,1),
  (5,426,1),
  (5,427,1),
  (5,428,1),
  (5,429,1),
  (5,430,1),
  (5,431,1),
  (5,432,1),
  (5,433,1),
  (5,434,1),
  (5,435,1),
  (5,436,1),
  (5,437,1),
  (5,438,2),
  (5,439,1),
  (5,440,1),
  (5,441,1),
  (5,442,1),
  (5,443,1),
  (5,444,1),
  (5,445,9),
  (5,446,1),
  (5,447,1),
  (5,448,1),
  (5,449,1),
  (5,450,1),
  (5,451,1),
  (5,452,1),
  (5,453,1),
  (5,454,1),
  (5,455,1),
  (5,456,1),
  (5,457,1),
  (5,458,1),
  (5,459,1),
  (5,460,1),
  (5,461,1),
  (5,462,1),
  (5,463,1),
  (5,464,1),
  (5,465,1),
  (5,466,1),
  (5,467,1),
  (5,468,1),
  (5,469,1),
  (5,470,1),
  (5,471,1),
  (5,472,1),
  (5,473,1),
  (5,474,1),
  (5,475,1),
  (5,476,1),
  (5,477,3),
  (5,478,4),
  (5,479,4),
  (5,480,4),
  (5,481,4),
  (5,482,8),
  (5,483,8),
  (5,484,4),
  (5,485,4),
  (5,486,4),
  (5,487,4),
  (5,488,14),
  (5,489,3),
  (5,490,1),
  (5,491,1),
  (5,492,1),
  (5,493,1),
  (5,494,1),
  (5,495,1),
  (5,496,1),
  (5,497,1),
  (5,498,1),
  (5,499,2),
  (5,500,3),
  (5,501,1),
  (5,502,1),
  (5,503,1),
  (5,504,2),
  (5,505,2),
  (5,506,1),
  (5,507,1),
  (5,508,1),
  (5,509,1),
  (5,510,1),
  (5,511,1),
  (5,512,1),
  (5,513,1),
  (5,514,1),
  (5,515,1),
  (5,516,1),
  (5,517,1),
  (5,518,1),
  (5,519,1),
  (5,520,1),
  (5,521,1),
  (5,522,1),
  (5,523,5),
  (5,524,1),
  (5,525,1),
  (5,526,1),
  (5,527,2);
COMMIT;

#
# Data for the `ps_search_index` table  (LIMIT 500,500)
#

INSERT INTO `ps_search_index` (`id_product`, `id_word`, `weight`) VALUES
  (5,528,1),
  (5,529,1),
  (5,530,1),
  (5,531,1),
  (5,532,1),
  (5,533,1),
  (5,534,1),
  (5,535,1),
  (5,536,1),
  (5,537,1),
  (5,538,1),
  (5,539,2),
  (5,540,1),
  (5,541,1),
  (5,542,1),
  (5,543,1),
  (5,544,1),
  (5,545,1),
  (5,546,9),
  (5,547,1),
  (5,548,1),
  (5,549,1),
  (5,550,1),
  (5,551,1),
  (5,552,1),
  (5,553,1),
  (5,554,1),
  (5,555,1),
  (5,556,1),
  (5,557,1),
  (5,558,1),
  (5,559,1),
  (5,560,1),
  (5,561,1),
  (5,562,2),
  (5,563,1),
  (5,564,1),
  (5,565,1),
  (5,566,1),
  (5,567,1),
  (5,568,1),
  (5,569,1),
  (5,570,1),
  (5,571,1),
  (5,572,1),
  (5,573,1),
  (5,574,1),
  (5,575,1),
  (5,576,1),
  (5,577,1),
  (5,578,1),
  (5,579,1),
  (5,580,1),
  (5,581,1),
  (5,582,1),
  (5,583,3),
  (5,584,4),
  (5,585,4),
  (5,586,8),
  (5,587,8),
  (5,588,4),
  (5,589,4),
  (5,590,11),
  (5,591,3),
  (5,592,1),
  (5,593,1),
  (5,594,1),
  (5,595,1),
  (5,596,1),
  (5,597,1),
  (5,598,1),
  (5,599,1),
  (5,600,1),
  (5,601,3),
  (5,602,1),
  (5,603,1),
  (5,604,1),
  (5,605,1),
  (5,606,1),
  (5,607,1),
  (5,608,1),
  (5,609,1),
  (5,610,1),
  (5,611,1),
  (5,612,1),
  (5,613,1),
  (5,614,3),
  (5,615,1),
  (5,616,1),
  (5,617,1),
  (5,618,1),
  (5,619,1),
  (5,620,1),
  (5,621,2),
  (5,622,1),
  (5,623,1),
  (5,624,2),
  (5,625,1),
  (5,626,1),
  (5,627,1),
  (5,628,1),
  (5,629,1),
  (5,630,1),
  (5,631,1),
  (5,632,1),
  (5,633,1),
  (5,634,1),
  (5,635,1),
  (5,636,1),
  (5,637,1),
  (5,638,1),
  (5,639,1),
  (5,640,1),
  (5,641,1),
  (5,642,1),
  (5,643,1),
  (5,644,1),
  (5,645,5),
  (5,646,5),
  (5,647,1),
  (5,648,1),
  (5,649,1),
  (5,650,1),
  (5,651,1),
  (5,652,1),
  (5,653,1),
  (5,654,1),
  (5,655,1),
  (5,656,1),
  (5,657,1),
  (5,658,1),
  (5,659,1),
  (5,660,1),
  (5,661,1),
  (5,662,2),
  (5,663,1),
  (5,664,1),
  (5,665,1),
  (5,666,1),
  (5,667,1),
  (5,668,1),
  (5,669,1),
  (5,670,1),
  (5,671,1),
  (5,672,1),
  (5,673,1),
  (5,674,1),
  (5,675,1),
  (5,676,1),
  (5,677,1),
  (5,678,1),
  (5,679,1),
  (5,680,1),
  (5,681,1),
  (5,682,3),
  (5,683,4),
  (5,684,8),
  (5,685,8),
  (5,686,4),
  (5,687,4),
  (6,38,1),
  (6,47,1),
  (6,68,7),
  (6,242,1),
  (6,387,9),
  (6,402,1),
  (6,409,1),
  (6,415,1),
  (6,444,1),
  (6,445,1),
  (6,477,3),
  (6,688,1),
  (6,689,1),
  (6,690,1),
  (6,691,1),
  (6,692,1),
  (6,693,1),
  (6,695,1),
  (6,697,1),
  (6,698,1),
  (6,699,1),
  (6,700,1),
  (6,701,1),
  (6,702,1),
  (6,703,1),
  (6,704,1),
  (6,705,1),
  (6,706,1),
  (6,707,1),
  (6,710,1),
  (6,711,1),
  (6,712,1),
  (6,713,1),
  (6,714,1),
  (6,716,1),
  (6,717,1),
  (6,718,1),
  (6,719,1),
  (6,720,1),
  (6,721,1),
  (6,722,1),
  (6,723,1),
  (6,724,1),
  (6,725,4),
  (6,1204,1),
  (6,1250,1),
  (6,1252,1),
  (6,1291,3),
  (6,1292,3),
  (6,1338,1),
  (6,1340,2),
  (6,1348,3),
  (6,1350,1),
  (6,1369,1),
  (6,1388,1),
  (6,1418,3),
  (6,1419,3),
  (6,1420,3),
  (6,1437,1),
  (6,1438,1),
  (6,1449,1),
  (6,1450,1),
  (6,1451,1),
  (6,1452,1),
  (6,1453,1),
  (6,1489,9),
  (6,1490,1),
  (6,1491,1),
  (6,1492,1),
  (6,1493,1),
  (6,1494,1),
  (6,1495,1),
  (6,1496,1),
  (6,1497,1),
  (6,1498,1),
  (6,1499,1),
  (6,1500,1),
  (6,1501,1),
  (6,1502,1),
  (6,1503,1),
  (6,1504,1),
  (6,1505,1),
  (6,1506,1),
  (6,1507,1),
  (6,1508,1),
  (6,1509,1),
  (6,1510,1),
  (6,1511,1),
  (6,1512,1),
  (6,1513,1),
  (6,1514,1),
  (6,1515,1),
  (6,1516,1),
  (6,1517,1),
  (6,1518,1),
  (6,1519,1),
  (6,1520,1),
  (6,1521,1),
  (6,1529,1),
  (6,1530,1),
  (6,1531,1),
  (6,1532,1),
  (6,1533,1),
  (6,1534,1),
  (6,1535,1),
  (6,1536,1),
  (6,1537,1),
  (6,1538,1),
  (6,1539,1),
  (6,1540,1),
  (6,1541,1),
  (6,1542,1),
  (6,1543,3),
  (7,1,11),
  (7,37,1),
  (7,38,4),
  (7,51,4),
  (7,57,1),
  (7,60,1),
  (7,65,1),
  (7,67,3),
  (7,71,2),
  (7,81,2),
  (7,82,11),
  (7,86,1),
  (7,109,2),
  (7,118,2),
  (7,124,2),
  (7,131,2),
  (7,136,1),
  (7,145,3),
  (7,149,2),
  (7,159,2),
  (7,160,7),
  (7,164,1),
  (7,165,1),
  (7,204,1),
  (7,213,1),
  (7,222,3),
  (7,226,2),
  (7,235,2),
  (7,241,1),
  (7,242,1),
  (7,259,1),
  (7,308,1),
  (7,318,1),
  (7,334,1),
  (7,362,1),
  (7,371,1),
  (7,384,1),
  (7,411,1),
  (7,422,1),
  (7,427,2),
  (7,434,1),
  (7,456,1),
  (7,461,2),
  (7,500,1),
  (7,524,1),
  (7,525,1),
  (7,531,2),
  (7,565,1),
  (7,567,1),
  (7,570,1),
  (7,576,1),
  (7,606,1),
  (7,615,2),
  (7,621,3),
  (7,622,1),
  (7,628,2),
  (7,665,2),
  (7,700,1),
  (7,722,1),
  (7,723,1),
  (7,734,1),
  (7,757,1),
  (7,764,1),
  (7,765,1),
  (7,788,12),
  (7,789,2),
  (7,790,1),
  (7,791,2),
  (7,792,1),
  (7,793,2),
  (7,794,1),
  (7,795,1),
  (7,796,1),
  (7,797,1),
  (7,798,1),
  (7,799,1),
  (7,800,1),
  (7,801,1),
  (7,802,1),
  (7,803,1),
  (7,804,1),
  (7,805,1),
  (7,806,1),
  (7,807,1),
  (7,808,1),
  (7,809,1),
  (7,810,1),
  (7,811,1),
  (7,812,1),
  (7,813,1),
  (7,814,1),
  (7,815,1),
  (7,816,1),
  (7,817,1),
  (7,818,1),
  (7,819,1),
  (7,820,1),
  (7,821,1),
  (7,822,1),
  (7,823,1),
  (7,824,1),
  (7,825,1),
  (7,826,1),
  (7,827,1),
  (7,828,1),
  (7,829,1),
  (7,830,1),
  (7,831,1),
  (7,832,1),
  (7,833,1),
  (7,834,1),
  (7,835,1),
  (7,836,1),
  (7,837,1),
  (7,838,1),
  (7,839,1),
  (7,840,1),
  (7,841,1),
  (7,842,1),
  (7,843,1),
  (7,844,1),
  (7,845,1),
  (7,846,2),
  (7,847,1),
  (7,848,1),
  (7,849,1),
  (7,850,1),
  (7,851,1),
  (7,852,1),
  (7,853,1),
  (7,854,1),
  (7,855,1),
  (7,856,1),
  (7,857,1),
  (7,858,2),
  (7,859,2),
  (7,860,2),
  (7,861,2),
  (7,862,2),
  (7,863,11),
  (7,864,1),
  (7,865,2),
  (7,866,1),
  (7,867,1),
  (7,868,1),
  (7,869,1),
  (7,870,1),
  (7,871,1),
  (7,872,1),
  (7,873,1),
  (7,874,2),
  (7,875,1),
  (7,876,1),
  (7,877,2),
  (7,878,6),
  (7,879,3),
  (7,880,1),
  (7,881,1),
  (7,882,1),
  (7,883,2),
  (7,884,1),
  (7,885,2),
  (7,886,1),
  (7,887,1),
  (7,888,1),
  (7,889,1),
  (7,890,1),
  (7,891,1),
  (7,892,1),
  (7,893,1),
  (7,894,1),
  (7,895,1),
  (7,896,1),
  (7,897,1),
  (7,898,1),
  (7,899,1),
  (7,900,1),
  (7,901,1),
  (7,902,1),
  (7,903,1),
  (7,904,1),
  (7,905,1),
  (7,906,1),
  (7,907,1),
  (7,908,1),
  (7,909,1),
  (7,910,1),
  (7,911,1),
  (7,912,1),
  (7,913,1),
  (7,914,1),
  (7,915,1),
  (7,916,2),
  (7,917,1),
  (7,918,1),
  (7,919,1),
  (7,920,1),
  (7,921,1),
  (7,922,1),
  (7,923,1),
  (7,924,1),
  (7,925,1),
  (7,926,1),
  (7,927,1),
  (7,928,1),
  (7,929,1),
  (7,930,1),
  (7,931,1),
  (7,932,1),
  (7,933,1),
  (7,934,1),
  (7,935,1),
  (7,936,1),
  (7,937,1),
  (7,938,1),
  (7,939,1),
  (7,940,1),
  (7,941,1),
  (7,942,1),
  (7,943,1),
  (7,944,1),
  (7,945,1),
  (7,946,1),
  (7,947,1),
  (7,948,1),
  (7,949,1),
  (7,950,4);
COMMIT;

#
# Data for the `ps_search_index` table  (LIMIT 1000,500)
#

INSERT INTO `ps_search_index` (`id_product`, `id_word`, `weight`) VALUES
  (7,951,2),
  (7,952,2),
  (7,953,2),
  (7,954,2),
  (7,955,2),
  (7,956,7),
  (7,957,1),
  (7,958,2),
  (7,959,1),
  (7,960,2),
  (7,961,1),
  (7,962,1),
  (7,963,2),
  (7,964,1),
  (7,965,1),
  (7,966,1),
  (7,967,1),
  (7,968,2),
  (7,969,1),
  (7,970,1),
  (7,971,2),
  (7,972,1),
  (7,973,1),
  (7,974,2),
  (7,975,1),
  (7,976,2),
  (7,977,1),
  (7,978,1),
  (7,979,1),
  (7,980,1),
  (7,981,1),
  (7,982,1),
  (7,983,1),
  (7,984,1),
  (7,985,1),
  (7,986,1),
  (7,987,1),
  (7,988,1),
  (7,989,1),
  (7,990,1),
  (7,991,2),
  (7,992,1),
  (7,993,1),
  (7,994,1),
  (7,995,1),
  (7,996,1),
  (7,997,1),
  (7,998,1),
  (7,999,1),
  (7,1000,1),
  (7,1001,1),
  (7,1002,2),
  (7,1003,2),
  (7,1004,4),
  (7,1005,2),
  (7,1006,1),
  (7,1007,1),
  (7,1008,1),
  (7,1009,1),
  (7,1010,1),
  (7,1011,1),
  (7,1012,1),
  (7,1013,1),
  (7,1014,1),
  (7,1015,1),
  (7,1016,1),
  (7,1017,1),
  (7,1018,1),
  (7,1019,1),
  (7,1020,1),
  (7,1021,1),
  (7,1022,1),
  (7,1023,1),
  (7,1024,1),
  (7,1025,1),
  (7,1026,1),
  (7,1027,1),
  (7,1028,1),
  (7,1029,1),
  (7,1030,1),
  (7,1031,1),
  (7,1032,1),
  (7,1033,1),
  (7,1034,2),
  (7,1035,2),
  (7,1036,2),
  (7,1037,2),
  (7,1038,2),
  (8,1,6),
  (8,2,6),
  (8,82,1),
  (8,109,1),
  (8,118,3),
  (8,124,1),
  (8,152,6),
  (8,160,1),
  (8,163,1),
  (8,229,6),
  (8,570,1),
  (8,669,1),
  (8,730,1),
  (8,762,1),
  (8,882,1),
  (8,926,1),
  (8,944,1),
  (8,1013,1),
  (8,1023,1),
  (8,1025,1),
  (8,1039,6),
  (8,1040,6),
  (8,1041,6),
  (8,1042,6),
  (8,1043,6),
  (8,1044,6),
  (8,1045,6),
  (8,1046,2),
  (8,1047,2),
  (8,1048,3),
  (8,1049,6),
  (8,1050,6),
  (8,1051,8),
  (8,1052,6),
  (8,1053,6),
  (8,1054,6),
  (8,1055,1),
  (8,1056,1),
  (8,1057,1),
  (8,1058,1),
  (8,1059,1),
  (8,1060,1),
  (8,1061,1),
  (8,1062,1),
  (8,1063,1),
  (8,1064,1),
  (8,1065,1),
  (8,1066,1),
  (8,1067,1),
  (8,1068,1),
  (8,1069,1),
  (8,1070,1),
  (8,1071,1),
  (8,1072,2),
  (8,1073,1),
  (8,1074,1),
  (8,1075,1),
  (8,1076,1),
  (8,1077,1),
  (8,1078,1),
  (8,1079,3),
  (8,1080,6),
  (8,1081,6),
  (8,1082,6),
  (8,1083,6),
  (8,1084,6),
  (8,1085,1),
  (8,1086,2),
  (8,1087,1),
  (8,1088,1),
  (8,1089,1),
  (8,1090,1),
  (8,1091,1),
  (8,1092,1),
  (8,1093,1),
  (8,1094,1),
  (8,1095,1),
  (8,1096,1),
  (8,1097,1),
  (8,1098,1),
  (8,1099,1),
  (8,1100,1),
  (8,1101,1),
  (8,1102,1),
  (8,1103,1),
  (8,1104,1),
  (8,1105,2),
  (8,1106,1),
  (8,1107,1),
  (8,1108,1),
  (8,1109,1),
  (8,1110,1),
  (8,1111,1),
  (8,1112,1),
  (8,1113,3),
  (9,1,8),
  (9,3,3),
  (9,4,1),
  (9,20,1),
  (9,22,1),
  (9,38,2),
  (9,41,1),
  (9,47,2),
  (9,51,5),
  (9,68,2),
  (9,81,1),
  (9,85,1),
  (9,90,2),
  (9,95,7),
  (9,103,1),
  (9,109,7),
  (9,118,2),
  (9,131,3),
  (9,136,2),
  (9,159,1),
  (9,163,1),
  (9,173,11),
  (9,181,1),
  (9,191,1),
  (9,213,2),
  (9,238,2),
  (9,299,1),
  (9,319,1),
  (9,330,1),
  (9,354,2),
  (9,356,2),
  (9,381,1),
  (9,430,1),
  (9,442,4),
  (9,448,1),
  (9,499,1),
  (9,500,1),
  (9,505,2),
  (9,523,1),
  (9,544,1),
  (9,553,2),
  (9,562,1),
  (9,570,1),
  (9,583,1),
  (9,593,1),
  (9,601,1),
  (9,606,7),
  (9,610,1),
  (9,631,1),
  (9,635,1),
  (9,653,3),
  (9,654,1),
  (9,658,2),
  (9,660,1),
  (9,662,1),
  (9,669,1),
  (9,730,1),
  (9,762,1),
  (9,764,2),
  (9,786,1),
  (9,805,1),
  (9,826,1),
  (9,840,1),
  (9,845,1),
  (9,850,8),
  (9,851,4),
  (9,889,1),
  (9,910,1),
  (9,918,1),
  (9,931,1),
  (9,938,1),
  (9,940,1),
  (9,941,1),
  (9,942,17),
  (9,943,7),
  (9,973,1),
  (9,1021,1),
  (9,1022,1),
  (9,1023,3),
  (9,1024,12),
  (9,1048,3),
  (9,1055,3),
  (9,1065,1),
  (9,1079,3),
  (9,1099,1),
  (9,1103,1),
  (9,1113,3),
  (9,1114,11),
  (9,1115,9),
  (9,1116,7),
  (9,1117,8),
  (9,1118,1),
  (9,1119,1),
  (9,1120,1),
  (9,1121,1),
  (9,1122,1),
  (9,1123,1),
  (9,1124,2),
  (9,1125,1),
  (9,1126,1),
  (9,1127,2),
  (9,1128,3),
  (9,1129,1),
  (9,1130,1),
  (9,1131,1),
  (9,1132,1),
  (9,1133,3),
  (9,1134,1),
  (9,1135,1),
  (9,1136,1),
  (9,1137,1),
  (9,1138,1),
  (9,1139,1),
  (9,1140,1),
  (9,1141,1),
  (9,1142,1),
  (9,1143,1),
  (9,1144,1),
  (9,1145,2),
  (9,1146,1),
  (9,1147,1),
  (9,1148,1),
  (9,1149,1),
  (9,1150,1),
  (9,1151,1),
  (9,1152,1),
  (9,1153,1),
  (9,1154,1),
  (9,1155,1),
  (9,1156,1),
  (9,1157,1),
  (9,1158,2),
  (9,1159,1),
  (9,1160,1),
  (9,1161,1),
  (9,1162,1),
  (9,1163,1),
  (9,1164,1),
  (9,1165,1),
  (9,1166,1),
  (9,1167,1),
  (9,1168,1),
  (9,1169,1),
  (9,1170,1),
  (9,1171,1),
  (9,1172,1),
  (9,1173,1),
  (9,1174,1),
  (9,1175,1),
  (9,1176,1),
  (9,1177,1),
  (9,1178,1),
  (9,1179,1),
  (9,1180,1),
  (9,1181,1),
  (9,1182,1),
  (9,1183,1),
  (9,1184,1),
  (9,1185,1),
  (9,1186,1),
  (9,1187,1),
  (9,1188,1),
  (9,1189,1),
  (9,1190,1),
  (9,1191,2),
  (9,1192,2),
  (9,1193,1),
  (9,1194,3),
  (9,1195,3),
  (9,1196,2),
  (9,1197,2),
  (9,1198,2),
  (9,1199,1),
  (9,1200,1),
  (9,1201,1),
  (9,1202,1),
  (9,1203,1),
  (9,1204,1),
  (9,1205,2),
  (9,1206,1),
  (9,1207,2),
  (9,1208,1),
  (9,1209,1),
  (9,1210,2),
  (9,1211,1),
  (9,1212,1),
  (9,1213,1),
  (9,1214,1),
  (9,1215,1),
  (9,1216,1),
  (9,1217,1),
  (9,1218,1),
  (9,1219,4),
  (9,1220,2),
  (9,1221,1),
  (9,1222,1),
  (9,1223,1),
  (9,1224,1),
  (9,1225,1),
  (9,1226,1),
  (9,1227,1),
  (9,1228,1),
  (9,1229,1),
  (9,1230,1),
  (9,1231,1),
  (9,1232,1),
  (9,1233,1),
  (9,1234,1),
  (9,1235,2),
  (9,1236,1),
  (9,1237,1),
  (9,1238,1),
  (9,1239,1),
  (9,1240,1),
  (9,1241,1),
  (9,1242,1),
  (9,1243,1),
  (9,1244,1),
  (9,1245,1),
  (9,1246,1),
  (9,1247,1),
  (9,1248,3),
  (9,1249,13),
  (9,1250,13),
  (9,1251,11),
  (9,1252,11),
  (9,1253,1),
  (9,1254,2),
  (9,1255,1),
  (9,1256,1),
  (9,1257,5),
  (9,1258,1),
  (9,1259,1),
  (9,1260,1),
  (9,1261,1),
  (9,1262,1),
  (9,1263,1),
  (9,1264,1),
  (9,1265,1),
  (9,1266,1),
  (9,1267,1),
  (9,1268,1),
  (9,1269,1),
  (9,1270,2),
  (9,1271,1),
  (9,1272,1),
  (9,1273,1),
  (9,1274,1),
  (9,1275,1),
  (9,1276,3),
  (9,1277,2),
  (9,1278,1),
  (9,1279,2),
  (9,1280,1),
  (9,1281,4),
  (9,1282,1),
  (9,1283,1),
  (9,1284,1),
  (9,1285,1),
  (9,1286,1),
  (9,1287,1),
  (9,1288,3),
  (9,1289,1),
  (9,1290,1),
  (9,1291,1),
  (9,1292,1),
  (9,1293,1),
  (9,1294,1),
  (9,1295,1),
  (9,1296,1),
  (9,1297,1),
  (9,1298,1),
  (9,1299,1),
  (9,1300,1),
  (9,1301,1),
  (9,1302,1),
  (9,1303,2),
  (9,1304,2),
  (9,1305,2),
  (9,1306,1),
  (9,1307,2),
  (9,1308,1),
  (9,1309,1),
  (9,1310,1),
  (9,1311,1),
  (9,1312,2),
  (9,1313,1),
  (9,1314,1),
  (9,1315,1),
  (9,1316,4),
  (9,1317,1),
  (9,1318,1),
  (9,1319,1),
  (9,1320,1),
  (9,1321,1),
  (9,1322,1),
  (9,1323,1),
  (9,1324,3),
  (9,1325,3),
  (9,1326,2),
  (9,1327,1),
  (9,1328,1),
  (9,1329,1),
  (9,1330,1),
  (9,1331,1),
  (9,1332,1),
  (9,1333,1),
  (9,1334,1),
  (9,1335,1),
  (9,1336,1),
  (9,1337,1),
  (9,1338,1),
  (9,1339,1),
  (9,1340,1),
  (9,1341,1),
  (9,1342,1),
  (9,1343,1);
COMMIT;

#
# Data for the `ps_search_index` table  (LIMIT 1500,500)
#

INSERT INTO `ps_search_index` (`id_product`, `id_word`, `weight`) VALUES
  (9,1344,1),
  (9,1345,1),
  (9,1346,1),
  (9,1347,1),
  (9,1348,1),
  (9,1349,1),
  (9,1350,1),
  (9,1351,1),
  (9,1352,1),
  (9,1353,1),
  (9,1354,1),
  (9,1355,1),
  (9,1356,1),
  (9,1357,1),
  (9,1358,1),
  (9,1359,1),
  (9,1360,1),
  (9,1361,1),
  (9,1362,1),
  (9,1363,1),
  (9,1364,1),
  (9,1365,2),
  (9,1366,1),
  (9,1367,2),
  (9,1368,1),
  (9,1369,1),
  (9,1370,1),
  (9,1371,1),
  (9,1372,2),
  (9,1373,1),
  (9,1374,1),
  (9,1375,1),
  (9,1376,1),
  (9,1377,2),
  (9,1378,1),
  (9,1379,1),
  (9,1380,1),
  (9,1381,1),
  (9,1382,1),
  (9,1383,1),
  (9,1384,2),
  (9,1385,1),
  (9,1386,2),
  (9,1387,1),
  (9,1388,1),
  (9,1389,1),
  (9,1390,1),
  (9,1391,1),
  (9,1392,1),
  (9,1393,1),
  (9,1394,1),
  (9,1395,1),
  (9,1396,1),
  (9,1397,1),
  (9,1398,1),
  (9,1399,1),
  (9,1400,1),
  (9,1401,1),
  (9,1402,1),
  (9,1403,3),
  (9,1404,4),
  (9,1405,4),
  (9,1406,6),
  (9,1407,6),
  (9,1408,12),
  (9,1409,11),
  (9,1410,9),
  (9,1411,1),
  (9,1412,2),
  (9,1413,1),
  (9,1414,1),
  (9,1415,1),
  (9,1416,1),
  (9,1417,1),
  (9,1418,5),
  (9,1419,1),
  (9,1420,1),
  (9,1421,1),
  (9,1422,1),
  (9,1423,1),
  (9,1424,3),
  (9,1425,1),
  (9,1426,1),
  (9,1427,1),
  (9,1428,1),
  (9,1429,1),
  (9,1430,2),
  (9,1431,1),
  (9,1432,2),
  (9,1433,1),
  (9,1434,1),
  (9,1435,2),
  (9,1436,1),
  (9,1437,3),
  (9,1438,2),
  (9,1439,1),
  (9,1440,3),
  (9,1441,6),
  (9,1442,5),
  (9,1443,1),
  (9,1444,1),
  (9,1445,2),
  (9,1446,1),
  (9,1447,1),
  (9,1448,1),
  (9,1449,3),
  (9,1450,1),
  (9,1451,1),
  (9,1452,1),
  (9,1453,1),
  (9,1454,1),
  (9,1455,1),
  (9,1456,1),
  (9,1457,1),
  (9,1458,1),
  (9,1459,1),
  (9,1460,1),
  (9,1461,1),
  (9,1462,1),
  (9,1463,1),
  (9,1464,2),
  (9,1465,2),
  (9,1466,2),
  (9,1467,1),
  (9,1468,2),
  (9,1469,2),
  (9,1470,1),
  (9,1471,2),
  (9,1472,1),
  (9,1473,1),
  (9,1474,2),
  (9,1475,1),
  (9,1476,1),
  (9,1477,4),
  (9,1478,1),
  (9,1479,1),
  (9,1480,1),
  (9,1481,3),
  (9,1482,3),
  (9,1483,2),
  (9,1484,1),
  (9,1485,1),
  (9,1486,1),
  (9,1487,1),
  (9,1488,2),
  (9,1489,1),
  (9,1490,1),
  (9,1491,1),
  (9,1492,1),
  (9,1493,1),
  (9,1494,1),
  (9,1495,1),
  (9,1496,1),
  (9,1497,1),
  (9,1498,1),
  (9,1499,1),
  (9,1500,1),
  (9,1501,1),
  (9,1502,1),
  (9,1503,1),
  (9,1504,1),
  (9,1505,1),
  (9,1506,1),
  (9,1507,1),
  (9,1508,1),
  (9,1509,1),
  (9,1510,1),
  (9,1511,1),
  (9,1512,1),
  (9,1513,1),
  (9,1514,1),
  (9,1515,1),
  (9,1516,1),
  (9,1517,2),
  (9,1518,1),
  (9,1519,1),
  (9,1520,1),
  (9,1521,1),
  (9,1522,1),
  (9,1523,1),
  (9,1524,1),
  (9,1525,1),
  (9,1526,1),
  (9,1527,2),
  (9,1528,1),
  (9,1529,1),
  (9,1530,1),
  (9,1531,1),
  (9,1532,2),
  (9,1533,1),
  (9,1534,2),
  (9,1535,1),
  (9,1536,1),
  (9,1537,1),
  (9,1538,1),
  (9,1539,1),
  (9,1540,1),
  (9,1541,1),
  (9,1542,1),
  (9,1543,1),
  (9,1544,1),
  (9,1545,1),
  (9,1546,1),
  (9,1547,1),
  (9,1548,1),
  (9,1549,1),
  (9,1550,1),
  (9,1551,1),
  (9,1552,3);
COMMIT;

#
# Data for the `ps_search_word` table  (LIMIT 0,500)
#

INSERT INTO `ps_search_word` (`id_word`, `id_lang`, `word`) VALUES
  (1,1,'ipod'),
  (2,1,'nano'),
  (3,1,'design'),
  (4,1,'features'),
  (5,1,'16gb'),
  (6,1,'rocks'),
  (7,1,'like'),
  (8,1,'never'),
  (9,1,'before'),
  (10,1,'curved'),
  (11,1,'ahead'),
  (12,1,'curve'),
  (13,1,'those'),
  (14,1,'about'),
  (16,1,'give'),
  (17,1,'nine'),
  (18,1,'amazing'),
  (19,1,'colors'),
  (20,1,'that''s'),
  (21,1,'only'),
  (22,1,'part'),
  (23,1,'story'),
  (24,1,'feel'),
  (26,1,'allaluminum'),
  (27,1,'glass'),
  (29,1,'want'),
  (30,1,'down'),
  (31,1,'great'),
  (32,1,'looks'),
  (34,1,'genius'),
  (35,1,'feature'),
  (36,1,'turns'),
  (37,1,'into'),
  (38,1,'your'),
  (39,1,'highly'),
  (41,1,'personal'),
  (42,1,'creates'),
  (43,1,'playlists'),
  (44,1,'finding'),
  (45,1,'songs'),
  (46,1,'library'),
  (47,1,'that'),
  (48,1,'together'),
  (49,1,'made'),
  (50,1,'move'),
  (51,1,'with'),
  (52,1,'moves'),
  (53,1,'accelerometer'),
  (54,1,'comes'),
  (55,1,'shake'),
  (56,1,'shuffle'),
  (57,1,'music'),
  (58,1,'turn'),
  (59,1,'sideways'),
  (60,1,'view'),
  (61,1,'cover'),
  (62,1,'flow'),
  (63,1,'play'),
  (64,1,'games'),
  (65,1,'designed'),
  (66,1,'mind'),
  (67,1,'ipods'),
  (68,1,'apple'),
  (69,1,'computer,'),
  (70,1,'metal'),
  (71,1,'16go'),
  (72,1,'yellow'),
  (73,1,'blue'),
  (74,1,'black'),
  (75,1,'orange'),
  (76,1,'pink'),
  (77,1,'green'),
  (78,1,'purple'),
  (80,1,'minijack'),
  (81,1,'stereo'),
  (237,1,'world'),
  (238,1,'most'),
  (239,1,'wearable'),
  (241,1,'clips'),
  (242,1,'more'),
  (243,1,'vibrant'),
  (247,1,'instant'),
  (248,1,'attachment'),
  (249,1,'wear'),
  (250,1,'sleeve'),
  (251,1,'belt'),
  (252,1,'shorts'),
  (253,1,'badge'),
  (254,1,'musical'),
  (255,1,'devotion'),
  (257,1,'brilliant'),
  (258,1,'feed'),
  (259,1,'itunes'),
  (260,1,'entertainment'),
  (261,1,'superstore'),
  (262,1,'ultraorganized'),
  (263,1,'collection'),
  (264,1,'jukebox'),
  (265,1,'load'),
  (266,1,'click'),
  (267,1,'beauty'),
  (268,1,'beat'),
  (269,1,'intensely'),
  (270,1,'colorful'),
  (271,1,'anodized'),
  (272,1,'aluminum'),
  (273,1,'complements'),
  (274,1,'simple'),
  (276,1,'original'),
  (277,1,'silver'),
  (387,1,'macbook'),
  (388,1,'ultrathin,'),
  (389,1,'ultraportable,'),
  (390,1,'ultra'),
  (391,1,'unlike'),
  (392,1,'anything'),
  (393,1,'else'),
  (394,1,'lose'),
  (395,1,'inches'),
  (396,1,'pounds'),
  (397,1,'overnight'),
  (398,1,'result'),
  (399,1,'rethinking'),
  (400,1,'conventions'),
  (401,1,'multiple'),
  (402,1,'wireless'),
  (403,1,'innovations'),
  (404,1,'breakthrough'),
  (405,1,'air,'),
  (406,1,'mobile'),
  (407,1,'computing'),
  (408,1,'suddenly'),
  (409,1,'standard'),
  (410,1,'nearly'),
  (411,1,'thin'),
  (412,1,'index'),
  (413,1,'finger'),
  (414,1,'practically'),
  (415,1,'every'),
  (416,1,'detail'),
  (417,1,'could'),
  (418,1,'streamlined'),
  (419,1,'been'),
  (420,1,'still'),
  (421,1,'133inch'),
  (422,1,'widescreen'),
  (423,1,'display,'),
  (424,1,'fullsize'),
  (425,1,'keyboard,'),
  (426,1,'large'),
  (427,1,'multitouch'),
  (428,1,'trackpad'),
  (429,1,'incomparably'),
  (430,1,'portable'),
  (431,1,'without'),
  (432,1,'usual'),
  (433,1,'ultraportable'),
  (434,1,'screen'),
  (435,1,'keyboard'),
  (436,1,'compromisesthe'),
  (437,1,'incredible'),
  (438,1,'thinness'),
  (439,1,'numerous'),
  (440,1,'size'),
  (441,1,'weightshaving'),
  (442,1,'from'),
  (443,1,'slimmer'),
  (444,1,'hard'),
  (445,1,'drive'),
  (446,1,'strategically'),
  (447,1,'hidden'),
  (448,1,'ports'),
  (449,1,'lowerprofile'),
  (450,1,'battery,'),
  (451,1,'everything'),
  (452,1,'considered'),
  (453,1,'reconsidered'),
  (454,1,'mindmacbook'),
  (455,1,'engineered'),
  (456,1,'take'),
  (457,1,'full'),
  (458,1,'advantage'),
  (459,1,'which'),
  (460,1,'80211n'),
  (461,1,'wifi'),
  (462,1,'fast'),
  (463,1,'available,'),
  (464,1,'people'),
  (465,1,'truly'),
  (466,1,'living'),
  (467,1,'untethered'),
  (468,1,'buying'),
  (469,1,'renting'),
  (470,1,'movies'),
  (471,1,'online,'),
  (472,1,'downloading'),
  (473,1,'software,'),
  (474,1,'sharing'),
  (475,1,'storing'),
  (476,1,'files'),
  (477,1,'laptops'),
  (478,1,'80gb'),
  (479,1,'parallel'),
  (480,1,'4200'),
  (481,1,'160ghz'),
  (482,1,'intel'),
  (483,1,'core'),
  (484,1,'optional'),
  (485,1,'64gb'),
  (486,1,'solidstate'),
  (487,1,'180ghz'),
  (688,1,'makes'),
  (689,1,'easy'),
  (690,1,'road'),
  (691,1,'thanks'),
  (692,1,'tough'),
  (693,1,'polycarbonate'),
  (695,1,'builtin'),
  (697,1,'innovative'),
  (698,1,'magsafe'),
  (699,1,'power'),
  (700,1,'adapter'),
  (701,1,'releases'),
  (702,1,'automatically'),
  (703,1,'someone'),
  (704,1,'accidentally'),
  (705,1,'trips'),
  (706,1,'cord'),
  (707,1,'larger'),
  (710,1,'store'),
  (711,1,'growing'),
  (712,1,'media'),
  (713,1,'collections'),
  (714,1,'valuable'),
  (716,1,'24ghz'),
  (717,1,'models'),
  (718,1,'include'),
  (719,1,'memory'),
  (720,1,'perfect'),
  (721,1,'running'),
  (722,1,'favorite'),
  (723,1,'applications'),
  (724,1,'smoothly'),
  (725,1,'superdrive'),
  (788,1,'touch'),
  (789,1,'revolutionary'),
  (790,1,'interface'),
  (791,1,'35inch'),
  (792,1,'color'),
  (793,1,'display'),
  (794,1,'(80211b'),
  (795,1,'safari,'),
  (796,1,'youtube,'),
  (797,1,'mail,'),
  (798,1,'stocks,'),
  (799,1,'weather,'),
  (800,1,'notes,'),
  (801,1,'store,'),
  (802,1,'maps'),
  (803,1,'five'),
  (804,1,'handson'),
  (805,1,'rich'),
  (806,1,'html'),
  (807,1,'email'),
  (808,1,'photos'),
  (809,1,'well'),
  (810,1,'pdf,'),
  (811,1,'word,'),
  (812,1,'excel'),
  (813,1,'attachments'),
  (814,1,'maps,'),
  (815,1,'directions,'),
  (816,1,'realtime'),
  (817,1,'traffic'),
  (818,1,'information'),
  (819,1,'notes'),
  (820,1,'read'),
  (821,1,'stock'),
  (822,1,'weather'),
  (823,1,'reports'),
  (824,1,'music,'),
  (825,1,'movies,'),
  (826,1,'technology'),
  (827,1,'built'),
  (828,1,'gorgeous'),
  (829,1,'lets'),
  (830,1,'pinch,'),
  (831,1,'zoom,'),
  (832,1,'scroll,'),
  (833,1,'flick'),
  (834,1,'fingers'),
  (835,1,'internet'),
  (836,1,'pocket'),
  (837,1,'safari'),
  (838,1,'browser,'),
  (839,1,'websites'),
  (840,1,'they'),
  (841,1,'were'),
  (842,1,'seen'),
  (843,1,'zoom'),
  (844,1,'tap2'),
  (845,1,'home'),
  (846,1,'quick'),
  (847,1,'access'),
  (848,1,'sites'),
  (849,1,'what''s'),
  (850,1,'earphones'),
  (851,1,'cable'),
  (852,1,'dock'),
  (853,1,'polishing'),
  (854,1,'cloth'),
  (855,1,'stand'),
  (856,1,'start'),
  (857,1,'guide'),
  (858,1,'32go'),
  (859,1,'jack'),
  (860,1,'120g'),
  (861,1,'70mm'),
  (862,1,'110mm'),
  (1039,1,'housse'),
  (1040,1,'portefeuille'),
  (1041,1,'cuir'),
  (1042,1,'belkin'),
  (1043,1,'pour'),
  (1044,1,'noir'),
  (1045,1,'chocolat'),
  (1046,1,'lorem'),
  (1047,1,'ipsum'),
  (1048,1,'accessories'),
  (1114,1,'shure'),
  (1115,1,'se210'),
  (1116,1,'soundisolating'),
  (1117,1,'iphone'),
  (1118,1,'evolved'),
  (1119,1,'monitor'),
  (1120,1,'roadtested'),
  (1121,1,'musicians'),
  (1122,1,'perfected'),
  (1123,1,'engineers,'),
  (1124,1,'lightweight'),
  (1125,1,'stylish'),
  (1126,1,'delivers'),
  (1127,1,'fullrange'),
  (1128,1,'audio'),
  (1129,1,'free'),
  (1130,1,'outside'),
  (1131,1,'noise'),
  (1132,1,'using'),
  (1133,1,'hidefinition'),
  (1134,1,'microspeakers'),
  (1135,1,'deliver'),
  (1136,1,'audio,'),
  (1137,1,'ergonomic'),
  (1138,1,'ideal'),
  (1139,1,'premium'),
  (1140,1,'onthego'),
  (1141,1,'listening'),
  (1142,1,'offer'),
  (1143,1,'accurate'),
  (1144,1,'reproduction'),
  (1145,1,'both'),
  (1146,1,'sourcesfor'),
  (1147,1,'ultimate'),
  (1148,1,'precision'),
  (1149,1,'highs'),
  (1150,1,'addition,'),
  (1151,1,'flexible'),
  (1152,1,'allows'),
  (1153,1,'choose'),
  (1154,1,'comfortable'),
  (1155,1,'variety'),
  (1156,1,'wearing'),
  (1157,1,'positions'),
  (1158,1,'microspeaker'),
  (1159,1,'single'),
  (1160,1,'balanced'),
  (1161,1,'armature'),
  (1162,1,'driver'),
  (1163,1,'detachable,'),
  (1164,1,'modular'),
  (1165,1,'make'),
  (1166,1,'longer'),
  (1167,1,'shorter'),
  (1168,1,'depending'),
  (1169,1,'activity'),
  (1170,1,'connector'),
  (1171,1,'compatible'),
  (1172,1,'earphone'),
  (1173,1,'specifications'),
  (1174,1,'speaker'),
  (1175,1,'type'),
  (1176,1,'frequency'),
  (1177,1,'range'),
  (1178,1,'25hz185khz'),
  (1179,1,'impedance'),
  (1180,1,'(1khz)'),
  (1181,1,'ohms'),
  (1182,1,'sensitivity'),
  (1183,1,'(1mw)'),
  (1184,1,'length'),
  (1185,1,'(with'),
  (1186,1,'extension)'),
  (1187,1,'(540'),
  (1188,1,'1371'),
  (1189,1,'extension'),
  (1190,1,'(360'),
  (1191,1,'three'),
  (1192,1,'pairs'),
  (1193,1,'foam'),
  (1194,1,'earpiece'),
  (1195,1,'sleeves'),
  (1196,1,'(small,'),
  (1197,1,'medium,'),
  (1198,1,'large)'),
  (1199,1,'soft'),
  (1200,1,'flex'),
  (1201,1,'pair'),
  (1202,1,'tripleflange'),
  (1203,1,'carrying'),
  (1204,1,'case'),
  (1205,1,'warranty'),
  (1206,1,'twoyear'),
  (1207,1,'limited'),
  (1208,1,'(for'),
  (1209,1,'details,'),
  (1210,1,'please'),
  (1211,1,'visit'),
  (1212,1,'wwwshurecom'),
  (1213,1,'personalaudio'),
  (1214,1,'customersupport'),
  (1215,1,'productreturnsa'),
  (1216,1,'indexhtm)'),
  (1217,1,'se210aefs'),
  (1218,1,'note'),
  (1219,1,'products'),
  (1220,1,'sold'),
  (1221,1,'through'),
  (1222,1,'this'),
  (1223,1,'website'),
  (1224,1,'bear'),
  (1225,1,'brand'),
  (1226,1,'name'),
  (1227,1,'serviced'),
  (1228,1,'supported'),
  (1229,1,'exclusively'),
  (1230,1,'their'),
  (1231,1,'manufacturers'),
  (1232,1,'accordance'),
  (1233,1,'terms'),
  (1234,1,'conditions'),
  (1235,1,'packaged'),
  (1236,1,'apple''s'),
  (1237,1,'does'),
  (1238,1,'apply'),
  (1239,1,'applebranded,'),
  (1240,1,'even'),
  (1241,1,'contact'),
  (1242,1,'manufacturer'),
  (1243,1,'directly'),
  (1244,1,'technical'),
  (1245,1,'support'),
  (1246,1,'customer'),
  (1247,1,'service'),
  (1248,1,'incorporated'),
  (1249,1,'new'),
  (1250,1,'now'),
  (1251,1,'8gb'),
  (1252,1,'for'),
  (1253,1,'rock'),
  (1254,1,'you'),
  (1255,1,'but'),
  (1256,1,'won'),
  (1257,1,'put'),
  (1258,1,'brains'),
  (1259,1,'too'),
  (1289,1,'own'),
  (1290,1,'intelligent'),
  (1291,1,'computer'),
  (1292,1,'inc'),
  (1293,1,'8go'),
  (1329,1,'275'),
  (1330,1,'206'),
  (1331,1,'492'),
  (1332,1,'026'),
  (1333,6,'ipod'),
  (1334,6,'nano'),
  (1335,6,'new'),
  (1336,6,'design'),
  (1337,6,'features'),
  (1338,6,'now'),
  (1339,6,'8gb'),
  (1340,6,'and'),
  (1341,6,'16gb'),
  (1342,6,'rocks'),
  (1343,6,'like'),
  (1344,6,'never'),
  (1345,6,'before'),
  (1346,6,'curved'),
  (1347,6,'ahead'),
  (1348,6,'the');
COMMIT;

#
# Data for the `ps_search_word` table  (LIMIT 500,500)
#

INSERT INTO `ps_search_word` (`id_word`, `id_lang`, `word`) VALUES
  (1349,6,'curve'),
  (1350,6,'for'),
  (1351,6,'those'),
  (1352,6,'about'),
  (1353,6,'rock'),
  (1354,6,'give'),
  (1355,6,'you'),
  (1356,6,'nine'),
  (1357,6,'amazing'),
  (1358,6,'colors'),
  (1359,6,'but'),
  (1369,6,'that'),
  (1370,6,'only'),
  (1371,6,'part'),
  (1372,6,'story'),
  (1373,6,'feel'),
  (1374,6,'allaluminum'),
  (1375,6,'glass'),
  (1376,6,'won'),
  (1377,6,'want'),
  (1378,6,'put'),
  (1379,6,'down'),
  (1380,6,'great'),
  (1381,6,'looks'),
  (1382,6,'brains'),
  (1383,6,'too'),
  (1384,6,'genius'),
  (1385,6,'feature'),
  (1386,6,'turns'),
  (1387,6,'into'),
  (1388,6,'your'),
  (1389,6,'own'),
  (1390,6,'highly'),
  (1391,6,'intelligent'),
  (1392,6,'personal'),
  (1393,6,'creates'),
  (1394,6,'playlists'),
  (1395,6,'finding'),
  (1396,6,'songs'),
  (1397,6,'library'),
  (1398,6,'together'),
  (1399,6,'made'),
  (1400,6,'move'),
  (1401,6,'with'),
  (1402,6,'moves'),
  (1403,6,'accelerometer'),
  (1404,6,'comes'),
  (1405,6,'shake'),
  (1406,6,'shuffle'),
  (1407,6,'music'),
  (1408,6,'turn'),
  (1409,6,'sideways'),
  (1410,6,'view'),
  (1411,6,'cover'),
  (1412,6,'flow'),
  (1413,6,'play'),
  (1414,6,'games'),
  (1415,6,'designed'),
  (1416,6,'mind'),
  (1417,6,'ipods'),
  (1418,6,'apple'),
  (1419,6,'computer'),
  (1420,6,'inc'),
  (1421,6,'blue'),
  (1422,6,'16go'),
  (1423,6,'8go'),
  (1424,6,'yellow'),
  (1425,6,'metal'),
  (1426,6,'black'),
  (1427,6,'orange'),
  (1428,6,'pink'),
  (1429,6,'green'),
  (1430,6,'purple'),
  (1431,6,'minijack'),
  (1432,6,'stereo'),
  (1433,6,'275'),
  (1434,6,'206'),
  (1435,6,'492'),
  (1436,6,'026'),
  (1437,1,'hit'),
  (1438,1,'its'),
  (1449,1,'technologies'),
  (1450,1,'has'),
  (1451,1,'250gb'),
  (1452,1,'data'),
  (1453,1,'2gb'),
  (1489,6,'macbook'),
  (1490,6,'makes'),
  (1491,6,'easy'),
  (1492,6,'hit'),
  (1493,6,'road'),
  (1494,6,'thanks'),
  (1495,6,'its'),
  (1496,6,'tough'),
  (1497,6,'polycarbonate'),
  (1498,6,'case'),
  (1499,6,'builtin'),
  (1500,6,'wireless'),
  (1501,6,'technologies'),
  (1502,6,'innovative'),
  (1503,6,'magsafe'),
  (1504,6,'power'),
  (1505,6,'adapter'),
  (1506,6,'releases'),
  (1507,6,'automatically'),
  (1508,6,'someone'),
  (1509,6,'accidentally'),
  (1510,6,'trips'),
  (1511,6,'cord'),
  (1512,6,'every'),
  (1513,6,'has'),
  (1514,6,'larger'),
  (1515,6,'hard'),
  (1516,6,'drive'),
  (1517,6,'250gb'),
  (1518,6,'store'),
  (1519,6,'growing'),
  (1520,6,'media'),
  (1521,6,'collections'),
  (1529,6,'valuable'),
  (1530,6,'data'),
  (1531,6,'24ghz'),
  (1532,6,'models'),
  (1533,6,'include'),
  (1534,6,'2gb'),
  (1535,6,'memory'),
  (1536,6,'standard'),
  (1537,6,'perfect'),
  (1538,6,'running'),
  (1539,6,'more'),
  (1540,6,'favorite'),
  (1541,6,'applications'),
  (1542,6,'smoothly'),
  (1543,6,'laptops'),
  (1710,1,'player'),
  (1750,1,'red'),
  (1751,1,'500'),
  (1752,1,'gym'),
  (1753,1,'how'),
  (1754,1,'one'),
  (1790,1,'107'),
  (1791,1,'162'),
  (1792,1,'155'),
  (1793,1,'041'),
  (1794,1,'clip'),
  (1795,1,'included'),
  (1796,6,'world'),
  (1797,6,'most'),
  (1798,6,'wearable'),
  (1799,6,'player'),
  (1800,6,'clips'),
  (1801,6,'vibrant'),
  (1802,6,'red'),
  (1803,6,'instant'),
  (1804,6,'attachment'),
  (1805,6,'wear'),
  (1806,6,'500'),
  (1807,6,'sleeve'),
  (1808,6,'belt'),
  (1830,6,'gym'),
  (1831,6,'shorts'),
  (1832,6,'badge'),
  (1833,6,'musical'),
  (1834,6,'devotion'),
  (1835,6,'brilliant'),
  (1836,6,'feed'),
  (1837,6,'itunes'),
  (1838,6,'entertainment'),
  (1839,6,'superstore'),
  (1840,6,'ultraorganized'),
  (1841,6,'collection'),
  (1842,6,'jukebox'),
  (1843,6,'how'),
  (1844,6,'load'),
  (1845,6,'one'),
  (1846,6,'click'),
  (1847,6,'beauty'),
  (1848,6,'beat'),
  (1849,6,'intensely'),
  (1850,6,'colorful'),
  (1851,6,'anodized'),
  (1852,6,'aluminum'),
  (1853,6,'complements'),
  (1854,6,'simple'),
  (1855,6,'original'),
  (1856,6,'silver'),
  (1857,6,'107'),
  (1858,6,'162'),
  (1870,6,'155'),
  (1871,6,'041'),
  (1872,6,'clip'),
  (1873,6,'included');
COMMIT;

#
# Data for the `ps_specific_price` table  (LIMIT 0,500)
#

INSERT INTO `ps_specific_price` (`id_specific_price`, `id_product`, `id_shop`, `id_currency`, `id_country`, `id_group`, `price`, `from_quantity`, `reduction`, `reduction_type`, `from`, `to`) VALUES
  (1,1,0,0,0,0,0.000000,1,0.050000,'percentage','0000-00-00 00:00:00','0000-00-00 00:00:00');
COMMIT;

#
# Data for the `ps_state` table  (LIMIT 0,500)
#

INSERT INTO `ps_state` (`id_state`, `id_country`, `id_zone`, `name`, `iso_code`, `tax_behavior`, `active`) VALUES
  (701,177,7,'Республика Адыгея','RU-A',0,1),
  (702,177,7,'Республика Алтай','RU-A',0,1),
  (703,177,7,'Республика Башкортостан','RU-B',0,1),
  (704,177,7,'Республика Бурятия','RU-B',0,1),
  (705,177,7,'Республика Дагестан','RU-D',0,1),
  (706,177,7,'Республика Ингушетия','RU-I',0,1),
  (707,177,7,'Кабардино-Балкарская Республика','RU-K',0,1),
  (708,177,7,'Республика Калмыкия','RU-K',0,1),
  (709,177,7,'Карачаево-Черкесская Республика','RU-K',0,1),
  (710,177,7,'Республика Карелия','RU-K',0,1),
  (711,177,7,'Республика Коми','RU-K',0,1),
  (712,177,7,'Республика Марий Эл','RU-M',0,1),
  (713,177,7,'Республика Мордовия','RU-M',0,1),
  (714,177,7,'Республика Саха (Якутия)','RU-S',0,1),
  (715,177,7,'Республика Северная Осетия - Алания','RU-S',0,1),
  (716,177,7,'Республика Татарстан','RU-T',0,1),
  (717,177,7,'Республика Тыва','RU-T',0,1),
  (718,177,7,'Удмуртская Республика','RU-U',0,1),
  (719,177,7,'Республика Хакасия','RU-K',0,1),
  (720,177,7,'Чеченская Республика','RU-C',0,1),
  (721,177,7,'Чувашская Республика','RU-C',0,1),
  (722,177,7,'Алтайский край','RU-A',0,1),
  (723,177,7,'Краснодарский край','RU-K',0,1),
  (724,177,7,'Красноярский край','RU-K',0,1),
  (725,177,7,'Приморский край','RU-P',0,1),
  (726,177,7,'Ставропольский край','RU-S',0,1),
  (727,177,7,'Хабаровский край','RU-K',0,1),
  (728,177,7,'Амурская область','RU-A',0,1),
  (729,177,7,'Архангельская область','RU-A',0,1),
  (730,177,7,'Астраханская область','RU-A',0,1),
  (731,177,7,'Белгородская область','RU-B',0,1),
  (732,177,7,'Брянская область','RU-B',0,1),
  (733,177,7,'Владимирская область','RU-V',0,1),
  (734,177,7,'Волгоградская область','RU-V',0,1),
  (735,177,7,'Вологодская область','RU-V',0,1),
  (736,177,7,'Воронежская область','RU-V',0,1),
  (737,177,7,'Ивановская область','RU-I',0,1),
  (738,177,7,'Иркутская область','RU-I',0,1),
  (739,177,7,'Калининградская область','RU-K',0,1),
  (740,177,7,'Калужская область','RU-K',0,1),
  (741,177,7,'Камчатский край','RU-K',0,1),
  (742,177,7,'Кемеровская область','RU-K',0,1),
  (743,177,7,'Кировская область','RU-K',0,1),
  (744,177,7,'Костромская область','RU-K',0,1),
  (745,177,7,'Курганская область','RU-K',0,1),
  (746,177,7,'Курская область','RU-K',0,1),
  (747,177,7,'Ленинградская область','RU-L',0,1),
  (748,177,7,'Липецкая область','RU-L',0,1),
  (749,177,7,'Магаданская область','RU-M',0,1),
  (750,177,7,'Московская область','RU-M',0,1),
  (751,177,7,'Мурманская область','RU-M',0,1),
  (752,177,7,'Нижегородская область','RU-N',0,1),
  (753,177,7,'Новгородская область','RU-N',0,1),
  (754,177,7,'Новосибирская область','RU-N',0,1),
  (755,177,7,'Омская область','RU-O',0,1),
  (756,177,7,'Оренбургская область','RU-O',0,1),
  (757,177,7,'Орловская область','RU-O',0,1),
  (758,177,7,'Пензенская область','RU-P',0,1),
  (759,177,7,'Пермский край','RU-P',0,1),
  (760,177,7,'Псковская область','RU-P',0,1),
  (761,177,7,'Ростовская область','RU-R',0,1),
  (762,177,7,'Рязанская область','RU-R',0,1),
  (763,177,7,'Самарская область','RU-S',0,1),
  (764,177,7,'Саратовская область','RU-S',0,1),
  (765,177,7,'Сахалинская область','RU-S',0,1),
  (766,177,7,'Свердловская область','RU-S',0,1),
  (767,177,7,'Смоленская область','RU-S',0,1),
  (768,177,7,'Тамбовская область','RU-T',0,1),
  (769,177,7,'Тверская область','RU-T',0,1),
  (770,177,7,'Томская область','RU-T',0,1),
  (771,177,7,'Тульская область','RU-T',0,1),
  (772,177,7,'Тюменская область','RU-T',0,1),
  (773,177,7,'Ульяновская область','RU-U',0,1),
  (774,177,7,'Челябинская область','RU-C',0,1),
  (775,177,7,'Забайкальский край','RU-Z',0,1),
  (776,177,7,'Ярославская область','RU-Y',0,1),
  (777,177,7,'Москва','RU-M',0,1),
  (778,177,7,'Санкт-Петербург','RU-S',0,1),
  (779,177,7,'Еврейская АО','RU-Y',0,1),
  (780,177,7,'Ненецкий АО','RU-N',0,1),
  (781,177,7,'Ханты-Мансийский АО','RU-K',0,1),
  (782,177,7,'Чукотский АО','RU-C',0,1),
  (783,177,7,'Ямало-Ненецкий АО','RU-Y',0,1);
COMMIT;

#
# Data for the `ps_statssearch` table  (LIMIT 0,500)
#

INSERT INTO `ps_statssearch` (`id_statssearch`, `keywords`, `results`, `date_add`) VALUES
  (1,'ipod',3,'2011-03-22 17:07:25');
COMMIT;

#
# Data for the `ps_stock_mvt` table  (LIMIT 0,500)
#

INSERT INTO `ps_stock_mvt` (`id_stock_mvt`, `id_product`, `id_product_attribute`, `id_order`, `id_stock_mvt_reason`, `id_employee`, `quantity`, `date_add`, `date_upd`) VALUES
  (1,6,0,0,2,1,250,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (2,8,0,0,2,1,1,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (3,9,0,0,2,1,1,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (4,2,7,0,2,1,10,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (5,2,8,0,2,1,20,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (6,2,9,0,2,1,30,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (7,2,10,0,2,1,40,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (8,5,12,0,2,1,100,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (9,5,13,0,2,1,99,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (10,5,14,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (11,5,15,0,2,1,25,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (12,7,19,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (13,7,22,0,2,1,60,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (14,7,23,0,2,1,70,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (15,1,25,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (16,1,26,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (17,1,27,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (18,1,28,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (19,1,29,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (20,1,30,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (21,1,31,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (22,1,32,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (23,1,33,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (24,1,34,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (25,1,35,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (26,1,36,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (27,1,39,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (28,1,40,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (29,1,41,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (30,1,42,0,2,1,50,'2011-03-19 20:04:52','2011-03-19 20:04:52'),
  (31,9,0,2,2,0,-1,'2011-03-30 00:47:01','2011-03-30 00:47:01'),
  (32,2,8,3,2,0,-1,'2011-03-30 00:50:13','2011-03-30 00:50:13'),
  (33,1,31,3,2,0,-1,'2011-03-30 00:50:13','2011-03-30 00:50:13'),
  (34,1,31,4,2,0,-1,'2011-03-31 00:20:56','2011-03-31 00:20:56'),
  (35,2,8,4,2,0,-1,'2011-03-31 00:20:56','2011-03-31 00:20:56'),
  (36,1,31,5,2,0,-1,'2011-04-01 00:51:27','2011-04-01 00:51:27'),
  (37,7,19,5,2,0,-1,'2011-04-01 00:51:27','2011-04-01 00:51:27'),
  (38,1,31,6,2,0,-2,'2011-04-02 02:40:23','2011-04-02 02:40:23'),
  (39,7,19,6,2,0,-1,'2011-04-02 02:40:24','2011-04-02 02:40:24'),
  (40,1,31,7,3,0,-1,'2011-06-03 20:43:45','2011-06-03 20:43:45'),
  (41,2,8,7,3,0,-1,'2011-06-03 20:43:46','2011-06-03 20:43:46'),
  (42,7,19,7,3,0,-1,'2011-06-03 20:43:46','2011-06-03 20:43:46'),
  (43,5,13,8,3,0,-1,'2011-06-03 23:41:41','2011-06-03 23:41:41'),
  (44,8,0,8,3,0,-1,'2011-06-03 23:41:41','2011-06-03 23:41:41');
COMMIT;

#
# Data for the `ps_stock_mvt_reason` table  (LIMIT 0,500)
#

INSERT INTO `ps_stock_mvt_reason` (`id_stock_mvt_reason`, `sign`, `date_add`, `date_upd`) VALUES
  (1,1,'2011-03-19 20:04:47','2011-03-19 20:04:47'),
  (2,-1,'2011-03-19 20:04:47','2011-03-19 20:04:47'),
  (3,-1,'2011-03-19 20:04:47','2011-03-19 20:04:47'),
  (4,-1,'2011-03-19 20:04:47','2011-03-19 20:04:47'),
  (5,1,'2011-03-19 20:04:47','2011-03-19 20:04:47');
COMMIT;

#
# Data for the `ps_stock_mvt_reason_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_stock_mvt_reason_lang` (`id_stock_mvt_reason`, `id_lang`, `name`) VALUES
  (1,1,'Increase'),
  (2,1,'Decrease'),
  (3,1,'Order'),
  (4,1,'Missing Stock Movement'),
  (5,1,'Restocking');
COMMIT;

#
# Data for the `ps_store` table  (LIMIT 0,500)
#

INSERT INTO `ps_store` (`id_store`, `id_country`, `id_state`, `name`, `address1`, `address2`, `city`, `postcode`, `latitude`, `longitude`, `hours`, `phone`, `fax`, `email`, `note`, `active`, `date_add`, `date_upd`) VALUES
  (1,21,9,'Dade County','3030 SW 8th St Miami','','Miami',' 33135',25.765005,-80.243797,'a:7:{i:0;s:13:\"09:00 - 19:00\";i:1;s:13:\"09:00 - 19:00\";i:2;s:13:\"09:00 - 19:00\";i:3;s:13:\"09:00 - 19:00\";i:4;s:13:\"09:00 - 19:00\";i:5;s:13:\"10:00 - 16:00\";i:6;s:13:\"10:00 - 16:00\";}','','','','',1,'2010-11-09 10:53:13','2010-11-09 10:53:13'),
  (2,21,9,'E Fort Lauderdale','1000 Northeast 4th Ave Fort Lauderdale','','miami',' 33304',26.137936,-80.139435,'a:7:{i:0;s:13:\"09:00 - 19:00\";i:1;s:13:\"09:00 - 19:00\";i:2;s:13:\"09:00 - 19:00\";i:3;s:13:\"09:00 - 19:00\";i:4;s:13:\"09:00 - 19:00\";i:5;s:13:\"10:00 - 16:00\";i:6;s:13:\"10:00 - 16:00\";}','','','','',0,'2010-11-09 10:56:26','2010-11-09 10:56:26'),
  (3,21,9,'Pembroke Pines','11001 Pines Blvd Pembroke Pines','','miami','33026',26.009987,-80.294472,'a:7:{i:0;s:13:\"09:00 - 19:00\";i:1;s:13:\"09:00 - 19:00\";i:2;s:13:\"09:00 - 19:00\";i:3;s:13:\"09:00 - 19:00\";i:4;s:13:\"09:00 - 19:00\";i:5;s:13:\"10:00 - 16:00\";i:6;s:13:\"10:00 - 16:00\";}','','','','',0,'2010-11-09 10:58:42','2010-11-09 11:01:11'),
  (4,21,9,'Coconut Grove','2999 SW 32nd Avenue','',' Miami',' 33133',25.736296,-80.244797,'a:7:{i:0;s:13:\"09:00 - 19:00\";i:1;s:13:\"09:00 - 19:00\";i:2;s:13:\"09:00 - 19:00\";i:3;s:13:\"09:00 - 19:00\";i:4;s:13:\"09:00 - 19:00\";i:5;s:13:\"10:00 - 16:00\";i:6;s:13:\"10:00 - 16:00\";}','','','','',0,'2010-11-09 11:00:38','2010-11-09 11:04:52'),
  (5,21,9,'N Miami/Biscayne','12055 Biscayne Blvd','','Miami','33181',25.886740,-80.163292,'a:7:{i:0;s:13:\"09:00 - 19:00\";i:1;s:13:\"09:00 - 19:00\";i:2;s:13:\"09:00 - 19:00\";i:3;s:13:\"09:00 - 19:00\";i:4;s:13:\"09:00 - 19:00\";i:5;s:13:\"10:00 - 16:00\";i:6;s:13:\"10:00 - 16:00\";}','','','','',0,'2010-11-09 11:11:28','2010-11-09 11:11:28');
COMMIT;

#
# Data for the `ps_subdomain` table  (LIMIT 0,500)
#

INSERT INTO `ps_subdomain` (`id_subdomain`, `name`) VALUES
  (1,'www');
COMMIT;

#
# Data for the `ps_supplier` table  (LIMIT 0,500)
#

INSERT INTO `ps_supplier` (`id_supplier`, `name`, `date_add`, `date_upd`, `active`) VALUES
  (1,'AppleStore','2011-03-19 20:04:50','2011-03-19 20:04:50',1),
  (2,'Shure Online Store','2011-03-19 20:04:50','2011-03-19 20:04:50',1);
COMMIT;

#
# Data for the `ps_supplier_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_supplier_lang` (`id_supplier`, `id_lang`, `description`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
  (1,1,NULL,NULL,NULL,NULL),
  (1,6,NULL,NULL,NULL,NULL),
  (2,1,NULL,NULL,NULL,NULL),
  (2,6,NULL,NULL,NULL,NULL);
COMMIT;

#
# Data for the `ps_tab` table  (LIMIT 0,500)
#

INSERT INTO `ps_tab` (`id_tab`, `id_parent`, `class_name`, `module`, `position`) VALUES
  (1,0,'AdminCatalog',NULL,1),
  (2,0,'AdminCustomers',NULL,2),
  (3,0,'AdminOrders',NULL,3),
  (4,0,'AdminPayment',NULL,4),
  (5,0,'AdminShipping',NULL,5),
  (6,0,'AdminStats',NULL,6),
  (7,0,'AdminModules',NULL,7),
  (8,0,'AdminPreferences',NULL,9),
  (9,0,'AdminTools',NULL,10),
  (10,1,'AdminManufacturers',NULL,2),
  (11,1,'AdminAttributesGroups',NULL,4),
  (12,2,'AdminAddresses',NULL,1),
  (13,3,'AdminStatuses',NULL,6),
  (14,4,'AdminDiscounts',NULL,4),
  (15,4,'AdminCurrencies',NULL,1),
  (16,4,'AdminTaxes',NULL,2),
  (17,5,'AdminCarriers',NULL,1),
  (18,5,'AdminCountries',NULL,3),
  (19,5,'AdminZones',NULL,5),
  (20,5,'AdminRangePrice',NULL,6),
  (21,5,'AdminRangeWeight',NULL,7),
  (22,7,'AdminModulesPositions',NULL,4),
  (23,8,'AdminDb',NULL,7),
  (24,8,'AdminEmails',NULL,5),
  (26,8,'AdminImages',NULL,6),
  (27,8,'AdminPPreferences',NULL,4),
  (28,29,'AdminContacts',NULL,3),
  (29,0,'AdminEmployees',NULL,8),
  (30,29,'AdminProfiles',NULL,1),
  (31,29,'AdminAccess',NULL,2),
  (32,9,'AdminLanguages',NULL,1),
  (33,9,'AdminTranslations',NULL,2),
  (34,1,'AdminSuppliers',NULL,3),
  (35,29,'AdminTabs',NULL,3),
  (36,1,'AdminFeatures',NULL,5),
  (37,9,'AdminQuickAccesses',NULL,4),
  (38,8,'AdminAppearance',NULL,2),
  (39,8,'AdminContact',NULL,1),
  (40,8,'AdminAliases',NULL,5),
  (41,9,'AdminImport',NULL,6),
  (42,3,'AdminInvoices',NULL,1),
  (43,-1,'AdminSearch',NULL,0),
  (44,8,'AdminLocalization',NULL,9),
  (46,5,'AdminStates',NULL,2),
  (47,3,'AdminReturn',NULL,3),
  (48,3,'AdminPDF',NULL,8),
  (49,3,'AdminSlip',NULL,4),
  (51,6,'AdminStatsConf',NULL,1),
  (52,9,'AdminSubDomains',NULL,7),
  (53,9,'AdminBackup',NULL,8),
  (54,3,'AdminOrderMessage',NULL,7),
  (55,3,'AdminDeliverySlip',NULL,2),
  (56,8,'AdminMeta',NULL,3),
  (57,9,'AdminCMSContent',NULL,9),
  (58,1,'AdminScenes',NULL,6),
  (59,3,'AdminMessages',NULL,5),
  (60,1,'AdminTracking',NULL,1),
  (61,6,'AdminSearchEngines',NULL,2),
  (62,6,'AdminReferrers',NULL,3),
  (63,2,'AdminGroups',NULL,2),
  (64,9,'AdminGenerator',NULL,10),
  (65,2,'AdminCarts',NULL,3),
  (66,1,'AdminTags',NULL,7),
  (67,8,'AdminSearchConf',NULL,10),
  (68,1,'AdminAttachments',NULL,7),
  (69,9,'AdminInformation',NULL,11),
  (70,8,'AdminPerformance',NULL,11),
  (71,29,'AdminCustomerThreads',NULL,4),
  (72,9,'AdminWebservice',NULL,12),
  (73,1,'AdminStockMvt',NULL,9),
  (80,7,'AdminAddonsCatalog',NULL,1),
  (81,7,'AdminAddonsMyAccount',NULL,2),
  (82,9,'AdminStores',NULL,11),
  (83,7,'AdminThemes',NULL,3),
  (84,8,'AdminGeolocation',NULL,12),
  (85,4,'AdminTaxRulesGroup',NULL,3),
  (86,9,'AdminLogs',NULL,13),
  (87,5,'AdminCounty',NULL,4),
  (88,-1,'AdminHome',NULL,0);
COMMIT;

#
# Data for the `ps_tab_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_tab_lang` (`id_tab`, `id_lang`, `name`) VALUES
  (1,1,'Catalog'),
  (1,6,'Каталог'),
  (2,1,'Customers'),
  (2,6,'Клиенты'),
  (3,1,'Orders'),
  (3,6,'Заказы'),
  (4,1,'Payment'),
  (4,6,'Оплата'),
  (5,1,'Shipping'),
  (5,6,'Доставка'),
  (6,1,'Stats'),
  (6,6,'Статистика'),
  (7,1,'Modules'),
  (7,6,'Модули'),
  (8,1,'Preferences'),
  (8,6,'Настройка'),
  (9,1,'Tools'),
  (9,6,'Инструменты'),
  (10,1,'Manufacturers'),
  (10,6,'Производители'),
  (11,1,'Attributes and Groups'),
  (11,6,'Attributes and Groups'),
  (12,1,'Addresses'),
  (12,6,'Адреса'),
  (13,1,'Statuses'),
  (13,6,'Статусы'),
  (14,1,'Vouchers'),
  (14,6,'Купоны'),
  (15,1,'Currencies'),
  (15,6,'Валюты'),
  (16,1,'Taxes'),
  (16,6,'Налоги'),
  (17,1,'Carriers'),
  (17,6,'Перевозчики'),
  (18,1,'Countries'),
  (18,6,'Страны'),
  (19,1,'Zones'),
  (19,6,'Зоны'),
  (20,1,'Price Ranges'),
  (20,6,'Price Ranges'),
  (21,1,'Weight Ranges'),
  (21,6,'Weight Ranges'),
  (22,1,'Positions'),
  (22,6,'Расположение модулей'),
  (23,1,'Database'),
  (23,6,'База данных'),
  (24,1,'E-mail'),
  (24,6,'E-mail'),
  (26,1,'Image'),
  (26,6,'Изображение'),
  (27,1,'Products'),
  (27,6,'Товары'),
  (28,1,'Contacts'),
  (28,6,'Контакты'),
  (29,1,'Employees'),
  (29,6,'Сотрудники'),
  (30,1,'Profiles'),
  (30,6,'Профили'),
  (31,1,'Permissions'),
  (31,6,'Доступ и разрешения'),
  (32,1,'Languages'),
  (32,6,'Языки'),
  (33,1,'Translations'),
  (33,6,'Переводы'),
  (34,1,'Suppliers'),
  (34,6,'Поставщики'),
  (35,1,'Tabs'),
  (35,6,'Вкладки'),
  (36,1,'Features'),
  (36,6,'Характеристики'),
  (37,1,'Quick Access'),
  (37,6,'Quick Access'),
  (38,1,'Appearance'),
  (38,6,'Дизайн'),
  (39,1,'Contact Information'),
  (39,6,'Contact Information'),
  (40,1,'Aliases'),
  (40,6,'Алиасы'),
  (41,1,'Import'),
  (41,6,'Импорт'),
  (42,1,'Invoices'),
  (42,6,'Счета-фактуры'),
  (43,1,'Search'),
  (43,6,'Поиск'),
  (44,1,'Localization'),
  (44,6,'Локализация'),
  (46,1,'States'),
  (46,6,'Регионы'),
  (47,1,'Merchandise Returns'),
  (47,6,'Merchandise Returns'),
  (48,1,'PDF'),
  (48,6,'PDF'),
  (49,1,'Credit Slips'),
  (49,6,'Credit Slips'),
  (51,1,'Settings'),
  (51,6,'Настройки'),
  (52,1,'Subdomains'),
  (52,6,'Субдомены'),
  (53,1,'DB backup'),
  (53,6,'Бэкап БД'),
  (54,1,'Order Messages'),
  (54,6,'Коментарии к заказу'),
  (55,1,'Delivery Slips'),
  (55,6,'Delivery Slips'),
  (56,1,'SEO & URLs'),
  (56,6,'SEO & URLs'),
  (57,1,'CMS'),
  (57,6,'Страницы'),
  (58,1,'Image Mapping'),
  (58,6,'Image Mapping'),
  (59,1,'Customer Messages'),
  (59,6,'Customer Messages'),
  (60,1,'Tracking'),
  (60,6,'Трекер'),
  (61,1,'Search Engines'),
  (61,6,'Search Engines'),
  (62,1,'Referrers'),
  (62,6,'Реферральная программа'),
  (63,1,'Groups'),
  (63,6,'Группы'),
  (64,1,'Generators'),
  (64,6,'Генераторы'),
  (65,1,'Shopping Carts'),
  (65,6,'Shopping Carts'),
  (66,1,'Tags'),
  (66,6,'Теги'),
  (67,1,'Search'),
  (67,6,'Поиск'),
  (68,1,'Attachments'),
  (68,6,'Вложения'),
  (69,1,'Configuration Information'),
  (69,6,'Configuration Information'),
  (70,1,'Performance'),
  (70,6,'Производительность'),
  (71,1,'Customer Service'),
  (71,6,'Сервисная служба'),
  (72,1,'Webservice'),
  (72,6,'Веб-сервис'),
  (73,1,'Stock Movements'),
  (73,6,'Движение товаров'),
  (80,1,'Modules & Themes Catalog'),
  (80,6,'Modules & Themes Catalog'),
  (81,1,'My Account'),
  (81,6,'Мой профиль'),
  (82,1,'Stores'),
  (82,6,'Магазины'),
  (83,1,'Themes'),
  (83,6,'Шаблоны'),
  (84,1,'Geolocation'),
  (84,6,'Geolocation'),
  (85,1,'Tax Rules'),
  (85,6,'Налоговые ставки'),
  (86,1,'Log'),
  (86,6,'Лог'),
  (87,1,'Counties'),
  (87,6,'Counties'),
  (88,1,'Home'),
  (88,6,'Home');
COMMIT;

#
# Data for the `ps_tag` table  (LIMIT 0,500)
#

INSERT INTO `ps_tag` (`id_tag`, `id_lang`, `name`) VALUES
  (5,6,'apple'),
  (22,1,'superdrive'),
  (23,1,'Ipod touch'),
  (28,6,'ipod'),
  (29,1,'nano'),
  (33,1,'shuffle');
COMMIT;

#
# Data for the `ps_tax` table  (LIMIT 0,500)
#

INSERT INTO `ps_tax` (`id_tax`, `rate`, `active`) VALUES
  (177,18.000,1);
COMMIT;

#
# Data for the `ps_tax_lang` table  (LIMIT 0,500)
#

INSERT INTO `ps_tax_lang` (`id_tax`, `id_lang`, `name`) VALUES
  (177,6,'НДС 18.0%');
COMMIT;

#
# Data for the `ps_tax_rule` table  (LIMIT 0,500)
#

INSERT INTO `ps_tax_rule` (`id_tax_rule`, `id_tax_rules_group`, `id_country`, `id_state`, `id_county`, `id_tax`, `state_behavior`, `county_behavior`) VALUES
  (1,177,177,0,0,177,0,0);
COMMIT;

#
# Data for the `ps_tax_rules_group` table  (LIMIT 0,500)
#

INSERT INTO `ps_tax_rules_group` (`id_tax_rules_group`, `name`, `active`) VALUES
  (177,'НДС 18.0%',1);
COMMIT;

#
# Data for the `ps_timezone` table  (LIMIT 0,500)
#

INSERT INTO `ps_timezone` (`id_timezone`, `name`) VALUES
  (1,'Africa/Abidjan'),
  (2,'Africa/Accra'),
  (3,'Africa/Addis_Ababa'),
  (4,'Africa/Algiers'),
  (5,'Africa/Asmara'),
  (6,'Africa/Asmera'),
  (7,'Africa/Bamako'),
  (8,'Africa/Bangui'),
  (9,'Africa/Banjul'),
  (10,'Africa/Bissau'),
  (11,'Africa/Blantyre'),
  (12,'Africa/Brazzaville'),
  (13,'Africa/Bujumbura'),
  (14,'Africa/Cairo'),
  (15,'Africa/Casablanca'),
  (16,'Africa/Ceuta'),
  (17,'Africa/Conakry'),
  (18,'Africa/Dakar'),
  (19,'Africa/Dar_es_Salaam'),
  (20,'Africa/Djibouti'),
  (21,'Africa/Douala'),
  (22,'Africa/El_Aaiun'),
  (23,'Africa/Freetown'),
  (24,'Africa/Gaborone'),
  (25,'Africa/Harare'),
  (26,'Africa/Johannesburg'),
  (27,'Africa/Kampala'),
  (28,'Africa/Khartoum'),
  (29,'Africa/Kigali'),
  (30,'Africa/Kinshasa'),
  (31,'Africa/Lagos'),
  (32,'Africa/Libreville'),
  (33,'Africa/Lome'),
  (34,'Africa/Luanda'),
  (35,'Africa/Lubumbashi'),
  (36,'Africa/Lusaka'),
  (37,'Africa/Malabo'),
  (38,'Africa/Maputo'),
  (39,'Africa/Maseru'),
  (40,'Africa/Mbabane'),
  (41,'Africa/Mogadishu'),
  (42,'Africa/Monrovia'),
  (43,'Africa/Nairobi'),
  (44,'Africa/Ndjamena'),
  (45,'Africa/Niamey'),
  (46,'Africa/Nouakchott'),
  (47,'Africa/Ouagadougou'),
  (48,'Africa/Porto-Novo'),
  (49,'Africa/Sao_Tome'),
  (50,'Africa/Timbuktu'),
  (51,'Africa/Tripoli'),
  (52,'Africa/Tunis'),
  (53,'Africa/Windhoek'),
  (54,'America/Adak'),
  (55,'America/Anchorage '),
  (56,'America/Anguilla'),
  (57,'America/Antigua'),
  (58,'America/Araguaina'),
  (59,'America/Argentina/Buenos_Aires'),
  (60,'America/Argentina/Catamarca'),
  (61,'America/Argentina/ComodRivadavia'),
  (62,'America/Argentina/Cordoba'),
  (63,'America/Argentina/Jujuy'),
  (64,'America/Argentina/La_Rioja'),
  (65,'America/Argentina/Mendoza'),
  (66,'America/Argentina/Rio_Gallegos'),
  (67,'America/Argentina/Salta'),
  (68,'America/Argentina/San_Juan'),
  (69,'America/Argentina/San_Luis'),
  (70,'America/Argentina/Tucuman'),
  (71,'America/Argentina/Ushuaia'),
  (72,'America/Aruba'),
  (73,'America/Asuncion'),
  (74,'America/Atikokan'),
  (75,'America/Atka'),
  (76,'America/Bahia'),
  (77,'America/Barbados'),
  (78,'America/Belem'),
  (79,'America/Belize'),
  (80,'America/Blanc-Sablon'),
  (81,'America/Boa_Vista'),
  (82,'America/Bogota'),
  (83,'America/Boise'),
  (84,'America/Buenos_Aires'),
  (85,'America/Cambridge_Bay'),
  (86,'America/Campo_Grande'),
  (87,'America/Cancun'),
  (88,'America/Caracas'),
  (89,'America/Catamarca'),
  (90,'America/Cayenne'),
  (91,'America/Cayman'),
  (92,'America/Chicago'),
  (93,'America/Chihuahua'),
  (94,'America/Coral_Harbour'),
  (95,'America/Cordoba'),
  (96,'America/Costa_Rica'),
  (97,'America/Cuiaba'),
  (98,'America/Curacao'),
  (99,'America/Danmarkshavn'),
  (100,'America/Dawson'),
  (101,'America/Dawson_Creek'),
  (102,'America/Denver'),
  (103,'America/Detroit'),
  (104,'America/Dominica'),
  (105,'America/Edmonton'),
  (106,'America/Eirunepe'),
  (107,'America/El_Salvador'),
  (108,'America/Ensenada'),
  (109,'America/Fort_Wayne'),
  (110,'America/Fortaleza'),
  (111,'America/Glace_Bay'),
  (112,'America/Godthab'),
  (113,'America/Goose_Bay'),
  (114,'America/Grand_Turk'),
  (115,'America/Grenada'),
  (116,'America/Guadeloupe'),
  (117,'America/Guatemala'),
  (118,'America/Guayaquil'),
  (119,'America/Guyana'),
  (120,'America/Halifax'),
  (121,'America/Havana'),
  (122,'America/Hermosillo'),
  (123,'America/Indiana/Indianapolis'),
  (124,'America/Indiana/Knox'),
  (125,'America/Indiana/Marengo'),
  (126,'America/Indiana/Petersburg'),
  (127,'America/Indiana/Tell_City'),
  (128,'America/Indiana/Vevay'),
  (129,'America/Indiana/Vincennes'),
  (130,'America/Indiana/Winamac'),
  (131,'America/Indianapolis'),
  (132,'America/Inuvik'),
  (133,'America/Iqaluit'),
  (134,'America/Jamaica'),
  (135,'America/Jujuy'),
  (136,'America/Juneau'),
  (137,'America/Kentucky/Louisville'),
  (138,'America/Kentucky/Monticello'),
  (139,'America/Knox_IN'),
  (140,'America/La_Paz'),
  (141,'America/Lima'),
  (142,'America/Los_Angeles'),
  (143,'America/Louisville'),
  (144,'America/Maceio'),
  (145,'America/Managua'),
  (146,'America/Manaus'),
  (147,'America/Marigot'),
  (148,'America/Martinique'),
  (149,'America/Mazatlan'),
  (150,'America/Mendoza'),
  (151,'America/Menominee'),
  (152,'America/Merida'),
  (153,'America/Mexico_City'),
  (154,'America/Miquelon'),
  (155,'America/Moncton'),
  (156,'America/Monterrey'),
  (157,'America/Montevideo'),
  (158,'America/Montreal'),
  (159,'America/Montserrat'),
  (160,'America/Nassau'),
  (161,'America/New_York'),
  (162,'America/Nipigon'),
  (163,'America/Nome'),
  (164,'America/Noronha'),
  (165,'America/North_Dakota/Center'),
  (166,'America/North_Dakota/New_Salem'),
  (167,'America/Panama'),
  (168,'America/Pangnirtung'),
  (169,'America/Paramaribo'),
  (170,'America/Phoenix'),
  (171,'America/Port-au-Prince'),
  (172,'America/Port_of_Spain'),
  (173,'America/Porto_Acre'),
  (174,'America/Porto_Velho'),
  (175,'America/Puerto_Rico'),
  (176,'America/Rainy_River'),
  (177,'America/Rankin_Inlet'),
  (178,'America/Recife'),
  (179,'America/Regina'),
  (180,'America/Resolute'),
  (181,'America/Rio_Branco'),
  (182,'America/Rosario'),
  (183,'America/Santarem'),
  (184,'America/Santiago'),
  (185,'America/Santo_Domingo'),
  (186,'America/Sao_Paulo'),
  (187,'America/Scoresbysund'),
  (188,'America/Shiprock'),
  (189,'America/St_Barthelemy'),
  (190,'America/St_Johns'),
  (191,'America/St_Kitts'),
  (192,'America/St_Lucia'),
  (193,'America/St_Thomas'),
  (194,'America/St_Vincent'),
  (195,'America/Swift_Current'),
  (196,'America/Tegucigalpa'),
  (197,'America/Thule'),
  (198,'America/Thunder_Bay'),
  (199,'America/Tijuana'),
  (200,'America/Toronto'),
  (201,'America/Tortola'),
  (202,'America/Vancouver'),
  (203,'America/Virgin'),
  (204,'America/Whitehorse'),
  (205,'America/Winnipeg'),
  (206,'America/Yakutat'),
  (207,'America/Yellowknife'),
  (208,'Antarctica/Casey'),
  (209,'Antarctica/Davis'),
  (210,'Antarctica/DumontDUrville'),
  (211,'Antarctica/Mawson'),
  (212,'Antarctica/McMurdo'),
  (213,'Antarctica/Palmer'),
  (214,'Antarctica/Rothera'),
  (215,'Antarctica/South_Pole'),
  (216,'Antarctica/Syowa'),
  (217,'Antarctica/Vostok'),
  (218,'Arctic/Longyearbyen'),
  (219,'Asia/Aden'),
  (220,'Asia/Almaty'),
  (221,'Asia/Amman'),
  (222,'Asia/Anadyr'),
  (223,'Asia/Aqtau'),
  (224,'Asia/Aqtobe'),
  (225,'Asia/Ashgabat'),
  (226,'Asia/Ashkhabad'),
  (227,'Asia/Baghdad'),
  (228,'Asia/Bahrain'),
  (229,'Asia/Baku'),
  (230,'Asia/Bangkok'),
  (231,'Asia/Beirut'),
  (232,'Asia/Bishkek'),
  (233,'Asia/Brunei'),
  (234,'Asia/Calcutta'),
  (235,'Asia/Choibalsan'),
  (236,'Asia/Chongqing'),
  (237,'Asia/Chungking'),
  (238,'Asia/Colombo'),
  (239,'Asia/Dacca'),
  (240,'Asia/Damascus'),
  (241,'Asia/Dhaka'),
  (242,'Asia/Dili'),
  (243,'Asia/Dubai'),
  (244,'Asia/Dushanbe'),
  (245,'Asia/Gaza'),
  (246,'Asia/Harbin'),
  (247,'Asia/Ho_Chi_Minh'),
  (248,'Asia/Hong_Kong'),
  (249,'Asia/Hovd'),
  (250,'Asia/Irkutsk'),
  (251,'Asia/Istanbul'),
  (252,'Asia/Jakarta'),
  (253,'Asia/Jayapura'),
  (254,'Asia/Jerusalem'),
  (255,'Asia/Kabul'),
  (256,'Asia/Kamchatka'),
  (257,'Asia/Karachi'),
  (258,'Asia/Kashgar'),
  (259,'Asia/Kathmandu'),
  (260,'Asia/Katmandu'),
  (261,'Asia/Kolkata'),
  (262,'Asia/Krasnoyarsk'),
  (263,'Asia/Kuala_Lumpur'),
  (264,'Asia/Kuching'),
  (265,'Asia/Kuwait'),
  (266,'Asia/Macao'),
  (267,'Asia/Macau'),
  (268,'Asia/Magadan'),
  (269,'Asia/Makassar'),
  (270,'Asia/Manila'),
  (271,'Asia/Muscat'),
  (272,'Asia/Nicosia'),
  (273,'Asia/Novosibirsk'),
  (274,'Asia/Omsk'),
  (275,'Asia/Oral'),
  (276,'Asia/Phnom_Penh'),
  (277,'Asia/Pontianak'),
  (278,'Asia/Pyongyang'),
  (279,'Asia/Qatar'),
  (280,'Asia/Qyzylorda'),
  (281,'Asia/Rangoon'),
  (282,'Asia/Riyadh'),
  (283,'Asia/Saigon'),
  (284,'Asia/Sakhalin'),
  (285,'Asia/Samarkand'),
  (286,'Asia/Seoul'),
  (287,'Asia/Shanghai'),
  (288,'Asia/Singapore'),
  (289,'Asia/Taipei'),
  (290,'Asia/Tashkent'),
  (291,'Asia/Tbilisi'),
  (292,'Asia/Tehran'),
  (293,'Asia/Tel_Aviv'),
  (294,'Asia/Thimbu'),
  (295,'Asia/Thimphu'),
  (296,'Asia/Tokyo'),
  (297,'Asia/Ujung_Pandang'),
  (298,'Asia/Ulaanbaatar'),
  (299,'Asia/Ulan_Bator'),
  (300,'Asia/Urumqi'),
  (301,'Asia/Vientiane'),
  (302,'Asia/Vladivostok'),
  (303,'Asia/Yakutsk'),
  (304,'Asia/Yekaterinburg'),
  (305,'Asia/Yerevan'),
  (306,'Atlantic/Azores'),
  (307,'Atlantic/Bermuda'),
  (308,'Atlantic/Canary'),
  (309,'Atlantic/Cape_Verde'),
  (310,'Atlantic/Faeroe'),
  (311,'Atlantic/Faroe'),
  (312,'Atlantic/Jan_Mayen'),
  (313,'Atlantic/Madeira'),
  (314,'Atlantic/Reykjavik'),
  (315,'Atlantic/South_Georgia'),
  (316,'Atlantic/St_Helena'),
  (317,'Atlantic/Stanley'),
  (318,'Australia/ACT'),
  (319,'Australia/Adelaide'),
  (320,'Australia/Brisbane'),
  (321,'Australia/Broken_Hill'),
  (322,'Australia/Canberra'),
  (323,'Australia/Currie'),
  (324,'Australia/Darwin'),
  (325,'Australia/Eucla'),
  (326,'Australia/Hobart'),
  (327,'Australia/LHI'),
  (328,'Australia/Lindeman'),
  (329,'Australia/Lord_Howe'),
  (330,'Australia/Melbourne'),
  (331,'Australia/North'),
  (332,'Australia/NSW'),
  (333,'Australia/Perth'),
  (334,'Australia/Queensland'),
  (335,'Australia/South'),
  (336,'Australia/Sydney'),
  (337,'Australia/Tasmania'),
  (338,'Australia/Victoria'),
  (339,'Australia/West'),
  (340,'Australia/Yancowinna'),
  (341,'Europe/Amsterdam'),
  (342,'Europe/Andorra'),
  (343,'Europe/Athens'),
  (344,'Europe/Belfast'),
  (345,'Europe/Belgrade'),
  (346,'Europe/Berlin'),
  (347,'Europe/Bratislava'),
  (348,'Europe/Brussels'),
  (349,'Europe/Bucharest'),
  (350,'Europe/Budapest'),
  (351,'Europe/Chisinau'),
  (352,'Europe/Copenhagen'),
  (353,'Europe/Dublin'),
  (354,'Europe/Gibraltar'),
  (355,'Europe/Guernsey'),
  (356,'Europe/Helsinki'),
  (357,'Europe/Isle_of_Man'),
  (358,'Europe/Istanbul'),
  (359,'Europe/Jersey'),
  (360,'Europe/Kaliningrad'),
  (361,'Europe/Kiev'),
  (362,'Europe/Lisbon'),
  (363,'Europe/Ljubljana'),
  (364,'Europe/London'),
  (365,'Europe/Luxembourg'),
  (366,'Europe/Madrid'),
  (367,'Europe/Malta'),
  (368,'Europe/Mariehamn'),
  (369,'Europe/Minsk'),
  (370,'Europe/Monaco'),
  (371,'Europe/Moscow'),
  (372,'Europe/Nicosia'),
  (373,'Europe/Oslo'),
  (374,'Europe/Paris'),
  (375,'Europe/Podgorica'),
  (376,'Europe/Prague'),
  (377,'Europe/Riga'),
  (378,'Europe/Rome'),
  (379,'Europe/Samara'),
  (380,'Europe/San_Marino'),
  (381,'Europe/Sarajevo'),
  (382,'Europe/Simferopol'),
  (383,'Europe/Skopje'),
  (384,'Europe/Sofia'),
  (385,'Europe/Stockholm'),
  (386,'Europe/Tallinn'),
  (387,'Europe/Tirane'),
  (388,'Europe/Tiraspol'),
  (389,'Europe/Uzhgorod'),
  (390,'Europe/Vaduz'),
  (391,'Europe/Vatican'),
  (392,'Europe/Vienna'),
  (393,'Europe/Vilnius'),
  (394,'Europe/Volgograd'),
  (395,'Europe/Warsaw'),
  (396,'Europe/Zagreb'),
  (397,'Europe/Zaporozhye'),
  (398,'Europe/Zurich'),
  (399,'Indian/Antananarivo'),
  (400,'Indian/Chagos'),
  (401,'Indian/Christmas'),
  (402,'Indian/Cocos'),
  (403,'Indian/Comoro'),
  (404,'Indian/Kerguelen'),
  (405,'Indian/Mahe'),
  (406,'Indian/Maldives'),
  (407,'Indian/Mauritius'),
  (408,'Indian/Mayotte'),
  (409,'Indian/Reunion'),
  (410,'Pacific/Apia'),
  (411,'Pacific/Auckland'),
  (412,'Pacific/Chatham'),
  (413,'Pacific/Easter'),
  (414,'Pacific/Efate'),
  (415,'Pacific/Enderbury'),
  (416,'Pacific/Fakaofo'),
  (417,'Pacific/Fiji'),
  (418,'Pacific/Funafuti'),
  (419,'Pacific/Galapagos'),
  (420,'Pacific/Gambier'),
  (421,'Pacific/Guadalcanal'),
  (422,'Pacific/Guam'),
  (423,'Pacific/Honolulu'),
  (424,'Pacific/Johnston'),
  (425,'Pacific/Kiritimati'),
  (426,'Pacific/Kosrae'),
  (427,'Pacific/Kwajalein'),
  (428,'Pacific/Majuro'),
  (429,'Pacific/Marquesas'),
  (430,'Pacific/Midway'),
  (431,'Pacific/Nauru'),
  (432,'Pacific/Niue'),
  (433,'Pacific/Norfolk'),
  (434,'Pacific/Noumea'),
  (435,'Pacific/Pago_Pago'),
  (436,'Pacific/Palau'),
  (437,'Pacific/Pitcairn'),
  (438,'Pacific/Ponape'),
  (439,'Pacific/Port_Moresby'),
  (440,'Pacific/Rarotonga'),
  (441,'Pacific/Saipan'),
  (442,'Pacific/Samoa'),
  (443,'Pacific/Tahiti'),
  (444,'Pacific/Tarawa'),
  (445,'Pacific/Tongatapu'),
  (446,'Pacific/Truk'),
  (447,'Pacific/Wake'),
  (448,'Pacific/Wallis'),
  (449,'Pacific/Yap'),
  (450,'Brazil/Acre'),
  (451,'Brazil/DeNoronha'),
  (452,'Brazil/East'),
  (453,'Brazil/West'),
  (454,'Canada/Atlantic'),
  (455,'Canada/Central'),
  (456,'Canada/East-Saskatchewan'),
  (457,'Canada/Eastern'),
  (458,'Canada/Mountain'),
  (459,'Canada/Newfoundland'),
  (460,'Canada/Pacific'),
  (461,'Canada/Saskatchewan'),
  (462,'Canada/Yukon'),
  (463,'CET'),
  (464,'Chile/Continental'),
  (465,'Chile/EasterIsland'),
  (466,'CST6CDT'),
  (467,'Cuba'),
  (468,'EET'),
  (469,'Egypt'),
  (470,'Eire'),
  (471,'EST'),
  (472,'EST5EDT'),
  (473,'Etc/GMT'),
  (474,'Etc/GMT+0'),
  (475,'Etc/GMT+1'),
  (476,'Etc/GMT+10'),
  (477,'Etc/GMT+11'),
  (478,'Etc/GMT+12'),
  (479,'Etc/GMT+2'),
  (480,'Etc/GMT+3'),
  (481,'Etc/GMT+4'),
  (482,'Etc/GMT+5'),
  (483,'Etc/GMT+6'),
  (484,'Etc/GMT+7'),
  (485,'Etc/GMT+8'),
  (486,'Etc/GMT+9'),
  (487,'Etc/GMT-0'),
  (488,'Etc/GMT-1'),
  (489,'Etc/GMT-10'),
  (490,'Etc/GMT-11'),
  (491,'Etc/GMT-12'),
  (492,'Etc/GMT-13'),
  (493,'Etc/GMT-14'),
  (494,'Etc/GMT-2'),
  (495,'Etc/GMT-3'),
  (496,'Etc/GMT-4'),
  (497,'Etc/GMT-5'),
  (498,'Etc/GMT-6'),
  (499,'Etc/GMT-7'),
  (500,'Etc/GMT-8');
COMMIT;

#
# Data for the `ps_timezone` table  (LIMIT 500,500)
#

INSERT INTO `ps_timezone` (`id_timezone`, `name`) VALUES
  (501,'Etc/GMT-9'),
  (502,'Etc/GMT0'),
  (503,'Etc/Greenwich'),
  (504,'Etc/UCT'),
  (505,'Etc/Universal'),
  (506,'Etc/UTC'),
  (507,'Etc/Zulu'),
  (508,'Factory'),
  (509,'GB'),
  (510,'GB-Eire'),
  (511,'GMT'),
  (512,'GMT+0'),
  (513,'GMT-0'),
  (514,'GMT0'),
  (515,'Greenwich'),
  (516,'Hongkong'),
  (517,'HST'),
  (518,'Iceland'),
  (519,'Iran'),
  (520,'Israel'),
  (521,'Jamaica'),
  (522,'Japan'),
  (523,'Kwajalein'),
  (524,'Libya'),
  (525,'MET'),
  (526,'Mexico/BajaNorte'),
  (527,'Mexico/BajaSur'),
  (528,'Mexico/General'),
  (529,'MST'),
  (530,'MST7MDT'),
  (531,'Navajo'),
  (532,'NZ'),
  (533,'NZ-CHAT'),
  (534,'Poland'),
  (535,'Portugal'),
  (536,'PRC'),
  (537,'PST8PDT'),
  (538,'ROC'),
  (539,'ROK'),
  (540,'Singapore'),
  (541,'Turkey'),
  (542,'UCT'),
  (543,'Universal'),
  (544,'US/Alaska'),
  (545,'US/Aleutian'),
  (546,'US/Arizona'),
  (547,'US/Central'),
  (548,'US/East-Indiana'),
  (549,'US/Eastern'),
  (550,'US/Hawaii'),
  (551,'US/Indiana-Starke'),
  (552,'US/Michigan'),
  (553,'US/Mountain'),
  (554,'US/Pacific'),
  (555,'US/Pacific-New'),
  (556,'US/Samoa'),
  (557,'UTC'),
  (558,'W-SU'),
  (559,'WET'),
  (560,'Zulu');
COMMIT;

#
# Data for the `ps_web_browser` table  (LIMIT 0,500)
#

INSERT INTO `ps_web_browser` (`id_web_browser`, `name`) VALUES
  (1,'Safari'),
  (2,'Firefox 2.x'),
  (3,'Firefox 3.x'),
  (4,'Opera'),
  (5,'IE 6.x'),
  (6,'IE 7.x'),
  (7,'IE 8.x'),
  (8,'Google Chrome');
COMMIT;

#
# Data for the `ps_zone` table  (LIMIT 0,500)
#

INSERT INTO `ps_zone` (`id_zone`, `name`, `active`) VALUES
  (1,'Europe',1),
  (2,'North America',1),
  (3,'Asia',1),
  (4,'Africa',1),
  (5,'Oceania',1),
  (6,'South America',1),
  (7,'Europe (out E.U)',1),
  (8,'Centrale America/Antilla',1);
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

