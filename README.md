welcome, this is my java project which is known as electricity billing system which we can pay our bills 

firstly download the project as zip file

after downloading save the zip file in your workspace 
and also extract the zip file 
here i have used the codestudio ide

go to file->top left

import ->maven->existing maven project ->browse ->click your project folder and import it 

after importing the project right click on the project go to build path->configure build path->tick 4 options and apply

after this again right click on the project maven->update project ->tick force update ->apply

go to the workbench write all the query 

open work bench file->new querytab in this copy all the above code and paste it


CREATE DATABASE projectbilling;

USE projectbilling;

CREATE TABLE bills (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  amount DOUBLE NOT NULL,
  date DATE NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE payment_history (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  amount DOUBLE NOT NULL,
  date DATE NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE recent_bills (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  amount DOUBLE NOT NULL,
  date DATE NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) DEFAULT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,  -- Ensure email is unique and not NULL
  phone_number VARCHAR(15) DEFAULT NULL,
  password VARCHAR(100) DEFAULT NULL,
  units INT DEFAULT '0',
  PRIMARY KEY (id)
);


in the project go to DBUtil.java change the password according to your workbench password 


    private static final String PASSWORD = "ILOVEmyself143";///change this password according to the workbench
   

for changing the admin dashboard username and password go to project ->servlets->adminservlets change the username and password according to your convinience 




