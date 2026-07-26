import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/password_field.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_event.dart';
import '../widgets/auth_form_scaffold.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_submit_button.dart';

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

  @override
  Widget build(BuildContext context) {
    final spacing = AppSpacing.of(context);

    return AuthFormScaffold(
      formKey: _formKey,
      horizontalPadding: spacing.form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthHeader(spacing: spacing),
          SizedBox(height: spacing.medium),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: Validators.email,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          SizedBox(height: spacing.small),
          PasswordField(
            controller: _passwordController,
            validator: Validators.password,
          ),
          SizedBox(height: spacing.form),
          AuthSubmitButton(label: 'Войти', onPressed: _submit),
          SizedBox(height: spacing.small),
          TextButton(
            onPressed: () => context.go(RoutePaths.register),
            child: const Text(
              'Нет аккаунта? Зарегистрироваться',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}