import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  static const String id  = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _capturedImage; // to hold captured image
  final ImagePicker _picker = ImagePicker();

  Future<void> _openCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _capturedImage = File(pickedFile.path);
      });
    }
  }
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
                  Text('chats'),
                  Text('status'),
                  Text('calls'),
            ]),
          ),
          body: TabBarView(children: [
            Center(
              child: _capturedImage == null
                  ? ElevatedButton.icon(
                onPressed: _openCamera,
                icon: const Icon(Icons.camera_alt),
                label: const Text("Open Camera"),
              )
                  : Image.file(_capturedImage!),
            ),
            ListView.builder(
              itemCount: 100,
                itemBuilder: (context, index){
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://images.pexels.com/photos/1040881/pexels-photo-1040881.jpeg'),
                ),
                title: Text('john khan'),
                subtitle: Text('where is he'),
                trailing: Text('6:40'),
              );
            }),

            ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index){
                  if(index == 0) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('new updates'),
                          ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.green,
                                      width: 3
                                  )
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.pexels.com/photos/1040881/pexels-photo-1040881.jpeg'),
                              ),
                            ),
                            title: Text('john khan'),
                            subtitle: Text('35m ago'),
                            trailing: Text('6:40'),
                          ),
                        ],
                      ),
                    );
                  }
                  return null;
                }),
            ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index){
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://images.pexels.com/photos/1040881/pexels-photo-1040881.jpeg'),
                    ),
                    title: Text('john khan'),
                    subtitle: Text(index/ 2 == 0 ? 'you missed call' : 'you missed video call'),
                    trailing: Icon(index/2 == 0? Icons.phone : Icons.video_call),
                  );
                }),
          ]),
        )
    );
  }
}
