import 'dart:convert';

import 'package:api_prectic/my%20derectory/modal/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<UserModal> userList = [UserModal(results: [])];
  UserModal userModal = UserModal();

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
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  getApiData() async {
    final uri = Uri.parse("https://randomuser.me/api");
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        userModal = UserModal.fromJson(jsonDecode(response.body));
        return userModal;
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
        width: double.infinity,
        color: Colors.amber,
        margin: const EdgeInsets.all(18),
        padding: const EdgeInsets.all(10),
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
                  "Result= ${userModal.results ?? ""}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Info= ${userModal.info!.page ?? ""}"),
                const SizedBox(
                  height: 5,
                ),
                Text("Email= ${userModal.info!.version ?? ""}"),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 600,
                  width: double.infinity,
                  color: Colors.deepOrangeAccent,
                  child: ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Results modal=userModal.results![index];
                      return Column(
                        children: [
                          Text("hh :${modal.gender ?? ""}"),
                          Text(
                              "Name :${modal.name!.title ?? ""} ${modal.name!.first ?? ""} ${modal.name!.last ?? ""}"),
                          Text("Location :${modal.location!.street!.number ?? ""}, ${modal.location!.street!.name ?? ""}"),
                          Text(
                              "city :${modal.location!.city ?? ""}"),
                        ],
                      );
                    },
                  ),
                )
                // Text("Body= ${_commentModal.body ?? ""}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
