import 'package:flutter/material.dart';
// Import main.dart karena class MainScreen ada di sana
import '../main.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  bool _isPinVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 100),
            // Logo MyPertamina
            Image.asset(
            'assets/images/icon_mypertamina.png',
               height: 120,
  fit: BoxFit.contain,
),
            const SizedBox(height: 50),
            
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Masukkan Nomor Telepon dan PIN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            const SizedBox(height: 20),

            // Input Nomor Telepon
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixText: "+62 ",
                hintText: "Nomor Telepon",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),

            // Input PIN
            TextField(
              controller: _pinController,
              obscureText: !_isPinVisible,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                hintText: "Masukkan 6 Digit PIN",
                counterText: "", 
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                suffixIcon: IconButton(
                  icon: Icon(_isPinVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() => _isPinVisible = !_isPinVisible);
                  },
                ),
              ),
            ),

            const Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: null,
                child: Text("Lupa PIN?", style: TextStyle(color: Colors.black54)),
              ),
            ),
            const SizedBox(height: 30),

            // Tombol Masuk - DI SINI PENYESUAIANNYA
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1649AD),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                onPressed: () {
                  // Logika Validasi: Nomor HP terisi & PIN 6 digit
                  if (_phoneController.text.isNotEmpty && _pinController.text.length == 6) {
                    
                    // NAVIGASI: Pindah ke MainScreen agar Bottom Navigation Bar muncul
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainScreen()),
                    );
                    
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Harap isi nomor telepon dan 6 digit PIN"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text("Masuk", 
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            const Text("atau", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),

            // Tombol Daftar
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF1649AD)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                onPressed: () {},
                child: const Text("Daftar", style: TextStyle(color: Color(0xFF1649AD), fontSize: 18)),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}