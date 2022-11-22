<?php
    $sql_sua_danhmucsp = "SELECT * FROM tbl_danhmuc WHERE id_danhmuc='$_GET[iddanhmuc]' limit 1"; // limit : lấy 1 sp để sửa
    $query_sua_danhmucsp = mysqli_query($mysqli, $sql_sua_danhmucsp);
?>

<p>Sửa danh mục sản phẩm</p>

<table border = "1" width = 50% style = "border-collapse:collapse;">

<form method="POST" action= "modules/quanlydanhmucsp/xuly.php?iddanhmuc=<?php echo $_GET['iddanhmuc'] ?> "> <!-- khi nhấn sửa danh mục thì nó sẽ gửi về trang xử lý -->

<?php
while($dong = mysqli_fetch_array($query_sua_danhmucsp)){ // lấy dữ liệu từ $query_sua_danhmucsp : dòng 2
?>

    <tr>
        <td>Tên danh mục</td>
        <td><input type ="text" value="<?php echo $dong['tendanhmuc'] ?>" name="tendanhmuc"></td>
    </tr>
 
    <tr>
        <td>Thứ tự</td>
        <td><input type ="text" value="<?php echo $dong['thutu'] ?> " name="thutu"></td>
    </tr>

    <tr>
        <td colspan="2"><input type ="submit"  name="suadanhmuc" value="Sửa danh mục sản phẩm"></td>  
    </tr> 
    
    <!-- submit : để gửi  ; text : nhập -->


    <?php
    }
    ?>

</form>
</table>