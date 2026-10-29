import 'package:flutter/material.dart';

class _Game {
  final String nama;
  final String genre;
  final IconData ikon;
  final Color warna;

  const _Game(this.nama, this.genre, this.ikon, this.warna);
}

const List<_Game> _daftarGame = [
  _Game('Teka-Teki Sinema', 'Puzzle', Icons.extension, Colors.orange),
  _Game('Balap Senja', 'Balapan', Icons.directions_car, Colors.red),
  _Game('Penjaga Rimba', 'Aksi', Icons.shield, Colors.green),
  _Game('Tebak Adegan', 'Kuis', Icons.quiz, Colors.purple),
  _Game('Samudra Quest', 'Petualangan', Icons.sailing, Colors.blue),
];

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _daftarGame.length,
      itemBuilder: (context, index) {
        final game = _daftarGame[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: CircleAvatar(
              radius: 26,
              backgroundColor: game.warna,
              child: Icon(game.ikon, color: Colors.white),
            ),
            title: Text(
              game.nama,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(game.genre),
            trailing: FilledButton.tonal(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Membuka ${game.nama}...')),
                );
              },
              child: const Text('Main'),
            ),
          ),
        );
      },
    );
  }
}
