import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nitor_assignment/screens/user_details_screen.dart';

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({
    Key key,
    @required this.login,
    @required this.avatar_url,
    @required this.id,
    @required this.score,
  }) : super(key: key);

  final String login;
  final String avatar_url;
  final int id;
  final double score;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                pageBuilder: (_, __, ___) => UserDetailsScreen(
                      username: login,
                      avatar: avatar_url,
                    )));
      },
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Hero(
                tag: login,
                child: ClipOval(
                  child:
                  Container(
                    height: 60,
                    width: 60,
                    child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/download.png',
                        image:avatar_url

                    ),
                  ),
//                  Image.network(
//                    avatar_url,
//                    height: 60,
//                    width: 60,
//                    fit: BoxFit.cover,
//                  ),
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      login,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15.0),
                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Id: ${id.toString()}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14.0)),
                        score!=null? Padding(
                          padding: const EdgeInsets.only(right:100.0),
                          child: Text('Score: ${score.toString()}', style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14.0)),
                        ):Text(''),
                      ],

                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 5.0,
            top: 5.0,
            right: 5.0,
            child: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
