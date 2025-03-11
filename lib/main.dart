import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_exp/main_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: MyTranslations(),
        locale: const Locale('pt', 'BR'),
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          colorSchemeSeed: Colors.blue,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorSchemeSeed: Colors.blue,
        ),
        themeMode: ThemeMode.light,
        home: const HomePage());
  }
}

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'title': 'Hello World %s',
          'test': 'tested',
        },
        'en_US': {
          'title': 'Hello World from US',
          'test': 'helo',
        },
        'pt': {
          'title': 'Olá de Portugal',
          'test': 'hi',
        },
        'pt_BR': {
          'title': 'Olá do Brasil',
          'test': 'huy',
        },
      };
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MainController productController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("counter")),
        body: Column(
          children: [
            Center(
              child: TextField(
                controller: productController.controller,
              ),
            ),
            Center(
              child: Text("test".trArgs(['John'])),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Get.updateLocale(Locale('en', 'UK')),
        ));
  }
}
