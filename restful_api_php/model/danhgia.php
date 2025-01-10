<?php
class danhgia
{
    private $conn;
    //thuộc tính bản sản phẩm
    public $MaDG;
    public $MaNgD;
    public $MaSp;
    public $NoiDung;
    public $DiemDanhGia;

    public function __construct($conn)
    {
        $this->conn=$conn;    
    }
    public function layDanhSachDanhGia(){
        $sql="select * from danhgia";
        $result=mysqli_query($this->conn,$sql);
        return $result;
    }
}