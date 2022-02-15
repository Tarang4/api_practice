import 'dart:convert';

import 'package:api_prectic/my%20derectory/modal/post_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  late bool isProcess;

  PostModal model = PostModal();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
  // ApiHelper.db.getApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: isProcess == true
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(model.title?? ""),
SizedBox(height: 10,),
                    Text(model.body ?? ""),
                  ],
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }

  getApiData() async {
    isProces(false);
    final uri = Uri.parse("https://hotels4.p.rapidapi.com/properties/list/?pageNumber=1",);
    try {
      final response = await http.get(uri);
      isProces(true);
      if (response.statusCode == 200) {
        model = PostModal.fromJson(jsonDecode(response.body));
        return response;
      } else {
        print("No data found");
      }
    } catch (e) {
      print('Failed to load post ');
    }
  }

  isProces(bool value) {
    setState(() {
      isProcess = value;
    });
  }
}
