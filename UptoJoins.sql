create database if not exists learnvern;
-- shortcut toexecute ctr+enter
-- unsinged = can't be negative
drop database learnvern;
create table products (pro_id int primary key not null auto_increment, prod_code char(4) not null, name varchar(15) not null, quantity int unsigned not null default 0, price decimal(10,2) not null default 99999.99);
insert into products values(101,"Mark","bluemarker",500,10.55);
insert into products values(null,"Mark","readmarker",1500,8.33);
insert into products values(null,"Mark","bluemarker",1200,3.44);
insert into products values(null,"Mark","whitemarker",1100,9.44),(null,"Mark","whitemarker",1200,5.4);
insert into products (prod_code, name, quantity, price) values ("Pen" ,"Blackmarker", 300, 4.33);
-- select pro_id, prod_code, name, price from products where name like "b_ue%" and prod_code="mark";
-- select * from products where quantity <1500 and prod_code = 'mark';
alter table products add pro_expiry int not null default 0 after pro_id;
alter table products modify name varchar(100) not null;
alter table products change column name pro_name varchar(100) not null;
alter table products drop column pro_expiry;
-- alter table products rename to bigProduct;
-- alter table bigproduct rename to products;
-- desc products;	
-- desc bigproduct;
-- truncate table products;
select * from products;
alter table products add pro_suppliers int not null default 0 ;
create table suppliers(sup_id int unsigned auto_increment not null, name varchar(100) not null, phone char(9) not null, primary key(sup_id));
insert into suppliers values (1001,'jain Agency',987987987),(1002,'Meet Corporation',454545454), (1003,'ABC Traders',363636363), (1004,'Shah Company',575757575);
alter table products add column supplier_id int unsigned not null;
SET SQL_SAFE_UPDATES = 0;
update products set supplier_id = 1001;	
alter table products add foreign key (supplier_id) references suppliers(sup_id);
select * from products join suppliers on products.supplier_id = suppliers.sup_id;
select * from products left join suppliers on products.supplier_id = suppliers.sup_id;
select * from products right join suppliers on products.supplier_id = suppliers.sup_id;
select * from products left join suppliers on products.supplier_id = suppliers.sup_id union all select * from products right join suppliers on products.supplier_id = suppliers.sup_id where pro_id is null;
select * from suppliers cross join products;