import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink(
  'https://api.graphql.jobs/',
);

GraphQLClient clientToQuery() {
  return GraphQLClient(
      link: httpLink, cache: GraphQLCache(store: InMemoryStore()));
}
