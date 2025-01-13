// widgets/top_bar.dart
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         IconButton(
//           icon: const Icon(Icons.menu, color: Colors.blue),
//           onPressed: () {},
//         ),
//         Image.asset(
//           'assets/autobse_logo.png',
//           height: 30,
//         ),
//         Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.notifications_none, color: Colors.blue),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: const Icon(Icons.bookmark_border, color: Colors.blue),
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.blue),
          onPressed: () {},
        ),
        const Text(
          'HOME',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.blue),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.bookmark_border, color: Colors.blue),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
