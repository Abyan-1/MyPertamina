import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditHargaPage extends StatefulWidget {
  const EditHargaPage({super.key});

  @override
  State<EditHargaPage> createState() => _EditHargaPageState();
}

class _EditHargaPageState extends State<EditHargaPage> {
  final TextEditingController _pertaliteCtrl = TextEditingController();
  final TextEditingController _pertamaxCtrl = TextEditingController();
  final TextEditingController _turboCtrl = TextEditingController();
  final TextEditingController _biosolarCtrl = TextEditingController();
  final TextEditingController _dexliteCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadHarga(); // Muat harga saat halaman dibuka
  }

  // Fungsi untuk mengambil data harga yang tersimpan
  Future<void> _loadHarga() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _pertaliteCtrl.text = prefs.getString('harga_pertalite') ?? "10.000";
      _pertamaxCtrl.text = prefs.getString('harga_pertamax') ?? "13.000";
      _turboCtrl.text = prefs.getString('harga_turbo') ?? "14.500";
      _biosolarCtrl.text = prefs.getString('harga_biosolar') ?? "6.800";
      _dexliteCtrl.text = prefs.getString('harga_dexlite') ?? "16.000";
    });
  }

  // Fungsi untuk menyimpan harga baru
  Future<void> _simpanHarga() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('harga_pertalite', _pertaliteCtrl.text);
    await prefs.setString('harga_pertamax', _pertamaxCtrl.text);
    await prefs.setString('harga_turbo', _turboCtrl.text);
    await prefs.setString('harga_biosolar', _biosolarCtrl.text);
    await prefs.setString('harga_dexlite', _dexliteCtrl.text);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Harga BBM berhasil diperbarui!"), backgroundColor: Colors.green),
      );
      Navigator.pop(context, true); // Kembali dan beri sinyal bahwa data berubah
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Harga BBM", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInputForm("Harga Pertalite", _pertaliteCtrl),
            _buildInputForm("Harga Pertamax", _pertamaxCtrl),
            _buildInputForm("Harga Pertamax Turbo", _turboCtrl),
            _buildInputForm("Harga Biosolar", _biosolarCtrl),
            _buildInputForm("Harga Dexlite", _dexliteCtrl),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF005DAA)),
                onPressed: _simpanHarga,
                child: const Text("Simpan Perubahan", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputForm(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          prefixText: "Rp. ",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}