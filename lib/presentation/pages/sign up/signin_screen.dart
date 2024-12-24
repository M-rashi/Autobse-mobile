// import 'package:autobse/DOMAIN/PROVIDERS/SIGNINPROVIDER/auth_providers.dart';
// import 'package:autobse/PRESENTATION/PAGES/SIGN%20UP/signin_controller.dart';
// import 'package:autobse/UTILS/widgets/custome_appbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class CreateAccountPage extends ConsumerWidget {
//   const CreateAccountPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final username = ref.watch(usernameProvider);
//     final email = ref.watch(emailProvider);
//     final password = ref.watch(passwordProvider);
//     final usernameError = ref.watch(usernameErrorProvider);
//     final emailError = ref.watch(emailErrorProvider);
//     final passwordError = ref.watch(passwordErrorProvider);

//     void createAccount() {
//       CreateAccountController(ref).createAccount(context);
//     }

//     return Scaffold(
//       appBar: CustomAppBar(),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 50),
//                 const Icon(Icons.lock, size: 100, color: Colors.blue),
//                 const SizedBox(height: 50),
//                 Text(
//                   'Create a new account!',
//                   style: TextStyle(color: Colors.grey[700], fontSize: 16),
//                 ),
//                 const SizedBox(height: 25),
//                 // Username
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextField(
//                         onChanged: (value) =>
//                             ref.read(usernameProvider.notifier).state = value,
//                         decoration: InputDecoration(
//                           hintText: 'Username',
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       if (usernameError != null)
//                         Padding(
//                           padding: const EdgeInsets.only(top: 5.0),
//                           child: Text(
//                             usernameError,
//                             style: const TextStyle(
//                                 color: Colors.red, fontSize: 12),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 // Email
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextField(
//                         onChanged: (value) =>
//                             ref.read(emailProvider.notifier).state = value,
//                         decoration: InputDecoration(
//                           hintText: 'Email',
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       if (emailError != null)
//                         Padding(
//                           padding: const EdgeInsets.only(top: 5.0),
//                           child: Text(
//                             emailError,
//                             style: const TextStyle(
//                                 color: Colors.red, fontSize: 12),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 // Password
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextField(
//                         obscureText: true,
//                         onChanged: (value) =>
//                             ref.read(passwordProvider.notifier).state = value,
//                         decoration: InputDecoration(
//                           hintText: 'Password',
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       if (passwordError != null)
//                         Padding(
//                           padding: const EdgeInsets.only(top: 5.0),
//                           child: Text(
//                             passwordError,
//                             style: const TextStyle(
//                                 color: Colors.red, fontSize: 12),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 25),
//                 GestureDetector(
//                   onTap: createAccount,
//                   child: Container(
//                     padding: const EdgeInsets.all(15),
//                     margin: const EdgeInsets.symmetric(horizontal: 25),
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'Create Account',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:autobse/domain/providers/signin_provider/sigin_auth_provider.dart';
import 'package:autobse/presentation/PAGES/LOGIN/login_screen.dart';
import 'package:autobse/presentation/PAGES/SIGN%20UP/signin_controller.dart';
import 'package:autobse/UTILS/widgets/custome_appbar.dart';
import 'package:autobse/UTILS/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAccountPage extends ConsumerWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameError = ref.watch(usernameErrorProvider);
    final emailError = ref.watch(emailErrorProvider);
    final passwordError = ref.watch(passwordErrorProvider);

    void createAccount() {
      CreateAccountController(ref).createAccount(context);
    }

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
                const Icon(Icons.lock, size: 100, color: Colors.blue),
                const SizedBox(height: 50),
                Text(
                  'Create a new account!',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                const SizedBox(height: 25),
                // Username Field
                CustomTextField(
                  label: 'Username',
                  onChanged: (value) =>
                      ref.read(usernameProvider.notifier).state = value,
                  errorText: usernameError,
                ),
                const SizedBox(height: 10),
                // Email Field
                CustomTextField(
                  label: 'Email',
                  onChanged: (value) =>
                      ref.read(emailProvider.notifier).state = value,
                  errorText: emailError,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                // Password Field
                CustomTextField(
                  label: 'Password',
                  onChanged: (value) =>
                      ref.read(passwordProvider.notifier).state = value,
                  errorText: passwordError,
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: createAccount,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Create Account',
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
                      'Already a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Login',
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
