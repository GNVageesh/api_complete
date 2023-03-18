import 'package:api_complete/service/remote.dart';
import 'package:api_complete/widgets/card.dart';
import 'package:flutter/material.dart';

import '../models/post.model.dart';

class GetAllView extends StatefulWidget {
  const GetAllView({super.key});

  @override
  State<GetAllView> createState() => _GetAllViewState();
}

class _GetAllViewState extends State<GetAllView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Post>>(
        future: Remote().fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("All Error Occured"),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardView(
                      title: snapshot.data![index].title,
                      description: snapshot.data![index].body,
                    ));
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
