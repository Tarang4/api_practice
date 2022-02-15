import 'dart:convert';

import 'package:api_prectic/my%20derectory/modal/user_profile_screens/second_screen.dart';
import 'package:api_prectic/my%20derectory/modal/user_profile_screens/user_profile_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  UserProfileModal userProfileModal = UserProfileModal();

  List<UserProfileModal> userProfileList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getApiData(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return profileWidget();
            } else if (snapshot.hasError) {
              return Center(
                  child: Text("hh:kk  ${snapshot.hasError.toString()} "));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  getApiData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final items = jsonDecode(response.body);
        userProfileList.clear();
        items.forEach((items) {
          userProfileModal = UserProfileModal.fromJson(items);
          setState(() {
            userProfileList.add(userProfileModal);
          });
        });

        return userProfileList;
      } else {
        throw Exception("ERROR else");
      }
    } catch (e) {
      throw Exception("ERROR : $e");
    }
  }

  profileWidget() {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ListView.builder(
        itemCount: userProfileList.length,
        itemBuilder: (BuildContext context, int index) {
          UserProfileModal modal = userProfileList[index];
          return Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(
                          userProfileModal: modal,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    color: Colors.deepOrangeAccent,
                    margin: EdgeInsets.all(9),
                    alignment: Alignment.center,
                    child: Text(
                      "id ${++index}",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
