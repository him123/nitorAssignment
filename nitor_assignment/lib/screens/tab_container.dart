import 'package:flutter/material.dart';
import 'package:nitor_assignment/screens/follower_list_screen.dart';

class TabContainer extends StatefulWidget {
  final String username;
  final bool isFollower;

  TabContainer({this.username, this.isFollower});

  @override
  _TabContainerState createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(
        length: 2, vsync: this, initialIndex: widget.isFollower ? 0 : 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Followers',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Following',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700)),
            )
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          FollowerListScreen(
            username: widget.username,
            isFollower: true,
          ),
          FollowerListScreen(
            username: widget.username,
            isFollower: false,
          ),
        ],
        controller: _tabController,
      ),
    );
  }
}
