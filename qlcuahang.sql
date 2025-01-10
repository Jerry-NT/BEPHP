-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th1 10, 2025 lúc 01:09 PM
-- Phiên bản máy phục vụ: 8.3.0
-- Phiên bản PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlcuahang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

DROP TABLE IF EXISTS `chitiethoadon`;
CREATE TABLE IF NOT EXISTS `chitiethoadon` (
  `MaHD` varchar(10) DEFAULT NULL,
  `MaSp` varchar(10) DEFAULT NULL,
  `DonGia` decimal(10,0) DEFAULT NULL,
  `ThanhTien` decimal(10,0) DEFAULT NULL,
  `SLMua` int DEFAULT NULL,
  KEY `MaHD` (`MaHD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`MaHD`, `MaSp`, `DonGia`, `ThanhTien`, `SLMua`) VALUES
('HD001', 'SP001', 20000, 40000, 2),
('HD002', 'SP002', 30000, 4, 120000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia`
--

DROP TABLE IF EXISTS `danhgia`;
CREATE TABLE IF NOT EXISTS `danhgia` (
  `MaDG` varchar(10) NOT NULL,
  `MaNgD` varchar(10) DEFAULT NULL,
  `MaSp` varchar(10) DEFAULT NULL,
  `NoiDung` varchar(1000) DEFAULT NULL,
  `DiemDanhGia` double DEFAULT NULL,
  PRIMARY KEY (`MaDG`),
  KEY `MaNgD` (`MaNgD`),
  KEY `MaSp` (`MaSp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `danhgia`
--

INSERT INTO `danhgia` (`MaDG`, `MaNgD`, `MaSp`, `NoiDung`, `DiemDanhGia`) VALUES
('DG001', 'ND001', 'SP001', 'Sản phẩm tốt, giá tốt với thị trường', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

DROP TABLE IF EXISTS `donhang`;
CREATE TABLE IF NOT EXISTS `donhang` (
  `MaDH` varchar(10) NOT NULL,
  `MaNgD` varchar(10) DEFAULT NULL,
  `TongTien` decimal(10,0) DEFAULT NULL,
  `MoTa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaDH`),
  KEY `MaNgD` (`MaNgD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`MaDH`, `MaNgD`, `TongTien`, `MoTa`) VALUES
('DH001', 'ND001', 200000, 'Bánh tráng'),
('DH002', 'ND001', 20000, 'Tóp Mỡ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

DROP TABLE IF EXISTS `giohang`;
CREATE TABLE IF NOT EXISTS `giohang` (
  `MaNgD` varchar(10) DEFAULT NULL,
  `MaSp` varchar(10) DEFAULT NULL,
  `SLMua` int DEFAULT NULL,
  `ThanhTien` decimal(10,0) DEFAULT NULL,
  KEY `MaNgD` (`MaNgD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `giohang`
--

INSERT INTO `giohang` (`MaNgD`, `MaSp`, `SLMua`, `ThanhTien`) VALUES
('ND001', 'SP001', 2, 10000),
('ND001', 'SP002', 1, 10000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
CREATE TABLE IF NOT EXISTS `hoadon` (
  `MaHD` varchar(10) NOT NULL,
  `MaNgD` varchar(10) DEFAULT NULL,
  `TongTien` decimal(10,0) DEFAULT NULL,
  `TrangThai` int DEFAULT NULL,
  PRIMARY KEY (`MaHD`),
  KEY `MaNgD` (`MaNgD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`MaHD`, `MaNgD`, `TongTien`, `TrangThai`) VALUES
('HD001', 'ND001', 200000, 1),
('HD002', 'ND001', 20000, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisp`
--

DROP TABLE IF EXISTS `loaisp`;
CREATE TABLE IF NOT EXISTS `loaisp` (
  `MaLoai` varchar(10) NOT NULL,
  `TenLoai` varchar(30) DEFAULT NULL,
  `HinhLoai` varchar(255) NOT NULL,
  `TrangThai` int DEFAULT NULL,
  PRIMARY KEY (`MaLoai`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `loaisp`
--

INSERT INTO `loaisp` (`MaLoai`, `TenLoai`, `HinhLoai`, `TrangThai`) VALUES
('L001', 'Bánh Tráng', '', 1),
('L002', 'Tóp Mỡ', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ngdung`
--

DROP TABLE IF EXISTS `ngdung`;
CREATE TABLE IF NOT EXISTS `ngdung` (
  `MaNgD` varchar(10) NOT NULL,
  `TenNgD` varchar(30) DEFAULT NULL,
  `SDT` varchar(10) DEFAULT NULL,
  `TKNgD` varchar(10) DEFAULT NULL,
  `MatKhauNgD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TrangThai` int DEFAULT NULL,
  `ChucVu` enum('NguoiDung','QuanLy') DEFAULT NULL,
  PRIMARY KEY (`MaNgD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `ngdung`
--

INSERT INTO `ngdung` (`MaNgD`, `TenNgD`, `SDT`, `TKNgD`, `MatKhauNgD`, `TrangThai`, `ChucVu`) VALUES
('ND00', 'Nguyen Van A', '0123456789', 'userstest', 'e10adc3949ba59abbe56e057f20f883e', 1, 'NguoiDung');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE IF NOT EXISTS `sanpham` (
  `MaSp` varchar(10) NOT NULL,
  `MaLoai` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TenSp` varchar(30) DEFAULT NULL,
  `HinhSp` varchar(100) DEFAULT NULL,
  `MoTa` varchar(100) DEFAULT NULL,
  `DonGia` decimal(10,0) DEFAULT NULL,
  `TrangThai` int DEFAULT NULL,
  PRIMARY KEY (`MaSp`),
  KEY `Maloai` (`MaLoai`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MaSp`, `MaLoai`, `TenSp`, `HinhSp`, `MoTa`, `DonGia`, `TrangThai`) VALUES
('SP001', 'L001', 'Bánh Tráng Cuốn', 'https://media.vneconomy.vn/w800/images/upload/2023/10/28/avatar-anime.jpg', 'Thơm ngon khó cưỡng', 20000, 1),
('SP002', 'L002', 'Tóp Mỡ Mắm Tỏi', 'https://media.vneconomy.vn/w800/images/upload/2023/10/28/avatar-anime.jpg', 'Thơm ngon khó cưỡng', 30000, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
