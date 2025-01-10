<?php
class chitiethoadon
{
    private $conn;
    //thuộc tính bản sản phẩm
    public $MaHD;
    public $MaSp;
    public $DonGia;
    public $ThanhTien;
    public $SLMua;

    public function __construct($conn)
    {
        $this->conn=$conn;    
    }
    public function layDanhSachChiTietHoaDon(){
        $sql="select * from chitiethoadon";
        $result=mysqli_query($this->conn,$sql);
        return $result;
    }
}