<?php
header("Content-Type: application/json");

require_once("../../config/db.php");
require_once("../../model/sanpham.php");
$db=new Database();
$conn=$db->connect();

$sanpham=new sanpham($conn);
$result=$sanpham->layDanhSachSanPham();

$dssanpham=[];
if(mysqli_num_rows($result)>0){

    while($row=mysqli_fetch_assoc($result)){
        $dssanpham[]=[
            "MaSp"=>$row["MaSp"],
            "MaLoai"=>$row["MaLoai"],
            "TenSp"=>$row["TenSp"],
            "HinhSp"=>$row["HinhSp"],
            "MoTa"=>$row["MoTa"],
            "DonGia"=>$row["DonGia"],
            "TrangThai"=>$row["TrangThai"],
         ]; 
    }
    
    echo json_encode($dssanpham);
}else{
    echo json_encode([]);
}