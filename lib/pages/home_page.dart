import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';
import 'package:flutter/material.dart';

import '../storage_service.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Home Page');
  }

  // ignore: unused_element
  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }
Widget _upload(context) {
    final Storage storage = Storage();
    return ElevatedButton(
      onPressed: () async {
        final results = await FilePicker.platform.pickFiles(
          allowMultiple: false,
          type: FileType.any,
        );

        if (results == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
            content: Text('No file Selected.'),
            ),
          );
        }
        else{
         final path = results.files.single.path!;
         final fileName = results.files.single.name;
         
         storage
         .uploadFile(path, fileName);
        }
      },
      child: const Text('Upload File'),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        actions: <Widget>[
            _signOutButton(),
          ],
      ),
     body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[  
             _upload(context)
             ],
        ),
      )
    );
  }
}


