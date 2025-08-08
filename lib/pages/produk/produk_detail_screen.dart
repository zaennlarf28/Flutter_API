import 'package:flutter/material.dart';
import 'package:flutter_api/models/produk_model.dart';

class ProdukDetailScreen extends StatelessWidget {
  final ProdukModel produk;

  const ProdukDetailScreen({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produk.title),
        backgroundColor: const Color(0xFF1976D2), // Biru tua
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
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
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Kategori: ${produk.category}',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  'Harga: Rp ${produk.price.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 18, color: Color(0xFF1976D2)), // Biru juga
                ),
                const Divider(height: 30),
                Text(
                  produk.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
