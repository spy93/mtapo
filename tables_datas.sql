create table GRUPE(
IdGrupa INT AUTO_INCREMENT NOT NULL,
Grupa VARCHAR(5),
Facultate VARCHAR(25),
Specialitate VARCHAR(25),
PRIMARY KEY (IdGrupa)
);

create table STUDENTI(
IdStudent INT AUTO_INCREMENT NOT NULL,
Nume VARCHAR(25),
Prenume VARCHAR(25),
AnNastere SMALLINT,
CNP VARCHAR(13),
IdGrupa INT NOT NULL,
PRIMARY KEY (IdStudent),
FOREIGN KEY (IdGrupa) REFERENCES GRUPE(IdGrupa)
);

create table CURSURI(
IdCurs INT AUTO_INCREMENT NOT NULL,
NumeCurs VARCHAR(25),
Profesor VARCHAR(25),
IdGrupa INT,
PRIMARY KEY (IdCurs),
FOREIGN KEY (IdGrupa) REFERENCES GRUPE(IdGrupa)
);

create table ORAR(
Ziua VARCHAR(25),
IntervalOrar VARCHAR(25),
IdCurs INT AUTO_INCREMENT NOT NULL,
FOREIGN KEY (IdCurs),
FOREIGN KEY (IdCurs) REFERENCES CURSURI(IdCurs);
);

insert into GRUPE (Grupa,Facultate,Specialitate) values
('111A','Inginerie Electrica','Electrotehnica'),
('411A','ETTI','Comunicatii'),
('311CC','Automatica si Calculatoare','Calculatoare');

insert into STUDENTI (Nume, Prenume, AnNastere, CNP, IdGrupa) values
('Adrian','Olariu',1990,'1930812892345',1),
('Madalina','Iorga',1989,'2960812892323',1),
('Beniamin','Sandu',1990,'1920812892356',2),
('Marcel','Ghita',1990,'1930709892786',2),
('Felix','Stefan',1989,'1940812892341',2);

insert into CURSURI (NumeCurs, Profesor, IdGrupa) values
('PSBD','Tudorie',2),
('AM','laixandru',1),
('SOC','Anghel',3);

insert into ORAR(Ziua, IntervalOrar, IdCurs) values
('Luni','10.00-12.00',1),
('Miercuri','12.00-14.00',2),
('Vineri','08.00-12.00',3);
