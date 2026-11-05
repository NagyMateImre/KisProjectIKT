create database Kisproject
default character set utf8mb4
collate utf8mb4_hungarian_ci;

create table Reg(
    id int(11) Not Null PRIMARY KEY AUTO_INCREMENT,
    Name varchar(255),
    LoginName varchar(255),
    Password varchar(25),
    role varchar(20),
    Car boolean,
    PC boolean,
    Mobil varchar(255),
    email varchar(255)
)