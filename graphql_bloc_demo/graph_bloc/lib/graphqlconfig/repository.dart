import 'package:graph_bloc/model/job.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql_client.dart';
import 'graphqlquery.dart';

class Repositories {
  GraphQLClient _client = clientToQuery();
  Future<List<Job>> fetchAllJobs() async {
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(GraphQuery.query),
      ),
    );
    if (!result.hasException) {
      List data = result.data['jobs'];
      //
      List<Job> listJob = [];
      //add all element to listJob
      data.forEach((e) {
        listJob.add(Job.fromJson(e)
            // Job(
            //   id: e["id"],
            //   title: e["title"],
            //   applyUrl: e["applyUrl"],
            //   locationNames: e["locationNames"],
            //   userEmail: e["userEmail"],
            //   createdAt: DateTime.parse(e["createdAt"]),
            // ),
            );
      });
      return listJob;
    }
  }
}
