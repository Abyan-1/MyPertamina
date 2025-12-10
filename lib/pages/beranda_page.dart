import 'package:flutter/material.dart';
import 'notifikasi_page.dart';
import 'voucher_page.dart';
import 'tagihan_gas_page.dart';
import 'layanan_antar_page.dart';
import 'promo_page.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          "assets/images/logo_mypertamina.png",
          height: 35,
          errorBuilder: (ctx, err, stack) => const Text(
            "MyPERTAMINA",
            style: TextStyle(color: Color(0xFFED1C24), fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.confirmation_number_outlined, color: Color(0xFF005DAA)),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const VoucherPage())),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF005DAA)),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotifikasiPage())),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. KARTU SALDO (UBAH WARNA JADI ABU MUDA)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6), // Putih keabu-abuan
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 5, offset: const Offset(0, 2))
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFF005DAA),
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nama Pengguna", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            Text("XXXXXXX", style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Saldo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        Text("Rp. XXXXXXX", style: TextStyle(color: Colors.black, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 2. LAYANAN
              const Text("Layanan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 8,
                childAspectRatio: 0.8,
                children: [
                  _buildMenuIcon(context, "assets/images/icon_subsidi_tepat.png", "Subsidi Tepat", null),
                  _buildMenuIcon(context, "assets/images/icon_layanan_antar.png", "Layanan\nAntar", const LayananAntarPage()),
                  _buildMenuIcon(context, "assets/images/icon_merchandise.png", "Merchandise", const PromoPage()),
                  _buildMenuIcon(context, "assets/images/icon_tukar_poin.png", "Tukar Poin", null),
                  _buildMenuIcon(context, "assets/images/icon_tagihan_gas.png", "Tagihan Gas", const TagihanGasPage()),
                  _buildMenuIcon(context, "assets/images/icon_pelita_air.png", "Pelita Air", null),
                ],
              ),

              // 3. SPBU TERDEKAT (UBAH WARNA JADI ABU MUDA)
              const SizedBox(height: 24),
              const Text("SPBU Terdekat", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6), // Putih keabu-abuan
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withValues(alpha: 0.1), spreadRadius: 1, blurRadius: 5)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("XX.XXX.XX", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text("Alamat SPBU", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xFFD6E4F0),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.directions, color: Color(0xFF005DAA), size: 28),
                    )
                  ],
                ),
              ),

              // 4. HARGA BBM
              const SizedBox(height: 24),
              const Text("Harga BBM saat ini", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),

              _buildFuelCard("assets/images/logo_pertalite.png", "Pertalite", "Rp. 10.000", imageScale: 0.94),
              _buildFuelCard("assets/images/logo_pertamax.png", "Pertamax", "Rp. 13.000", imageScale: 0.5),
              _buildFuelCard("assets/images/logo_pertamax_turbo.png", "Pertamax Turbo", "Rp. 14.500", imageScale: 0.65),
              _buildFuelCard("assets/images/logo_biosolar.png", "Biosolar", "Rp. 6.800", imageScale: 0.9),
              _buildFuelCard("assets/images/logo_dexlite.png", "Dexlite", "Rp. 16.000", imageScale: 1.0),
              
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET HELPER ---

  Widget _buildMenuIcon(BuildContext context, String imagePath, String label, Widget? page) {
    return InkWell(
      onTap: () {
        if (page != null) Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // WADAH KOTAK (UBAH WARNA JADI ABU MUDA)
          Container(
            height: 64, 
            width: 64,  
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6), // Putih keabu-abuan (Agar kontras dengan BG putih)
              borderRadius: BorderRadius.circular(16), 
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1), 
                  blurRadius: 5, 
                  spreadRadius: 0, 
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (ctx, err, stack) => const Icon(Icons.image_not_supported, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11, 
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildFuelCard(String logoPath, String fallbackName, String price, {double imageScale = 1.0}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6), // UBAH WARNA JADI ABU MUDA
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
           BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2))
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fallbackName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(price, style: const TextStyle(fontSize: 14, color: Colors.black87)),
              ],
            ),
          ),
          
          Container(
            height: 50,
            width: 130,
            alignment: Alignment.centerRight,
            child: Transform.scale(
              scale: 1.0 / imageScale,
              alignment: Alignment.centerRight,
              child: Image.asset(
                logoPath,
                fit: BoxFit.contain,
                errorBuilder: (ctx, err, stack) => Text(
                  fallbackName.toUpperCase(), 
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}