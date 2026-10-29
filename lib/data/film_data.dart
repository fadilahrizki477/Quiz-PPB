import 'package:flutter/material.dart';

class Film {
  final String judul;
  final String genre;
  final int tahun;
  final double rating;
  final String durasi;
  final int jumlahEpisode;
  final String sinopsis;
  final Color warna;
  final List<String> pemain;

  const Film({
    required this.judul,
    required this.genre,
    required this.tahun,
    required this.rating,
    required this.durasi,
    required this.jumlahEpisode,
    required this.sinopsis,
    required this.warna,
    required this.pemain,
  });

  // Film punya 1 bagian, serial punya lebih dari 1 episode
  bool get isSerial => jumlahEpisode > 1;
}

// Data contoh (tanpa internet dan tanpa file gambar)
const List<Film> daftarFilm = [
  Film(
    judul: 'Bayangan Senja',
    genre: 'Drama',
    tahun: 2025,
    rating: 8.4,
    durasi: '1j 52m',
    jumlahEpisode: 1,
    sinopsis: 'Seorang fotografer muda kembali ke kampung halamannya dan menemukan rahasia keluarga yang selama ini terkubur bersama senja terakhir ayahnya.',
    warna: Colors.deepOrange,
    pemain: [
      'Raka Pratama',
      'Dinda Maheswari',
      'Arman Wiguna',
      'Sekar Ayuningtyas',
    ],
  ),
  Film(
    judul: 'Kota Tanpa Nama',
    genre: 'Thriller',
    tahun: 2026,
    rating: 7.9,
    durasi: '45m / episode',
    jumlahEpisode: 8,
    sinopsis: 'Sebuah kota kecil tiba-tiba terhapus dari peta. Seorang jurnalis investigasi menelusuri petunjuk yang membawanya ke jaringan rahasia di balik hilangnya kota itu.',
    warna: Colors.teal,
    pemain: [
      'Bima Santoso',
      'Laras Kinanti',
      'Yudha Permana',
      'Citra Anggraini',
    ],
  ),
  Film(
    judul: 'Samudra Terakhir',
    genre: 'Petualangan',
    tahun: 2024,
    rating: 8.1,
    durasi: '2j 05m',
    jumlahEpisode: 1,
    sinopsis: 'Tim penjelajah laut berlayar menuju titik terdalam samudra untuk mencari peradaban yang dipercaya hanya legenda para nelayan.',
    warna: Colors.blue,
    pemain: ['Gilang Ramadhan', 'Nadia Salsabila', 'Hendra Kusuma'],
  ),
  Film(
    judul: 'Jejak di Balik Kabut',
    genre: 'Misteri',
    tahun: 2026,
    rating: 8.7,
    durasi: '50m / episode',
    jumlahEpisode: 10,
    sinopsis: 'Setiap pagi berkabut, satu penduduk desa pegunungan menghilang. Seorang detektif pensiunan dipaksa kembali bertugas untuk mengungkap pola di baliknya.',
    warna: Colors.blueGrey,
    pemain: [
      'Wahyu Nugraha',
      'Maya Sartika',
      'Dimas Aryo',
      'Intan Permatasari',
      'Fajar Hidayat',
    ],
  ),
  Film(
    judul: 'Langit Kedua',
    genre: 'Fantasi',
    tahun: 2025,
    rating: 7.6,
    durasi: '1j 48m',
    jumlahEpisode: 1,
    sinopsis: 'Seorang anak menemukan pintu menuju langit kedua, dunia tempat mimpi-mimpi yang terlupakan hidup dan menunggu untuk diselamatkan.',
    warna: Colors.purple,
    pemain: ['Alya Rahmawati', 'Satria Mahendra', 'Rina Oktaviani'],
  ),
  Film(
    judul: 'Rimba Cahaya',
    genre: 'Aksi',
    tahun: 2026,
    rating: 8.0,
    durasi: '42m / episode',
    jumlahEpisode: 6,
    sinopsis: 'Pasukan penjaga hutan melawan sindikat yang ingin menguasai kristal cahaya di jantung rimba, sumber energi yang bisa mengubah dunia.',
    warna: Colors.green,
    pemain: [
      'Eko Prasetyo',
      'Tiara Handayani',
      'Galih Wicaksono',
      'Putri Maharani',
    ],
  ),
];
