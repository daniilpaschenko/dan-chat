import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
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

  // определяем устройство
  bool get _isMobile {
    if (kIsWeb) return false; // на вебе считаем десктопом
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSend() {
    if (widget.isSending) return;
    widget.onSend();
    // возвращаем фокус после отправки
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusNode.requestFocus();
      }
    });
  }

  // обработка клавиш (только для десктопа)
  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (_isMobile) return KeyEventResult.ignored;

    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.enter) {
      // если зажат Shift — разрешаем перенос строки
      final isShiftPressed = HardwareKeyboard.instance.isShiftPressed;

      if (!isShiftPressed) {
        _handleSend();
        return KeyEventResult.handled; // блокируем перенос
      }
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // не защищаем верх, потому что там appbar
      top: false,
      child: Padding(
        padding: EdgeInsets.all(widget.gap * 0.2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end, // кнопка прижата к низу
          children: [
            Expanded(
              child: Focus(
                onKeyEvent: _handleKeyEvent,
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(300),
                  ],
                  onChanged: widget.onChanged,
                  minLines: 1,
                  maxLines: 5,
                  textInputAction: TextInputAction.newline,
                  onSubmitted: (_) {},
                  onEditingComplete: () {},
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Сообщение',
                    filled: true,
                    fillColor: AppColors.surface,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: widget.gap,
                      vertical: widget.gap * 0.4,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.spacing.inputRadius),
                    ),
                  ),
                ),
              ),
            ),
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