-- Table structure for table `hotel`

CREATE TABLE `hotel` (
  `hotelID` int NOT NULL auto_increment,
  `hotel_name` varchar(50) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `zipcode` int DEFAULT 1,
  PRIMARY KEY (`hotelID`)
);

-- Table structure for table `HotelPhoneNumbers`
-- In case we want to add fax, international numbers, reservation #
--room service etc.
CREATE TABLE `HotelPhoneNumbers` (
  `hotelID` int NOT NULL DEFAULT 1,
  `phone_no` varchar(30) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`hotelID`, `phone_no`),
  FOREIGN KEY (`hotelID`) REFERENCES `hotel`(`hotelID`)
);

-- Table structure for table `myroom`

CREATE TABLE `myroom` (
  `room_num` INT NOT NULL DEFAULT 1,
  `hotelID` INT NOT NULL DEFAULT 1,
  `price` FLOAT DEFAULT NULL,
  `capacity` INT DEFAULT NULL,
  `room_type` ENUM('standard','double','deluxe','suite'),
  PRIMARY KEY (`room_num`, `hotelID`),
  FOREIGN KEY (`hotelID`) REFERENCES `hotel`(`hotelID`)
);

-- Table structure for table `customer`

CREATE TABLE `customer` (
  `CID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT ' ',
  `password` varchar (100) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `PHONE_NUM` int DEFAULT NULL,
  PRIMARY KEY (`CID`)
);

-- Table structure for table `reservation`

CREATE TABLE `reservation` (
  `invoiceNo` INT NOT NULL auto_increment,
  `CID` INT NOT NULL DEFAULT 1,
  `totalAmt` FLOAT DEFAULT NULL,
  `resDate` DATE NOT NULL DEFAULT '2019-12-05',
  PRIMARY KEY (`invoiceNO`),
  FOREIGN KEY (`CID`) REFERENCES `customer`(`CID`)
);

-- Table structure for table `reserves`

CREATE TABLE `reserves` (
  `invoiceNo` INT NOT NULL DEFAULT 1,
  `room_num` INT NOT NULL DEFAULT 1,
  `hotelID` INT NOT NULL DEFAULT 1,
  `noOfDays` INT DEFAULT NULL,
  `inDate` DATE NOT NULL DEFAULT '2019-12-05',
  `outDate` DATE NOT NULL DEFAULT '2019-12-05',
  PRIMARY KEY (`invoiceNo`,`room_num`,`hotelID`),
  FOREIGN KEY (`invoiceNo`) REFERENCES `reservation`(`invoiceNo`),
  FOREIGN KEY (`room_num`,`hotelID`) REFERENCES `myroom`(`room_num`,`hotelID`)
);

-- Table structure for table creditcard

CREATE TABLE `creditcard` (
  `CNumber` INT NOT NULL DEFAULT 1,
  `CID` INT NOT NULL DEFAULT 1,
  `InvoiceNo` INT NOT NULL DEFAULT 1,
  `Name` varchar(30) DEFAULT NULL,
  `ExpDate` DATE DEFAULT NULL,
  `Type` varchar (20) DEFAULT NULL,
  `SecCode` INT NOT NULL DEFAULT 1,
  `BillingAddr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CNumber`, `CID`, `InvoiceNo`),
  FOREIGN KEY (`CID`) REFERENCES `customer`(`CID`),
  FOREIGN KEY (`InvoiceNo`) REFERENCES `reservation`(`invoiceNo`)
);
