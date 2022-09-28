import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const GridItem({
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
