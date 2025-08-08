import 'package:flutter/material.dart';
import 'package:flutter_api/models/quran_model.dart';
import 'package:flutter_api/services/quran_service.dart';
import 'package:flutter_api/pages/quran/quran_detail_screen.dart';

class ListQuranScreen extends StatefulWidget {
  const ListQuranScreen({super.key});

  @override
  State<ListQuranScreen> createState() => _ListQuranScreenState();
}

class _ListQuranScreenState extends State<ListQuranScreen> {
  late Future<List<QuranModel>> _quranList;
  final TextEditingController _searchController = TextEditingController();
  List<QuranModel> _filteredQuranList = [];

  @override
  void initState() {
    super.initState();
    _quranList = QuranService.listQuran();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterSurahs(String query, List<QuranModel> quranList) {
    setState(() {
      _filteredQuranList = quranList
          .where((surah) =>
              (surah.nama?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
              (surah.arti?.toLowerCase().contains(query.toLowerCase()) ?? false))
          .toList();
    });
  }

  Future<void> _refreshQuranList() async {
    setState(() {
      _quranList = QuranService.listQuran();
      _searchController.clear();
      _filteredQuranList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Light blue-grey background
      appBar: AppBar(
        title: const Text(
          'Daftar Surah',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1E88E5), // Blue theme
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari surah atau arti...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onChanged: (query) async {
                final quranList = await _quranList;
                _filterSurahs(query, quranList);
              },
            ),
          ),
          // Surah List
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshQuranList,
              color: const Color(0xFF1E88E5), // Blue refresh indicator
              child: FutureBuilder<List<QuranModel>>(
                future: _quranList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF1E88E5),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Terjadi kesalahan: ${snapshot.error}",
                        style: const TextStyle(
                          color: Color(0xFFD32F2F),
                          fontSize: 16,
                        ),
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        "Tidak ada surah.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }

                  final quranList = _searchController.text.isNotEmpty
                      ? _filteredQuranList
                      : snapshot.data!;

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    itemCount: quranList.length,
                    itemBuilder: (context, index) {
                      final surah = quranList[index];
                      return AnimatedOpacity(
                        opacity: 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          margin: const EdgeInsets.only(bottom: 12.0),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16.0),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      QuranDetailScreen(surah: surah),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  // Surah Number Avatar
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: const Color(0xFFBBDEFB), // Light blue
                                    child: Text(
                                      surah.nomor ?? '-',
                                      style: const TextStyle(
                                        color: Color(0xFF1E88E5), // Blue text
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  // Surah Details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          surah.nama ?? '-',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          'Arti: ${surah.arti ?? '-'}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          'Jumlah Ayat: ${surah.ayat ?? 0}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}