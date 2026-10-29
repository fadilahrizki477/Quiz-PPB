import 'package:flutter/material.dart';

import '../../data/film_data.dart';

class PemainPage extends StatelessWidget {
  final Film film;

  const PemainPage({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pemain - ${film.judul}')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: film.pemain.length,
        itemBuilder: (context, index) {
          final nama = film.pemain[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: film.warna,
                child: Text(
                  nama[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                nama,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                index == 0 ? 'Pemeran utama' : 'Pemeran pendukung',
              ),
            ),
          );
        },
      ),
    );
  }
}
