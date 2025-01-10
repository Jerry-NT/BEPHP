<?php
class donhang
{
    private $conn;
    //thuộc tính bản sản phẩm
    public $MaDH;
    public $MaNgD;
    public $TongTien;
    public $MoTa;

    public function __construct($conn)
    {
        $this->conn=$conn;    
    }
    public function layDanhSachDonHang(){
        $sql="select * from donhang";
        $result=mysqli_query($this->conn,$sql);
        return $result;
    }
}