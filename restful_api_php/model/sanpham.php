<?php
class sanpham
{
    private $conn;
    //thuộc tính bản sản phẩm
    public $MaSp;
    public $MaLoai;
    public $TenSp;
    public $HinhSp;
    public $MoTa;
    public $DonGia;
    public $TrangThai;

    public function __construct($conn)
    {
        $this->conn=$conn;    
    }

    public function layDanhSachSanPham(){
        $sql="select * from sanpham";
        $result=mysqli_query($this->conn,$sql);
        return $result;
    }

    public function laySanPhamTheoMaSP($id) {
    $sql = "SELECT * FROM sanpham WHERE MaSp = ?";
    $stmt = mysqli_prepare($this->conn, $sql);
    
    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "s", $id); // "s" = string
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        return $result;
    } else {
        return false;
    }

    // -> 

}

}

