import 'package:flutter/material.dart';

class LayananAntarPage extends StatelessWidget {
  const LayananAntarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertamina Delivery Service", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildLinkCard(Icons.web, "Pesan sekarang via Website", "pds.mypertamina.id", Colors.blue),
            const SizedBox(height: 16),
            _buildLinkCard(Icons.phone, "Hubungi 135", "Pertamina Call Center", Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkCard(IconData icon, String title, String subtitle, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: color, size: 40),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}