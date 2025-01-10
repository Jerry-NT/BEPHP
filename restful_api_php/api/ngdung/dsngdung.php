<?php
header("Content-Type: application/json");

require_once("../../config/db.php");
require_once("../../model/ngdung.php");

// Kết nối CSDL
$db = new Database();
$conn = $db->connect();

// Tạo đối tượng ngdung từ model
$ngdung = new ngdung($conn);
$result = $ngdung->layDanhSachNgDung();

// Kiểm tra dữ liệu và phản hồi JSON
$dsngdung = [];

if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        $dsngdung[] = [
            "MaNgD" => $row["MaNgD"],
            "TenNgD" => $row["TenNgD"],
            "SDT" => $row["SDT"],
            "TKNgD" => $row["TKNgD"],
            "TrangThai" => $row["TrangThai"],
            "ChucVu" => $row["ChucVu"],
        ];
    }
    echo json_encode($dsngdung);
} else {
    echo json_encode([]);
}

?>
