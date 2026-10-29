import 'package:flutter/material.dart';

import '../data/film_data.dart';
import '../widgets/film_widgets.dart';
import 'detail/detail_film_page.dart';

class FilmSearchDelegate extends SearchDelegate<void> {
  FilmSearchDelegate() : super(searchFieldLabel: 'Cari film atau serial');

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _daftarHasil(context);

  @override
  Widget buildSuggestions(BuildContext context) => _daftarHasil(context);

  Widget _daftarHasil(BuildContext context) {
    final kata = query.toLowerCase();
    final hasil = daftarFilm
        .where(
          (f) =>
              f.judul.toLowerCase().contains(kata) ||
              f.genre.toLowerCase().contains(kata),
        )
        .toList();

    if (hasil.isEmpty) {
      return const Center(child: Text('Film tidak ditemukan'));
    }

    return ListView.builder(
      itemCount: hasil.length,
      itemBuilder: (context, index) {
        final film = hasil[index];
        return ListTile(
          leading: SizedBox(
            width: 50,
            height: 70,
            child: PosterFilm(film: film, radius: 8),
          ),
          title: Text(film.judul),
          subtitle: Text('${film.genre} • ${film.tahun} • ★ ${film.rating}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DetailFilmPage(film: film)),
            );
          },
        );
      },
    );
  }
}
