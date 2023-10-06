import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';
import 'next_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  // static bool textCheck = false;
  // static bool imageCheck = false;
  // static bool buttonCheck = false;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var activeColor = Colors.green;
  TextStyle style = const TextStyle(
      fontWeight: FontWeight.w700, fontSize: 22, color: Colors.black);
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
      body: Center(
        child: Consumer<updateScreenProvider>(builder: (context, data, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.775,
                width: MediaQuery.of(context).size.width * 0.8,
                color: Colors.greenAccent.shade100,
                child: Column(
                  children: [
                    data.imageCheck == false && data.textCheck == false
                        ? Center(
                            child: SizedBox(
                              child: Text("Add at-least widget to save",
                                  style: style),
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              data.textCheck == false
                                  ? const SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          color: Colors.grey.shade200,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("Text", style: style),
                                            ),
                                          )),
                                    ),
                              data.imageCheck == false
                                  ? const SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          color: Colors.grey.shade200,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child:
                                                  Text("Image", style: style),
                                            ),
                                          )),
                                    ),
                            ],
                          ),
                    data.buttonCheck == false
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () {
                              if (data.imageCheck == false &&
                                  data.textCheck == false) {
                              } else {
                                showSavedAlert();
                              }
                            },
                            child: Container(
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black)),
                              child: Center(
                                child: Text("Button", style: style),
                              ),
                            ),
                          )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 10, top: 10),
                child: GestureDetector(
                  onTap: () {
                    //   showSelectWidgetAlert();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const UpdateScreen()));
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)),
                    child: const Center(
                      child: Text("Add Widget"),
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  Future<void> showSelectWidgetAlert() async {
    return showDialog<void>(
      context: context,
      traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.only(top: 15),
          title: const Text("Select Widget"),
          content: SizedBox(
            height: 200,
            child: Center(
                child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      update.textCheck = !update.textCheck;
                    });
                  },
                  child: ListTile(
                    leading: Icon(update.textCheck == true
                        ? Icons.circle_sharp
                        : Icons.circle_outlined),
                    title: const Text("Text Widget"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      update.imageCheck = !update.imageCheck;
                    });
                  },
                  child: ListTile(
                    leading: Icon(update.imageCheck == true
                        ? Icons.circle_sharp
                        : Icons.circle_outlined),
                    title: const Text("Image Widget"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      update.buttonCheck = !update.buttonCheck;
                    });
                  },
                  child: ListTile(
                    leading: Icon(update.buttonCheck == true
                        ? Icons.circle_sharp
                        : Icons.circle_outlined),
                    title: const Text("Button Widget"),
                  ),
                ),
              ],
            )),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                "Sure",
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showSavedAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.only(top: 15),
          title: const Text("Widget Saved"),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Ok",
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
