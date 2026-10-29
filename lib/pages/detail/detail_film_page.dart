import 'package:flutter/material.dart';

import '../../data/film_data.dart';
import '../../widgets/film_widgets.dart';
import 'episode_page.dart';
import 'pemain_page.dart';
import 'rekomendasi_page.dart';

class DetailFilmPage extends StatefulWidget {
  final Film film;

  const DetailFilmPage({super.key, required this.film});

  @override
  State<DetailFilmPage> createState() => _DetailFilmPageState();
}

class _DetailFilmPageState extends State<DetailFilmPage> {
  bool _favorit = false;

  void _buka(Widget halaman) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => halaman));
  }

  @override
  Widget build(BuildContext context) {
    final film = widget.film;

    return Scaffold(
      appBar: AppBar(
        title: Text(film.judul),
        actions: [
          IconButton(
            tooltip: 'Favorit',
            icon: Icon(_favorit ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              setState(() {
                _favorit = !_favorit;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: ListView(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: PosterFilm(film: film, radius: 0),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      film.judul,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        Chip(
                          avatar: const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18,
                          ),
                          label: Text('${film.rating}'),
                        ),
                        Chip(label: Text(film.genre)),
                        Chip(label: Text('${film.tahun}')),
                        Chip(label: Text(film.durasi)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Memutar ${film.judul}...'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.play_arrow),
                            label: const Text('Tonton'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Mengunduh ${film.judul}...'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.download),
                            label: const Text('Download'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Sinopsis',
                      style: Theme.of(context).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(film.sinopsis),
                    const SizedBox(height: 20),
                    Text(
                      'Jelajahi',
                      style: Theme.of(context).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.video_library_outlined),
                            title: Text(
                              film.isSerial ? 'Episode' : 'Bagian Film',
                            ),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () => _buka(EpisodePage(film: film)),
                          ),
                          const Divider(height: 1),
                          ListTile(
                            leading: const Icon(Icons.groups_outlined),
                            title: const Text('Pemain'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () => _buka(PemainPage(film: film)),
                          ),
                          const Divider(height: 1),
                          ListTile(
                            leading: const Icon(Icons.recommend_outlined),
                            title: const Text('Rekomendasi'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () => _buka(RekomendasiPage(film: film)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
