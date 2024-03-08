import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isEnabled;

  const GridItem({
    required this.title,
    required this.onTap,
    this.isEnabled = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.blueAccent),
      ),
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: AutoSizeText(
                title,
                presetFontSizes: const [21, 18, 15, 12],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xff003675),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
