import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubix_star_project/views/home.dart';
import 'package:ubix_star_project/views/next_screen.dart';
import 'package:ubix_star_project/provider.dart';
import 'package:ubix_star_project/widgets/alert_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => updateScreenProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
