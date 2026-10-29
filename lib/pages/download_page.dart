import 'package:flutter/material.dart';

import '../data/film_data.dart';
import '../widgets/film_widgets.dart';

class _Unduhan {
  final Film film;
  final double progres;

  _Unduhan(this.film, this.progres);
}

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  final List<_Unduhan> _daftar = [
    _Unduhan(daftarFilm[0], 1.0),
    _Unduhan(daftarFilm[2], 0.65),
    _Unduhan(daftarFilm[4], 0.30),
  ];

  void _hapus(int index) {
    final judul = _daftar[index].film.judul;
    setState(() {
      _daftar.removeAt(index);
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('$judul dihapus dari unduhan')));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Penyimpanan',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 10),
                LinearProgressIndicator(value: 0.3),
                SizedBox(height: 6),
                Text('2,4 GB dari 8 GB terpakai'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Unduhan Saya',
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        if (_daftar.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 48),
            child: Center(child: Text('Belum ada unduhan.')),
          )
        else
          for (int i = 0; i < _daftar.length; i++)
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: SizedBox(
                  width: 56,
                  height: 56,
                  child: PosterFilm(film: _daftar[i].film, radius: 8),
                ),
                title: Text(
                  _daftar[i].film.judul,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      _daftar[i].progres >= 1
                          ? 'Selesai'
                          : 'Mengunduh ${(_daftar[i].progres * 100).round()}%',
                    ),
                    const SizedBox(height: 6),
                    LinearProgressIndicator(value: _daftar[i].progres),
                  ],
                ),
                trailing: IconButton(
                  tooltip: 'Hapus',
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => _hapus(i),
                ),
              ),
            ),
      ],
    );
  }
}
