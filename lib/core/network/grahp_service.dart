import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GQConstants {
  GQConstants._();

  static const gqUrl =
      "https://api-eu-central-1-shared-euc1-02.hygraph.com/v2/clnvubwdk3oke01ueb5o16f64/master";

  static const token = "";
}

class GQService {
  late final ValueNotifier<GraphQLClient> client;

  GQService() {
    _initGQService();
  }

  void _initGQService() {
    final httpLink = HttpLink(GQConstants.gqUrl);
    final authLink = AuthLink(
      getToken: () async => 'Bearer ${GQConstants.token}',
    );
    final link = authLink.concat(httpLink);

    client = ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(),
      ),
    );
  }
}
