import 'package:api_complete/service/remote.dart';
import 'package:api_complete/widgets/card.dart';
import 'package:flutter/material.dart';

import '../models/post.model.dart';

class CreateView extends StatefulWidget {
  const CreateView({super.key});

  @override
  State<CreateView> createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  Future<Post>? _futurePost;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: (_futurePost == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        TextField(
          controller: _bodyController,
          decoration: const InputDecoration(hintText: 'Enter Description'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futurePost = Remote()
                  .createPost(_titleController.text, _bodyController.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Post> buildFutureBuilder() {
    return FutureBuilder<Post>(
      future: _futurePost,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: CardView(
              title: snapshot.data!.title,
              description: snapshot.data!.body,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
