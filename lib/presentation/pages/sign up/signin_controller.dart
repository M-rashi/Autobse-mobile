import 'package:autobse/domain/providers/signin_provider/sigin_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAccountController {
  final WidgetRef ref;

  CreateAccountController(this.ref);

  void createAccount(BuildContext context) {
    final username = ref.read(usernameProvider);
    final email = ref.read(emailProvider);
    final password = ref.read(passwordProvider);

    bool isValid = true;

    if (username.isEmpty) {
      ref.read(usernameErrorProvider.notifier).state =
          'Username cannot be empty';
      isValid = false;
    } else {
      ref.read(usernameErrorProvider.notifier).state = null;
    }

    if (email.isEmpty) {
      ref.read(emailErrorProvider.notifier).state = 'Email cannot be empty';
      isValid = false;
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      ref.read(emailErrorProvider.notifier).state =
          'Enter a valid email address';
      isValid = false;
    } else {
      ref.read(emailErrorProvider.notifier).state = null;
    }

    if (password.isEmpty) {
      ref.read(passwordErrorProvider.notifier).state =
          'Password cannot be empty';
      isValid = false;
    } else if (password.length < 6) {
      ref.read(passwordErrorProvider.notifier).state =
          'Password must be at least 6 characters long';
      isValid = false;
    } else {
      ref.read(passwordErrorProvider.notifier).state = null;
    }

    if (isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully registered!')),
      );
    }
  }
}
