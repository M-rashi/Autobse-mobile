// widgets/auctions_list.dart
import 'package:autobse/domain/providers/home_provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auction_card.dart';

class AuctionsList extends ConsumerWidget {
  const AuctionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auctions = ref.watch(auctionsProvider);
    print(auctions);
    return Column(
      children: auctions
          .map((auction) => Column(
                children: [
                  AuctionCard(auction: auction),
                  const SizedBox(height: 20),
                ],
              ))
          .toList(),
    );
  }
}
