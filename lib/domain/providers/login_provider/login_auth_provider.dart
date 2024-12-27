import 'package:autobse/data/graphql/mutations/login_mutation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AuthAPI {
  static Future<Map<String, dynamic>> login(
      String mobile, String password) async {
    final GraphQLClient client = GraphQLClient(
      link: HttpLink('https://api-dev.autobse.com/graphql'),
      cache: GraphQLCache(),
    );

    final options = MutationOptions(
      document: gql(loginMutation),
      variables: {
        'loginInput': {
          'mobile': mobile,
          'password': password,
        },
      },
    );

    final result = await client.mutate(options);

    if (result.hasException) {
      throw result.exception!;
    }

    return result.data!;
  }
}
