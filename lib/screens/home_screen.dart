import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id  = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Whatsapp',style: TextStyle(
              color: Colors.white
            ),),
            backgroundColor: Colors.teal,
            actions: [
              Icon(Icons.search,color: Colors.white,),
              SizedBox(width: 14),
              PopupMenuButton(
                iconColor: Colors.white,
                  itemBuilder: (context)=>[
                PopupMenuItem(
                  value: '1',
                    child: Text('New Group')),
                PopupMenuItem(
                    value: '2',
                    child: Text('settings')),
                PopupMenuItem(
                    value: '3',
                    child: Text('logout')),
              ]),
              SizedBox(width: 8)
            ],
            bottom: TabBar(
                tabs: [
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.camera_enhance)),
                  Text('chars'),
                  Text('status'),
                  Text('calls'),
            ]),
          ),
          body: TabBarView(children: [
            Text('Camera'),
            Text('chats'),
            Text('Status'),
            Text('Call'),
          ]),
        )
    );
  }
}
