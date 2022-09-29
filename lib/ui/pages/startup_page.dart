import 'dart:convert';

import 'package:flutter/material.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({Key? key}) : super(key: key);

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  @override
  void initState() {
    super.initState();

    getPresetAssets();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void getPresetAssets() async {
    final manifestJson = jsonDecode(
      await DefaultAssetBundle.of(context).loadString('AssetManifest.json'),
    );
  }
}
