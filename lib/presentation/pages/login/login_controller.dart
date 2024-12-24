// import 'package:autobse/domain/providers/login_provider/login_auth_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// class LoginController {
//   final TextEditingController mobileController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool isLoading = false;

//   void performLogin(BuildContext context) async {
//     final mobile = mobileController.text.trim();
//     final password = passwordController.text;

//     if (mobile.isEmpty || mobile.length < 10) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please enter a valid mobile number')),
//       );
//       return;
//     }

//     isLoading = true;
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Logging in...')),
//     );

//     try {
//       final result = await AuthRepository(mobile, password);
//       if (result['data'] != null) {
//         final firstName = result['data']['login']['user'];
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Login Successful! Welcome, $firstName.')),
//         );
//         // TODO: Handle navigation and token storage
//       } else {
//         throw Exception("Invalid login response");
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Login Failed: $e')),
//       );
//     } finally {
//       isLoading = false;
//     }
//   }
// }
