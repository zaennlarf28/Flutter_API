import 'package:flutter_api/models/post_model.dart';
import 'package:flutter_api/services/post_service.dart';
import 'package:flutter/material.dart';

class ListPostScreen extends StatelessWidget {
  const ListPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.amber,
      child: FutureBuilder<List<PostModel>>(
        future: PostService.listPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final dataPost = snapshot.data ?? [];
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: dataPost.length,
            itemBuilder: (context, items) {
              final data = dataPost[items];
              return GestureDetector(
                // onTop: () {
                //   Navigator.push(
                //     context, 
                //     MaterialPageRoute(
                //       builder: (_) => PostDetailScreen(
                //         id: data.id.toString(),
                //         title : data.title,
                //         body: data.body,
                //         userId: data.userId.toString(),
                //       ),
                //     ),
                //   );
                // },
                child: ListTile(
                  leading: Text(data.id.toString()),
                  title: Text(data.title),
                  subtitle: Text('User ID: ${data.userId}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}