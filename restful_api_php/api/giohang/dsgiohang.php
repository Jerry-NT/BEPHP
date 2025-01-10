<?php
header("Content-Type: application/json");

require_once("../../config/db.php");
require_once("../../model/giohang.php");

$db = new Database();
$conn = $db->connect();

// Tạo đối tượng ngdung từ model
$giohang = new giohang($conn);
$result = $giohang->layDanhSachGioHang();

$dsgiohang=[];
if(mysqli_num_rows($result)>0){
    while($row =mysqli_fetch_assoc($result)){
        $dsgiohang[]=[
            "MaNgD"=>$row["MaNgD"],
            "MaSp"=>$row["MaSp"],
            "SLMua"=>$row["SLMua"],
            "ThanhTien"=>$row["ThanhTien"]];
    }
    echo json_encode($dsgiohang);
}else{
    echo json_encode([]);
}