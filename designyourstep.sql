-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2025 at 11:12 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `designyourstep`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_details_tbl`
--

CREATE TABLE `cart_details_tbl` (
  `Cart_Product_ID` int(5) NOT NULL,
  `Cart_ID` int(5) NOT NULL,
  `Customer_ID` int(5) NOT NULL,
  `Product_ID` int(5) NOT NULL,
  `Price` int(5) NOT NULL,
  `Manufacturing_Cost` float(7,2) NOT NULL,
  `Total` float(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_tbl`
--

CREATE TABLE `cart_tbl` (
  `Cart_ID` int(5) NOT NULL,
  `Customer_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_details_tbl`
--

CREATE TABLE `category_details_tbl` (
  `Category_ID` int(5) NOT NULL,
  `Category_Name` varchar(20) NOT NULL,
  `Date` timestamp(2) NULL DEFAULT NULL ON UPDATE current_timestamp(2),
  `Is_Active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `city_tbl`
--

CREATE TABLE `city_tbl` (
  `City_ID` int(5) NOT NULL,
  `State_ID` int(5) DEFAULT NULL,
  `City_Name` varchar(28) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_details_tbl`
--

CREATE TABLE `customer_details_tbl` (
  `Customer_ID` int(5) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `Email` varchar(40) NOT NULL,
  `Password` varchar(500) NOT NULL,
  `Birthdate` date NOT NULL,
  `Age` int(5) NOT NULL,
  `Gender` char(1) DEFAULT NULL,
  `ContactNo` varchar(15) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `City_ID` int(5) NOT NULL,
  `Pincode` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_support_tbl`
--

CREATE TABLE `customer_support_tbl` (
  `Query_ID` int(5) NOT NULL,
  `Customer_ID` int(5) DEFAULT NULL,
  `Query` varchar(255) NOT NULL,
  `Response` varchar(255) DEFAULT NULL,
  `Date_Created` timestamp(2) NOT NULL DEFAULT current_timestamp(2) ON UPDATE current_timestamp(2),
  `Date_Resolved` timestamp(2) NULL DEFAULT NULL,
  `Is_Resolved` tinyint(4) NOT NULL,
  `Response_time_limit` int(2) NOT NULL,
  `Is_Overdue` tinyint(4) NOT NULL,
  `Notification_Sent` tinyint(4) NOT NULL,
  `Last_Notification_Time` timestamp(2) NULL DEFAULT NULL,
  `Admin_response_time` timestamp(2) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customized_product_details_tbl`
--

CREATE TABLE `customized_product_details_tbl` (
  `Customer_ID` int(5) NOT NULL,
  `Product_ID` int(5) NOT NULL,
  `Material_ID` int(5) DEFAULT NULL,
  `Size_ID` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materials_tbl`
--

CREATE TABLE `materials_tbl` (
  `Material_ID` int(5) NOT NULL,
  `Material_Name` varchar(50) NOT NULL,
  `Material_Price` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details_tbl`
--

CREATE TABLE `order_details_tbl` (
  `Order_Details_ID` int(5) NOT NULL,
  `Order_ID` int(5) NOT NULL,
  `Product_ID` int(5) NOT NULL,
  `Quantity` int(3) NOT NULL,
  `Total` float(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_tbl`
--

CREATE TABLE `order_tbl` (
  `Order_ID` int(5) NOT NULL,
  `Customer_ID` int(5) NOT NULL,
  `Total_amt` float(8,2) NOT NULL,
  `Date_ordered` timestamp(2) NOT NULL DEFAULT current_timestamp(2) ON UPDATE current_timestamp(2),
  `Payment_Status` varchar(10) NOT NULL,
  `Estimated_Delivery_Date` date NOT NULL,
  `Delivery_Status` varchar(10) NOT NULL DEFAULT 'N',
  `Order_Status` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patch_color_tbl`
--

CREATE TABLE `patch_color_tbl` (
  `Patch_ID` int(5) NOT NULL,
  `Customer_ID` int(5) NOT NULL,
  `Product_ID` int(5) NOT NULL,
  `color` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patch_details_tbl`
--

CREATE TABLE `patch_details_tbl` (
  `Patch_ID` int(5) NOT NULL,
  `Patch_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_tbl`
--

CREATE TABLE `payment_tbl` (
  `Payment_ID` int(5) NOT NULL,
  `Customer_ID` int(5) DEFAULT NULL,
  `Order_ID` int(5) DEFAULT NULL,
  `Amount` float(9,2) NOT NULL,
  `Payment_Status` tinyint(4) NOT NULL,
  `Transaction_Date` timestamp(2) NULL DEFAULT NULL,
  `Payment_mode` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_details_tbl`
--

CREATE TABLE `product_details_tbl` (
  `Product_ID` int(5) NOT NULL,
  `Product_Name` varchar(20) NOT NULL,
  `Category_ID` int(5) DEFAULT NULL,
  `Description` varchar(40) NOT NULL,
  `Price` float(7,2) NOT NULL,
  `Manufacturing_Cost` float(4,2) DEFAULT NULL,
  `Is_Active` tinyint(4) NOT NULL,
  `Date` timestamp(2) NOT NULL DEFAULT current_timestamp(2) ON UPDATE current_timestamp(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review_rating_tbl`
--

CREATE TABLE `review_rating_tbl` (
  `Review_ID` int(5) NOT NULL,
  `Customer_ID` int(5) NOT NULL,
  `Product_ID` int(5) NOT NULL,
  `Rating` float(2,1) NOT NULL,
  `Review_Text` varchar(255) DEFAULT NULL,
  `Created_At` timestamp(2) NOT NULL DEFAULT current_timestamp(2) ON UPDATE current_timestamp(2),
  `Updated_At` timestamp(2) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shoe_size_tbl`
--

CREATE TABLE `shoe_size_tbl` (
  `Shoe_Size_ID` int(5) NOT NULL,
  `Product_ID` int(5) NOT NULL,
  `Size_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `size_tbl`
--

CREATE TABLE `size_tbl` (
  `Size_ID` int(5) NOT NULL,
  `Size` float(2,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `state_tbl`
--

CREATE TABLE `state_tbl` (
  `State_ID` int(5) NOT NULL,
  `State_Name` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_details_tbl`
--
ALTER TABLE `cart_details_tbl`
  ADD PRIMARY KEY (`Cart_Product_ID`),
  ADD KEY `fk_cartdettocart` (`Cart_ID`),
  ADD KEY `fk_prodtocartdet` (`Product_ID`);

--
-- Indexes for table `cart_tbl`
--
ALTER TABLE `cart_tbl`
  ADD PRIMARY KEY (`Cart_ID`),
  ADD KEY `fk_custcart` (`Customer_ID`);

--
-- Indexes for table `category_details_tbl`
--
ALTER TABLE `category_details_tbl`
  ADD PRIMARY KEY (`Category_ID`);

--
-- Indexes for table `city_tbl`
--
ALTER TABLE `city_tbl`
  ADD PRIMARY KEY (`City_ID`),
  ADD KEY `fk_parent` (`State_ID`);

--
-- Indexes for table `customer_details_tbl`
--
ALTER TABLE `customer_details_tbl`
  ADD PRIMARY KEY (`Customer_ID`),
  ADD UNIQUE KEY `Email_UNIQUE` (`Email`),
  ADD KEY `fk_city_id` (`City_ID`);

--
-- Indexes for table `customer_support_tbl`
--
ALTER TABLE `customer_support_tbl`
  ADD PRIMARY KEY (`Query_ID`),
  ADD KEY `fk_custocussup` (`Customer_ID`);

--
-- Indexes for table `customized_product_details_tbl`
--
ALTER TABLE `customized_product_details_tbl`
  ADD PRIMARY KEY (`Customer_ID`,`Product_ID`),
  ADD KEY `fk_custprodmaterial` (`Material_ID`),
  ADD KEY `fk_custprodsize` (`Size_ID`);

--
-- Indexes for table `materials_tbl`
--
ALTER TABLE `materials_tbl`
  ADD PRIMARY KEY (`Material_ID`);

--
-- Indexes for table `order_details_tbl`
--
ALTER TABLE `order_details_tbl`
  ADD PRIMARY KEY (`Order_Details_ID`),
  ADD KEY `fk_ordtoorddet` (`Order_ID`),
  ADD KEY `fk_prodtoorddet` (`Product_ID`);

--
-- Indexes for table `order_tbl`
--
ALTER TABLE `order_tbl`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `fk_custoord` (`Customer_ID`);

--
-- Indexes for table `patch_color_tbl`
--
ALTER TABLE `patch_color_tbl`
  ADD PRIMARY KEY (`Patch_ID`,`Customer_ID`,`Product_ID`);

--
-- Indexes for table `patch_details_tbl`
--
ALTER TABLE `patch_details_tbl`
  ADD PRIMARY KEY (`Patch_ID`);

--
-- Indexes for table `payment_tbl`
--
ALTER TABLE `payment_tbl`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `fk_custopay` (`Customer_ID`),
  ADD KEY `fk_ordtopay` (`Order_ID`);

--
-- Indexes for table `product_details_tbl`
--
ALTER TABLE `product_details_tbl`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `fk_product_category` (`Category_ID`);

--
-- Indexes for table `review_rating_tbl`
--
ALTER TABLE `review_rating_tbl`
  ADD PRIMARY KEY (`Review_ID`);

--
-- Indexes for table `shoe_size_tbl`
--
ALTER TABLE `shoe_size_tbl`
  ADD PRIMARY KEY (`Shoe_Size_ID`);

--
-- Indexes for table `size_tbl`
--
ALTER TABLE `size_tbl`
  ADD PRIMARY KEY (`Size_ID`);

--
-- Indexes for table `state_tbl`
--
ALTER TABLE `state_tbl`
  ADD PRIMARY KEY (`State_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_details_tbl`
--
ALTER TABLE `cart_details_tbl`
  MODIFY `Cart_Product_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_tbl`
--
ALTER TABLE `cart_tbl`
  MODIFY `Cart_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_details_tbl`
--
ALTER TABLE `category_details_tbl`
  MODIFY `Category_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city_tbl`
--
ALTER TABLE `city_tbl`
  MODIFY `City_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_details_tbl`
--
ALTER TABLE `customer_details_tbl`
  MODIFY `Customer_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_support_tbl`
--
ALTER TABLE `customer_support_tbl`
  MODIFY `Query_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materials_tbl`
--
ALTER TABLE `materials_tbl`
  MODIFY `Material_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details_tbl`
--
ALTER TABLE `order_details_tbl`
  MODIFY `Order_Details_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_tbl`
--
ALTER TABLE `order_tbl`
  MODIFY `Order_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patch_details_tbl`
--
ALTER TABLE `patch_details_tbl`
  MODIFY `Patch_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_tbl`
--
ALTER TABLE `payment_tbl`
  MODIFY `Payment_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_details_tbl`
--
ALTER TABLE `product_details_tbl`
  MODIFY `Product_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_rating_tbl`
--
ALTER TABLE `review_rating_tbl`
  MODIFY `Review_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shoe_size_tbl`
--
ALTER TABLE `shoe_size_tbl`
  MODIFY `Shoe_Size_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `size_tbl`
--
ALTER TABLE `size_tbl`
  MODIFY `Size_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state_tbl`
--
ALTER TABLE `state_tbl`
  MODIFY `State_ID` int(5) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_details_tbl`
--
ALTER TABLE `cart_details_tbl`
  ADD CONSTRAINT `fk_cartdettocart` FOREIGN KEY (`Cart_ID`) REFERENCES `cart_tbl` (`Cart_ID`),
  ADD CONSTRAINT `fk_prodtocartdet` FOREIGN KEY (`Product_ID`) REFERENCES `product_details_tbl` (`Product_ID`);

--
-- Constraints for table `cart_tbl`
--
ALTER TABLE `cart_tbl`
  ADD CONSTRAINT `fk_custcart` FOREIGN KEY (`Customer_ID`) REFERENCES `customer_details_tbl` (`Customer_ID`);

--
-- Constraints for table `city_tbl`
--
ALTER TABLE `city_tbl`
  ADD CONSTRAINT `fk_parent` FOREIGN KEY (`State_ID`) REFERENCES `state_tbl` (`State_ID`);

--
-- Constraints for table `customer_details_tbl`
--
ALTER TABLE `customer_details_tbl`
  ADD CONSTRAINT `fk_city_id` FOREIGN KEY (`City_ID`) REFERENCES `city_tbl` (`City_ID`);

--
-- Constraints for table `customer_support_tbl`
--
ALTER TABLE `customer_support_tbl`
  ADD CONSTRAINT `fk_custocussup` FOREIGN KEY (`Customer_ID`) REFERENCES `customer_details_tbl` (`Customer_ID`);

--
-- Constraints for table `customized_product_details_tbl`
--
ALTER TABLE `customized_product_details_tbl`
  ADD CONSTRAINT `fk_custprodmaterial` FOREIGN KEY (`Material_ID`) REFERENCES `materials_tbl` (`Material_ID`),
  ADD CONSTRAINT `fk_custprodsize` FOREIGN KEY (`Size_ID`) REFERENCES `size_tbl` (`Size_ID`);

--
-- Constraints for table `order_details_tbl`
--
ALTER TABLE `order_details_tbl`
  ADD CONSTRAINT `fk_ordtoorddet` FOREIGN KEY (`Order_ID`) REFERENCES `order_tbl` (`Order_ID`),
  ADD CONSTRAINT `fk_prodtoorddet` FOREIGN KEY (`Product_ID`) REFERENCES `product_details_tbl` (`Product_ID`);

--
-- Constraints for table `order_tbl`
--
ALTER TABLE `order_tbl`
  ADD CONSTRAINT `fk_custoord` FOREIGN KEY (`Customer_ID`) REFERENCES `customer_details_tbl` (`Customer_ID`);

--
-- Constraints for table `payment_tbl`
--
ALTER TABLE `payment_tbl`
  ADD CONSTRAINT `fk_custopay` FOREIGN KEY (`Customer_ID`) REFERENCES `customer_details_tbl` (`Customer_ID`),
  ADD CONSTRAINT `fk_ordtopay` FOREIGN KEY (`Order_ID`) REFERENCES `order_tbl` (`Order_ID`);

--
-- Constraints for table `product_details_tbl`
--
ALTER TABLE `product_details_tbl`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`Category_ID`) REFERENCES `category_details_tbl` (`Category_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
