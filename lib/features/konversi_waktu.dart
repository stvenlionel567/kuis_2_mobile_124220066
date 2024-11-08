import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KonversiWaktu extends StatefulWidget {
  const KonversiWaktu({super.key});

  @override
  State<KonversiWaktu> createState() => _KonversiWaktuState();
}

class _KonversiWaktuState extends State<KonversiWaktu> {
  DateTime? selectedTime;
  String? convertedWIB;
  String? convertedWIT;
  String? convertedWITA;

  final TextEditingController _timeController = TextEditingController();

// Fungsi konversi waktu
  void _convertTimeZones(String inputTime) {
    try {
      final inputFormat = DateFormat('HH:mm');
      final parsedTime = inputFormat.parse(inputTime);

      final now = DateTime.now();
      selectedTime = DateTime(
          now.year, now.month, now.day, parsedTime.hour, parsedTime.minute);

      // Konversi waktu
      final wibTime = selectedTime!.toUtc().add(const Duration(hours: 7));
      convertedWIB = DateFormat('HH:mm').format(wibTime);

      final witaTime = selectedTime!.toUtc().add(const Duration(hours: 8));
      convertedWITA = DateFormat('HH:mm').format(witaTime);

      final witTime = selectedTime!.toUtc().add(const Duration(hours: 9));
      convertedWIT = DateFormat('HH:mm').format(witTime);

      setState(() {});
    } catch (e) {
      // Format salah
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Format Salah'),
          content:
              const Text('Pastikan format waktu adalah HH:mm, misal 13:45'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Konversi Waktu'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextField(
                    focusNode: FocusNode(),
                    controller: _timeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      labelText: 'Masukkan Waktu (HH:mm)',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final inputTime = _timeController.text;
                      _convertTimeZones(inputTime);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black, width: 2),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Konversi Waktu'),
                  ),
                ),
                const SizedBox(height: 20),
                if (selectedTime != null) ...[
                  Text(
                    'Waktu Terpilih: ${DateFormat('HH:mm').format(selectedTime!)}',
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'WIB: $convertedWIB',
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(
                    'WITA: $convertedWITA',
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(
                    'WIT: $convertedWIT',
                    style: const TextStyle(fontSize: 25),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
