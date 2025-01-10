<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

require_once("../../config/db.php");
require_once("../../model/ngdung.php");

// Đọc dữ liệu JSON từ body request
$json = file_get_contents("php://input");
$data = json_decode($json, true);

// Kiểm tra JSON có hợp lệ không
if (!$data) {
    echo json_encode(["status" => "false", "message" => "Dữ liệu JSON không hợp lệ"]);
    exit();
}

// Kiểm tra dữ liệu đầu vào
if (!isset($data["TenNgD"], $data["SDT"], $data["TKNgD"], $data["MatKhauNgD"])) {
    echo json_encode(["status" => "false", "message" => "Thiếu dữ liệu đầu vào"]);
    exit();
}

// Kết nối CSDL
$db = new Database();
$conn = $db->connect();
$ngdung = new ngdung($conn);

// Thực hiện đăng ký
$result = $ngdung->dangKy($data["TenNgD"], $data["SDT"], $data["TKNgD"], $data["MatKhauNgD"]);

if ($result) {
    echo json_encode(["status" => "true", "message" => "Đăng ký thành công"]);
} else {
    echo json_encode(["status" => "false", "message" => "Đăng ký thất bại"]);
}
?>
