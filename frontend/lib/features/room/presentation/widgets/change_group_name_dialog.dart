import 'package:flutter/material.dart';

class ChangeGroupNameDialog extends StatefulWidget {
  final String? currentName;

  const ChangeGroupNameDialog({required this.currentName});

  @override
  State<ChangeGroupNameDialog> createState() => ChangeGroupNameDialogState();
}

class ChangeGroupNameDialogState extends State<ChangeGroupNameDialog> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.currentName ?? '');

  bool _isValid(String value) => value.trim().length >= 3 && value.trim().length <= 24;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = _controller.text;
    final valid = _isValid(value);
    final showError = value.isNotEmpty && !valid;

    return AlertDialog(
      title: const Text('Изменить название группы'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        maxLength: 24,
        decoration: InputDecoration(
          hintText: 'Новое название группы',
          errorText: showError ? 'От 3 до 24 символов' : null,
        ),
        onChanged: (_) => setState(() {}),
        onSubmitted: (v) => _isValid(v) ? Navigator.of(context).pop(v) : null,
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