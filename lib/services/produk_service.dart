import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_api/models/produk_model.dart';

class ProdukService {
  static const String apiUrl = 'https://dummyjson.com/products';

  static Future<List<ProdukModel>> getProdukList() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> products = data['products']; // ambil array products
      return products.map((item) => ProdukModel.fromJson(item)).toList();
    } else {
      throw Exception('Gagal mengambil data produk');
    }
  }
}
