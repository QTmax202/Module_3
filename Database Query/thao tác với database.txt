create database quanlybanhang;

CREATE TABLE `quanlybanhang`.`customer` (
  `cID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(25) NULL,
  `cAge` TINYINT(3) NULL,
  PRIMARY KEY (`cID`));

CREATE TABLE `quanlybanhang`.`order` (
  `oID` INT NOT NULL AUTO_INCREMENT,
  `cID` INT NULL,
  `oDate` DATETIME NULL,
  `oTotalPrice` INT NULL,
  PRIMARY KEY (`oID`),
  INDEX `customerID_idx` (`cID` ASC) VISIBLE,
  CONSTRAINT `customerID`
    FOREIGN KEY (`cID`)
    REFERENCES `quanlybanhang`.`customer` (`cID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `quanlybanhang`.`product` (
  `pID` INT NOT NULL AUTO_INCREMENT,
  `pName` VARCHAR(25) NULL,
  `pPrice` INT NULL,
  PRIMARY KEY (`pID`));

CREATE TABLE `quanlybanhang`.`orderdetail` (
  `oID` INT NOT NULL,
  `pID` INT NOT NULL,
  `odQTY` INT NOT NULL,
  INDEX `OrderID_idx` (`oID` ASC) VISIBLE,
  INDEX `ProductID_idx` (`pID` ASC) VISIBLE,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`oID`)
    REFERENCES `quanlybanhang`.`order` (`oID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ProductID`
    FOREIGN KEY (`pID`)
    REFERENCES `quanlybanhang`.`product` (`pID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

    
INSERT INTO `quanlybanhang`.`order` (`cID`, `oDate`) VALUES ('1', '2006/3/21');
INSERT INTO `quanlybanhang`.`order` (`cID`, `oDate`) VALUES ('2', '2006/3/23');
INSERT INTO `quanlybanhang`.`order` (`cID`, `oDate`) VALUES ('1', '2006/3/16');

INSERT INTO `quanlybanhang`.`product` (`pName`, `pPrice`) VALUES ('May Giat', '3');
INSERT INTO `quanlybanhang`.`product` (`pName`, `pPrice`) VALUES ('Tu Lanh', '5');
INSERT INTO `quanlybanhang`.`product` (`pName`, `pPrice`) VALUES ('Dieu Hoa', '7');
INSERT INTO `quanlybanhang`.`product` (`pName`, `pPrice`) VALUES ('Quat', '1');
INSERT INTO `quanlybanhang`.`product` (`pName`, `pPrice`) VALUES ('Bep Dien', '2');

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oID, oDate, oTotalPrice from quanlybanhang.order;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.cID,c.Name,p.pName from customer c
join quanlybanhang.order o on c.cID = o.cID
join orderdetail od on od.oID = o.oID
join product p on p.pID = od.pID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.cID, c.Name , c.cAge from customer c
left join quanlybanhang.order o on c.cID = o.cID
where o.cID is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
--  Giá bán của từng loại được tính = odQTY*pPrice)
select o.oID, o.oDate, sum(od.odQTY * p.pPrice) as oToTalPrice from quanlybanhang.order o
join orderdetail od on o.oID = od.oID
join product p on od.pID = p.pID
group by o.oID;