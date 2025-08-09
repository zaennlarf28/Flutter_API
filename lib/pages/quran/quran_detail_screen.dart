import 'package:flutter/material.dart';
import 'package:flutter_api/models/quran_model.dart';

class QuranDetailScreen extends StatelessWidget {
  final QuranModel surah;

  const QuranDetailScreen({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Dark background
      appBar: AppBar(
        backgroundColor:Colors.grey[900],
        foregroundColor: Colors.white,
        title: Text(
          surah.nama ?? 'Detail Surah',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: const Color(0xFF1E1E1E), // Dark card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul
                Center(
                  child: Text(
                    surah.nama ?? '-',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E88E5), // Blue accent
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    surah.asma ?? '-',
                    style: const TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(height: 1, color: Colors.white24),
                const SizedBox(height: 12),

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
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value ?? '-',
              style: const TextStyle(
                color: Colors.white70,
                height: 1.4, // biar rapi kalau keterangan panjang
              ),
            ),
          ),
        ],
      ),
    );
  }
}
