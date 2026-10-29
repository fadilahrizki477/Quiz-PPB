import 'package:flutter/material.dart';

import '../data/film_data.dart';
import '../widgets/film_widgets.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tren = daftarFilm.take(4).toList();

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: _JudulSeksi('Sedang Tren')),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 240,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: tren.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 140,
                  child: KartuFilm(film: tren[index]),
                );
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(child: _JudulSeksi('Semua Tayangan')),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              mainAxisSpacing: 16,
              crossAxisSpacing: 12,
              childAspectRatio: 0.62,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => KartuFilm(film: daftarFilm[index]),
              childCount: daftarFilm.length,
            ),
          ),
        ),
      ],
    );
  }
}

class _JudulSeksi extends StatelessWidget {
  final String teks;

  const _JudulSeksi(this.teks);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Text(
        teks,
        style: Theme.of(context).textTheme.titleLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
