create database Kisproject
default character set utf8mb4
collate utf8mb4_hungarian_ci;

create table Reg(
  id int(11) NOT NULL,
  Name varchar(255) DEFAULT NULL,
  LoginName varchar(255) DEFAULT NULL,
  Password varchar(255) DEFAULT NULL,
  role varchar(20) DEFAULT NULL,
  Car tinyint(1) DEFAULT NULL,
  PC tinyint(1) DEFAULT NULL,
  Mobil varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL
)