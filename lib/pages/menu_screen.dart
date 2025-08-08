import 'package:flutter/material.dart';
import 'package:flutter_api/pages/home_screen.dart';
import 'package:flutter_api/pages/posts/list_post_screen.dart';
import 'package:flutter_api/pages/product/product_list_screen.dart';
import 'package:flutter_api/pages/quran/list_quran_screen.dart';
import 'package:flutter_api/pages/produk/produk_list_screen.dart';
import 'package:flutter_api/pages/profile_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    ListPostScreen(),
    ListQuranScreen(),
    ProductListScreen(),
    ProdukListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article), // Post
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book), // Quran
            label: 'Qur\'an',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag), // Produk
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront), // Produk Data
            label: 'Produk Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
