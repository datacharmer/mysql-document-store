
DROP DATABASE IF EXISTS docstore;
CREATE DATABASE docstore;
USE docstore;

--
-- Table structure for table `categories`
--
DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
  cat_id int(10) unsigned NOT NULL default '0',
  category char(30) NOT NULL default '',
  PRIMARY KEY  (cat_id),
  KEY category (category)
) engine=InnoDB;

--
-- Dumping data for table `categories`
--

INSERT INTO categories (cat_id, category) VALUES (3,'consultant');
INSERT INTO categories (cat_id, category) VALUES (2,'contractor');
INSERT INTO categories (cat_id, category) VALUES (1,'employee');

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS class;
CREATE TABLE class (
  class_id int(10) unsigned NOT NULL default '0',
  class_name char(20) NOT NULL default '',
  PRIMARY KEY  (class_id),
  KEY class_ndx (class_name)
) engine=InnoDB;

--
-- Dumping data for table `class`
--

INSERT INTO class (class_id, class_name) VALUES (2,'hardware');
INSERT INTO class (class_id, class_name) VALUES (3,'services');
INSERT INTO class (class_id, class_name) VALUES (1,'software');

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
  country_id int(10) unsigned NOT NULL default '0',
  country char(30) NOT NULL default '',
  PRIMARY KEY  (country_id),
  KEY country (country)
) engine=InnoDB;

--
-- Dumping data for table `countries`
--

INSERT INTO countries (country_id, country) VALUES (2,'Germany');
INSERT INTO countries (country_id, country) VALUES (3,'Italy');
INSERT INTO countries (country_id, country) VALUES (1,'UK');

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
  customer_id int(10) unsigned NOT NULL default '0',
  customer char(40) NOT NULL default '',
  PRIMARY KEY  (customer_id)
) engine=InnoDB;

--
-- Dumping data for table `customers`
--

INSERT INTO customers (customer_id, customer) VALUES (1,'DataSmart');
INSERT INTO customers (customer_id, customer) VALUES (2,'ViewData');
INSERT INTO customers (customer_id, customer) VALUES (3,'NewHardware');
INSERT INTO customers (customer_id, customer) VALUES (4,'SmartEdu');

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
  dept_id int(10) unsigned NOT NULL default '0',
  department char(30) NOT NULL default '',
  PRIMARY KEY  (dept_id),
  KEY department (department)
) engine=InnoDB;

--
-- Dumping data for table `departments`
--

INSERT INTO departments (dept_id, department) VALUES (3,'dev');
INSERT INTO departments (dept_id, department) VALUES (1,'pers');
INSERT INTO departments (dept_id, department) VALUES (4,'research');
INSERT INTO departments (dept_id, department) VALUES (2,'sales');

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS locations;
CREATE TABLE locations (
  loc_id int(10) unsigned NOT NULL default '0',
  loc char(30) NOT NULL default '',
  country_id int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (loc_id),
  KEY country_id (country_id),
  CONSTRAINT `0_31` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`) ON DELETE CASCADE
) engine=InnoDB;

--
-- Dumping data for table `locations`
--

INSERT INTO locations (loc_id, loc, country_id) VALUES (1,'Rome',3);
INSERT INTO locations (loc_id, loc, country_id) VALUES (2,'London',1);
INSERT INTO locations (loc_id, loc, country_id) VALUES (3,'Munich',2);
INSERT INTO locations (loc_id, loc, country_id) VALUES (4,'Berlin',2);
INSERT INTO locations (loc_id, loc, country_id) VALUES (5,'Bonn',2);

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS person;
CREATE TABLE person (
  person_id int(10) unsigned NOT NULL default '0',
  name char(20) NOT NULL default '',
  salary int(11) default NULL,
  gender char(1) default NULL,
  dept_id int(10) unsigned NOT NULL default '0',
  cat_id int(10) unsigned NOT NULL default '0',
  loc_id int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (person_id),
  KEY cat_id (cat_id),
  KEY dept_id (dept_id),
  KEY loc_id (loc_id),
  CONSTRAINT `0_33` FOREIGN KEY (`loc_id`) REFERENCES `locations` (`loc_id`) ON DELETE CASCADE,
  CONSTRAINT `0_34` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON DELETE CASCADE,
  CONSTRAINT `0_35` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`) ON DELETE CASCADE
) engine=InnoDB;

--
-- Dumping data for table `person`
--

INSERT INTO person (person_id, name, salary, gender, dept_id, cat_id, loc_id) VALUES (1,'John',5000,'m',1,2,2);
INSERT INTO person (person_id, name, salary, gender, dept_id, cat_id, loc_id) VALUES (2,'Mario',6000,'m',1,1,1);
INSERT INTO person (person_id, name, salary, gender, dept_id, cat_id, loc_id) VALUES (3,'Frank',5000,'m',2,1,5);
INSERT INTO person (person_id, name, salary, gender, dept_id, cat_id, loc_id) VALUES (4,'Otto',6000,'m',3,1,4);
INSERT INTO person (person_id, name, salary, gender, dept_id, cat_id, loc_id) VALUES (5,'Susan',5500,'f',2,3,3);
INSERT INTO person (person_id, name, salary, gender, dept_id, cat_id, loc_id) VALUES (6,'Martin',5500,'m',2,2,2);
INSERT INTO person (person_id, name, salary, gender, dept_id, cat_id, loc_id) VALUES (7,'Mary',5500,'f',1,1,4);
INSERT INTO person (person_id, name, salary, gender, dept_id, cat_id, loc_id) VALUES (8,'Bill',5000,'m',1,1,3);
INSERT INTO person (person_id, name, salary, gender, dept_id, cat_id, loc_id) VALUES (9,'June',6000,'f',3,3,1);

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
  person_id int(10) unsigned NOT NULL default '0',
  class_id int(10) unsigned NOT NULL default '0',
  sale_date date NOT NULL,
  customer_id int(10) unsigned NOT NULL default '0',
  sale_amount int(11) NOT NULL default '0',
  PRIMARY KEY  (person_id,class_id,sale_date,customer_id),
  KEY person_id (person_id),
  KEY class_id (class_id),
  KEY customer_id (customer_id),
  CONSTRAINT `0_37` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE,
  CONSTRAINT `0_38` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE,
  CONSTRAINT `0_39` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE
) engine=InnoDB;

--
-- Dumping data for table `sales`
--

INSERT INTO sales (person_id, class_id, sale_date, customer_id, sale_amount) VALUES (3,1,'2003-10-01',1,23000);
INSERT INTO sales (person_id, class_id, sale_date, customer_id, sale_amount) VALUES (3,2,'2003-10-12',3,45000);
INSERT INTO sales (person_id, class_id, sale_date, customer_id, sale_amount) VALUES (3,3,'2003-11-04',1,60000);
INSERT INTO sales (person_id, class_id, sale_date, customer_id, sale_amount) VALUES (5,1,'2003-11-02',2,25000);
INSERT INTO sales (person_id, class_id, sale_date, customer_id, sale_amount) VALUES (5,3,'2003-10-13',4,18000);
INSERT INTO sales (person_id, class_id, sale_date, customer_id, sale_amount) VALUES (6,2,'2003-10-12',4,50000);

