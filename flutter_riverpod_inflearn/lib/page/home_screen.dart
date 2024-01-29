import 'package:flutter/material.dart';
import 'package:flutter_riverpod_inflearn/component/default_layout.dart';
import 'package:flutter_riverpod_inflearn/page/family_modifier_screen.dart';
import 'package:flutter_riverpod_inflearn/page/future_provider_screen.dart';
import 'package:flutter_riverpod_inflearn/page/provider_screen.dart';
import 'package:flutter_riverpod_inflearn/page/select_provider_screen.dart';
import 'package:flutter_riverpod_inflearn/page/state_notifier_screen.dart';
import 'package:flutter_riverpod_inflearn/page/state_provider_screen.dart';
import 'package:flutter_riverpod_inflearn/page/stream_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Home Screen',
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => StateProviderScreen())
              );
            },
            child: const Text('State Provider Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => StateNotifierScreen())
              );
            },
            child: const Text('State Notifier Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => FutureProviderScreen())
              );
            },
            child: const Text('Future Provider Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => StreamProviderScreen())
              );
            },
            child: const Text('Stream Provider Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => FamilyModifierScreen())
              );
            },
            child: const Text('Family Modifier Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => SelectProviderScreen())
              );
            },
            child: const Text('Selector Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => ProviderScreen())
              );
            },
            child: const Text('Provider Screen'),
          ),
        ],
      ),
    );
  }
}
