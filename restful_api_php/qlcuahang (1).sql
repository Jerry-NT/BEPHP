-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th1 14, 2025 lúc 01:01 PM
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
-- Cấu trúc bảng cho bảng `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
CREATE TABLE IF NOT EXISTS `hoadon` (
  `MaHD` varchar(10) NOT NULL,
  `MaNgD` varchar(10) DEFAULT NULL,
  `TongTien` decimal(10,0) DEFAULT NULL,
  `TrangThai` enum('Đã đặt','Đặt hàng thành công','Đang giao','Đã giao','Đã hủy') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Đã đặt',
  PRIMARY KEY (`MaHD`),
  KEY `MaNgD` (`MaNgD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`MaHD`, `MaNgD`, `TongTien`, `TrangThai`) VALUES
('HD001', 'ND001', 200000, 'Đã đặt'),
('HD002', 'ND001', 20000, 'Đã đặt');

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
('L001', 'Bánh Tráng', 'https://s.pro.vn/i0y9', 1),
('L002', 'Tóp Mỡ', 'https://s.pro.vn/w8N5', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ngdung`
--

DROP TABLE IF EXISTS `ngdung`;
CREATE TABLE IF NOT EXISTS `ngdung` (
  `MaNgD` varchar(10) NOT NULL,
  `Email` varchar(128) NOT NULL,
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

INSERT INTO `ngdung` (`MaNgD`, `Email`, `TenNgD`, `SDT`, `TKNgD`, `MatKhauNgD`, `TrangThai`, `ChucVu`) VALUES
('ND00', 'a', 'Nguyen Van A', '0123456789', 'userstest', 'e10adc3949ba59abbe56e057f20f883e', 1, 'NguoiDung'),
('ND01', 'a', 'tan', '12648174', 'tan01', 'e10adc3949ba59abbe56e057f20f883e', 1, 'NguoiDung'),
('ND02', 'a', 'thai', '341241', 'thai0121', 'e10adc3949ba59abbe56e057f20f883e', 1, 'NguoiDung'),
('ND03', 'a', 'HuuVinh', '0335487716', 'kenvinh', '202cb962ac59075b964b07152d234b70', 1, 'NguoiDung');

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
('SP001', 'L001', 'Bánh Tráng Cuốn', 'https://s.net.vn/IofD', 'Thơm ngon khó cưỡng, ra lò bao khói.', 20000, 1),
('SP002', 'L002', 'Tóp Mỡ Mắm Tỏi', 'https://s.net.vn/swUF', 'Thơm ngon khó cưỡng', 30000, 1),
('SP008', 'L001', 'Bánh tráng xì ke', 'https://s.net.vn/LXo8', 'Cay xé lưỡi, ngon bá cháy', 15000, 1),
('SP003', 'L001', 'Bánh Tráng Trộn', 'https://s.net.vn/1NaZ', 'Bánh tráng thơm ngon, có kèm trứng cút béo ngậy tuyệt đối.', 20000, 1),
('SP004', 'L002', 'Tóp mỡ hành phi', 'https://s.net.vn/koOK', 'Tóp mỡ giòn rụm, nhai rộp rộp kèm với hành phi thơm lừng', 30000, 1),
('SP005', 'L002', 'Tóp mỡ miếng', 'https://s.net.vn/UGHj', 'Miếng tóp mỡ dày như mỏ của bạn, béo ngậy tuyệt đối.\r\n(khuyến cáo không dùng với nước lạnh)', 50000, 1),
('SP006', 'L001', 'Bánh tráng nướng mắm ruốc', 'https://s.net.vn/d6bJ', 'Nóng hỏi mới ra lò, thơm ngon.', 15000, 1),
('SP007', 'L001', 'Bánh tráng phơi sương', 'https://s.net.vn/4rY7', 'Dai ngon, muối ngon tuyệt đối', 20000, 1),
('SP009', 'L002', 'Tóp mỡ chua ngọt', 'http://surl.li/afobrs', 'Chua chua ngọt ngọt bao dính.', 20000, 1),
('SP010', 'L002', 'Tóp mỡ giòn', 'http://surl.li/ofiwng', 'Thơm ngon giòn rụm.', 20000, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
