CREATE TABLE IF NOT EXISTS ACCOUNT (
ID BIGINT(20) UNSIGNED NOT NULl AUTO_INCREMENT PRIMARY KEY,
ACCOUNT_NAME VARCHAR(255) NOT NULL,
CREATE_DATE TIMESTAMP NOT NULL,
STATUS VARCHAR(50) NOT NULL,
BALANCE double NOT NULL,
PERSON_ID BIGINT(20) NOT NULL,
ACCOUNT_PARENT_ID BIGINT(20)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS PERSON (
ID BIGINT(20) UNSIGNED NOT NULl AUTO_INCREMENT PRIMARY KEY,
CNPJ VARCHAR(14),
COMPANY_NAME VARCHAR(255),
FANTASY_NAME VARCHAR(255),
CPF VARCHAR(11),
FULL_NAME VARCHAR(255),
BIRTH_DATE TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `TRANSACTION` (
ID BIGINT(20) UNSIGNED NOT NULl AUTO_INCREMENT PRIMARY KEY,
CREATE_DATE TIMESTAMP NOT NULL,
`VALUE` double NOT NULL,
TYPE VARCHAR(50) NOT NULL,
REVERSED tinyint(1) NOT NULL,
ACCOUNT_ID_IN BIGINT(20),
ACCOUNT_ID_OUT BIGINT(20)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


ALTER TABLE ACCOUNT ADD FOREIGN KEY (PERSON_ID) REFERENCES PERSON(ID);
ALTER TABLE ACCOUNT ADD FOREIGN KEY (ACCOUNT_PARENT_ID) REFERENCES ACCOUNT(ID);
ALTER TABLE `TRANSACTION` ADD FOREIGN KEY (ACCOUNT_ID_IN) REFERENCES ACCOUNT(ID);
ALTER TABLE `TRANSACTION` ADD FOREIGN KEY (ACCOUNT_ID_OUT) REFERENCES ACCOUNT(ID);