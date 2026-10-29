import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/beranda_page.dart';
import 'pages/game_page.dart';
import 'pages/download_page.dart';
import 'pages/profil_page.dart';
import 'pages/film_search_delegate.dart';
import 'pages/pengaturan_bantuan_page.dart';

void main() {
  runApp(const CineKuApp());
}

class CineKuApp extends StatelessWidget {
  const CineKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineKu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HalamanUtama(),
    );
  }
}

// Data satu menu navigasi (dipakai NavigationBar dan NavigationRail)
class _MenuItem {
  final String label;
  final IconData ikon;
  final IconData ikonAktif;

  const _MenuItem(this.label, this.ikon, this.ikonAktif);
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _indexTerpilih = 0;
  String _nama = 'Kiki';
  final String _npm = '5520124085';
  String _bahasa = 'Indonesia';

  static const List<_MenuItem> _menu = [
    _MenuItem('Beranda', Icons.home_outlined, Icons.home),
    _MenuItem('Game', Icons.sports_esports_outlined, Icons.sports_esports),
    _MenuItem('Download', Icons.download_outlined, Icons.download),
    _MenuItem('Profil', Icons.person_outline, Icons.person),
  ];

  String get _inisial {
    final bagian = _nama
        .trim()
        .split(RegExp(r'\s+'))
        .where((s) => s.isNotEmpty)
        .toList();
    if (bagian.isEmpty) return '?';
    return bagian.take(2).map((s) => s[0]).join().toUpperCase();
  }

  void _pilihMenu(int index) {
    setState(() {
      _indexTerpilih = index;
    });
  }

  // ---------- Aksi ----------

  void _tampilNotifikasi() {
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => const SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                'Notifikasi',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.live_tv),
              title: Text('Episode baru telah tersedia'),
              subtitle: Text('Jejak di Balik Kabut - Episode 10'),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Film baru ditambahkan'),
              subtitle: Text('Langit Kedua kini bisa ditonton'),
            ),
            ListTile(
              leading: Icon(Icons.download_done),
              title: Text('Unduhan selesai'),
              subtitle: Text('Bayangan Senja siap ditonton offline'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _gantiProfil() async {
    final controller = TextEditingController(text: _nama);
    final hasil = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Ganti Profil'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Nama lengkap',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, controller.text.trim()),
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
    if (!mounted) return;
    if (hasil != null && hasil.isNotEmpty) {
      setState(() {
        _nama = hasil;
      });
    }
  }

  Future<void> _pilihBahasa() async {
    final hasil = await showDialog<String>(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const Text('Pilih Bahasa'),
        children: [
          for (final b in ['Indonesia', 'English'])
            ListTile(
              title: Text(b),
              trailing: _bahasa == b ? const Icon(Icons.check) : null,
              onTap: () => Navigator.pop(ctx, b),
            ),
        ],
      ),
    );
    if (!mounted) return;
    if (hasil != null) {
      setState(() {
        _bahasa = hasil;
      });
    }
  }

  Future<void> _konfirmasiKeluar() async {
    final keluar = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Keluar'),
        content: const Text('Apakah kamu yakin ingin keluar dari CineKu?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
    if (keluar == true) {
      SystemNavigator.pop();
    }
  }

  void _bukaHalaman(Widget halaman) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => halaman));
  }

  // ---------- Drawer (menu samping kiri) ----------

  Widget _buildDrawer() {
    final warna = Theme.of(context).colorScheme;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: warna.primaryContainer),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: warna.primary,
                  child: Text(
                    _inisial,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: warna.onPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _nama,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('NPM $_npm'),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Akun'),
            onTap: () {
              Navigator.pop(context); // tutup drawer
              _pilihMenu(3); // buka tab Profil
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Pengaturan'),
            onTap: () {
              Navigator.pop(context);
              _bukaHalaman(const PengaturanPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Bantuan'),
            onTap: () {
              Navigator.pop(context);
              _bukaHalaman(const BantuanPage());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Keluar'),
            onTap: () {
              Navigator.pop(context);
              _konfirmasiKeluar();
            },
          ),
        ],
      ),
    );
  }

  // ---------- EndDrawer (panel profil di kanan) ----------

  Widget _buildEndDrawer() {
    final warna = Theme.of(context).colorScheme;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: warna.secondaryContainer),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: warna.secondary,
                  child: Text(
                    _inisial,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: warna.onSecondary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _nama,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Bahasa: $_bahasa'),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Ganti Profil'),
            onTap: () {
              Navigator.pop(context);
              _gantiProfil();
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Bahasa'),
            subtitle: Text(_bahasa),
            onTap: () {
              Navigator.pop(context);
              _pilihBahasa();
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Keluar'),
            onTap: () {
              Navigator.pop(context);
              _konfirmasiKeluar();
            },
          ),
        ],
      ),
    );
  }

  // ---------- Build ----------

  @override
  Widget build(BuildContext context) {
    final List<Widget> halaman = [
      const BerandaPage(),
      const GamePage(),
      const DownloadPage(),
      ProfilPage(
        nama: _nama,
        npm: _npm,
        bahasa: _bahasa,
        onGantiProfil: _gantiProfil,
      ),
    ];

    final Widget isi = IndexedStack(index: _indexTerpilih, children: halaman);

    return LayoutBuilder(
      builder: (context, constraints) {
        // Layar lebar (tablet / desktop) pakai NavigationRail,
        // layar sempit (HP) pakai NavigationBar di bawah
        final bool layarLebar = constraints.maxWidth >= 600;

        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            // leading otomatis berupa tombol menu untuk membuka Drawer
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.movie_filter,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                const Text(
                  'CineKu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                tooltip: 'Pencarian',
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: FilmSearchDelegate());
                },
              ),
              IconButton(
                tooltip: 'Notifikasi',
                icon: const Badge(
                  label: Text('3'),
                  child: Icon(Icons.notifications_outlined),
                ),
                onPressed: _tampilNotifikasi,
              ),
              IconButton(
                tooltip: 'Profil',
                icon: const Icon(Icons.account_circle_outlined),
                onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
              ),
            ],
          ),
          drawer: _buildDrawer(),
          endDrawer: _buildEndDrawer(),
          body: layarLebar
              ? Row(
                  children: [
                    NavigationRail(
                      selectedIndex: _indexTerpilih,
                      onDestinationSelected: _pilihMenu,
                      labelType: NavigationRailLabelType.all,
                      destinations: [
                        for (final m in _menu)
                          NavigationRailDestination(
                            icon: Icon(m.ikon),
                            selectedIcon: Icon(m.ikonAktif),
                            label: Text(m.label),
                          ),
                      ],
                    ),
                    const VerticalDivider(width: 1),
                    Expanded(child: isi),
                  ],
                )
              : isi,
          bottomNavigationBar: layarLebar
              ? null
              : NavigationBar(
                  selectedIndex: _indexTerpilih,
                  onDestinationSelected: _pilihMenu,
                  destinations: [
                    for (final m in _menu)
                      NavigationDestination(
                        icon: Icon(m.ikon),
                        selectedIcon: Icon(m.ikonAktif),
                        label: m.label,
                      ),
                  ],
                ),
        );
      },
    );
  }
}
