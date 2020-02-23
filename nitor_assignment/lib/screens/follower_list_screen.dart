import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nitor_assignment/constants/constanst.dart';
import 'package:nitor_assignment/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nitor_assignment/widgets/user_item.dart';

class FollowerListScreen extends StatefulWidget {
  static String id = 'FollowerListScreem';

  final String username;
  final bool isFollower;

  FollowerListScreen({this.username, this.isFollower});

  @override
  _FollowerListScreenState createState() => _FollowerListScreenState();
}

class _FollowerListScreenState extends State<FollowerListScreen> {
  List<User> users = [];
  bool showProgress;
  bool isEmpty = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showProgress = true;
    fetchFollowers();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: CircularProgressIndicator(
        backgroundColor: Colors.black,
      ),
      inAsyncCall: showProgress,
      child: !isEmpty
          ? ListView.separated(
              itemCount: users.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              padding: EdgeInsets.all(8.0),
              itemBuilder: (BuildContext context, int index) => UserItemWidget(
                    login: users[index].login,
                    avatar_url: users[index].avatar_url,
                    id: users[index].id,
                    score: users[index].score,
                  ))
          : Center(child: Text('No users found')),
    );
  }

  Future<List<User>> fetchFollowers() async {
    print('Search called');
    var response;
    if (widget.isFollower) {
      response = await http
          .get(BASE_URL+'users/${widget.username}/followers');
    } else {
      response = await http
          .get(BASE_URL+'users/${widget.username}/following');
    }

    if (mounted) {
      setState(() {
        dynamic data = json.decode(response.body);
        print('response $data');
        if (response.statusCode == 200 && data != null) {
          users =
              (data as List).map((data) => new User.fromJson(data)).toList();
          if (users.length == 0) isEmpty = true;
        } else {
          isEmpty = true;
        }
        showProgress = false;
      });
    }

    return users;
  }
}
