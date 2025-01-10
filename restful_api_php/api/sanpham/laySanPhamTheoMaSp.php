<?php
header("Content-Type: application/json");

require_once("../../config/db.php");
require_once("../../model/sanpham.php");

// Kiểm tra id có tồn tại không
if (!isset($_GET["id"]) || empty($_GET["id"])) {
    echo json_encode(["status" => "error", "message" => "ID không hợp lệ"]);
    exit;
}

$id = $_GET["id"]; // Giữ nguyên chuỗi

// Kết nối CSDL
$db = new Database();
$conn = $db->connect();

// Gọi model để lấy dữ liệu
$sanpham = new sanpham($conn);
$result = $sanpham->laySanPhamTheoMaSP($id);

if ($result && mysqli_num_rows($result) > 0) {
    $data = mysqli_fetch_assoc($result);
    echo json_encode( $data);
} else {
    echo json_encode(["status" => "error", "message" => "Không tìm thấy sản phẩm"]);
}

?>
