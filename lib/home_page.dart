import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Orgainser'),
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Company'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
