import 'package:api_complete/service/remote.dart';
import 'package:api_complete/widgets/card.dart';
import 'package:flutter/material.dart';

import '../models/post.model.dart';

class GetByIdView extends StatefulWidget {
  const GetByIdView({super.key});

  @override
  State<GetByIdView> createState() => _GetByIdViewState();
}

class _GetByIdViewState extends State<GetByIdView> {
  final TextEditingController _controller = TextEditingController();
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
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: "Enter Id"),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _futurePost =
                    Remote().fetchOnePost(int.parse(_controller.text));
              });
            },
            child: const Text("Fetch Post"))
      ],
    );
  }

  FutureBuilder<Post> buildFutureBuilder() {
    return FutureBuilder(
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
