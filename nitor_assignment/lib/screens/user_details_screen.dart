import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nitor_assignment/constants/constanst.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nitor_assignment/model/user_details.dart';
import 'package:nitor_assignment/screens/tab_container.dart';
import 'package:nitor_assignment/widgets/shimmer_layout.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetailsScreen extends StatefulWidget {
  static String id = 'UserDetalsScreen';
  final String username;
  final String avatar;

  UserDetailsScreen({this.username, this.avatar});

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  bool isLoading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    fetchUserDetails(widget.username);
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.username),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Share.share('$BASE_URL${widget.username}',
                    subject: 'Check out this Github profile!');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              /*AVATAR*/ Hero(
                tag: widget.username,
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: new DecorationImage(
                      image: new NetworkImage(widget.avatar),
                      fit: BoxFit.cover,
                    ),
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(100.0)),
                    border: new Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              isLoading
                  ? ShimmerLayout()
                  : Card(
                      elevation: 3.0,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            userDetails.name != null ? userDetails.name : '',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          /*LOCATION*/ Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.location_on),
                              Text(userDetails.location != null
                                  ? userDetails.location
                                  : '')
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          /*FOLLOWER FOLLOWING*/ Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              /*FOLLOWER*/ InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TabContainer(
                                              username: widget.username,
                                              isFollower: true,
                                            )),
                                  );
                                },
                                child: Card(
                                    color: Colors.green,
                                    elevation: 3.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${userDetails.followers != null ? userDetails.followers : ''} Followers',
                                        style: kBioTitleStyle.copyWith(
                                            color: Colors.white),
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 4.0, right: 4.0),
                                child: Container(
                                  width: 1,
                                  height: 35.0,
                                  color: Colors.grey,
                                ),
                              ),
                              /*FOLLOWING*/ InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TabContainer(
                                              username: widget.username,
                                              isFollower: false,
                                            )),
                                  );
                                },
                                child: Card(
                                    color: Colors.green,
                                    elevation: 3.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${userDetails.following != null ? userDetails.following : ''} Following',
                                        style: kBioTitleStyle.copyWith(
                                            color: Colors.white),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          /*BIO DETAILS*/ Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  /*LINK*/ InkWell(
                                    onTap: () {
                                      _launchURL('https://github.com/${widget.username}');
                                    },
                                    child: Container(
                                      height: 30.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.link,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                'https://github.com/${widget.username}',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Colors.grey,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  Text(
                                    'Bio',
                                    style: kBioTitleStyle,
                                  ),
                                  Text(
                                    userDetails.bio != null
                                        ? userDetails.bio
                                        : '',
                                    style: kBioTextStyle,
                                  ),
                                  Divider(),
                                  Text(
                                    'Public Repositories',
                                    style: kBioTitleStyle,
                                  ),
                                  Text(
                                    userDetails.public_repos != null
                                        ? userDetails.public_repos.toString()
                                        : '',
                                    style: kBioTextStyle,
                                  ),
                                  Divider(),
                                  Text(
                                    'Public gists',
                                    style: kBioTitleStyle,
                                  ),
                                  Text(
                                    userDetails.public_gists != null
                                        ? userDetails.public_gists.toString()
                                        : '',
                                    style: kBioTextStyle,
                                  ),
                                  Divider(),
                                  Text(
                                    'Updated at',
                                    style: kBioTitleStyle,
                                  ),
                                  Text(
                                    userDetails.updated_at != null
                                        ? changeDateFormate(
                                            userDetails.updated_at)
                                        : '',
                                    style: kBioTextStyle,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }

  var userDetails = UserDetails();

  Future<UserDetails> fetchUserDetails(String username) async {
    print('Details api called 2');
    var response = await http.get(BASE_URL + 'users/$username');
    if (mounted) {
      setState(() {
        var data = json.decode(response.body);
        print('response $data');
        if (response.statusCode == 200 && data != null) {
          userDetails = UserDetails.fromJson(data);
          isLoading = false;
        } else {
          isLoading = false;
        }
      });
    }

    return userDetails;
  }

  String changeDateFormate(String date) {
    var datetime = DateTime.parse(date);
    var formatter = new DateFormat('dd MMM yyyy hh:mm a');
    return formatter.format(datetime);
  }
}
