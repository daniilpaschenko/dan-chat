import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/theme/app_colors.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_event.dart';
import '../blocs/auth_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // bloc создаём через BlocProvider, а не через getIt<AuthBloc>()
    // живёт ровно столько, сколько живёт экран, и корректно закрывается через dispose при уходе с него
    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    // если форма невалидна — просто выходим, ошибки уже подсветились
    if (!_formKey.currentState!.validate()) return;

    context.read<AuthBloc>().add(
          AuthEvent.loginRequested(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          ),
        );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Введите email';
    // простая проверка формата
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value.trim())) return 'Некорректный email';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Введите пароль';
    if (value.length < 8) return 'Минимум 8 символов';
    if (value.length > 24) return 'Максимум 24 символа';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.of(context).size.width.clamp(0.0, 600.0);
    final double titleSize = screenW * 0.05;
    final double smallGap = screenW * 0.03;
    final double mediumGap = screenW * 0.08;
    final double formGap = screenW * 0.06;

    // BlocListener — для эффектов, которые не должны срабатывать повторно при rebuild виджета
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (_) {
            // AuthStateNotifier уже обновлён внутри bloc — GoRouter redirect
            // явный и мгновенный context.go()
            context.go(RoutePaths.chatList);
          },
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: formGap),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(Icons.chat_bubble_rounded, size: titleSize * 2.2, color: AppColors.primary),
                      SizedBox(height: smallGap),
                      Text(
                        'DAN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: titleSize,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: mediumGap),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: _validateEmail,
                        decoration: const InputDecoration(hintText: 'Email'),
                      ),
                      SizedBox(height: smallGap),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        validator: _validatePassword,
                        decoration: InputDecoration(
                          hintText: 'Пароль',
                          suffixIcon: IconButton(
                            icon: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: Icon(
                                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                key: ValueKey(_isPasswordVisible),
                                color: AppColors.textSecondary,
                              ),
                            ),
                            onPressed: () {setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          )
                        ),
                      ),
                      SizedBox(height: formGap),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          final isLoading = state is AuthLoading;
                          return ElevatedButton(
                            // пока идёт запрос — кнопка задизейблена, чтобы нельзя было наспамить сабмитами
                            onPressed: isLoading ? null : _submit,
                            child: isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  )
                                : const Text('Войти'),
                          );
                        },
                      ),
                      SizedBox(height: smallGap),
                      TextButton(
                        onPressed: () => context.go(RoutePaths.register),
                        child: const Text(
                          'Нет аккаунта? Зарегистрироваться',
                          style: TextStyle(color: AppColors.textSecondary),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}