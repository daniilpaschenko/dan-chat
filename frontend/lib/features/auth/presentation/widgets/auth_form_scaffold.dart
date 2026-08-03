import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/navigation/route_paths.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_state.dart';

// общий каркас для login/register экранов:
// BlocListener(success -> go(chatList), failure -> snackbar) + Scaffold + SafeArea + ScrollView + ConstrainedBox(400) + Form
class AuthFormScaffold extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final double horizontalPadding;
  final Widget child;

  const AuthFormScaffold({
    super.key,
    required this.formKey,
    required this.horizontalPadding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (_) => context.go(RoutePaths.chatList),
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
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [child],
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