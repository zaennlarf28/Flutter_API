import 'package:flutter/material.dart';
import 'package:flutter_api/models/produk_model.dart';

class ProdukDetailScreen extends StatelessWidget {
  final ProdukModel produk;

  const ProdukDetailScreen({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Latar belakang hitam
      appBar: AppBar(
        title: Text(
          produk.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black, // AppBar hitam
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: const Color(0xFF1E1E1E), // Card abu-abu gelap
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    produk.thumbnail,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  produk.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Kategori: ${produk.category}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Harga: Rp ${produk.price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF1E88E5),
                  ),
                ),
                const Divider(height: 30, color: Colors.grey),
                Text(
                  produk.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
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
