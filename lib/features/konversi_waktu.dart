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

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final now = DateTime.now();
      setState(() {
        selectedTime =
            DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
        _convertTimeZones();
      });
    }
  }

  void _convertTimeZones() {
    if (selectedTime != null) {
      // WIB is UTC+7
      final wibTime = selectedTime!.toUtc().add(const Duration(hours: 7));
      convertedWIB = DateFormat('HH:mm').format(wibTime);

      // WITA is UTC+8
      final witaTime = selectedTime!.toUtc().add(const Duration(hours: 8));
      convertedWITA = DateFormat('HH:mm').format(witaTime);

      // WIT is UTC+9
      final witTime = selectedTime!.toUtc().add(const Duration(hours: 9));
      convertedWIT = DateFormat('HH:mm').format(witTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: const Text('Pilih Waktu'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black, width: 2),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
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
    );
  }
}
