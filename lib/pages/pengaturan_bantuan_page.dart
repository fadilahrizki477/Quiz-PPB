import 'package:flutter/material.dart';

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({super.key});

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  bool _notifikasi = true;
  bool _hematData = false;
  bool _putarOtomatis = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan')),
      body: ListView(
        children: [
          SwitchListTile(
            secondary: const Icon(Icons.notifications_outlined),
            title: const Text('Notifikasi'),
            subtitle: const Text('Terima info episode dan film baru'),
            value: _notifikasi,
            onChanged: (v) => setState(() => _notifikasi = v),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.data_saver_on),
            title: const Text('Mode hemat data'),
            subtitle: const Text('Kurangi kualitas video saat streaming'),
            value: _hematData,
            onChanged: (v) => setState(() => _hematData = v),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.play_circle_outline),
            title: const Text('Putar episode berikutnya otomatis'),
            value: _putarOtomatis,
            onChanged: (v) => setState(() => _putarOtomatis = v),
          ),
        ],
      ),
    );
  }
}

class BantuanPage extends StatelessWidget {
  const BantuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bantuan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ExpansionTile(
            title: Text('Bagaimana cara mengunduh film?'),
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text('Buka Detail Film, lalu tekan tombol Download.'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Bagaimana cara mengganti nama profil?'),
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Tekan ikon profil di pojok kanan atas, lalu pilih Ganti Profil.',
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Bagaimana cara mengubah bahasa?'),
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Tekan ikon profil di pojok kanan atas, lalu pilih Bahasa.',
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Film tidak bisa diputar, apa yang harus dilakukan?'),
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Periksa koneksi internet, lalu coba buka ulang aplikasi.',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
