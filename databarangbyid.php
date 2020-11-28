<?php
include "conn.php";
$sql = "SELECT * FROM lokasibarang INNER JOIN listallbarang ON lokasibarang.id_lokasi = listallbarang.id_lokasi INNER JOIN datagudang ON lokasibarang.id_gudang = datagudang.id_gudang WHERE id_barang='1'";

$query = mysqli_query($conn, $sql);

while($data= mysqli_fetch_array($query)){

$item[] = array(
    'id_barang'=>$data["id_barang"],
    'id_lokasi'=>$data["id_lokasi"],
    'kode_barang'=>$data["kode_barang"],
    'nama_barang'=>$data["nama_barang"],
    'satuan_barang'=>$data["satuan_barang"],
    'jenis_barang'=>$data["jenis_barang"],
    'harga_barang'=>$data["harga_barang"],
    'stock_barang'=>$data["stock_barang"],
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