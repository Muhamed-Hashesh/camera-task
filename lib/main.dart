import 'package:camera_task/features/camera/presentation/views/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CameraTask());
}

class CameraTask extends StatelessWidget {
  const CameraTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Camera Task',
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.light().textTheme,
        ),
      ),
      home: const CameraScreen(),
    );
  }
}
