import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_management_app/application_layer/loading_screen.dart/loading_screen.dart';
import 'package:time_management_app/application_layer/models/users.dart';
import 'package:time_management_app/service_layer/auth.dart';

import '../../wrapper.dart';

class Profile extends StatefulWidget {
  final List<Users> snapshot;
  Profile(this.snapshot);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<String> _userID;
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.height;
    final height = MediaQuery.of(context).size.height;
    if (widget.snapshot != null) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("Profile"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.indigoAccent,
                  radius: 88,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        NetworkImage("${widget.snapshot.first.profilePicture}"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.snapshot.first.name}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    child: Container(
                        width: width / 5,
                        height: height / 18,
                        margin: EdgeInsets.only(top: 25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.indigoAccent),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'Sign out',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ))),
                    onTap: () async {
                      await _auth.signOut();
                      await AuthService().googleSignOut();
                      LoadingScreen();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Wrapper()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return LoadingScreen();
    }
  }
}
