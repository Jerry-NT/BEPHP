<?php
class loaisp
{
    private $conn;
    //thuộc tính bản sản phẩm
    public $MaLoai;
    public $TenLoai;
    public $HinhLoai;
    public $TrangThai;

    public function __construct($conn)
    {
        $this->conn=$conn;    
    }
    public function layDanhSachLoai(){
        $sql="select * from loaisp";
        $result=mysqli_query($this->conn,$sql);
        return $result;
    }
}