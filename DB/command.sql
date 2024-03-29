CREATE DATABASE CRM;

CREATE TABLE SETOR(
    STRCODIGO INT PRIMARY KEY AUTO_INCREMENT,
    STRNOME VARCHAR(50) NOT NULL
);

CREATE TABLE ANALISTA(
    ANLMATRICULA INT PRIMARY KEY AUTO_INCREMENT,
    ANLNOME VARCHAR(150) NOT NULL,
    ANLSENHA VARCHAR(20) NOT NULL,
    ANLEMAIL VARCHAR(100) NOT NULL
);

CREATE TABLE ESTADO(
    ESTSIGLA CHAR(2) PRIMARY KEY,
    ESTNOME VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE CIDADE(
    CDDCODIGO INT PRIMARY KEY AUTO_INCREMENT,
    CDDNOME VARCHAR(50) NOT NULL,
    CDDESTADO CHAR(2) NOT NULL,
    CONSTRAINT FOREIGN KEY(CDDESTADO) REFERENCES ESTADO(ESTSIGLA)
);

CREATE TABLE GRUPO(
    GRPCODIGO INT PRIMARY KEY AUTO_INCREMENT,
    GRPNOME VARCHAR(50) NOT NULL
);

CREATE TABLE GRPFILHO(
    GPFCODIGO INT PRIMARY KEY AUTO_INCREMENT,
    GPFNOME VARCHAR(40) NOT NULL,
    GPFPAI INT NOT NULL,
    CONSTRAINT FOREIGN KEY(GPFPAI) REFERENCES GRUPO(GRPCODIGO)
);

CREATE TABLE GRPNETO(
    GPNCODIGO INT PRIMARY KEY AUTO_INCREMENT,
    GPNNOME VARCHAR(40) NOT NULL,
    GPNFILHO INT NOT NULL,
    CONSTRAINT FOREIGN KEY(GPNFILHO) REFERENCES GRPFILHO(GPFCODIGO)
);

CREATE TABLE ACESSO(
    ACSCODIGO INT PRIMARY KEY AUTO_INCREMENT,
    ACSANALISTA INT NOT NULL,
    ACSSETOR INT NOT NULL,
    ACSGRUPO INT NOT NULL,
    CONSTRAINT FOREIGN KEY(ACSANALISTA) REFERENCES ANALISTA(ANLMATRICULA),
    CONSTRAINT FOREIGN KEY(ACSSETOR) REFERENCES SETOR(STRCODIGO),
    CONSTRAINT FOREIGN KEY(ACSGRUPO) REFERENCES GRUPO(GRPCODIGO)
);

CREATE TABLE CLIENTE(
    CLTCPF CHAR(11) PRIMARY KEY,
    CLTNOME VARCHAR(150) NOT NULL,
    CLTEMAIL VARCHAR(150) NOT NULL,
    CLTPHONE1 INT NOT NULL,
    CLTPHONE2 INT,
    CLTCEP CHAR(8) NOT NULL,
    ENDRUA VARCHAR(100) NOT NULL,
    ENDCOMPLEMENTO VARCHAR(100),
    ENDBAIRRO VARCHAR(60) NOT NULL,
    ENDCIDADE INT NOT NULL,
    ENDESTADO CHAR(2) NOT NULL,
    CONSTRAINT FOREIGN KEY(ENDCIDADE) REFERENCES CIDADE(CDDCODIGO),
    CONSTRAINT FOREIGN KEY(ENDESTADO) REFERENCES ESTADO(ESTSIGLA)
);

CREATE TABLE SOLICITACAO(
    SLTCODIGO INT PRIMARY KEY AUTO_INCREMENT,
    SLTCLIENTE CHAR(8) NOT NULL,
    SLTANALISTA INT,
    SLTTITULO VARCHAR(50) NOT NULL,
    SLTOBSERVACAO TEXT NOT NULL,
    SLTSETOR INT NOT NULL,
    SLTGRUPO INT NOT NULL,
    SLTGRPFILHO INT NOT NULL,
    SLTGRPNETO INT,
    SLTSTATUS VARCHAR(20) NOT NULL,
    CONSTRAINT FOREIGN KEY(SLTCLIENTE) REFERENCES CLIENTE(CLTCPF),
    CONSTRAINT FOREIGN KEY(SLTSETOR) REFERENCES SETOR(STRCODIGO),
    CONSTRAINT FOREIGN KEY(SLTANALISTA) REFERENCES ANALISTA(ANLMATRICULA),
    CONSTRAINT FOREIGN KEY(SLTGRUPO) REFERENCES GRUPO(GRPCODIGO),
    CONSTRAINT FOREIGN KEY(SLTGRPFILHO) REFERENCES GRPFILHO(GPFCODIGO),
    CONSTRAINT FOREIGN KEY(SLTGRPNETO) REFERENCES GRPNETO(GPNCODIGO)
);