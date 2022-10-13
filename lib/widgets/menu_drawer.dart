import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  Map userDetails = {};
  @override
  void initState() {
    super.initState();
  }

  getUserDetails() async {}

  @override
  Widget build(BuildContext context) {
    final List menuItems = [
      {
        'icon': Icons.home,
        'title': 'Home',
      },
      {
        'icon': Icons.star,
        'title': 'Favourites',
      },
      {
        'icon': Icons.notifications,
        'title': 'Notifications',
      },
      {
        'icon': Icons.settings,
        'title': 'Settings',
      },
      {
        'icon': Icons.info,
        'title': 'Terms & conditions',
      },
      {
        'icon': Icons.logout,
        'title': 'Logout',
      }
    ];
    navigateTo(title) {
      Navigator.of(context).pop();
      if (title == 'Dashboard') {
        // navigate to page
      } else if (title == 'Activities') {
        // navigate to page
      } else if (title == 'Chats') {
        // navigate to page
      } else if (title == 'Notifications') {
        // navigate to page
      } else if (title == 'Settings') {
        // navigate to page
      }
    }

    return Drawer(
      backgroundColor: Colors.black,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).secondaryHeaderColor,
              Theme.of(context).primaryColor,
            ],
            end: Alignment.topLeft,
            begin: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 100,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 10.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(
                            MediaQuery.of(context).size.width, 90.0),
                        bottomRight: Radius.elliptical(
                            MediaQuery.of(context).size.width, 90.0)),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 16, right: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/user.jpeg'),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(width: 2, color: Colors.white)),
                      height: 60,
                      width: 60,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'PRATHYUSH P',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          'p.prathyush@gmail.com',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,
                              height: 1.5),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            for (var i in menuItems)
              ListTile(
                minLeadingWidth: 20,
                leading: Icon(
                  i['icon'],
                  size: 28,
                  color: Colors.white,
                ),
                title: Text(
                  i['title'],
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                onTap: () {
                  navigateTo(i['title']);
                },
              ),
          ],
        ),
      ),
    );
  }
}
