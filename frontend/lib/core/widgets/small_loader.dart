import 'package:flutter/material.dart';

// маленький индикатор загрузки
class SmallLoader extends StatelessWidget {
  final double size;

  const SmallLoader({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(strokeWidth: 2),
    );
  }
}