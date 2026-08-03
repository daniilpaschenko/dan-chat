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

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatefulWidget {
  const _RegisterView();

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    context.read<AuthBloc>().add(
          AuthEvent.registerRequested(
            email: _emailController.text.trim(),
            password: _passwordController.text,
            username: _usernameController.text.trim(),
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
            controller: _usernameController,
            validator: Validators.username,
            decoration: const InputDecoration(hintText: 'Имя пользователя'),
          ),
          SizedBox(height: spacing.small),
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
          AuthSubmitButton(label: 'Зарегистрироваться', onPressed: _submit),
          SizedBox(height: spacing.small),
          TextButton(
            onPressed: () => context.go(RoutePaths.login),
            child: const Text(
              'Уже есть аккаунт? Войти',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}