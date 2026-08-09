import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/small_loader.dart';

class MessageInput extends StatefulWidget {
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
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSend() {
    widget.onSend();
    // возвращаем фокус после отправки
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusNode.requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // не защищаем верх, потому что там appbar
      top: false,
      child: Padding(
        padding: EdgeInsets.all(widget.gap * 0.5),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: widget.controller,
                focusNode: _focusNode,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(300),
                ],
                onSubmitted: (_) => _handleSend(),
                onChanged: widget.onChanged,
                // enter = отправить (прописываем явно)
                textInputAction: TextInputAction.send, 
                decoration: InputDecoration(
                  hintText: 'Сообщение',
                  filled: true,
                  fillColor: AppColors.surface,
                  contentPadding: EdgeInsets.symmetric(horizontal: widget.gap, vertical: widget.gap * 0.4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.spacing.inputRadius),
                  ),
                ),
              ),
            ),
            SizedBox(width: widget.gap * 0.3),
            IconButton(
              onPressed: widget.isSending ? null : _handleSend,
              // если идет отправка, показываем лоадер вместо иконки отправки
              icon: widget.isSending
                  ? SmallLoader(size: widget.spacing.loaderSize)
                  // иначе саму иконку отправки
                  : const Icon(Icons.send, color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}