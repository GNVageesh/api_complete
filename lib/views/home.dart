import 'package:api_complete/widgets/button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FlutterLogo(
                    size: 100,
                  ),
                  const Icon(Icons.add, size: 45),
                  Icon(
                    Icons.miscellaneous_services_outlined,
                    size: 100,
                    color: Colors.teal.shade400,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            AppButton(
                opr: "GET",
                desc: "Fetch All Posts",
                color: Colors.green,
                callback: () {
                  Navigator.of(context).pushNamed("/get_all");
                }),
            AppButton(
                opr: "GET ID",
                desc: "Fetch A Post By ID",
                color: Colors.teal.shade800,
                callback: () {
                  Navigator.of(context).pushNamed("/get_id");
                }),
            AppButton(
                opr: "POST",
                desc: "Create New Post",
                color: Colors.blue,
                callback: () {
                  Navigator.of(context).pushNamed("/create");
                }),
            AppButton(
                opr: "PUT",
                desc: "Update A Post",
                color: Colors.amber.shade700,
                callback: () {
                  Navigator.of(context).pushNamed("/update");
                }),
            AppButton(
                opr: "DELETE",
                desc: "Remove A Post",
                color: Colors.red,
                callback: () {
                  Navigator.of(context).pushNamed("/create");
                }),
          ],
        ),
      ),
    );
  }
}
