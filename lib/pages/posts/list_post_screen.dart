import 'package:flutter/material.dart';
import 'package:flutter_api/models/post_model.dart';
import 'package:flutter_api/services/post_service.dart';

class ListPostScreen extends StatelessWidget {
  const ListPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Postingan')),
      body: FutureBuilder<List<PostModel>>(
        future: PostService.listPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final dataPost = snapshot.data ?? [];

          if (dataPost.isEmpty) {
            return const Center(child: Text("Tidak ada postingan."));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: dataPost.length,
            itemBuilder: (context, index) {
              final post = dataPost[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: CircleAvatar(
                    child: Text(post.id.toString()),
                    backgroundColor: Colors.blue.shade100,
                  ),
                  title: Text(
                    post.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'User ID: ${post.userId}',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                  // TODO: Aktifkan jika sudah ada PostDetailScreen
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (_) => PostDetailScreen(
                  //         id: post.id.toString(),
                  //         title: post.title,
                  //         body: post.body,
                  //         userId: post.userId.toString(),
                  //       ),
                  //     ),
                  //   );
                  // },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
