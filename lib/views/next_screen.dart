import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubix_star_project/provider.dart';

import '../main.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late updateScreenProvider update;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    update = Provider.of<updateScreenProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Ubix Star Project"),
      ),
      body: Center(child:
          Consumer<updateScreenProvider>(builder: (context, data, child) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                data.updateText();
              },
              child: ListTile(
                leading: Icon(data.textCheck == true
                    ? Icons.circle_sharp
                    : Icons.circle_outlined),
                title: const Text("Text Widget"),
              ),
            ),
            GestureDetector(
              onTap: () {
                data.updateImage();
              },
              child: ListTile(
                leading: Icon(data.imageCheck == true
                    ? Icons.circle_sharp
                    : Icons.circle_outlined),
                title: const Text("Image Widget"),
              ),
            ),
            GestureDetector(
              onTap: () {
                data.updateButton();
              },
              child: ListTile(
                leading: Icon(data.buttonCheck == true
                    ? Icons.circle_sharp
                    : Icons.circle_outlined),
                title: const Text("Button Widget"),
              ),
            ),
          ],
        );
      })),
    );
  }
}
