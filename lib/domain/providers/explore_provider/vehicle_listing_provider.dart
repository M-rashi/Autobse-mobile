// vehicle_listing_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Vehicle {
  final String name;
  final String location;
  final double price;
  final String date;
  final int kilometers;
  final String fuelType;
  final int seats;
  final double rating;
  final int reviews;

  Vehicle({
    required this.name,
    required this.location,
    required this.price,
    required this.date,
    required this.kilometers,
    required this.fuelType,
    required this.seats,
    required this.rating,
    required this.reviews,
  });
}

final vehicleListingProvider =
    StateNotifierProvider<VehicleListingNotifier, List<Vehicle>>((ref) {
  return VehicleListingNotifier();
});

class VehicleListingNotifier extends StateNotifier<List<Vehicle>> {
  VehicleListingNotifier()
      : super([
          Vehicle(
            name: 'Ashok Leyland Truck',
            location: 'Mumbai',
            price: 2000000,
            date: '27 Sept 2024 | 12:00 PM',
            kilometers: 25000,
            fuelType: 'Petrol',
            seats: 10,
            rating: 4.8,
            reviews: 12800,
          ),
        ]);

  void addVehicle(Vehicle vehicle) {
    state = [...state, vehicle];
  }

  void removeVehicle(Vehicle vehicle) {
    state = state.where((v) => v != vehicle).toList();
  }
}
