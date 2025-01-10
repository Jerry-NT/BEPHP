<?php
header("Content-Type: application/json");

require_once("../../config/db.php");
require_once("../../model/hoadon.php");

$db = new Database();
$conn = $db->connect();

// Tạo đối tượng ngdung từ model
$hoadon = new hoadon($conn);
$result = $hoadon->layDanhHoaDon();

$dshoadon=[];
if(mysqli_num_rows($result)>0){
    while($row =mysqli_fetch_assoc($result)){
        $dshoadon[]=[
            "MaHD"=>$row["MaHD"],
            "MaNgD"=>$row["MaNgD"],
            "TongTien"=>$row["TongTien"],
            "TrangThai"=>$row["TrangThai"]];
    }
    echo json_encode($dshoadon);
}else{
    echo json_encode([]);
}