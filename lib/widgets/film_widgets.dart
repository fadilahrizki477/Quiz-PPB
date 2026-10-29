import 'package:flutter/material.dart';

import '../data/film_data.dart';
import '../pages/detail/detail_film_page.dart';

// Poster berupa gradasi warna + ikon (pengganti gambar)
class PosterFilm extends StatelessWidget {
  final Film film;
  final double radius;

  const PosterFilm({super.key, required this.film, this.radius = 12});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [film.warna, Colors.black87],
        ),
      ),
      child: Center(
        child: Icon(
          film.isSerial ? Icons.live_tv : Icons.movie_creation_outlined,
          color: Colors.white70,
          size: 40,
        ),
      ),
    );
  }
}

// Kartu film: poster + judul + rating. Kalau diketuk, buka Detail Film
class KartuFilm extends StatelessWidget {
  final Film film;

  const KartuFilm({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailFilmPage(film: film)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: PosterFilm(film: film)),
          const SizedBox(height: 6),
          Text(
            film.judul,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const Icon(Icons.star, size: 14, color: Colors.amber),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  '${film.rating}  •  ${film.genre}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
