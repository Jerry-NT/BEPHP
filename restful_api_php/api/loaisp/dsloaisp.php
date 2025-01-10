<?php
header("Content-Type: application/json");

require_once("../../config/db.php");
require_once("../../model/loaisp.php");

$db = new Database();
$conn = $db->connect();

// Tạo đối tượng ngdung từ model
$loaisp = new loaisp($conn);
$result = $loaisp->layDanhSachLoai();

$dsLoai=[];
if(mysqli_num_rows($result)>0){
    while($row =mysqli_fetch_assoc($result)){
        $dsLoai[]=[
            "MaLoai"=>$row["MaLoai"],
            "TenLoai"=>$row["TenLoai"],
            "HinhLoai"=>$row["HinhLoai"],
            "TrangThai"=>$row["TrangThai"]];
    }
    echo json_encode($dsLoai);
}else{
    echo json_encode([]);
}