import 'dart:typed_data';
import 'dart:io';
import 'package:flutter_clean_todo/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum OverlayAnimationType {
  asset,
  file,
  memory,
  network,
}

class LoadingOverlayManager {
  LoadingOverlayManager._();

  static final LoadingOverlayManager _instance = LoadingOverlayManager._();

  factory LoadingOverlayManager() {
    return _instance;
  }

  OverlayEntry? _overlayEntry;

  void show() {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => const LoadingOverlay(),
    );

    rootNavigatorKey.currentState?.overlay?.insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  //animation loading....

  void showAssetLoadingAnimation({String url = 'assets/animation/animation_ball_fill.json'}) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => AssetLoadingOverlay(url: url),
    );

    rootNavigatorKey.currentState?.overlay?.insert(_overlayEntry!);
  }

  void showFileLoadingAnimation({required File file}) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => FileLoadingOverlay(file: file),
    );

    rootNavigatorKey.currentState?.overlay?.insert(_overlayEntry!);
  }

  void showMemoryLoadingAnimation({required Uint8List bytes}) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => MemoryLoadingOverlay(bytes: bytes),
    );

    rootNavigatorKey.currentState?.overlay?.insert(_overlayEntry!);
  }

  void showNetworkLoadingAnimation({required String url}) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => NetworkLoadingOverlay(url: url),
    );

    rootNavigatorKey.currentState?.overlay?.insert(_overlayEntry!);
  }
}

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Opacity(
          opacity: 0.54,
          //Colors.black54
          //opacity: 0.7,
          //     opacityColor: Colors.black,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
        Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ],
    );
  }
}

class AssetLoadingOverlay extends StatelessWidget {
  final String url;

  const AssetLoadingOverlay({
    super.key,
    this.url = 'assets/animation/animation_ball_fill.json',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Opacity(
          opacity: 0.40,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
        Center(
          child: Lottie.asset(
            url,
            width: 80,
            height: 80,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

class FileLoadingOverlay extends StatelessWidget {
  final File file;

  const FileLoadingOverlay({
    super.key,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Opacity(
          opacity: 0.40,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
        Center(
          child: Lottie.file(
            file,
            width: 80,
            height: 80,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

class NetworkLoadingOverlay extends StatelessWidget {
  final String url;

  const NetworkLoadingOverlay({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Opacity(
          opacity: 0.40,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
        Center(
          child: Lottie.network(
            url,
            width: 80,
            height: 80,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

class MemoryLoadingOverlay extends StatelessWidget {
  final Uint8List bytes;

  const MemoryLoadingOverlay({
    super.key,
    required this.bytes,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Opacity(
          opacity: 0.40,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
        Center(
          child: Lottie.memory(
            bytes,
            width: 80,
            height: 80,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
