-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2025 at 07:38 AM
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

--
-- Dumping data for table `cart_details_tbl`
--

INSERT INTO `cart_details_tbl` (`Cart_Product_ID`, `Cart_ID`, `Customer_ID`, `Product_ID`, `Price`, `Manufacturing_Cost`, `Total`) VALUES
(1, 101, 1, 201, 1500, 700.00, 2200.00),
(2, 102, 2, 202, 2000, 900.00, 2900.00),
(3, 103, 3, 203, 1200, 500.00, 1700.00),
(4, 104, 4, 204, 1800, 800.00, 2600.00),
(5, 105, 5, 205, 2500, 1100.00, 3600.00);

-- --------------------------------------------------------

--
-- Table structure for table `cart_tbl`
--

CREATE TABLE `cart_tbl` (
  `Cart_ID` int(5) NOT NULL,
  `Customer_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_tbl`
--

INSERT INTO `cart_tbl` (`Cart_ID`, `Customer_ID`) VALUES
(101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 5);

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

--
-- Dumping data for table `category_details_tbl`
--

INSERT INTO `category_details_tbl` (`Category_ID`, `Category_Name`, `Date`, `Is_Active`) VALUES
(1, 'Sneakers', '2025-01-20 10:19:08.00', 1),
(2, 'Formal Shoes', '2025-01-20 10:19:08.00', 1),
(3, 'Sandals', '2025-01-20 10:19:08.00', 1),
(4, 'Boots', '2025-01-20 10:19:08.00', 1),
(5, 'Slippers', '2025-01-20 10:19:08.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `city_tbl`
--

CREATE TABLE `city_tbl` (
  `City_ID` int(5) NOT NULL,
  `State_ID` int(5) DEFAULT NULL,
  `City_Name` varchar(28) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city_tbl`
--

INSERT INTO `city_tbl` (`City_ID`, `State_ID`, `City_Name`) VALUES
(1, 1, 'Ahmedabad'),
(2, 1, 'Surat'),
(3, 2, 'Mumbai'),
(4, 2, 'Pune'),
(5, 3, 'Bangalore');

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

--
-- Dumping data for table `customer_details_tbl`
--

INSERT INTO `customer_details_tbl` (`Customer_ID`, `Fname`, `Lname`, `Email`, `Password`, `Birthdate`, `Age`, `Gender`, `ContactNo`, `Address`, `City_ID`, `Pincode`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'password123', '1990-01-01', 33, 'M', '9876543210', '123 Street, City', 1, 380001),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'password123', '1992-02-02', 31, 'F', '9876543211', '456 Avenue, City', 2, 395007),
(3, 'Alice', 'Brown', 'alice.brown@example.com', 'password123', '1995-03-03', 28, 'F', '9876543212', '789 Road, City', 3, 400001),
(4, 'Bob', 'Johnson', 'bob.johnson@example.com', 'password123', '1988-04-04', 35, 'M', '9876543213', '101 Blvd, City', 4, 411001),
(5, 'Charlie', 'Davis', 'charlie.davis@example.com', 'password123', '1985-05-05', 38, 'M', '9876543214', '202 Lane, City', 5, 560001),
(12, 'Jason', 'Jasonasdads', 'john.doew@example.com', '$2y$10$JjNEYgf8q/Ktq3lJkuk3BeiPCnkNYMSv95naOh5zzdUmSN2lrnqVe', '2004-04-02', 0, 'M', '6546465465', 'B-302 Suhavan Appartments Judges Buglow Road Bodekdev Ahmedabad', 1, 380015),
(13, 'Veer', 'Diyora', 'veerdiyora@gmail.com', '$2y$10$qFQJDWXcIX2hrtJ1ftnEvOJG790ZuDioNQRN/1hndDbb2NjgOEXZe', '2005-04-30', 0, 'M', '9586254785', 'suratr', 2, 395009);

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

--
-- Dumping data for table `customer_support_tbl`
--

INSERT INTO `customer_support_tbl` (`Query_ID`, `Customer_ID`, `Query`, `Response`, `Date_Created`, `Date_Resolved`, `Is_Resolved`, `Response_time_limit`, `Is_Overdue`, `Notification_Sent`, `Last_Notification_Time`, `Admin_response_time`) VALUES
(1, 1, 'My order #1234 hasn\'t arrived yet. It\'s been 7 days since the estimated delivery date.', 'We apologize for the delay. Your order was delayed due to weather conditions. It will be delivered within 2 business days.', '2025-01-15 05:00:00.00', '2025-01-15 06:15:00.00', 1, 24, 0, 1, '2025-01-15 05:05:00.00', '2025-01-15 06:15:00.00'),
(2, 3, 'How do I customize the color of patches on my shoes?', 'You can customize patch colors in the product customization page. Click on the patch section and select your desired color from the color palette.', '2025-01-16 08:50:00.00', '2025-01-16 09:15:00.00', 1, 24, 0, 1, '2025-01-16 08:55:00.00', '2025-01-16 09:15:00.00'),
(3, 2, 'The size I received is smaller than what I ordered. I need a replacement.', NULL, '2025-01-19 03:45:00.00', NULL, 0, 48, 0, 1, '2025-01-19 03:50:00.00', NULL),
(4, 4, 'Can I change my shipping address for order #2468?', 'Yes, we\'ve updated your shipping address. Your order will be delivered to the new address provided.', '2025-01-18 11:00:00.00', '2025-01-18 11:25:00.00', 1, 24, 0, 1, '2025-01-18 11:05:00.00', '2025-01-18 11:25:00.00'),
(5, 5, 'The payment for my order failed but money was deducted from my account', NULL, '2025-01-20 02:30:00.00', NULL, 0, 24, 0, 0, NULL, NULL);

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

--
-- Dumping data for table `customized_product_details_tbl`
--

INSERT INTO `customized_product_details_tbl` (`Customer_ID`, `Product_ID`, `Material_ID`, `Size_ID`) VALUES
(1, 201, 1, 3),
(2, 202, 2, 2),
(3, 203, 3, 4),
(4, 204, 4, 5),
(5, 205, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `materials_tbl`
--

CREATE TABLE `materials_tbl` (
  `Material_ID` int(5) NOT NULL,
  `Material_Name` varchar(50) NOT NULL,
  `Material_Price` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materials_tbl`
--

INSERT INTO `materials_tbl` (`Material_ID`, `Material_Name`, `Material_Price`) VALUES
(1, 'Leather', 500.00),
(2, 'Foam', 300.00),
(3, 'Canvas', 200.00),
(4, 'Rubber', 150.00),
(5, 'Mesh', 250.00);

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

--
-- Dumping data for table `order_details_tbl`
--

INSERT INTO `order_details_tbl` (`Order_Details_ID`, `Order_ID`, `Product_ID`, `Quantity`, `Total`) VALUES
(1, 1, 201, 1, 1500.00),
(2, 2, 202, 1, 2000.00),
(3, 3, 203, 1, 1200.00),
(4, 4, 204, 1, 1800.00),
(5, 5, 205, 1, 2500.00);

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

--
-- Dumping data for table `order_tbl`
--

INSERT INTO `order_tbl` (`Order_ID`, `Customer_ID`, `Total_amt`, `Date_ordered`, `Payment_Status`, `Estimated_Delivery_Date`, `Delivery_Status`, `Order_Status`) VALUES
(1, 1, 1500.00, '2025-01-15 04:30:00.00', 'Paid', '2025-01-22', 'Shipped', 'P'),
(2, 2, 2000.00, '2025-01-16 06:00:00.00', 'Paid', '2025-01-23', 'Pending', 'P'),
(3, 3, 1200.00, '2025-01-17 09:15:00.00', 'Pending', '2025-01-24', 'N', 'N'),
(4, 4, 1800.00, '2025-01-18 03:45:00.00', 'Paid', '2025-01-25', 'Delivered', 'C'),
(5, 5, 2500.00, '2025-01-19 10:50:00.00', 'Failed', '2025-01-26', 'N', 'C');

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

--
-- Dumping data for table `patch_color_tbl`
--

INSERT INTO `patch_color_tbl` (`Patch_ID`, `Customer_ID`, `Product_ID`, `color`) VALUES
(1, 1, 201, 'Red'),
(1, 12, 201, '#74b9ff'),
(2, 2, 202, 'Blue'),
(2, 12, 201, '#d9534f'),
(3, 3, 203, 'Green'),
(3, 12, 201, '#ffffff'),
(4, 4, 204, 'Gold'),
(4, 12, 201, '#ffffff'),
(5, 5, 205, 'Silver'),
(5, 12, 201, '#ffffff'),
(6, 12, 201, '#ffffff'),
(7, 12, 201, '#ffffff'),
(8, 12, 201, '#ffffff'),
(9, 12, 201, '#ffffff'),
(10, 12, 201, '#ffffff'),
(11, 12, 201, '#ffffff'),
(12, 12, 201, '#ffffff'),
(13, 12, 201, '#ffffff');

-- --------------------------------------------------------

--
-- Table structure for table `patch_details_tbl`
--

CREATE TABLE `patch_details_tbl` (
  `Patch_ID` int(5) NOT NULL,
  `Patch_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patch_details_tbl`
--

INSERT INTO `patch_details_tbl` (`Patch_ID`, `Patch_Name`) VALUES
(1, 'Nike Swoosh'),
(2, 'Star Pattern'),
(3, 'Custom Name'),
(4, 'Lightning Bolt'),
(5, 'Heart Shape');

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

--
-- Dumping data for table `payment_tbl`
--

INSERT INTO `payment_tbl` (`Payment_ID`, `Customer_ID`, `Order_ID`, `Amount`, `Payment_Status`, `Transaction_Date`, `Payment_mode`) VALUES
(1, 1, 1, 1500.00, 1, '2025-01-15 04:35:00.00', 'Credit Card'),
(2, 2, 2, 2000.00, 1, '2025-01-16 06:05:00.00', 'Debit Card'),
(3, 3, 3, 1200.00, 0, '2025-01-17 09:20:00.00', 'UPI'),
(4, 4, 4, 1800.00, 1, '2025-01-18 03:50:00.00', 'Net Banking'),
(5, 5, 5, 2500.00, 0, '2025-01-19 10:55:00.00', 'Credit Card');

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

--
-- Dumping data for table `product_details_tbl`
--

INSERT INTO `product_details_tbl` (`Product_ID`, `Product_Name`, `Category_ID`, `Description`, `Price`, `Manufacturing_Cost`, `Is_Active`, `Date`) VALUES
(201, 'AirMax', 1, 'Comfortable sneakers', 1500.00, 99.99, 1, '2025-01-20 10:26:19.00'),
(202, 'FormalPro', 2, 'Elegant formal shoes', 2000.00, 99.99, 1, '2025-01-20 10:26:19.00'),
(203, 'SandWalk', 3, 'Durable sandals', 1200.00, 99.99, 1, '2025-01-20 10:26:19.00'),
(204, 'TrekBoot', 4, 'Sturdy boots', 1800.00, 99.99, 1, '2025-01-20 10:26:19.00'),
(205, 'SoftSteps', 5, 'Cozy slippers', 2500.00, 99.99, 1, '2025-01-20 10:26:19.00');

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

--
-- Dumping data for table `review_rating_tbl`
--

INSERT INTO `review_rating_tbl` (`Review_ID`, `Customer_ID`, `Product_ID`, `Rating`, `Review_Text`, `Created_At`, `Updated_At`) VALUES
(1, 1, 201, 4.5, 'Great comfortable sneakers, perfect for daily wear!', '2025-01-16 10:00:00.00', NULL),
(2, 2, 202, 5.0, 'These formal shoes are exactly what I needed for work.', '2025-01-17 07:15:00.00', NULL),
(3, 3, 203, 3.5, 'Good sandals but could be more durable.', '2025-01-18 03:50:00.00', '2025-01-18 09:00:00.00'),
(4, 4, 204, 4.8, 'Excellent boots for hiking, very sturdy and comfortable.', '2025-01-19 10:45:00.00', NULL),
(5, 5, 205, 4.0, 'Comfortable slippers but a bit pricey.', '2025-01-20 04:30:00.00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shoe_size_tbl`
--

CREATE TABLE `shoe_size_tbl` (
  `Shoe_Size_ID` int(5) NOT NULL,
  `Product_ID` int(5) NOT NULL,
  `Size_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shoe_size_tbl`
--

INSERT INTO `shoe_size_tbl` (`Shoe_Size_ID`, `Product_ID`, `Size_ID`) VALUES
(1, 201, 1),
(2, 201, 2),
(3, 202, 3),
(4, 203, 4),
(5, 204, 5),
(6, 205, 2);

-- --------------------------------------------------------

--
-- Table structure for table `size_tbl`
--

CREATE TABLE `size_tbl` (
  `Size_ID` int(5) NOT NULL,
  `Size` float(2,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `size_tbl`
--

INSERT INTO `size_tbl` (`Size_ID`, `Size`) VALUES
(1, 6.0),
(2, 7.0),
(3, 8.0),
(4, 9.0),
(5, 9.9);

-- --------------------------------------------------------

--
-- Table structure for table `state_tbl`
--

CREATE TABLE `state_tbl` (
  `State_ID` int(5) NOT NULL,
  `State_Name` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `state_tbl`
--

INSERT INTO `state_tbl` (`State_ID`, `State_Name`) VALUES
(1, 'Gujarat'),
(2, 'Maharashtra'),
(3, 'Karnataka'),
(4, 'Rajasthan'),
(5, 'Tamil Nadu');

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
  MODIFY `Cart_Product_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart_tbl`
--
ALTER TABLE `cart_tbl`
  MODIFY `Cart_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `category_details_tbl`
--
ALTER TABLE `category_details_tbl`
  MODIFY `Category_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `city_tbl`
--
ALTER TABLE `city_tbl`
  MODIFY `City_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer_details_tbl`
--
ALTER TABLE `customer_details_tbl`
  MODIFY `Customer_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `customer_support_tbl`
--
ALTER TABLE `customer_support_tbl`
  MODIFY `Query_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `materials_tbl`
--
ALTER TABLE `materials_tbl`
  MODIFY `Material_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_details_tbl`
--
ALTER TABLE `order_details_tbl`
  MODIFY `Order_Details_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_tbl`
--
ALTER TABLE `order_tbl`
  MODIFY `Order_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patch_details_tbl`
--
ALTER TABLE `patch_details_tbl`
  MODIFY `Patch_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_tbl`
--
ALTER TABLE `payment_tbl`
  MODIFY `Payment_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_details_tbl`
--
ALTER TABLE `product_details_tbl`
  MODIFY `Product_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `review_rating_tbl`
--
ALTER TABLE `review_rating_tbl`
  MODIFY `Review_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shoe_size_tbl`
--
ALTER TABLE `shoe_size_tbl`
  MODIFY `Shoe_Size_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `size_tbl`
--
ALTER TABLE `size_tbl`
  MODIFY `Size_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `state_tbl`
--
ALTER TABLE `state_tbl`
  MODIFY `State_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
