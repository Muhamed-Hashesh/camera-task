import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Selfie',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
