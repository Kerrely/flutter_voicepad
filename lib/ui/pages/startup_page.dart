import 'package:flutter/material.dart';
import 'package:voice_pad/data/repositories/preset_voices_repository.dart';
import 'package:voice_pad/ui/pages/category_selection.dart';
import 'package:voice_pad/utils/injector.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({Key? key}) : super(key: key);

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  @override
  void initState() {
    super.initState();
    getPresetAssets().then(
      (_) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const CategorySelectionPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<void> getPresetAssets() async {
    final manifestJson =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final presetRepo = PresetVoicesRepository.fromManifest(manifestJson);
    injector.registerSingleton(presetRepo);
  }
}
