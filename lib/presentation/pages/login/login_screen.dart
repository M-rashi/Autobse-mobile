import 'package:autobse/domain/providers/login_provider/login_auth_provider.dart';
import 'package:autobse/domain/providers/signin_provider/sigin_auth_provider.dart';
import 'package:autobse/presentation/PAGES/SIGN%20UP/signin_screen.dart';
import 'package:autobse/UTILS/widgets/custom_text_field.dart';
import 'package:autobse/UTILS/widgets/custome_appbar.dart';
import 'package:autobse/routes.dart';
// Import AuthAPI
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  Future<void> _signIn(BuildContext context, WidgetRef ref) async {
    final username = ref.read(usernameProvider);
    final password = ref.read(passwordProvider);

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    //   try {
    //     final result = await AuthAPI.login(username, password);

    //     final firstName = result['login']['user']['firstName'];
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('Welcome back, $firstName!')),
    //     );

    //     // Perform navigation or state updates as needed
    //     print("Login successful! Token: ${result['login']['access_token']}");
    //   } catch (e) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('Login failed: $e')),
    //     );
    //   }
    // }

    try {
      final result = await AuthAPI.login(username, password);

      final firstName = result['login']['user']['firstName'];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Welcome back, $firstName!')),
      );

      // Navigate to the home page using named routes
      Navigator.pushReplacementNamed(context, AppRoutes.home);

      print("Login successful! Token: ${result['login']['access_token']}");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameError = ref.watch(usernameErrorProvider);
    final passwordError = ref.watch(passwordErrorProvider);

    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.lock,
                  size: 100,
                  color: Colors.blue,
                ),
                const SizedBox(height: 50),
                Text(
                  'Welcome back, you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  label: 'Username',
                  onChanged: (value) =>
                      ref.read(usernameProvider.notifier).state = value,
                  errorText: usernameError,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: 'Password',
                  onChanged: (value) =>
                      ref.read(passwordProvider.notifier).state = value,
                  errorText: passwordError,
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () => _signIn(context, ref), // Call _signIn on tap
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateAccountPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
