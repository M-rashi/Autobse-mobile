import 'package:flutter_riverpod/flutter_riverpod.dart';

// Form field state providers
final usernameProvider = StateProvider<String>((ref) => '');
final emailProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');

// Error message providers
final usernameErrorProvider = StateProvider<String?>((ref) => null);
final emailErrorProvider = StateProvider<String?>((ref) => null);
final passwordErrorProvider = StateProvider<String?>((ref) => null);
