import 'package:flutter/material.dart';
import 'package:syariahapp/page/surah_page.dart';

//create a button for click and navigate to another page
class CardSurah extends StatelessWidget {
  final List surah;
  const CardSurah({Key? key, required this.surah}) : super(key: key);

  //create function to map surah data
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: surah.length,
      itemBuilder: (context, i) {
        return Card(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SurahPage(
                    id: surah[i]['id'],
                    title: surah[i]['nama_surah'],
                  ),
                ),
              );
            },
            child: ListTile(
              title: Text(surah[i]['nama_surah']),
              subtitle: Text(surah[i]['arti']),
            ),
          ),
        );
      },
    );
  }
}
