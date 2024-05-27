import 'package:flutter/material.dart';
import 'drawer_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Drawer(
      width: width * 0.7,
      shadowColor: const Color(0xFF65647C),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      elevation: 2,
      child: Scaffold(
        // color: Colors.black,
        bottomSheet: Container(
          height: height * 0.2,
          decoration: const BoxDecoration(
            color:  Color.fromARGB(179, 107, 166, 202),
            image: DecorationImage(
              alignment: Alignment.center,
              
              // opacity: 5,

              image: AssetImage('assets/images/shola_motto_image.png'),
              fit: BoxFit.contain,
            ),

            borderRadius: BorderRadius.only(
              topRight: Radius.circular(26),
              topLeft: Radius.circular(26),
              
            ),
          ),
          
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1D6EA0),
                Color.fromARGB(255, 107, 166, 202),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 20, 14, 0),
            child: Column(
              children: [
                headerWidget(),
                const SizedBox(
                  height: 40,
                ),
                const Divider(
                  thickness: 1,
                  height: 10,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 40,
                ),
                DrawerItem(
                  name: 'አካውንት',
                  icon: Icons.people,
                  onPressed: () => onItemPressed(context, index: 0),
                ),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'የእቃ ማዘዣ',
                    icon: Icons.account_box_rounded,
                    onPressed: () => onItemPressed(context, index: 1)),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'ያላለቁ ምዝገባዎች',
                    icon: Icons.message_outlined,
                    onPressed: () => onItemPressed(context, index: 2)),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'የሾላ ምርቶች',
                    icon: Icons.favorite_outline,
                    onPressed: () => onItemPressed(context, index: 3)),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: 1,
                  height: 10,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'ማስተካያ',
                    icon: Icons.settings,
                    onPressed: () => onItemPressed(context, index: 4)),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'መውጫ',
                    icon: Icons.logout,
                    onPressed: () => onItemPressed(context, index: 5)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    // switch(index){
    //   case 0:
    //     Navigator.push(context, MaterialPageRoute(builder: (context) => const People()));
    //     break;
    // }
  }

  Widget headerWidget() {
    return Container(
      child:  const Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage:
                AssetImage('assets/images/logo_with_white_text.png'),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('የተጠቃሚ ስም',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text('ኢሚዬል@email.com',
                  style: TextStyle(fontSize: 14, color: Colors.white))
            ],
          )
        ],
      ),
    );
  }
}
