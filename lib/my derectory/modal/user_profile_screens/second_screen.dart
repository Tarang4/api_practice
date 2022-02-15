import 'package:api_prectic/my%20derectory/modal/user_profile_screens/user_profile_modal.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  UserProfileModal userProfileModal;

  SecondScreen({Key? key, required this.userProfileModal}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  UserProfileModal modal = UserProfileModal();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    modal = widget.userProfileModal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(modal.id.toString()),
            Text(modal.username.toString()),
            Text(modal.name.toString()),
            Text(modal.email.toString()),
            Text(modal.phone.toString()),
            Text(modal.website.toString()),
            Text(modal.company!.name.toString()),
            Text(modal.company!.catchPhrase.toString()),
            Text(modal.company!.bs.toString()),
            Text(
                "address: ${modal.address!.suite.toString()} ${modal.address!.street.toString()} ${modal.address!.city.toString()} ${modal.address!.zipcode.toString()} "),
          ],
        ),
      ),
    );
  }
}
