import 'package:api_complete/service/remote.dart';
import 'package:api_complete/widgets/button.dart';
import 'package:api_complete/widgets/card.dart';
import 'package:flutter/material.dart';

import '../models/post.model.dart';

class UpdateView extends StatefulWidget {
  const UpdateView({super.key});

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  Future<Post>? _futurePost;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        child: _futurePost == null ? buildColumn() : buildView(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _idController,
          decoration:
              const InputDecoration(hintText: "Enter the id to be update"),
        ),
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(hintText: "Enter the title"),
        ),
        TextField(
          controller: _bodyController,
          decoration: const InputDecoration(hintText: "Enter the body"),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _futurePost = Remote().updatePost(_titleController.text,
                    _bodyController.text, int.parse(_idController.text));
              });
            },
            child: const Text("Fetch Post"))
      ],
    );
  }

  FutureBuilder<Post> buildView() {
    return FutureBuilder(
      future: _futurePost,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "The Updated Data",
                style: TextStyle(fontSize: 24),
              ),
              CardView(
                title: snapshot.data!.title,
                description: snapshot.data!.body,
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
