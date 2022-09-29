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
    return Container();
  }

  void getPresetAssets() async {
    final manifestJson = jsonDecode(
      await DefaultAssetBundle.of(context).loadString('AssetManifest.json'),
    );
    final categories = manifestJson.keys
        .where((String key) => key.startsWith('assets/voices'));
    final List<String> voiceLines = List<String>.empty(growable: true);
    for (final category in categories) {
      voiceLines.addAll(manifestJson.keys.where((String key) =>
          key.startsWith('assets/voices/${Uri.encodeComponent(category)}')));
    }
    print(voiceLines);
  }
}
