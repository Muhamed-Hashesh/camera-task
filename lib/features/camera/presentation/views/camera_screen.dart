import 'package:camera_task/features/camera/presentation/data/camera_services.dart';
import 'package:camera_task/features/camera/presentation/widgets/bottom_camera_row.dart';
import 'package:camera_task/features/camera/presentation/widgets/camera_display_section.dart';
import 'package:camera_task/features/camera/presentation/widgets/title_section.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final CameraService _cameraService = CameraService();
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      await _cameraService.initializeCamera();
      await _cameraService.loadSavedImages(); // تحميل الصور عند التهيئة
      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _cameraService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1b1b),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _isCameraInitialized
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const TitleSection(),
                    CameraDisplaySection(
                        cameraController: _cameraService.cameraController),
                    BottomCameraRow(
                      onCapturePressed: _capturePhoto,
                      onSwitchCamera: _switchCamera,
                      cameraService: _cameraService,
                    ),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Future<void> _capturePhoto() async {
    try {
      final String imagePath = await _cameraService.capturePhoto();
      debugPrint('Image saved to: $imagePath');
    } catch (e) {
      debugPrint('Error capturing photo: $e');
    }
  }

  Future<void> _switchCamera() async {
    try {
      await _cameraService.switchCamera();
      setState(() {});
    } catch (e) {
      debugPrint('Error switching camera: $e');
    }
  }
}
