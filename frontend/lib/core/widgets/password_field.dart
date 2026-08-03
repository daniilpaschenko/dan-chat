import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// TextFormField для пароля с переключателем видимости
class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hintText;

  const PasswordField({
    super.key,
    required this.controller,
    required this.validator,
    this.hintText = 'Пароль',
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !_isVisible,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              _isVisible ? Icons.visibility : Icons.visibility_off,
              key: ValueKey(_isVisible),
              color: AppColors.textSecondary,
            ),
          ),
          onPressed: () => setState(() => _isVisible = !_isVisible),
        ),
      ),
    );
  }
}