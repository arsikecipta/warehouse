<?php
include "conn.php";
$sql = "SELECT * FROM biayasimpan INNER JOIN datagudang ON biayasimpan.id_gudang = datagudang.id_gudang";
$total = "harga_unit + ";

$query = mysqli_query($conn, $sql);

while($data= mysqli_fetch_array($query)){

$item[] = array(
    'nama_gudang'=>$data["nama_gudang"],
    'bulan'=>$data["bulan"],
    'biaya_sewa'=>$data["biaya_sewa"],
    'jumlah_unit'=>$data["jumlah_unit"],
    'harga_unit'=>$data["harga_unit"],
    'rata_rata_jumlah'=>$data["rata_rata_jumlah"],
    'biaya_investasi_persediaan'=>$data["biaya_investasi_persediaan"],
    'total_biaya_perawatan'=>$data["biaya_investasi_persediaan"] * $data["harga_unit"] * $data["jumlah_unit"] / 2,
);
}
$response = array(
    'status'=>'OK',
    'data'=>$item
);
echo json_encode($response);
?>