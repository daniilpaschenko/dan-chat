import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/small_loader.dart';

// stateless потому что состояние текста хранится не здесь, а в контроллере
class MessageInput extends StatelessWidget {
  // вот в этом контроллере
  final TextEditingController controller;
  final bool isSending;
  final VoidCallback onSend;
  final ValueChanged<String>? onChanged;
  final double gap;
  final AppSpacing spacing;

  const MessageInput({
    super.key,
    required this.controller,
    required this.isSending,
    required this.onSend,
    this.onChanged,
    required this.gap,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // не защищаем верх, потому что там appbar
      top: false,
      child: Padding(
        padding: EdgeInsets.all(gap * 0.5),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                inputFormatters: [
                    // лимит на длину в названии группы
                    LengthLimitingTextInputFormatter(300),
                  ],
                onSubmitted: (_) => onSend(),
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: 'Сообщение',
                  filled: true,
                  fillColor: AppColors.surface,
                  contentPadding: EdgeInsets.symmetric(horizontal: gap, vertical: gap * 0.4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(spacing.inputRadius),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: gap * 0.3),
            IconButton(
              onPressed: isSending ? null : onSend,
              // если идет отправка, показываем лоадер вместо иконки отправки
              icon: isSending
                  ? SmallLoader(size: spacing.loaderSize)
                  // иначе саму иконку отправки
                  : const Icon(Icons.send, color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}