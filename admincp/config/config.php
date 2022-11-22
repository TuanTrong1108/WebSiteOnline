<?php
$mysqli = new mysqli("localhost","root","","web_hoanchinh");

// "phpmyadmin" : là tên sql , xem trong phpadmin
// vào http://localhost/phpmyadmin/ , tạo 1 cơ sở dữ liệu mới , rồi mới Add file sql cũ vào


// Check connection
if ($mysqli->connect_errno) {
  echo "Kết nối MYSQLi lỗi " . $mysqli->connect_error;
  exit();
}
?>