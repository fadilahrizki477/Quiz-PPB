import 'package:flutter/material.dart';

import '../../data/film_data.dart';
import '../../widgets/film_widgets.dart';

class EpisodePage extends StatelessWidget {
  final Film film;

  const EpisodePage({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film.isSerial ? 'Episode - ${film.judul}' : 'Bagian Film'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: film.jumlahEpisode,
        itemBuilder: (context, index) {
          final judulEpisode = film.isSerial
              ? 'Episode ${index + 1}'
              : 'Film Utuh';
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: SizedBox(
                width: 80,
                height: 56,
                child: PosterFilm(film: film, radius: 8),
              ),
              title: Text(
                judulEpisode,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(film.durasi),
              trailing: const Icon(Icons.play_circle_fill),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Memutar $judulEpisode...')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
