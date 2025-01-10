<?php
header("Content-Type: application/json");

require_once("../../config/db.php");
require_once("../../model/donhang.php");

$db = new Database();
$conn = $db->connect();

// Tạo đối tượng ngdung từ model
$donhang = new donhang($conn);
$result = $donhang->layDanhSachDonHang();

$dsdonhang=[];
if(mysqli_num_rows($result)>0){
    while($row =mysqli_fetch_assoc($result)){
        $dsdonhang[]=[
            "MaDH"=>$row["MaDH"],
            "MaNgD"=>$row["MaNgD"],
            "TongTien"=>$row["TongTien"],
            "MoTa"=>$row["MoTa"]
            ];
    }
    echo json_encode($dsdonhang);
}else{
    echo json_encode([]);
}