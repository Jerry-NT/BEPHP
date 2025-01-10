<?php
header("Content-Type: application/json");

require_once("../../config/db.php");
require_once("../../model/danhgia.php");

// Kết nối CSDL
$db = new Database();
$conn = $db->connect();

// Tạo đối tượng ngdung từ model
$danhgia = new danhgia($conn);
$result = $danhgia->layDanhSachDanhGia();

// Kiểm tra dữ liệu và phản hồi JSON
$dsdanhgia = [];

if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        $dsdanhgia[] = [
            "MaDG" => $row["MaDG"],
            "MaNgD" => $row["MaNgD"],
            "MaSp" => $row["MaSp"],
            "NoiDung" => $row["NoiDung"],
            "DiemDanhGia" => $row["DiemDanhGia"],
            
        ];
    }
    echo json_encode($dsdanhgia);
} else {
    echo json_encode([]);
}

?>
