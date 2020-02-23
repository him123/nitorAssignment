import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nitor_assignment/constants/constanst.dart';
import 'package:nitor_assignment/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nitor_assignment/widgets/user_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  bool showProgress = false;
  var _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: <Widget>[
            Center(child: Text('GitHub')),
            showProgress
                ? Positioned(
                    right: 10.0,
                    top: 5.0,
                    bottom: 5.0,
                    child: SizedBox(
                      child: CircularProgressIndicator(),
                      height: 20.0,
                      width: 20.0,
                    ),
                  )
                : Container()
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 40.0,
              child: TextField(
                controller: _textController,
                autofocus: false,
                decoration: new InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(22.0),
                      ),
                    ),
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    suffixIcon: InkWell(
                        onTap: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                              (_) => _textController.clear());
                        },
                        child: Icon(Icons.cancel)),
                    hintStyle: new TextStyle(color: Colors.grey[800]),
                    hintText: "Type in your text",
                    fillColor: Colors.white70),
                onChanged: (val) {
                  print('=====cahnge: $val');
                  setState(() {
                    users.clear();
                    search(val);
                    val = '';
                  });
                },
              ),
            ),
          ),
        ),
      ),
      body: users.length != 0
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
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/download.png',
                ),
                Text('Nitor Infotech Assignment'),
                SizedBox(
                  width: double.infinity,
                )
              ],
            ),
    );
  }

  Future<List<User>> search(String search) async {
    showProgress = true;
    print('Search called: https://api.github.com/search/users?q=$search');
    var response = await http.get(BASE_URL + 'search/users?q=$search');
    if (mounted) {
      setState(() {
        dynamic data = json.decode(response.body)['items'];
        print('response $data');
        if (response.statusCode == 200 && data != null) {
          users =
              (data as List).map((data) => new User.fromJson(data)).toList();
        } else {}
        showProgress = false;
      });
    }

    return users;
  }
}
