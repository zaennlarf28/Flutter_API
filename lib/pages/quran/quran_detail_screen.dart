import 'package:flutter/material.dart';
import 'package:flutter_api/models/quran_model.dart';

class QuranDetailScreen extends StatelessWidget {
  final QuranModel surah;

  const QuranDetailScreen({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surah.nama ?? 'Detail Surah'),
        backgroundColor: const Color(0xFF1E88E5),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    surah.nama ?? '-',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E88E5),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    surah.asma ?? '-',
                    style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  ),
                ),
                const Divider(height: 30, color: Colors.grey),

                // Detail Rows
                detailItem('Nomor', surah.nomor),
                detailItem('Arti', surah.arti),
                detailItem('Jumlah Ayat', surah.ayat?.toString()),
                detailItem('Tipe', surah.type),
                detailItem('Urutan Pewahyuan', surah.urut),
                detailItem('Rukuk', surah.rukuk),
                detailItem('Keterangan', surah.keterangan),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget detailItem(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value ?? '-',
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
