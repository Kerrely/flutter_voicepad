import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:flutter/material.dart';
import 'package:voice_pad/data/data_provider.dart';
import 'package:voice_pad/data/models/category.dart';
import 'package:voice_pad/utils/injector.dart';

void main() {
  initializeInjector();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataProvider dataProvider = injector();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vojs pet'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            for (final category in dataProvider.categories)
              GridCard(
                title: category.title,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => VoicePage(
                        category: category,
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class GridCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const GridCard({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Material(
        color: Colors.blueAccent,
        child: InkWell(
          onTap: onTap,
          child: GridTile(
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VoicePage extends StatelessWidget {
  final Category category;

  const VoicePage({
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataProvider dataProvider = injector();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            for (final voice in dataProvider.voices
                .where((element) => element.category == category.id))
              GridCard(
                  title: voice.title,
                  onTap: () {
                    Audio.load('assets/voices/${voice.file}')
                      ..play()
                      ..dispose();
                  })
          ],
        ),
      ),
    );
  }
}
