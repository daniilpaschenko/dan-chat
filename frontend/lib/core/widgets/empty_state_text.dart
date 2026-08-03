import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// серый текст по центру для пустых состояний ("Ничего не найдено" и т.п.)
// если передать fillHeight, растянется на всю доступную высоту родителя
class EmptyStateText extends StatelessWidget {
  final String message;
  final bool fillHeight;

  const EmptyStateText({super.key, required this.message, this.fillHeight = false});

  @override
  Widget build(BuildContext context) {
    final text = Text(message, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.textSecondary));

    if (!fillHeight) return Center(child: text);

    return LayoutBuilder(
      builder: (context, constraints) => ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: constraints.maxHeight,
            child: Center(child: text),
          ),
        ],
      ),
    );
  }
}