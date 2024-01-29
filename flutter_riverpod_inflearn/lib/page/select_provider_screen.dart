import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_inflearn/component/default_layout.dart';
import 'package:flutter_riverpod_inflearn/riverpods/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(selectProvider);
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
    ref.listen(selectProvider.select((value) => value.hasBought), (previous, next)
    {
      print('next: $next');
    });

    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(state.toString()),
          // Text(state.name),
          // Text(state.isSpicy.toString()),
          // Text(state.hasBought.toString()),
          ElevatedButton(
            onPressed: () {
              ref.read(selectProvider.notifier).toggleIsSpicy();
            },
            child: Text('Spicy Toggle'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(selectProvider.notifier).toggleHasBought();
            },
            child: Text('Bought Toggle'),
          ),
        ],
      ),
    );
  }
}
