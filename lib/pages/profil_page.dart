import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  final String nama;
  final String npm;
  final String bahasa;
  final VoidCallback onGantiProfil;

  const ProfilPage({
    super.key,
    required this.nama,
    required this.npm,
    required this.bahasa,
    required this.onGantiProfil,
  });

  String get _inisial {
    final bagian = nama
        .trim()
        .split(RegExp(r'\s+'))
        .where((s) => s.isNotEmpty)
        .toList();
    if (bagian.isEmpty) return '?';
    return bagian.take(2).map((s) => s[0]).join().toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              // Header profil
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [warna.primaryContainer, warna.surface],
                  ),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 52,
                      backgroundColor: warna.primary,
                      child: Text(
                        _inisial,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: warna.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      nama,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text('NPM $npm'),
                    const SizedBox(height: 2),
                    const Text(
                      'Teknik Informatika • Universitas Suryakancana',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    const Chip(
                      avatar: Icon(
                        Icons.workspace_premium,
                        color: Colors.amber,
                      ),
                      label: Text('Member Premium'),
                    ),
                  ],
                ),
              ),

              // Statistik
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: _Statistik(angka: '24', label: 'Ditonton'),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _Statistik(angka: '8', label: 'Favorit'),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _Statistik(angka: '3', label: 'Download'),
                    ),
                  ],
                ),
              ),

              // Informasi akun
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  child: Column(
                    children: [
                      const ListTile(
                        leading: Icon(Icons.email_outlined),
                        title: Text('Email'),
                        subtitle: Text('kiki@gmail.com'),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text('Bahasa'),
                        subtitle: Text(bahasa),
                      ),
                      const Divider(height: 1),
                      const ListTile(
                        leading: Icon(Icons.card_membership),
                        title: Text('Paket Langganan'),
                        subtitle: Text('Premium - aktif'),
                      ),
                      const Divider(height: 1),
                      const ListTile(
                        leading: Icon(Icons.calendar_month_outlined),
                        title: Text('Bergabung sejak'),
                        subtitle: Text('Oktober 2026'),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: onGantiProfil,
                    icon: const Icon(Icons.edit),
                    label: const Text('Ganti Profil'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Statistik extends StatelessWidget {
  final String angka;
  final String label;

  const _Statistik({required this.angka, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Text(
              angka,
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(label, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
