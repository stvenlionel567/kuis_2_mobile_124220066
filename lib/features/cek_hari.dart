import 'package:flutter/material.dart';

class CekHari extends StatefulWidget {
  const CekHari({super.key});

  @override
  State<CekHari> createState() => _CekHariState();
}

class _CekHariState extends State<CekHari> {
  final _numberController = TextEditingController();
  String? dayResult;

  void checkDay() {
    final dayNumber = int.tryParse(_numberController.text);

    setState(() {
      switch (dayNumber) {
        case 1:
          dayResult = "Senin";
          break;
        case 2:
          dayResult = "Selasa";
          break;
        case 3:
          dayResult = "Rabu";
          break;
        case 4:
          dayResult = "Kamis";
          break;
        case 5:
          dayResult = "Jumat";
          break;
        case 6:
          dayResult = "Sabtu";
          break;
        case 7:
          dayResult = "Minggu";
          break;
        default:
          dayResult = "Nomor tidak valid. Masukkan angka antara 1 dan 7.";
      }
    });
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cekHariKey = GlobalKey<FormState>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Cek Hari Berdasarkan Nomor'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: cekHariKey,
            child: Column(
              children: [
                // Input nomor hari
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor hari tidak boleh kosong';
                    }
                    return null;
                  },
                  controller: _numberController,
                  decoration: const InputDecoration(
                    labelText: 'Masukkan nomor hari (1-7)',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                // Tombol cek hari
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (cekHariKey.currentState!.validate()) {
                          checkDay();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        side: const BorderSide(color: Colors.black, width: 2),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        "Cek Hari",
                        style: TextStyle(fontSize: 15),
                      ),
                    )),
                const SizedBox(height: 20),
                // Tampilkan hasil hari
                if (dayResult != null)
                  Text(
                    dayResult!,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
