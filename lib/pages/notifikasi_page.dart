import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Notifikasi",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: [
            // --- 1. CUSTOM TAB BAR ---
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    )
                  ],
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                dividerColor: Colors.transparent,
                indicatorPadding: const EdgeInsets.all(4), 
                tabs: [
                  _buildTabItem(Icons.campaign, "Promo"),
                  _buildTabItem(Icons.article, "Informasi"),
                ],
              ),
            ),

            // --- 2. ISI KONTEN ---
            const Expanded(
              child: TabBarView(
                children: [
                  _PromoNotificationList(),     
                  _InformasiNotificationList(), 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(IconData icon, String label) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}

// --- TAB 1: PROMO ---
class _PromoNotificationList extends StatelessWidget {
  const _PromoNotificationList();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildNotifCard(
          tagIcon: Icons.local_offer,
          tagName: "Promo",
          tagColor: Colors.blue,
          title: "Promo Diskon Hari Ini",
          desc: "Dapatkan diskon 15% untuk pembelian Pertamax Turbo. Promo hanya berlaku hingga 27/10/2025.",
          date: "27 Okt 2025",
        ),
        _buildNotifCard(
          tagIcon: Icons.local_offer,
          tagName: "Promo",
          tagColor: Colors.blue,
          title: "Kesempatan Terakhir!",
          desc: "Poin Anda senilai Rp 50.000 akan kedaluwarsa pada 31 Oktober 2025.",
          date: "28 Okt 2025",
        ),
        _buildNotifCard(
          tagIcon: Icons.local_offer,
          tagName: "Promo",
          tagColor: Colors.blue,
          title: "Promo Isi Full Tank!",
          desc: "Isi BBM minimum 40 liter (semua jenis) dan dapatkan voucher cashback Rp 15.000.",
          date: "25 Okt 2025",
        ),
      ],
    );
  }
}

// --- TAB 2: INFORMASI ---
class _InformasiNotificationList extends StatelessWidget {
  const _InformasiNotificationList();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildNotifCard(
          tagIcon: Icons.payments,
          tagName: "Transaksi",
          tagColor: Colors.blue,
          title: "Pembayaran Berhasil!",
          desc: "Pembelian Pertamax 92 senilai Rp 100.000 di SPBU [Kode SPBU] telah berhasil.",
          date: "25 Okt 2025",
        ),
        _buildNotifCard(
          tagIcon: Icons.payments,
          tagName: "Transaksi",
          tagColor: Colors.blue,
          title: "Poin Loyalitas Bertambah",
          desc: "Selamat! Anda mendapatkan tambahan 750 Poin Loyalitas.",
          date: "25 Okt 2025",
        ),
        _buildNotifCard(
          tagIcon: Icons.info,
          tagName: "Info Umum",
          tagColor: Colors.orange,
          title: "Poin Loyalitas Bertambah",
          desc: "Selamat! Anda mendapatkan tambahan 750 Poin Loyalitas. Kumpulkan dan tukarkan dengan rewards menarik.",
          date: "25 Okt 2025",
        ),
      ],
    );
  }
}

// --- HELPER: KARTU NOTIFIKASI ---
Widget _buildNotifCard({
  required IconData tagIcon,
  required String tagName,
  required Color tagColor,
  required String title,
  required String desc,
  required String date,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFFDAE6F8), // Biru muda background
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. HEADER (LOGO + TAG)
        Row(
          children: [
            // --- BAGIAN LOGO GAMBAR ---
            Container(
              width: 24, // UKURAN FIX KECIL
              height: 24,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              // ClipRRect Memastikan gambar tidak keluar dari kotak bundar
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  "assets/images/icon_my_small.png", // Pastikan nama file ini
                  fit: BoxFit.contain, // KUNCI: Memaksa gambar besar jadi pas di kotak kecil
                  errorBuilder: (c,e,s) => const Center(
                    child: Text("My", style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.blue)),
                  ),
                ),
              ),
            ),
            
            // LABEL KATEGORI
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(tagIcon, size: 12, color: tagColor),
                  const SizedBox(width: 4),
                  Text(
                    tagName,
                    style: TextStyle(fontSize: 12, color: tagColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 4),
        Text(desc, style: const TextStyle(fontSize: 13, color: Colors.black87)),
        const SizedBox(height: 12),
        
        // FOOTER (USER & TANGGAL)
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const Text("Uchiha Udin", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(width: 8),
            Text(date, style: const TextStyle(fontSize: 11, color: Colors.black54)),
          ],
        )
      ],
    ),
  );
}