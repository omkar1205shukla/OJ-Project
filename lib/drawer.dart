import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medhub/BottomNavigationBar.dart';
import 'package:medhub/ambulance.dart';
import 'package:medhub/loginpage.dart';
import 'package:medhub/main.dart';
import 'package:medhub/models/user_profile.dart';
import 'package:medhub/quick_access.dart';
import 'package:medhub/services/local_storage.dart';
import 'package:medhub/util/colors.dart';

class Drawers extends StatefulWidget {
  const Drawers({super.key});

  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    UserProfile userProfile = LocalStorage.instance.getUserProfile();
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration:
                  const BoxDecoration(color: MedCareColors.primaryColor),
              accountName: const Text(''),
              accountEmail: Text(userProfile.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  userProfile.email[0],
                  style: const TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Bottom()),
                );
              },
            ),
            ListTile(
                leading: Tab(
                    icon: Image.asset(
                  "images/siren.png",
                  color: Colors.grey[600],
                )),
                title: const Text('Ambulance'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const Ambulance()),
                  );
                }),
            ListTile(
              leading: Tab(
                icon: Image.asset(
                  "images/appointment_statrus.png",
                  color: Colors.grey[600],
                ),
              ),
              title: const Text('Appointment Status'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Tab(
                icon: Image.asset(
                  "images/history.png",
                  color: Colors.grey[600],
                ),
              ),
              title: const Text('Appointment History'),
              onTap: () {},
            ),
            ListTile(
              leading: Tab(
                icon: Image.asset(
                  "images/chat.png",
                  color: Colors.grey[600],
                ),
              ),
              title: const Text('MedBot'),
              onTap: () {
                Navigator.pop(context);
                // close drawer before navigate to another page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuickAccess()),
                );
              },
            ),
            ListTile(
                leading: Tab(
                  icon: Image.asset(
                    "images/quick.png",
                    color: Colors.grey[600],
                  ),
                ),
                title: const Text('Quick Access'),
                onTap: () {
                  Navigator.pop(context);
                  // close drawer before navigate to another page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuickAccess()),
                  );
                }),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey[600],
            ),
            ListTile(
              title: const Text("Communicate"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text("Share"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.feedback),
              title: const Text("Feedback"),
              onTap: () {},
            ),
            ListTile(
              leading: Tab(
                icon: Image.asset(
                  "images/about_us.png",
                  color: Colors.grey[600],
                ),
              ),
              title: const Text("About Us"),
              onTap: () {},
            ),
            ListTile(
              leading: Tab(
                icon: Image.asset(
                  "images/logout.png",
                  color: Colors.grey[600],
                ),
              ),
              title: const Text("Sign Out"),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  LocalStorage.instance.logOut();
                  Navigator.of(context)
                      .popUntil(ModalRoute.withName(SplashPage.routeName));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const LoginPage()),
                  );
                }).catchError((e) {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
