import 'package:catlog_app_by_codepur_demo/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111-1500x1000.jpg";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
        children:  <Widget>[
            const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                // decoration: BoxDecoration(color: Colors.amber),
                accountName: Text("Dhanashri Shisode"),
                accountEmail: Text("dhanahsrishisode17@gmail.com"),
                currentAccountPicture:
                    CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/login_page.png"),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 0,
              color: Colors.black,
            ),
            ListTile(
              textColor: Colors.white,
              leading: const Icon(
                color: Colors.white,
                Icons.edit,
              ),
              title: const Text(
                "EmaiId",
                textScaleFactor: 1.2,
              ),
              trailing:const Icon(
                Icons.done,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
            ),
            const ListTile(
              textColor: Colors.white,
              leading: Icon(
                color: Colors.white,
                Icons.adb_outlined,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
              ),
              trailing: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            const ListTile(
              textColor: Colors.white,
              leading: Icon(
                CupertinoIcons.add,
                color: Colors.white,
              ),
              title: Text(
                "Name",
                textScaleFactor: 1.2,
              ),
              trailing: Icon(
                Icons.edit_note,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
