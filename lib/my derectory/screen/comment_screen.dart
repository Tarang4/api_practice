import 'dart:convert';

import 'package:api_prectic/my%20derectory/modal/comment_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  bool? progress;

  CommentModal commentModal = CommentModal();
  List<CommentModal> list = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // getDataApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getApiData(),
          builder: (BuildContext context, data) {
            if (data.hasData) {
              return apiDataLayout();
            } else if (data.hasError) {
              // print(data.error.toString());

              return Center(
                child: Container(
                  height: 200,color: Colors.grey,
                  width: double.infinity,
                  child: Center(child: Text("hh:${data.error.toString()}")),
                ),
              );
            }
            return  Center(child:  const CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  getApiData() async {
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final item = jsonDecode(response.body);
        item.forEach((item) {
          CommentModal commentModal = CommentModal.fromJson(item);
          list.add(commentModal);
        });
        return list;
      } else {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception("please turn on Internet");
    }
  }

  isProgress(bool value) {
    setState(() {
      progress = value;
    });
  }

  Widget apiDataLayout() => ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          CommentModal _commentModal = list[index];
          return Card(
            elevation: 9,
            child: Container(
              height: 230,
              width: double.infinity,
              color: Colors.amber,
              margin: EdgeInsets.all(18),
              padding: EdgeInsets.all(10),
              child: Card(
                color: Colors.amber,
                elevation: 7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Id= ${_commentModal.id ?? ""}",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Name= ${_commentModal.name ?? ""}"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Email= ${_commentModal.email ?? ""}"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Body= ${_commentModal.body ?? ""}"),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
}
