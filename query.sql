To Drop the tables:

drop table BELONGSTO;
drop table CONTAINS;
drop table WRITES;
drop table ARTIST;
drop table GENRE;
drop table ORDER_LINE;
drop table ALBUM;
drop table PHYSICAL_ORDER;
drop table PLAY_HISTORY;
drop table SONG;
drop table DIGITAL_ORDER;
drop table ORDER_RECORD;
drop table CUSTOMER;

-----------------------------------------------------------------------------------------------

To create the CUSTOMER table:

create table CUSTOMER (
CustomerID number(6) primary key,
CustomerName varchar2(20),
City varchar2(20),
State char(2),
PostalCode char(5),
PhoneNumber char(10),
Birthday DATE,
RegistrationDate DATE
);


To create the ORDER_RECORD table:

create table ORDER_RECORD(
OrderID number(10) primary key,
OrderDate DATE,
PaymentMethod char(2),
OrderType char(1),
CustomerID number(6),
FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
);

To create the DIGITAL_ORDER table:

create table DIGITAL_ORDER(
DOrderID number(10) primary key,
SubscriptionOption char(1),
FOREIGN KEY (DOrderID) REFERENCES ORDER_RECORD(OrderID)
);



To create the PHYSICAL_ORDER table:

create table PHYSICAL_ORDER (
POrderID number(10) primary key,
DeliveryOption char(1),
FOREIGN KEY (POrderID) REFERENCES ORDER_RECORD(OrderID)
);


To create the SONG table:

create table SONG(
SongID number(10) primary key,
SongTitle varchar2(50),
PlayTime number(3)
);

To create the PLAY_HISTORY table:

create table PLAY_HISTORY(
DOrderID number(10),
SongID number(10),
PlayDate DATE,
PlayCount number(3),
primary key(DOrderID,SongID),
FOREIGN KEY (DOrderID) REFERENCES DIGITAL_ORDER(DOrderID),
FOREIGN KEY (SongID) REFERENCES SONG(SongID)
);



To create the ALBUM table:

create table ALBUM(
AlbumID number(10) primary key,
AlbumTitle varchar2(50),
AlbumPrice number(3),
ReleaseDate DATE
); 

To create the ORDER_LINE table:

create table ORDER_LINE(
POrderID number(10),
AlbumID number(10),
QuantitiesOrdered number(3),
FOREIGN KEY (POrderID) REFERENCES PHYSICAL_ORDER(POrderID),
FOREIGN KEY (AlbumID) REFERENCES ALBUM(AlbumID)
);

To create the ARTIST table:

create table ARTIST(
ArtistID number(10) primary key,
ArtistName varchar2(20),
DebutDate DATE
);

To create the GENRE table:

create table GENRE(
GenreID number(4) primary key,
GenreName varchar2(50)
);

To create the CONTAINS table:

create table CONTAINS(
SongID number(10),
AlbumID number(10),
primary key(SongID,AlbumID),
FOREIGN KEY (SongID) REFERENCES SONG(SongID),
FOREIGN KEY (AlbumID) REFERENCES ALBUM(AlbumID)
);

To create the WRITES table:

create table WRITES(
ArtistID number(10),
SongID number(10),
primary key(ArtistID,SongID),
FOREIGN KEY (ArtistID) REFERENCES ARTIST(ArtistID),
FOREIGN KEY (SongID) REFERENCES SONG(SongID)
);

To create the BELONGSTO table:

create table BELONGSTO(
SongID number(10),
GenreID number(4),
primary key(SongID,GenreID),
FOREIGN KEY (SongID) REFERENCES SONG(SongID),
FOREIGN KEY (GenreID) REFERENCES GENRE(GenreID)
);


-------------------------------------------------------------------------------------------------------------------

To insert new records into the CUSTOMER table:

INSERT INTO CUSTOMER VALUES (991001, 'MORALES BONITA', 'EASTPOINT', 'FL', '32328', '3132223333', '02-APR-70', '01-SEP-10');
INSERT INTO CUSTOMER VALUES (991002, 'THOMPSON RYAN', 'SANTA MONICA', 'CA', '90404', '5482222678', '28-FEB-80', '01-SEP-15');
INSERT INTO CUSTOMER VALUES (991003, 'RAJ ADITYA', 'EASTPOINT', 'FL', '32328', '3132223333', '09-APR-60', '01-FEB-10');
INSERT INTO CUSTOMER VALUES (991004, 'THOMPSON SAYAM', 'SANTA MONICA', 'CA', '90404', '5482222678', '03-FEB-80', '01-SEP-15');
INSERT INTO CUSTOMER VALUES (991005, 'RAHUL BONITA', 'EASTPOINT', 'FL', '32328', '3132223333', '26-APR-90', '01-JAN-10');

To insert new records into the ORDER_RECORD table:

INSERT INTO ORDER_RECORD VALUES(802001,'02-APR-70','CS','P',991001);
INSERT INTO ORDER_RECORD VALUES(802002,'02-FEB-70','CS','P',991002);
INSERT INTO ORDER_RECORD VALUES(802003,'06-APR-60','CC','D',991001);
INSERT INTO ORDER_RECORD VALUES(802004,'02-APR-70','CS','P',991002);
INSERT INTO ORDER_RECORD VALUES(802005,'03-JAN-10','CC','P',991003);
INSERT INTO ORDER_RECORD VALUES(802006,'02-APR-70','PP','P',991001);
INSERT INTO ORDER_RECORD VALUES(802007,'03-APR-56','CS','D',991004);
INSERT INTO ORDER_RECORD VALUES(802008,'01-APR-80','PP','D',991003);
INSERT INTO ORDER_RECORD VALUES(802009,'02-APR-45','CC','P',991005);
INSERT INTO ORDER_RECORD VALUES(802010,'09-APR-76','CS','D',991001);

To insert new records into the SONG table:

INSERT INTO SONG VALUES (678001,'MANA KARKE PAYAR',4);
INSERT INTO SONG VALUES (678002,'RAAT KO AAUGA',5);
INSERT INTO SONG VALUES (678003,'NATIONAL SONG',4);
INSERT INTO SONG VALUES (678004,'MANA KARKE PAYAR',4);
INSERT INTO SONG VALUES (678005,'RAAT KO AAUGA',5);
INSERT INTO SONG VALUES (678006,'NATIONAL SONG',4);
INSERT INTO SONG VALUES (678007,'MANA KARKE PAYAR',4);
INSERT INTO SONG VALUES (678008,'RAAT KO AAUGA',5);
INSERT INTO SONG VALUES (678009,'NATIONAL SONG',4);
INSERT INTO SONG VALUES (678010,'MANA KARKE PAYAR',4);
INSERT INTO SONG VALUES (678011,'RAAT KO AAUGA',5);
INSERT INTO SONG VALUES (678012,'NATIONAL SONG',4);
INSERT INTO SONG VALUES (678013,'MANA KARKE PAYAR',4);
INSERT INTO SONG VALUES (678014,'RAAT KO AAUGA',5);
INSERT INTO SONG VALUES (678015,'NATIONAL SONG',4);
INSERT INTO SONG VALUES (678016,'MANA KARKE PAYAR',4);
INSERT INTO SONG VALUES (678017,'RAAT KO AAUGA',5);
INSERT INTO SONG VALUES (678018,'NATIONAL SONG',4);
INSERT INTO SONG VALUES (678019,'MANA KARKE PAYAR',4);
INSERT INTO SONG VALUES (678020,'RAAT KO AAUGA',5);

To insert new records into the ALBUM table:

INSERT INTO ALBUM VALUES (90801,'english song',100,'09-APR-76');
INSERT INTO ALBUM VALUES (90802,'tamil song',700,'09-JAN-10');
INSERT INTO ALBUM VALUES (90803,'english song',100,'09-NOV-80');

To insert new records into the DIGITAL_ORDER table:

insert into DIGITAL_ORDER values (802006,'Y');
insert into DIGITAL_ORDER values (802007,'M');

To insert new records into the PHYSICAL_ORDER table:

insert into PHYSICAL_ORDER values (802006,'F');
insert into PHYSICAL_ORDER values (802007,'S');

To insert new records into the PLAY_HISTORY table:

insert into PLAY_HISTORY values (802006,678001,'09-APR-76',7);
insert into PLAY_HISTORY values (802007,678002,'03-JAN-89',10);

To insert new records into the ORDER_LINE table:

insert into ORDER_LINE values (802006,90801,756);
insert into ORDER_LINE values (802007,90802,100);

To insert new records into the ARTIST table:

insert into ARTIST values (567001,'raj','09-APR-60');
insert into ARTIST values (567002,'aditya','09-JAN-90');

To insert new records into the GENRE table:

insert into GENRE values (3401,'raj');
insert into GENRE values (3402,'raju');

To insert new records into the CONTAINS table:

insert into CONTAINS values (678001,90801);
insert into CONTAINS values (678002,90802);

To insert new records into the WRITES table:

insert into WRITES values (567001,678001);
insert into WRITES values (567002,678002);

To insert new records into the BELONGSTO table:

insert into BELONGSTO values (678001,3401);
insert into BELONGSTO values (678002,3402);

---------------------------------------------------------------------------------------------------------
To see the records:

SELECT * FROM CUSTOMER;
SELECT * FROM ORDER_RECORD;
SELECT * FROM DIGITAL_ORDER;
SELECT * FROM SONG;
SELECT * FROM ALBUM;
SELECT * FROM BELONGSTO;
SELECT * FROM CONTAINS;
SELECT * FROM WRITES;
SELECT * FROM ARTIST;
SELECT * FROM GENRE;
SELECT * FROM ORDER_LINE;
SELECT * FROM PHYSICAL_ORDER;
SELECT * FROM PLAY_HISTORY;



