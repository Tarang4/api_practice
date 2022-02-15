import 'dart:convert';

import 'package:api_prectic/my%20derectory/modal/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Results resultsModal=Results();

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
                  height: 200,
                  color: Colors.grey,
                  width: double.infinity,
                  child: Center(child: Text("hh:${data.error.toString()}")),
                ),
              );
            }
            return Center(child: const CircularProgressIndicator());
          },
        ),
      ),
    );
  }
  getApiData() async {
    final uri = Uri.parse("https://randomuser.me/api/");
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        resultsModal = Results.fromJson(jsonDecode(response.body));
        return resultsModal;
      } else {
        print("No data found");
      }
    } catch (e) {
      print('Failed to load post ');
    }
  }

  Widget apiDataLayout() {
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
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen()));
                  },
                  child: Text(
                    "Result= ${resultsModal.gender ?? ""}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Info= ${resultsModal.gender ?? ""}"),
                const SizedBox(
                  height: 5,
                ),
                Text("Email= ${resultsModal.gender ?? ""}"),
                // const SizedBox(
                //   height: 5,
                // ),
                // Text("Body= ${_commentModal.body ?? ""}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
