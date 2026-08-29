import 'package:flutter/material.dart';

class ChangeUsernameDialog extends StatefulWidget {
  final String? currentUsername;

  const ChangeUsernameDialog({super.key, required this.currentUsername});

  @override
  State<ChangeUsernameDialog> createState() => ChangeUsernameDialogState();
}

class ChangeUsernameDialogState extends State<ChangeUsernameDialog> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.currentUsername ?? '');

  // только буквы и цифры — как alphanum() на бэке
  final alphanumRegex = RegExp(r'^[a-zA-Z0-9]+$');

  bool isValid(String value) => value.length >= 3 && alphanumRegex.hasMatch(value);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = _controller.text;
    final valid = isValid(value);
    final showError = value.isNotEmpty && !valid;

    return AlertDialog(
      title: const Text('Изменить имя пользователя'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        maxLength: 16,
        decoration: InputDecoration(
          hintText: 'Новое имя пользователя',
            errorText: showError
                ? (value.length < 3
                    ? 'Минимум 3 символа'
                    : 'Только латинские буквы и цифры')
                : null,
        ),
        onChanged: (_) => setState(() {}),
        onSubmitted: (v) => isValid(v) ? Navigator.of(context).pop(v) : null,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Отмена'),
        ),
        TextButton(
          onPressed: valid ? () => Navigator.of(context).pop(_controller.text) : null,
          child: const Text('Сохранить'),
        ),
      ],
    );
  }
}