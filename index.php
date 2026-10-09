<?php
require_once __DIR__ . '/services/config.php';

$query = "SELECT 
            pesanan.id_pesanan,
            pesanan.nama_pelanggan,
            pesanan.jumlah,
            pesanan.tanggal_pesan,
            produk.nama_produk,
            produk.harga,
            kategori.nama_kategori 
          FROM pesanan
          JOIN produk ON pesanan.id_produk = produk.id_produk
          JOIN kategori ON produk.id_kategori = kategori.id_kategori";

$result = mysqli_query($conn, $query);
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Pesanan Toko Online</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <header>
        <h1>Sistem Informasi Pesanan</h1>
    </header>

    <div class="container">
        <h2>Data Transaksi Pelanggan</h2>
        <div class="card-container">
            <?php 
            if ($result && mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) { 
                    $total = $row['harga'] * $row['jumlah'];
            ?>
                    <div class="card">
                        <h3>Pesanan #<?= $row['id_pesanan']; ?></h3>
                        <p><strong>Pelanggan:</strong> <?= htmlspecialchars($row['nama_pelanggan']); ?></p>
                        <p><strong>Produk:</strong> <?= htmlspecialchars($row['nama_produk']); ?></p>
                        <p><strong>Kategori:</strong> <?= htmlspecialchars($row['nama_kategori']); ?></p>
                        <p><strong>Jumlah:</strong> <?= $row['jumlah']; ?> unit</p>
                        <p><strong>Total Bayar:</strong> Rp<?= number_format($total, 0, ',', '.'); ?></p>
                        <p><strong>Tanggal:</strong> <?= $row['tanggal_pesan']; ?></p>
                    </div>
            <?php 
                }
            } else {
                echo "<p>Tidak ada data ditemukan.</p>";
            }
            ?>
        </div>
    </div>

</body>
</html>