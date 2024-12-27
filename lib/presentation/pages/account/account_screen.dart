// import 'package:autobse/domain/providers/account_provider/account_provider.dart';
// import 'package:autobse/utils/widgets/custom_bottom_nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AccountPage extends ConsumerWidget {
//   const AccountPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final userProfile = ref.watch(userProfileProvider);

//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // Profile Picture
//                     Container(
//                       width: 150,
//                       height: 150,
//                       child: const Icon(
//                         Icons.account_circle,
//                         size: 120,
//                         color: Colors.blue,
//                       ),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: Colors.blue.withOpacity(.5),
//                           width: 5.0,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),

//                     // Name and Verified Icon
//                     SizedBox(
//                       width: size.width * .8,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             userProfile['name'] ?? 'shibu',
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 20,
//                             ),
//                           ),
//                           const SizedBox(width: 5),
//                           const Icon(Icons.check_circle, color: Colors.green),
//                         ],
//                       ),
//                     ),

//                     // Email
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: Text(
//                         userProfile['email'] ?? 'shibu@gmail.com',
//                         textAlign: TextAlign.center, // Center the email text
//                         style: const TextStyle(
//                           color: Colors.black45,
//                         ),
//                         softWrap: true,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     // Menu Options
//                     Column(
//                       children: [
//                         ListTile(
//                           leading: const Icon(Icons.person, color: Colors.blue),
//                           title: const Text('My Profile'),
//                           onTap: () {},
//                         ),
//                         ListTile(
//                           leading:
//                               const Icon(Icons.settings, color: Colors.blue),
//                           title: const Text('Settings'),
//                           onTap: () {},
//                         ),
//                         ListTile(
//                           leading: const Icon(Icons.notifications,
//                               color: Colors.blue),
//                           title: const Text('Notifications'),
//                           onTap: () {},
//                         ),
//                         ListTile(
//                           leading: const Icon(Icons.chat, color: Colors.blue),
//                           title: const Text('FAQs'),
//                           onTap: () {},
//                         ),
//                         ListTile(
//                           leading: const Icon(Icons.share, color: Colors.blue),
//                           title: const Text('Share'),
//                           onTap: () {},
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: TextButton(
//               style: TextButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 12,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 backgroundColor: Colors.orange,
//               ),
//               onPressed: () {
//                 // Handle logout action
//                 print('Log Out clicked');
//               },
//               child: const Center(
//                 child: Text(
//                   'Log Out',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           CustomBottomNavBar(),
//         ],
//       ),
//     );
//   }
// }
import 'package:autobse/domain/providers/account_provider/account_provider.dart';
import 'package:autobse/utils/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userProfileProvider);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white, // Set the background to pure white
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Picture
                    Container(
                      width: 150,
                      height: 150,
                      child: const Icon(
                        Icons.account_circle,
                        size: 120,
                        color: Colors.blue,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue.withOpacity(.5),
                          width: 5.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Name and Verified Icon
                    SizedBox(
                      width: size.width * .8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userProfile['name'] ?? 'shibu',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(Icons.check_circle, color: Colors.green),
                        ],
                      ),
                    ),

                    // Email
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        userProfile['email'] ?? 'shibu@gmail.com',
                        textAlign: TextAlign.center, // Center the email text
                        style: const TextStyle(
                          color: Colors.black45,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Menu Options
                    Column(
                      children: [
                        ListTile(
                          leading:
                              const Icon(Icons.payment, color: Colors.blue),
                          title: const Text('Payment'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.book, color: Colors.blue),
                          title: const Text('My Quotes'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.account_balance_wallet,
                              color: Colors.blue),
                          title: const Text('Passbook'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.menu_book, color: Colors.blue),
                          title: const Text('Workbook'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor:
                    Colors.orange, // Updated background color to orange
              ),
              onPressed: () {
                // Handle logout action
                print('Log Out clicked');
              },
              child: const Center(
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.white, // Updated text color to white
                    fontWeight:
                        FontWeight.bold, // Optional: makes the text bold
                  ),
                ),
              ),
            ),
          ),
          CustomBottomNavBar(),
        ],
      ),
    );
  }
}
