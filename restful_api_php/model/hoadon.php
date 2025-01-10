<?php
class hoadon
{
    private $conn;
    //thuộc tính bản sản phẩm
    public $MaHD;
    public $MaNgD;
    public $TongTien;
    public $TrangThai;

    public function __construct($conn)
    {
        $this->conn=$conn;    
    }
    public function layDanhHoaDon(){
        $sql="select * from hoadon";
        $result=mysqli_query($this->conn,$sql);
        return $result;
    }
}