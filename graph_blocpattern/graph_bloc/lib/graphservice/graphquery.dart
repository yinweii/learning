class GraphQuery {
  static String query = r'''
  query {
    characters(page: 1) {
      results {
        id
        name
        status
      }
    }
  }
''';
}
