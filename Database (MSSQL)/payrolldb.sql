USE payroldb;

-- Table structure for table `autonumber`
CREATE TABLE autonumber (
  id INT NOT NULL,
  autoname VARCHAR(30) NOT NULL,
  strnum INT NOT NULL,
  increment INT NOT NULL,
  PRIMARY KEY (id)
);

-- Inserting data into `autonumber`
INSERT INTO autonumber (id, autoname, strnum, increment) 
VALUES (1, 'trans', 19, 1);

-- Table structure for table `employee`
CREATE TABLE employee (
  emp_code VARCHAR(30) NOT NULL,
  emp_fname VARCHAR(60) NULL,
  emp_lname VARCHAR(60) NULL,
  emp_mname VARCHAR(60) NULL,
  address VARCHAR(100) NULL,
  contact BIGINT NULL,  -- use BIGINT for large numbers in SQL Server
  status VARCHAR(30) NULL,
  birth_date DATE NULL,
  birth_place VARCHAR(100) NULL,
  emp_sex VARCHAR(10) NULL,
  emp_age INT NULL,
  emerg_contct BIGINT NULL, -- use BIGINT for large numbers in SQL Server
  PRIMARY KEY (emp_code)
);

-- Inserting data into `employee`
INSERT INTO employee (emp_code, emp_fname, emp_lname, emp_mname, address, contact, status, birth_date, birth_place, emp_sex, emp_age, emerg_contct) 
VALUES 
('am29', 'Anna', 'Malvas', 'Lopez', 'Villa Socorro, Kabankalan City', 54546735, 'Single', '1989-07-07', 'Kabankalan City', 'FEMALE', 24, 54546735),
('by6', 'Bert', 'Yanson', 'Uy', 'Brgy. 3, Kabankalan City', 457892, 'Married', '1988-08-23', 'Kabankankalan City', 'MALE', 25, 457892),
('cg4', 'Joan', 'Geasin', 'Selvano', 'Brgy. 6, Kabankalan City', 4712134, 'single', '1987-02-13', 'Pontevedra ', 'FEMALE', 26, 4712134),
('jf30', 'Joan', 'Geasin', 'Selvano', 'Brgy. 6, Kabankalan City', 4712134, 'single', '1987-02-13', 'Pontevedra ', 'FEMALE', 26, 4712134),
('jha28', 'Jharen', 'Delmez', 'Lacios', 'Dancalan, Ilog', 958, 'Single', '1990-09-28', 'Dancalan, Ilog', 'FEMALE', 23, 958),
('jl4', 'Jade', 'Linco', 'Lopez', 'Brgy. Talubangi', 2147483647, 'Single', '1988-05-23', 'Kab.City', 'FEMALE', 25, 2147483647),
('jo1', 'Joan', 'Geasin', 'Selvano', 'Brgy. 6, Kabankalan City', 4712134, 'single', '1987-02-13', 'Pontevedra ', 'MALE', 26, 4712134),
('jt17', 'Kobe', 'Bryant', 'James', 'Los Angeles, California', 63211, 'Married', '2014-02-12', 'Chicago', 'MALE', 32, 63211),
('kp2', 'Katy', 'Parey', 'Kim', 'Kabankalan City', 2312312, 'single', '1989-01-12', 'Kabankalan City', 'FEMALE', 24, 2312312),
('zso12', 'Zoei shane', 'Omagap', 'Gomez', 'Brgy.1, Kabankalan City', 4657679, 'Single', '1985-12-09', 'Kabankalan City', 'FEMALE', 28, 4657679);

-- Table structure for table `employee_workinfo`
CREATE TABLE employee_workinfo (
  id INT NOT NULL IDENTITY(1,1),  -- AUTO_INCREMENT in MySQL is replaced by IDENTITY in SQL Server
  emp_code VARCHAR(30) NOT NULL,
  d_rate INT NULL,
  p_method VARCHAR(60) NULL,
  position VARCHAR(60) NULL,
  w_status VARCHAR(60) NULL,
  d_hired DATE NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (emp_code) REFERENCES employee(emp_code) -- Assuming foreign key relationship
);

-- Inserting data into `employee_workinfo`
INSERT INTO employee_workinfo (emp_code, d_rate, p_method, position, w_status, d_hired) 
VALUES
('jo1', 230, 'weekly', 'casual', 'active', '2012-12-11'),
('kp2', 230, 'Weekly', 'Casual', 'Active', '2013-01-23'),
('jha28', 230, 'weekly', 'casual', 'active', '2013-08-07'),
('cg4', 230, 'weekly', 'casual', 'active', '2012-12-11'),
('jl4', 230, 'Weekly', 'Casual', 'Active', '2013-08-21'),
('zso12', 270, 'weekly', 'regular', 'active', '2000-08-10'),
('jf30', 230, 'weekly', 'casual', 'active', '2012-12-11'),
('am29', 300, 'weekly', 'regular', 'active', '2010-07-20');

-- Table structure for table `other_deduction`
CREATE TABLE other_deduction (
  [KEY] INT NOT NULL IDENTITY(1,1),
  trans_id VARCHAR(30) NOT NULL,
  emp_code VARCHAR(30) NULL,
  deduct1 VARCHAR(60) NULL,
  ded_amount1 INT NULL,
  deduct2 VARCHAR(60) NULL,
  ded_amount2 INT NULL,
  deduct3 VARCHAR(60) NULL,
  ded_amount3 INT NULL,
  deduct4 VARCHAR(60) NULL,
  ded_amount4 INT NULL,
  total_ded INT NULL,
  PRIMARY KEY ([KEY]),
  FOREIGN KEY (emp_code) REFERENCES employee(emp_code) -- Assuming foreign key relationship
);

-- Inserting data into `other_deduction`
INSERT INTO other_deduction (trans_id, emp_code, deduct1, ded_amount1, deduct2, ded_amount2, deduct3, ded_amount3, deduct4, ded_amount4, total_ded) 
VALUES
('trans5', 'am29', '', 1, '', 1, '', 0, '', 0, 6),
('trans7', 'am29', '', 1, '', 1, '', 0, '', 0, 6),
('trans8', 'by6', 'oil', 50, 'uniform', 150, '', 0, '', 0, 550);

-- Table structure for table `payroll`
CREATE TABLE payroll (
  [KEY] INT NOT NULL IDENTITY(1,1),
  emp_code VARCHAR(30) NOT NULL,
  num_days INT NULL,
  r_wage INT NULL,
  overtime INT NULL,
  hol_pay INT NULL,
  gross_sal INT NULL,
  cash_ad INT NULL,
  bread_vale INT NULL,
  philhealth INT NULL,
  pag_ibig INT NULL,
  net_income INT NULL,
  remarks VARCHAR(100) NULL,
  dateissued DATE NOT NULL,
  trans_id VARCHAR(30) NOT NULL DEFAULT '0',
  user_id INT NULL,
  PRIMARY KEY ([KEY]),
  FOREIGN KEY (emp_code) REFERENCES employee(emp_code) -- Assuming foreign key relationship
);

-- Inserting data into `payroll`
INSERT INTO payroll (emp_code, num_days, r_wage, overtime, hol_pay, gross_sal, cash_ad, bread_vale, philhealth, pag_ibig, net_income, remarks, dateissued, trans_id, user_id) 
VALUES
('am29', 5, 1500, 188, 300, 1988, 1, 1, 1, 1, 1982, '', '2014-03-03', 'trans5', NULL),
('by6', 5, 1350, 68, 270, 1688, 200, 50, 50, 50, 1138, '', '2014-03-03', 'trans8', NULL);

-- Table structure for table `user`
CREATE TABLE [user] (
  user_id INT NOT NULL IDENTITY(1,1),
  name TEXT,
  username VARCHAR(60) NULL,
  pass VARCHAR(90) NULL,
  [type] VARCHAR(60) NULL,
  PRIMARY KEY (user_id)
);

-- Inserting data into `user`
INSERT INTO [user] (name, username, pass, [type]) 
VALUES ('administrator', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrator');
