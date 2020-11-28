<?php
include "conn.php";
$sql = "SELECT * FROM lokasibarang INNER JOIN listallbarang ON lokasibarang.id_lokasi = listallbarang.id_lokasi INNER JOIN datagudang ON lokasibarang.id_gudang = datagudang.id_gudang";

$query = mysqli_query($conn, $sql);

while($data= mysqli_fetch_array($query)){

$item[] = array(
    'id_lokasi'=>$data["id_lokasi"],
    'kode_barang'=>$data["kode_barang"],
    'nama_barang'=>$data["nama_barang"],
    'kode_gudang'=>$data["kode_gudang"],
    'nama_gudang'=>$data["nama_gudang"],
    'kode_rak'=>$data["kode_rak"],
);
}
$response = array(
    'status'=>'OK',
    'data'=>$item
);
echo json_encode($response);
?>