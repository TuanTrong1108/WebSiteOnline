<?php
include('../../config/config.php');

$tensanpham=$_POST['tensanpham'];
$masp=$_POST['masp'];
$giasp=$_POST['giasp'];
$soluong=$_POST['soluong'];
//xuly hinh anh
$hinhanh=$_FILES['hinhanh']['name'];
$hinhanh_tmp=$_FILES['hinhanh']['tmp_name'];
$hinhanh = time().'_'.$hinhanh;

$tomtat=$_POST['tomtat'];
$noidung=$_POST['noidung'];
$tinhtrang=$_POST['tinhtrang'];
$danhmuc=$_POST['danhmuc'];
//xuly hinh anh
// $hinhanh=$_FILES['hinhanh']['name'];
// $hinhanh_tmp=$_FILES['hinhanh']['tmp_name'];


if(isset($_POST['themsanpham'])){ //isset : tồn tại
    //thêm
    $sql_them = "INSERT INTO tbl_sanpham(tensanpham,masp,giasp,soluong,hinhanh,tomtat,noidung,tinhtrang,id_danhmuc ) 
    VALUE('".$tensanpham."','".$masp."','".$giasp."','".$soluong."','".$hinhanh."','".$tomtat."','".$noidung."','".$tinhtrang."','".$danhmuc."')"; // đã lấy được dựa vào dòng 2, 3
    
    mysqli_query($mysqli,$sql_them); //$mysqli : là tên csdl trong file config.php
    move_uploaded_file($hinhanh_tmp,'uploads/'.$hinhanh); // di chuyển hình ảnh sau khi thêm dữ liệu
    
    header('Location:../../index.php?action=quanlysp&query=them'); // ra 2 thư mục, từ (xuly.php) ->quanlydanhmucsp ->modules -> (menu.php)

}elseif(isset($_POST['suasanpham'])){
    //sửa
    if($hinhanh!= ''){ // hình ảnh # rỗng : có chọn hình ảnh

        move_uploaded_file($hinhanh_tmp,'uploads/'.$hinhanh); // upload hình ảnh vào      

        $sql_update= "UPDATE tbl_sanpham SET tensanpham= '".$tensanpham."',masp='".$masp."',giasp='".$giasp."',soluong='".$soluong."'
        ,hinhanh='".$hinhanh."',tomtat='".$tomtat."',noidung='".$noidung."',tinhtrang='".$tinhtrang."',id_danhmuc='".$danhmuc."' WHERE id_sanpham='$_GET[idsanpham]'"; // đã lấy được dựa vào dòng 2, 3
        $sql="SELECT * FROM tbl_sanpham WHERE id_sanpham = '$_GET[idsanpham]' LIMIT 1"; //  
        $query =  mysqli_query($mysqli,$sql);
        while($row = mysqli_fetch_array($query)){
            unlink('uploads/'.$row['hinhanh']); // từ file xuly.php đến file uploads -> hình ảnh dựa vào id mình lấy được , xóa trong file hình
        } 
    }
    else{
        $sql_update= "UPDATE tbl_sanpham SET tensanpham= '".$tensanpham."',masp='".$masp."',giasp='".$giasp."',soluong='".$soluong."'
        ,tomtat='".$tomtat."',noidung='".$noidung."',tinhtrang='".$tinhtrang."',id_danhmuc='".$danhmuc."' WHERE id_sanpham='$_GET[idsanpham]'";
    }
        
        mysqli_query($mysqli,$sql_update); //$mysqli : là tên csdl trong file config.php
        header('Location:../../index.php?action=quanlysp&query=them');


}else{
    //xóa   
    $id=$_GET['idsanpham'];
    $sql="SELECT * FROM tbl_sanpham WHERE id_sanpham = '$id' LIMIT 1"; //  
    $query =  mysqli_query($mysqli,$sql);
    while($row = mysqli_fetch_array($query)){
        unlink('uploads/'.$row['hinhanh']); // từ file xuly.php đến file uploads -> hình ảnh dựa vào id mình lấy được , xóa trong file hình
    }
    $sql_xoa = "DELETE  FROM tbl_sanpham WHERE id_sanpham='".$id."'"; // sau đó mới xóa sản phẩm đó
    mysqli_query($mysqli,$sql_xoa);
    header('Location:../../index.php?action=quanlysp&query=them');// này là xóa xog nó vẫn hiển thị trang này
}
?>
