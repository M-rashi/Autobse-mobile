import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProfileProvider = StateProvider<Map<String, String>>((ref) {
  return {
    'name': 'shibu',
    'email': 'shibu@gmail.com',
    'profileImage': 'assets/images/profile.jpg',
  };
});
