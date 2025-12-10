import 'package:flutter/material.dart';
// Hanya import halaman yang tampil di Bottom Navigation Bar
import 'pages/beranda_page.dart';
import 'pages/promo_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyPertamina Clone',
      theme: ThemeData(
        primaryColor: const Color(0xFF005DAA),
        // Mengatur background seluruh aplikasi jadi Putih
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        useMaterial3: true,
      ),
      
      // --- KODE KHUSUS CARA 1 (BINGKAI HP DI TENGAH) ---
      builder: (context, child) {
        return Center(
          child: Container(
            // Batasi lebar seukuran HP (480px)
            constraints: const BoxConstraints(maxWidth: 480),
            // Beri border/bayangan agar terlihat seperti layar HP
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.symmetric(
                vertical: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
            ),
            child: child,
          ),
        );
      },
      // --------------------------------------------------

      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Daftar halaman utama (Bottom Navigation)
  final List<Widget> _pages = [
    const BerandaPage(),       // Index 0: Beranda
    const PromoPage(),         // Index 1: Promo (Banner Merah/Biru)
    const Center(child: Text("Fitur Bayar")), 
    const Center(child: Text("Riwayat")),
    const Center(child: Text("Akun")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF005DAA), // Biru saat aktif
        unselectedItemColor: Colors.grey,           // Abu-abu saat mati
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Promo'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner, size: 30), label: 'Bayar'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}