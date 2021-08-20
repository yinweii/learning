import 'package:flutter/material.dart';
import 'package:graph_bloc/model/job.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  final Job job;

  const DetailScreen({Key key, this.job}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var createAt = DateFormat('yyyy/MM/dd hh:mm:a').format(job.createdAt);
    var updateAt = DateFormat('yyyy/MM/dd hh:mm:a').format(job.updatedAt);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              job.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            buildRow('Email:', job.userEmail),
            buildRow('Loacation:', job.locationNames),
            buildRow('Create At:', createAt),
            buildRow('Update At:', updateAt),
            buildRow('PUBLIC:', job.isPublished ? 'YES' : 'NO'),
            Expanded(
                child: Text(
              'ApplyURL: ${job.applyUrl}',
              style: TextStyle(color: Colors.blue),
            )),
            Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Text(job.description),
          ],
        ),
      ),
    );
  }

  buildRow(String title, String desc) {
    String isNull = 'Unknown';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? isNull,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Text(
          desc ?? isNull,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
