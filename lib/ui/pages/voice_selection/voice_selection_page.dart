import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_pad/data/models/voice_line.dart';
import 'package:voice_pad/data/models/voices_category.dart';
import 'package:voice_pad/ui/pages/voice_selection/voice_selection_cubit.dart';
import 'package:voice_pad/ui/widgets/grid_item.dart';
import 'package:voice_pad/utils/extensions/capitalize.dart';
import 'package:voice_pad/utils/page_state.dart';

class VoiceSelectionPage extends StatefulWidget {
  final VoicesCategory category;

  const VoiceSelectionPage({
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  State<VoiceSelectionPage> createState() => _VoiceSelectionPageState();
}

class _VoiceSelectionPageState extends State<VoiceSelectionPage> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VoiceSelectionCubit()..getVoicesForCategory(widget.category),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<VoiceSelectionCubit, PageState<List<VoiceLine>>>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.fatalErrorOccurred) {
              return const Center(
                child: Text('Oops!'),
              );
            }
            return GridView.count(
              crossAxisCount: MediaQuery.of(context).size.width > 500 ? 5 : 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(10),
              children: [
                for (final VoiceLine voice in state.data ?? [])
                  GridItem(
                    title: voice.title.replaceAll(RegExp(r'\.mp4|\.mp3'), '')
                        .replaceAll('_', ' ')
                        .capitalize(),
                    onTap: () {
                      setState(() {
                        isPlaying = true;
                      });
                      Audio.load('assets/voices/${voice.category}/${voice.file}')
                        ..play()
                        ..dispose().then(
                          (value) => setState(
                            () {
                              isPlaying = false;
                            },
                          ),
                        );
                    },
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
