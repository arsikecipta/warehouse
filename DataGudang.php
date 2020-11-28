<?php
include "conn.php";
$sql = "SELECT * FROM datagudang";

$query = mysqli_query($conn, $sql);

while($data= mysqli_fetch_array($query)){

$item[] = array(
    'id_gudang'=>$data["id_gudang"],
    'kode_gudang'=>$data["kode_gudang"],
    'nama_gudang'=>$data["nama_gudang"],
    'alamat_gudang'=>$data["alamat_gudang"],
    'jenis_gudang'=>$data["jenis_gudang"],
    'luas_gudang'=>$data["luas_gudang"],
);
}
$response = array(
    'status'=>'OK',
    'data'=>$item
);
echo json_encode($response);
?>