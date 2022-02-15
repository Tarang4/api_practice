import 'dart:convert';

import 'package:api_prectic/my%20derectory/modal/album_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  AlbumModal _albumModal = AlbumModal();
  List<AlbumModal> list=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: FutureBuilder(
            future: getApiData(),
            builder: (BuildContext context, data) {
              if (data.hasData) {
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    AlbumModal albumModal=list[index];
                    return Column(
                      children: [
                        Text(albumModal.id.toString()),
                        Text(albumModal.title.toString()),
                        Image.network(albumModal.url.toString(),height: 100,width: 100,),
                        Image.network(albumModal.thumbnailUrl.toString()),

                      ],
                    );
                  },

                );
              } else if (data.hasError) {
                return Text(data.error.toString());
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  getApiData() async {
    try {
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
      if (response.statusCode == 200) {
        final items=jsonDecode(response.body);
        items.forEach((items){
          _albumModal = AlbumModal.fromJson(items);
          list.add(_albumModal);

        });

        return list;
      } else {
        throw Exception("error 200");
      }
    } catch (e) {
      throw Exception("error catch $e");
    }
  }
}
