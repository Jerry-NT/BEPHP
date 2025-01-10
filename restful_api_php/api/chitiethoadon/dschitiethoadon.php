<?php
header("Content-Type: application/json");

require_once("../../config/db.php");
require_once("../../model/chitiethoadon.php");

// Kết nối CSDL
$db = new Database();
$conn = $db->connect();

// Tạo đối tượng ngdung từ model
$chitiethoadon = new chitiethoadon($conn);
$result = $chitiethoadon->layDanhSachChiTietHoaDon();

// Kiểm tra dữ liệu và phản hồi JSON
$dschitiethoadon = [];

if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        $dschitiethoadon[] = [
            "MaHD" => $row["MaHD"],
            "MaSp" => $row["MaSp"],
            "DonGia" => $row["DonGia"],
            "ThanhTien" => $row["ThanhTien"],
            "SLMua" => $row["SLMua"],
            
        ];
    }
    echo json_encode($dschitiethoadon);
} else {
    echo json_encode([]);
}

?>
