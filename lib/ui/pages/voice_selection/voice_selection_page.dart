import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_pad/data/models/voice_line.dart';
import 'package:voice_pad/data/models/voices_category.dart';
import 'package:voice_pad/ui/pages/voice_selection/voice_selection_cubit.dart';
import 'package:voice_pad/ui/widgets/grid_item.dart';
import 'package:voice_pad/utils/page_state.dart';

class VoiceSelectionPage extends StatelessWidget {
  final VoicesCategory category;

  const VoiceSelectionPage({
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VoiceSelectionCubit()..getVoicesForCategory(category),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<VoiceSelectionCubit, PageState<List<VoiceLine>>>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.errorOccurred) {
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
                for (final voice in state.data ?? [])
                  GridItem(
                    title: voice.title.replaceAll('.mp4', ''),
                    onTap: () =>
                        context.read<VoiceSelectionCubit>().playVoiceLine(
                              category: voice.category,
                              file: voice.file,
                            ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
