import 'package:flutter/material.dart';

class ListLoadingItem extends StatelessWidget {
  const ListLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
