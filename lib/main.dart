
import 'package:autobse/data/graphql/graphql_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:autobse/routes.dart'; // Import your AppRoutes file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the GraphQL client
  final client = initGraphQLClient('https://your-graphql-endpoint.com/graphql');

  runApp(
    ProviderScope(
      child: GraphQLProvider(
        client: client,
        child: CacheProvider(
          child: const MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login, // Set initial route to login
      onGenerateRoute: AppRoutes.onGenerateRoute, // Use your route generator
    );
  }
}
