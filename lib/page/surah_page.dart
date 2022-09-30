import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SurahPage extends StatefulWidget {
  final int id;
  final String title;
  const SurahPage({super.key, required this.id, required this.title});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  //create function to get data from API with parameter
  Future<List> getData() async {
    final response = await http.get(Uri.parse(
        "https://khatam.nikkoenggaliano.my.id/mobile/baca-quran/${widget.id}"));
    return jsonDecode(response.body);
  }

  //create listview to show data from API
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surah'),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(
                        snapshot.data![i]['arab'] +
                            " " +
                            snapshot.data![i]['ayat_id'].toString(),
                        textAlign: TextAlign.right,
                      ),
                      subtitle: Text(snapshot.data![i]['arti']),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
