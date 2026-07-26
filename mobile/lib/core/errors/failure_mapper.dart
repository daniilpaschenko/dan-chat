import 'failures.dart';

// единая точка перевода Failure в текст для UI. каждый bloc может взять дефолтный текст 
// либо переопределить конкретный кейс через параметр override, если нужна другая формулировка
String defaultFailureMessage(Failure failure) {
  return failure.when(
    invalidCredentials: () => 'Неверный email или пароль',
    emailAlreadyInUse: () => 'Пользователь с таким email уже существует',
    validation: (message) => message,
    network: () => 'Проверьте подключение к интернету',
    sessionExpired: () => 'Сессия истекла, войдите заново',
    unexpected: (message) => 'Что-то пошло не так, попробуйте позже',
  );
}