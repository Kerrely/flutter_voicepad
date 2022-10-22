import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_pad/data/models/voices_category.dart';
import 'package:voice_pad/ui/pages/category_selection/category_selection_cubit.dart';
import 'package:voice_pad/ui/pages/voice_selection/voice_selection_page.dart';
import 'package:voice_pad/ui/widgets/grid_item.dart';
import 'package:voice_pad/utils/extensions/build_context.dart';
import 'package:voice_pad/utils/page_state.dart';

class CategorySelectionPage extends StatelessWidget {
  const CategorySelectionPage({super.key});

  static final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategorySelectionCubit()..getCategories(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vojs pet'),
        ),
        body: BlocBuilder<CategorySelectionCubit,
            PageState<List<VoicesCategory>>>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.errorOccurred) {
              return const Center(
                child: Text('Oops!'),
              );
            }

            return ListView(
              controller: _scrollController,
              shrinkWrap: true,
              children: [
                SizedBox(height: 10),
                Text(
                  'PRESETS',
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.headline5,
                ),
                GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  controller: _scrollController,
                  shrinkWrap: true,
                  mainAxisSpacing: 10,
                  padding: const EdgeInsets.all(10),
                  children: [
                    for (final category in state.data
                            ?.where((element) =>
                                element.type == VoicesCategoryType.preset)
                            .toList() ??
                        [])
                      GridItem(
                        title: category.title,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => VoiceSelectionPage(
                                category: category,
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
                // Text(
                //   'CUSTOM',
                //   textAlign: TextAlign.center,
                //   style: context.theme.textTheme.headline5,
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
