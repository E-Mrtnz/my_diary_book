import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My diary book',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My diary book'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.repeat_rounded),
        onPressed: () async {
          /*
          var getDocAppDir = await getApplicationDocumentsDirectory();
          print(getDocAppDir);

          var dir = io.Directory('Master');
          var e = await dir.exists();

          var dir2 = await io.Directory('/storage/emulated/0/Download/Master/');

          print(await dir2.exists());

          if (!await dir2.exists()) {
            await dir2.create(recursive: true);
          }1

          print(await dir2.exists());
          print('object');
          */

          //var manageStorageStatus = Permission.storage.status;
          var storageStatus = Permission.storage.status;
          await Permission.storage.request();
          //print(await Permission.storage.isGranted);

          //
          if (await storageStatus.isGranted) {
            var getDocAppDir = await getExternalStorageDirectory();

            var getDAD = await getApplicationDocumentsDirectory();

            try {
              if (await Permission.storage.status.isGranted) {
                //print(await io.File('${getDocAppDir.path}/test.txt').exists());
                //print(await getDocAppDir);
                /*
                print(await io.File('${getDAD.path}/test.txt').exists());
                await io.File('${getDAD.path}/test.txt').copy(
                    '/storage/emulated/0/Android/data/com.example.my_diary_book/files/test.txt');
                */
                print(await io.File('${getDocAppDir!.path}/test.txt').exists());
                print(await io.Directory('${getDocAppDir.path}/mi').exists());
                io.Directory dir = io.Directory('${getDocAppDir.path}/mer');
                if (!await dir.exists()) {
                  dir.create(recursive: true);
                  print('kiwi');
                } else {
                  print('delete');
                }
                print(getDocAppDir);

                print(getDAD.path);
              }
            } catch (e) {
              print(e);
            }
          }
          //var manageExternalStorage = Permission.manageExternalStorage;
          //await manageExternalStorage.request();

          //print(await dir2.exists());

          //print('${getDocAppDir.path}/$e');
        },
      ),
    );
  }
}
