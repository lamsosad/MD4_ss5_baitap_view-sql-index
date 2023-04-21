create database PRODUCT;
USE PRODUCT;

create TABLE PRODUCT(
id int primary key auto_increment,
productCode varchar(255) unique,
productName varchar(255),
productPrice float,
productAmount int,
productDescription varchar(255),
productStatus tinyint default 1
);

insert into PRODUCT(productCode,productName,productPrice,productAmount,productDescription)values
("sp1","IPHONE 13",799,20,"ĐẸP"),
("sp2","IPHONE 11 PRO",599,10,"ĐẸP"),
("sp3","IPHONE SE 2022",299,50,"ĐẸP"),
("sp4","IPHONE 3G",99,100,"ĐẸP"),
("sp5","IPHONE 5S",199,8,"ĐẸP"),
("sp6","IPHONE 14",899,14,"ĐẸP");



-- explain ban dau
explain SELECT * FROM product.product;
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create unique index index_product
on product(productName,productPrice);
-- explain sau khi chi muc
explain SELECT * FROM product.product;

-- < VIEW > ---
-- Tạo view lấy về các thông tin: productCode, productName, productPrice,productStatus từ bảng products.
create view view_product as
select productCode, productName, productPrice,productStatus from product;

-- sửa đổi view
update view_product set productPrice=799 where productCode="sp1";

select * from view_product;
-- xoa view
drop view view_product;

-- < PROCEDURE > --
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE Product_show()
begin
select * from product;
end;
// DELIMITER ;

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE Product_Create(in productCode varchar(255),in productName varchar(255),
in productPrice float,in productAmount int,in productDescription varchar(255),in productStatus tinyint)
begin
insert into product (productCode,productName,productPrice,productAmount,productDescription,productStatus) values(productCode,productName,productPrice,productAmount,productDescription,productStatus);
end;
// DELIMITER ;

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE Product_Edit(in id int,in productStatus tinyint)
begin
update product set product.productStatus=productStatus where product.id = id;
end;
// DELIMITER ;

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE Product_Delete(in id int)
begin
delete from product where product.id = id;
end;
// DELIMITER ;

call Product_Delete(2);
call Product_Edit(3,0);
call Product_Create("sp7","IPHONE 7 PLUS",899,2,"ĐẸP",0);
call Product_show();