CREATE DATABASE techelp;

USE techelp;

CREATE TABLE customer (
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	password VARCHAR(150) NOT NULL,
    document VARCHAR(11) NOT NULL,
    active BOOLEAN NOT NULL,
    phone VARCHAR(11),
    street VARCHAR(50),
    number VARCHAR(20),
    additional_info VARCHAR(50),
    neighborhood VARCHAR(20),
    postal_code VARCHAR (8),
    city VARCHAR(50),
    state CHAR(2)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE payment_method (
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE work_order (
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(180) NOT NULL,
    created_at DATE NOT NULL,
    completed_at DATE,
    price DECIMAL(6,2),
    observation VARCHAR(50),
    status VARCHAR(11),
    payment_method_id BIGINT(20) NOT NULL,
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
