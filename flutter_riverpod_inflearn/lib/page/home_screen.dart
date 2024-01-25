import 'package:flutter/material.dart';
import 'package:flutter_riverpod_inflearn/component/default_layout.dart';
import 'package:flutter_riverpod_inflearn/page/state_provider_screen.dart';

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
            child: Text('State Provider Screen'),
          ),
        ],
      ),
    );
  }
}
