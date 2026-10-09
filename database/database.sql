-- Buat Database
CREATE DATABASE IF NOT EXISTS toko_online;
USE toko_online;

-- Tabel 1: Kategori
CREATE TABLE IF NOT EXISTS kategori (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(100) NOT NULL,
    deskripsi TEXT
);

-- Tabel 2: Produk (Relasi 1:N dengan Kategori)
CREATE TABLE IF NOT EXISTS produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    id_kategori INT NOT NULL,
    nama_produk VARCHAR(150) NOT NULL,
    harga INT NOT NULL,
    stok INT NOT NULL,
    FOREIGN KEY (id_kategori) REFERENCES kategori(id_kategori) ON DELETE CASCADE
);

-- Tabel 3: Pesanan (Relasi 1:N dengan Produk)
CREATE TABLE IF NOT EXISTS pesanan (
    id_pesanan INT AUTO_INCREMENT PRIMARY KEY,
    id_produk INT NOT NULL,
    nama_pelanggan VARCHAR(100) NOT NULL,
    jumlah INT NOT NULL,
    tanggal_pesan DATE NOT NULL,
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk) ON DELETE CASCADE
);

-- Insert Data Kategori (Minimal 5 Data)
INSERT INTO kategori (nama_kategori, deskripsi) VALUES
('Pakaian', 'Segala jenis pakaian pria dan wanita'),
('Elektronik', 'Perangkat elektronik dan aksesoris'),
('Buku', 'Buku bacaan, komik, dan novel'),
('Makanan', 'Makanan ringan dan camilan'),
('Olahraga', 'Peralatan dan perlengkapan olahraga');

-- Insert Data Produk (Minimal 5 Data)
INSERT INTO produk (id_kategori, nama_produk, harga, stok) VALUES
(1, 'Kaos Polos Hitam', 50000, 25),
(1, 'Jaket Hoodie', 150000, 10),
(2, 'Mouse Wireless', 85000, 15),
(3, 'Novel Fiksi', 75000, 8),
(5, 'Matras Yoga', 120000, 12);

-- Insert Data Pesanan (Minimal 5 Data)
INSERT INTO pesanan (id_produk, nama_pelanggan, jumlah, tanggal_pesan) VALUES
(1, 'Budi Santoso', 2, '2026-03-01'),
(2, 'Siti Aminah', 1, '2026-03-02'),
(3, 'Rian Pratama', 3, '2026-03-03'),
(4, 'Dewi Lestari', 1, '2026-03-04'),
(5, 'Eko Wijaya', 2, '2026-03-05');