import 'package:flutter/material.dart';

/// Comments section
class CommentSection extends StatefulWidget {
  /// Comments section
  const CommentSection({super.key});

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  double height = 100;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          height = 300;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        height: height,
        color: Colors.amber,
      ),
    );
  }
}
