// widgets/search_bar.dart
import 'package:autobse/domain/providers/home_provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBar extends ConsumerWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 15, 14, 14),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).state = value;
                ref.read(auctionsProvider.notifier).searchAuctions(value);
              },
              decoration: InputDecoration(
                hintText: 'Search Auctions',
                hintStyle:
                    TextStyle(color: const Color.fromARGB(255, 22, 21, 21)),
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.tune, color: const Color.fromARGB(255, 212, 6, 6)),
        ],
      ),
    );
  }
}
