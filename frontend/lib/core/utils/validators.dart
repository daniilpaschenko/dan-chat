// валидаторы форм
class Validators {
  Validators._();

  static final _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return 'Введите email';
    if (!_emailRegex.hasMatch(value.trim())) return 'Некорректный email';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Введите пароль';
    if (value.length < 8) return 'Минимум 8 символов';
    if (value.length > 24) return 'Максимум 24 символа';
    return null;
  }

  static String? username(String? value) {
    if (value == null || value.trim().isEmpty) return 'Введите имя пользователя';
    if (value.trim().length < 3) return 'Минимум 3 символа';
    if (value.trim().length > 16) return 'Максимум 16 символов';
    return null;
  }
}