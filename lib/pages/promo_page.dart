import 'package:flutter/material.dart';
import 'voucher_page.dart';
import 'notifikasi_page.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  String _selectedFilter = "MyPertamina";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          "assets/images/logo_mypertamina.png",
          height: 35,
          errorBuilder: (ctx, err, stack) => const Text(
            "MyPERTAMINA",
            style: TextStyle(
              color: Color(0xFFED1C24),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.confirmation_number_outlined,
              color: Color(0xFF005DAA),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VoucherPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Color(0xFF005DAA),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotifikasiPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. BAGIAN HARGA BBM ---
              const Text(
                "Harga BBM saat ini",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),

              // Baris 1 (MENGGUNAKAN ANGKA ANDA: 0.35 & 0.32)
              Row(
                children: [
                  Expanded(
                    child: _buildFuelGridCard(
                      "Pertalite",
                      "Rp. 10.000",
                      "assets/images/logo_pertalite.png",
                      imageScale: 0.80,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildFuelGridCard(
                      "Pertamax",
                      "Rp. 13.000",
                      "assets/images/logo_pertamax.png",
                      imageScale: 0.32,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Baris 2 (MENGGUNAKAN ANGKA ANDA: 0.5 & 0.65)
              Row(
                children: [
                  Expanded(
                    child: _buildFuelGridCard(
                      "Pertamax Turbo",
                      "Rp. 14.500",
                      "assets/images/logo_pertamax_turbo.png",
                      imageScale: 0.5,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildFuelGridCard(
                      "Biosolar",
                      "Rp. 6.800",
                      "assets/images/logo_biosolar.png",
                      imageScale: 0.65,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Baris 3 (MENGGUNAKAN ANGKA ANDA: 0.8)
              Row(
                children: [
                  Expanded(
                    child: _buildFuelGridCard(
                      "Dexlite",
                      "Rp. 16.000",
                      "assets/images/logo_dexlite.png",
                      imageScale: 0.8,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(child: SizedBox()),
                ],
              ),

              const SizedBox(height: 24),

              // --- 2. BAGIAN FILTER TOMBOL ---
              const Text(
                "Promo untuk Kamu",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildFilterButton("MyPertamina"),
                  const SizedBox(width: 10),
                  _buildFilterButton("Partner"),
                ],
              ),

              const SizedBox(height: 16),

              // --- 3. DAFTAR KARTU PROMO ---
              if (_selectedFilter == "MyPertamina") ...[
                _buildPromoCard(
                  "assets/images/banner_voucher_25k.png",
                  "E-Voucher MyPertamina",
                  "Rp. 25.000",
                  "4.500",
                ),
                _buildPromoCard(
                  "assets/images/banner_voucher_50k.png",
                  "E-Voucher MyPertamina",
                  "Rp. 50.000",
                  "9.000",
                ),
                _buildPromoCard(
                  "assets/images/banner_voucher_100k.png",
                  "E-Voucher MyPertamina",
                  "Rp. 100.000",
                  "18.000",
                ),
              ] else ...[
                _buildPromoCard(
                  "assets/images/banner_youtube.png",
                  "Voucher Youtube Premium",
                  "30 Hari",
                  "4.500",
                ),
                _buildPromoCard(
                  "assets/images/banner_grabfood.png",
                  "Voucher GrabFood",
                  "Rp. 50.000",
                  "2.500",
                ),
              ],

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET HELPER: KARTU BBM KECIL (GRID) ---
  Widget _buildFuelGridCard(
    String name,
    String price,
    String logoPath, {
    double imageScale = 1.0,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // KIRI: TEKS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),

          // KANAN: GAMBAR (Dengan Scale)
          Container(
            height: 35,
            width: 70,
            alignment: Alignment.centerRight,
            child: Transform.scale(
              scale: 1.0 / imageScale, // Logika Scale agar bisa diatur manual
              alignment: Alignment.centerRight,
              child: Image.asset(
                logoPath,
                fit: BoxFit.contain,
                errorBuilder: (c, e, s) =>
                    const Icon(Icons.image, size: 20, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET HELPER: TOMBOL FILTER ---
  Widget _buildFilterButton(String label) {
    bool isActive = _selectedFilter == label;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
      },
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF005DAA) : const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // --- WIDGET HELPER: KARTU PROMO BANNER ---
  Widget _buildPromoCard(
    String imagePath,
    String title,
    String value,
    String points,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (ctx, err, stack) => Container(
                height: 120,
                color: Colors.grey.shade200,
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(value, style: const TextStyle(fontSize: 13)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF005DAA)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 0,
                        ),
                        minimumSize: const Size(0, 28),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        "Tukar",
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF005DAA),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.stars, color: Colors.orange, size: 12),
                        const SizedBox(width: 4),
                        Text(
                          points,
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
