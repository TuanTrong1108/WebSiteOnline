-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 24, 2022 lúc 03:05 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web_laptop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `passwork` varchar(100) NOT NULL,
  `admin_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`id_admin`, `username`, `passwork`, `admin_status`) VALUES
(1, 'tuanadmin', '123456789', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `id_cart` int(11) NOT NULL,
  `id_khachhang` int(11) NOT NULL,
  `code_cart` varchar(10) NOT NULL,
  `cart_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_cart_details`
--

CREATE TABLE `tbl_cart_details` (
  `id_cart_details` int(11) NOT NULL,
  `code_cart` varchar(10) NOT NULL,
  `id_sanpham` int(11) NOT NULL,
  `soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_danhmuc`
--

CREATE TABLE `tbl_danhmuc` (
  `id_danhmuc` int(11) NOT NULL,
  `tendanhmuc` varchar(100) NOT NULL,
  `thutu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_danhmuc`
--

INSERT INTO `tbl_danhmuc` (`id_danhmuc`, `tendanhmuc`, `thutu`) VALUES
(33, 'USB', 1),
(34, 'Thẻ Nhớ', 2),
(35, 'Tai Nghe', 3),
(36, 'Bàn phím', 4),
(37, 'Chuột', 5),
(38, 'LapTop', 6),
(39, 'PC', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_sanpham`
--

CREATE TABLE `tbl_sanpham` (
  `id_sanpham` int(11) NOT NULL,
  `tensanpham` varchar(250) NOT NULL,
  `masp` varchar(100) NOT NULL,
  `giasp` varchar(50) NOT NULL,
  `soluong` int(11) NOT NULL,
  `hinhanh` varchar(50) NOT NULL,
  `tomtat` tinytext NOT NULL,
  `noidung` text NOT NULL,
  `tinhtrang` int(11) NOT NULL,
  `id_danhmuc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_sanpham`
--

INSERT INTO `tbl_sanpham` (`id_sanpham`, `tensanpham`, `masp`, `giasp`, `soluong`, `hinhanh`, `tomtat`, `noidung`, `tinhtrang`, `id_danhmuc`) VALUES
(58, 'USB 3.2 Gen 1 Kingston DataTraveler', 't1', '99000', 5, '1658605088_u1.png', 'Thương hiệu: Kingston', 'Tình trạng: Còn hàng', 1, 34),
(59, 'Thẻ Nhớ MicroSDHC SanDisk Ultra', 't2', '115000', 5, '1658605077_u2.png', '32GB 100MB/s \r\nThương hiệu: Sandisk ', 'Tình trạng: Còn hàng', 1, 34),
(60, 'USB 3.2 SanDisk Extreme Go CZ810', 'u1', '1250000', 10, '1658605199_u1.png', 'Thương hiệu: Sandisk ', 'Tình trạng: Còn hàng', 1, 33),
(61, 'USB 3.2 SanDisk Extreme Pro CZ880', 'u2', '990000', 10, '1658605230_u2.png', 'Thương hiệu: Sandisk', 'Tình trạng: Còn hàng', 1, 33),
(62, 'Tai nghe Samsung Galaxy S10 AKG', 'tainghe1', '140000', 9, '1658605324_tainghe01.png', 'Thương hiệu: Samsung', 'Tình trạng: Còn hàng', 1, 35),
(63, 'Tai Nghe Gaming HyperX Cloud Stinger Core', 'tainghe02', '590000', 9, '1658605383_tainghe02.png', 'Thương hiệu: HyperX', 'Tình trạng: Còn hàng', 1, 35),
(64, 'Chuột không dây Logitech Lightspeed G304', 'c01', '790000', 15, '1658605468_c01.png', 'Thương hiệu: logitech', 'Tình trạng: Còn hàng', 1, 37),
(65, 'Chuột Gaming SteelSeries Aerox 3 Black 62599', 'c02', '1490000', 10, '1658605541_c02.png', 'Thương hiệu: SteelSeries  ', 'Tình trạng: Còn hàng', 1, 37),
(66, 'Bàn phím cơ AKKO 3087 Plus Black & Cyan ', 'p01', '1490000', 5, '1658605640_p01.png', 'Thương hiệu: AKKO  ', 'Tình trạng: Còn hàng', 1, 36),
(67, 'Bàn phím cơ AKKO 3108v2 One Piece', 'p02', '1550000', 8, '1658605869_p02.png', 'Thương hiệu: AKKO  ', 'Tình trạng: còn hàng', 1, 36),
(68, 'Laptop Gaming Gigabyte AORUS', 'g1', '39990000', 11, '1658605979_g1.png', 'i7-11800H, RTX 3070 8GB, Ram 16GB DDR4, SSD 1TB, 15.6 Inch IPS 300Hz FHD', 'Tình trạng:còn hàng', 1, 38),
(69, 'Laptop Gaming Gigabyte AERO 16 ', 'g2', '73990000', 9, '1658605945_g2.png', 'i7-12700H, RTX 3070 Ti 8GB, Ram 16GB DDR5, SSD 2TB, 16 Inch AMOLED UHD', 'Tình trạng: Còn hàng', 1, 38),
(70, 'Laptop Dell Vostro 5620 P117F001AGR', 'd1', '28490000', 6, '1658606083_d1.png', 'i7-1260P, Iris Xe Graphics, Ram 16GB DDR4, SSD 512GB, 16 Inch FHD', 'Tình trạng: Còn hàng', 1, 38),
(71, 'Laptop Dell XPS 17 9710 XPS7I7001W1', 'd2', '75990000', 9, '1658637913_d2.png', 'I7-11800H, RTX 3050 4GB, Ram 16GB, SSD 1TB, 17 Inch UHD \r\nTouchScreen \r\n\r\n\r\n\r\n\r\n', 'Tình trạng: Còn hàng', 1, 38);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Chỉ mục cho bảng `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Chỉ mục cho bảng `tbl_cart_details`
--
ALTER TABLE `tbl_cart_details`
  ADD PRIMARY KEY (`id_cart_details`);

--
-- Chỉ mục cho bảng `tbl_danhmuc`
--
ALTER TABLE `tbl_danhmuc`
  ADD PRIMARY KEY (`id_danhmuc`);

--
-- Chỉ mục cho bảng `tbl_sanpham`
--
ALTER TABLE `tbl_sanpham`
  ADD PRIMARY KEY (`id_sanpham`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_cart_details`
--
ALTER TABLE `tbl_cart_details`
  MODIFY `id_cart_details` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_danhmuc`
--
ALTER TABLE `tbl_danhmuc`
  MODIFY `id_danhmuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `tbl_sanpham`
--
ALTER TABLE `tbl_sanpham`
  MODIFY `id_sanpham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
