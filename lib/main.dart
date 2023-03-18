import 'package:api_complete/views/create.dart';
import 'package:api_complete/views/get_all.dart';
import 'package:api_complete/views/get_by_id.dart';
import 'package:api_complete/views/home.dart';
import 'package:api_complete/views/update.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter and REST API',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
        '/get_id': (context) => const GetByIdView(),
        '/get_all': (context) => const GetAllView(),
        '/create': (context) => const CreateView(),
        '/update': (context) => const UpdateView(),
      },
      theme: ThemeData.dark(),
    );
  }
}
