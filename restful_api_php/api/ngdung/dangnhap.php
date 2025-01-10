<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

require_once("../../config/db.php");
require_once("../../model/ngdung.php");

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data["TKNgD"]) || !isset($data["MatKhauNgD"])) {
    echo json_encode(["status" => "error", "message" => "Dữ liệu không hợp lệ"]);
    exit;
}

$db = new Database();
$conn = $db->connect();
$ngdung = new NgDung($conn);

$user = $ngdung->dangNhap($data["TKNgD"], $data["MatKhauNgD"]);

if ($user) {
    unset($user["MatKhauNgD"]); // Ẩn mật khẩu
    echo json_encode(["status" => "true", "user" => $user]);
} else {
    echo json_encode(["status" => "false", "message" => "Tài khoản mật khẩu sai"]);
}
?>
