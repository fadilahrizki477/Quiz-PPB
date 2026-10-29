import 'package:flutter/material.dart';

import '../../data/film_data.dart';
import '../../widgets/film_widgets.dart';

class RekomendasiPage extends StatelessWidget {
  final Film film;

  const RekomendasiPage({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    // Rekomendasi = semua film selain film yang sedang dibuka
    final lain = daftarFilm.where((f) => f.judul != film.judul).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Rekomendasi untuk Kamu')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 180,
          mainAxisSpacing: 16,
          crossAxisSpacing: 12,
          childAspectRatio: 0.62,
        ),
        itemCount: lain.length,
        itemBuilder: (context, index) => KartuFilm(film: lain[index]),
      ),
    );
  }
}
