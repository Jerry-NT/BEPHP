<?php
class giohang
{
    private $conn;
    //thuộc tính bản sản phẩm
    public $MaNgD;
    public $MaSp;
    public $SLMua;
    public $ThanhTien;

    public function __construct($conn)
    {
        $this->conn=$conn;    
    }
    public function layDanhSachGioHang(){
        $sql="select * from giohang";
        $result=mysqli_query($this->conn,$sql);
        return $result;
    }
}