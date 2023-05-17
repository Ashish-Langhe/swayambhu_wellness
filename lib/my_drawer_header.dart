import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[700],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 52,
            backgroundImage: NetworkImage(
                'https://ca.slack-edge.com/E02KLGDBF9B-U03BHE9S8QJ-a77660e1d92d-512'
            ),
          ),
          SizedBox(height: 12),
          Text("Ashish Langhe",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16),
          ),
          Text("ashish.langhe@gmail.com",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14),
          ),
        ],
      ),
    );
  }
}


Widget MyDrawerList() {
  return Container(
    padding: EdgeInsets.only(top: 15,),
    child: Column(
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text("Home"),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(Icons.document_scanner_outlined),
          title: const Text("Reports"),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(Icons.favorite_border_outlined),
          title: const Text("Favourites"),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(Icons.notification_add_outlined),
          title: const Text("Notifications"),
          onTap: (){},
        ),
        const Divider(color: Colors.grey),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Settings"),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: const Text("Logout"),
          onTap: (){},
        ),
        const Divider(color: Colors.grey),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("App Version: 0.0.1", style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal
              ),),
            ),
            SizedBox(width: 130),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                width: 35,
                height: 35,
                image: NetworkImage(
                  'https://d2k7w3fmrpj0w4.cloudfront.net/companies/logos/000/000/131/small/7d7f00f4cb33966546a849755dd015341d7754b2.png?1657754250',
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget menuItem() {
  return Material(
    child: InkWell(
      onTap: (){},
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Icon(
                Icons.dashboard_outlined,
                size: 20,
                color: Colors.black,
              ),
            ),
            Expanded(child: Text("Dashboard", style: TextStyle(color: Colors.black, fontSize: 16,),))
          ],
        ),
      ),
    ),
  );
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
