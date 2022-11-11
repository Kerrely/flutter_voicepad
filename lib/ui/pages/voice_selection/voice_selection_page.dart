import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_pad/data/models/voices_category.dart';
import 'package:voice_pad/ui/bloc/full_text_search/full_text_search_cubit.dart';
import 'package:voice_pad/ui/pages/voice_selection/voice_selection_cubit.dart';
import 'package:voice_pad/ui/widgets/grid_item.dart';

class VoiceSelectionPage extends StatelessWidget {
  final VoicesCategory category;

  const VoiceSelectionPage({
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchFocusNode = FocusNode();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              VoiceSelectionCubit()..getVoicesForCategory(category),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => FullTextSearchCubit(),
        ),
      ],
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: BlocBuilder<FullTextSearchCubit, FullTextSearchState>(
            buildWhen: (previous, next) =>
                previous.isSearchEnabled != next.isSearchEnabled,
            builder: (BuildContext context, state) {
              return AppBar(
                title: state.isSearchEnabled
                    ? Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: TextField(
                          focusNode: searchFocusNode,
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          onChanged: (value) => context
                              .read<FullTextSearchCubit>()
                              .searchFor(value),
                          onSubmitted: (value) => context
                              .read<FullTextSearchCubit>()
                              .searchFor(value),
                        ),
                      )
                    : Text(category.title),
                leading: IconButton(
                  onPressed: state.isSearchEnabled
                      ? () => context.read<FullTextSearchCubit>().toggleSearch()
                      : () => Navigator.of(context).pop(),
                  icon: Icon(
                    state.isSearchEnabled ? Icons.close : Icons.arrow_back,
                  ),
                ),
                actions: [
                  if (!state.isSearchEnabled)
                    IconButton(
                      onPressed: () {
                        context.read<FullTextSearchCubit>().toggleSearch();
                        searchFocusNode.requestFocus();
                      },
                      icon: const Icon(Icons.search_rounded),
                    )
                ],
              );
            },
          ),
        ),
        body: BlocBuilder<FullTextSearchCubit, FullTextSearchState>(
          builder: (context, searchState) {
            return BlocBuilder<VoiceSelectionCubit, VoiceSelectionState>(
              builder: (context, voiceSelectionState) {
                if (voiceSelectionState.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (voiceSelectionState.errorOccurred) {
                  return const Center(
                    child: Text('Oops!'),
                  );
                }
                return GridView.count(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 500 ? 5 : 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: const EdgeInsets.all(10),
                  children: [
                    for (final voice in voiceSelectionState
                            .filterDataBySearch(searchState.searchValue) ??
                        [])
                      GridItem(
                        title: voice.title.replaceAll('.mp4', ''),
                        isEnabled: !voiceSelectionState.isPlaying,
                        onTap: () =>
                            context.read<VoiceSelectionCubit>().playVoiceLine(
                                  category: voice.category,
                                  file: voice.file,
                                ),
                      )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
