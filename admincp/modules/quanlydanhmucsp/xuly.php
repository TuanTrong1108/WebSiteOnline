<?php
include('../../config/config.php');

$tenloaisp=$_POST['tendanhmuc'];
$thutu=$_POST['thutu'];
if(isset($_POST['themdanhmuc'])){ //isset : tồn tại
    //thêm
    $sql_them = "INSERT INTO tbl_danhmuc(tendanhmuc,thutu ) VALUE('".$tenloaisp."','".$thutu."')"; // đã lấy được dựa vào dòng 2, 3
    mysqli_query($mysqli,$sql_them); //$mysqli : là tên csdl trong file config.php
    header('Location:../../index.php?action=quanlydanhmucsanpham&query=them'); // ra 2 thư mục, từ (xuly.php) ->quanlydanhmucsp ->modules -> (menu.php)
}elseif(isset($_POST['suadanhmuc'])){
    //sửa
    $sql_update= "UPDATE tbl_danhmuc SET tendanhmuc= '".$tenloaisp."',thutu='".$thutu."' WHERE id_danhmuc='$_GET[iddanhmuc]'"; // đã lấy được dựa vào dòng 2, 3
    mysqli_query($mysqli,$sql_update); //$mysqli : là tên csdl trong file config.php
    header('Location:../../index.php?action=quanlydanhmucsanpham&query=them');

}else{
    $id=$_GET['iddanhmuc'];
    $sql_xoa = "DELETE  FROM tbl_danhmuc WHERE id_danhmuc='".$id."'";
    mysqli_query($mysqli,$sql_xoa);
    header('Location:../../index.php?action=quanlydanhmucsanpham&query=them'); // này là xóa xog nó vẫn hiển thị trang này
}

?>
