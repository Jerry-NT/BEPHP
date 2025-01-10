<?php
class ngdung
{
    private $conn;
    //thuộc tính của bảng ngdung
    public $MaNgD;
    public $TenNgD;
    public $SDT;
    public $TKNgD;
    public $MatKhauNgD;
    public $TrangThai;
    public $ChucVu;

    //connect database
    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    // findall
    public function layDanhSachNgDung()
    {
        $sql = "SELECT * FROM ngdung"; //tip viết dùng này là truy vấn trên phpadmin copy vào
        $result = mysqli_query($this->conn, $sql);
        return $result;
    }

    public function dangKy($TenNgD, $SDT, $TKNgD, $MatKhauNgD)
    {
        // Mã hóa mật khẩu bằng MD5
        $hashedPassword = md5($MatKhauNgD);

        // Lấy mã người dùng lớn nhất hiện có
        $query = "SELECT MaNgD FROM ngdung ORDER BY MaNgD DESC LIMIT 1";
        $result = mysqli_query($this->conn, $query);
        $row = mysqli_fetch_assoc($result);

        if ($row) {
            // Lấy số từ mã NDxx (ND00 -> 00)
            $lastNumber = (int) substr($row["MaNgD"], 2);
            $newNumber = $lastNumber + 1;
        } else {
            $newNumber = 0; // Nếu chưa có tài khoản, bắt đầu từ ND00
        }

        // Tạo mã mới theo định dạng NDxx
        $newMaNgD = "ND" . str_pad($newNumber, 2, "0", STR_PAD_LEFT);

        // Thực hiện đăng ký với MaNgD tự động
        $sql = "INSERT INTO ngdung (MaNgD, TenNgD, SDT, TKNgD, MatKhauNgD, ChucVu, TrangThai) VALUES (?, ?, ?, ?, ?, 'NguoiDung', 1)";
        $stmt = mysqli_prepare($this->conn, $sql);
        if ($stmt) {
            mysqli_stmt_bind_param($stmt, "sssss", $newMaNgD, $TenNgD, $SDT, $TKNgD, $hashedPassword);
            if (mysqli_stmt_execute($stmt)) {
                return true;
            }
        }
        return false;
    }

    // Đăng nhập
    public function dangNhap($TKNgD, $MatKhauNgD)
{
    // Mã hóa mật khẩu nhập vào bằng MD5
    $hashedPassword = md5($MatKhauNgD);

    // Truy vấn kiểm tra tài khoản và mật khẩu (truyền trực tiếp giá trị vào câu truy vấn)
    $sql = "SELECT * FROM ngdung WHERE TKNgD = '$TKNgD' AND MatKhauNgD = '$hashedPassword' AND TrangThai = 1"; // TrangThai = 1 có nghĩa là tài khoản đang hoạt động

    // Thực thi câu lệnh truy vấn
    $result = mysqli_query($this->conn, $sql);

    // Kiểm tra lỗi trong truy vấn
    if (!$result) {
        // Nếu có lỗi trong truy vấn, in ra lỗi
        echo "Lỗi truy vấn: " . mysqli_error($this->conn);
        return false;
    }

    // Kiểm tra nếu có kết quả (người dùng hợp lệ)
    if (mysqli_num_rows($result) > 0) {
        // Lấy thông tin người dùng
        $user = mysqli_fetch_assoc($result);
        // Trả về thông tin người dùng nếu đăng nhập thành công
        return $user;
    } else {
        return false;
    }
}

}
