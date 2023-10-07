import 'package:flutter/material.dart';

class CompPage extends StatefulWidget {
  CompPage({Key? key}) : super(key: key);

  @override
  State<CompPage> createState() => _CompPageState();
}

class _CompPageState extends State<CompPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Comp page'),);
  }
}