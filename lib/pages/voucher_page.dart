import 'package:flutter/material.dart';

class VoucherPage extends StatelessWidget {
  const VoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Voucher Anda", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: const IconThemeData(color: Colors.black),
          bottom: const TabBar(
            labelColor: Color(0xFF005DAA),
            unselectedLabelColor: Colors.black,
            indicatorColor: Color(0xFF005DAA),
            indicatorWeight: 3,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: "Aktif"),
              Tab(text: "Tidak Aktif"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            VoucherContent(), // Konten Tab Aktif
            VoucherContent(), // Konten Tab Tidak Aktif
          ],
        ),
      ),
    );
  }
}

class VoucherContent extends StatefulWidget {
  const VoucherContent({super.key});

  @override
  State<VoucherContent> createState() => _VoucherContentState();
}

class _VoucherContentState extends State<VoucherContent> {
  String _selectedFilter = "MyPertamina"; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Search Bar
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              hintText: "Cari Promo (minimal 3 karakter)",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(color: Colors.grey)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(color: Colors.grey)),
            ),
          ),
        ),

        // 2. Tombol Filter (SESUAI FIGMA)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              _buildFilterButton("MyPertamina"),
              const SizedBox(width: 8),
              _buildFilterButton("Partner"),
            ],
          ),
        ),

        const Spacer(),
        
        // 3. Gambar Robot Sedih
        SizedBox(
          width: 250, 
          height: 200,
          child: Image.asset(
            "assets/images/ilustrasi_robot_sedih.png",
            fit: BoxFit.contain,
            // Jika gambar tidak ada, tampilkan placeholder yang rapi
            errorBuilder: (context, error, stackTrace) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.blue.shade50, shape: BoxShape.circle),
                    child: Icon(Icons.sentiment_dissatisfied, size: 80, color: Colors.blue.shade300),
                  ),
                  const SizedBox(height: 10),
                  const Text("Masukkan gambar: ilustrasi_robot_sedih.png", style: TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              );
            },
          ),
        ),

        const SizedBox(height: 20),
        const Text("Anda Belum Memiliki Voucher", style: TextStyle(color: Colors.black87, fontSize: 14)),
        const Spacer(flex: 2),
      ],
    );
  }

  // Widget Tombol Filter Kecil
  Widget _buildFilterButton(String label) {
    bool isActive = _selectedFilter == label;
    return InkWell(
      onTap: () => setState(() => _selectedFilter = label),
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF2C4095) : const Color(0xFFE0E0E0), // Biru tua Pertamina
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}