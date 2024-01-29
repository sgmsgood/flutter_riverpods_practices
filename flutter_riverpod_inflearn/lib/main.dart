import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_inflearn/page/home_screen.dart';
import 'package:flutter_riverpod_inflearn/riverpods/provider_observer.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        Logger()
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
