import 'package:flutter/material.dart';

class CustomLoading {
  static OverlayEntry? _overlayEntry;

  void show(BuildContext context) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => ColoredBox(color: Colors.black.withOpacity(0.5), child: const Center(child: CircularProgressIndicator())),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void hide() {
    try {
      _overlayEntry?.remove();
    } catch (e) {
      // Ignore errors if overlay was already removed
    } finally {
      _overlayEntry = null;
    }
  }

  // Force hide method to ensure overlay is cleared
  static void forceHide() {
    try {
      _overlayEntry?.remove();
    } catch (e) {
      // Ignore errors if overlay was already removed
    } finally {
      _overlayEntry = null;
    }
  }
}
