if exists (select * from sysobjects where id = object_id('ORDERS') and OBJECTPROPERTY(id, 'IsUserTable') = 1)    drop table ORDERS ;
if exists (select * from sysobjects where id = object_id('CUSTOMERS') and OBJECTPROPERTY(id, 'IsUserTable') = 1)    drop table CUSTOMERS ;
if exists (select * from sysobjects where id = object_id('AGENTS') and OBJECTPROPERTY(id, 'IsUserTable') = 1)    drop table AGENTS ;
if exists (select * from sysobjects where id = object_id('PRODUCTS') and OBJECTPROPERTY(id, 'IsUserTable') = 1)    drop table PRODUCTS ;

create table CUSTOMERS
(
	CID varchar(20),
	CNAME varchar(20),
	CITY varchar(20),
	DISCNT varchar(20),
	primary key(CID)
);

create table AGENTS
(
    AID varchar(20),
	ANAME varchar(20),
	CITY varchar(20),
	PERCENTS double precision,
	primary key(AID),
	check (PERCENTS < 100)
);

create table PRODUCTS
(
	PID varchar(20),
	PNAME varchar(20),
	primary key(PID)
);

create table ORDERS
(
    ORDNA varchar(20),
    MONTH varchar(20),
    CID varchar(20),
    AID varchar(20),
    PID varchar(20),   
    QTY varchar(20),
    DOLLARS varchar(20),
    primary key(ORDNA),
    foreign key(CID) references CUSTOMERS,
    foreign key(AID) references AGENTS,
    foreign key(PID) references PRODUCTS
);

alter table PRODUCTS add 
    CITY varchar(20),
    QUANTITY varchar(20),
    PRICE double precision;
    

create index customersIndex on CUSTOMERS(CID);
create index agentsIndex on AGENTS(AID);
create index productsIndex on PRODUCTS(PID);
create index ordersIndex on ORDERS(ORDNA);

drop index CUSTOMERS.customersIndex;
drop index AGENTS.agentsIndex;
drop index PRODUCTS.productsIndex;
drop index ORDERS.ordersIndex;

create index customersIndex on CUSTOMERS(CNAME desc);

alter table AGENTS drop column city;

alter table CUSTOMERS alter column city char(40);

drop table ORDERS;