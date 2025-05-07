import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'HeartController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Get.put(HeartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Heart Toggle"),
      ),
      body: Center(
        child: Obx(
          () => IconButton(
            iconSize: 100,
            icon: Icon(
              controller.isFavorite.value
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: controller.isFavorite.value ? Colors.red : Colors.grey,
            ),
            onPressed: controller.toggleFavorite,
          ),
        ),
      ),
    );
  }
}
