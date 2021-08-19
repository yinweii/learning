import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  GraphQLClient _client;

  GraphQLService() {
    HttpLink link = HttpLink('https://rickandmortyapi.com/graphql/');

    _client =
        GraphQLClient(link: link, cache: GraphQLCache(store: InMemoryStore()));
  }

  Future<QueryResult> performQuery(String query,
      {Map<String, dynamic> variables}) async {
    QueryOptions options =
        QueryOptions(document: gql(query), variables: variables);

    final result = await _client.query(options);

    return result;
  }
}
