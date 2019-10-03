import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meetupmakers/postDataModel.dart';
import 'package:meetupmakers/userDataModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meetup App",
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<PostData>> getPosts() async {
    List<PostData> posts = [];
    var response = await http.get("https://jsonplaceholder.typicode.com/posts");
    var responseBody = json.decode(response.body);

    responseBody.forEach((res) {
      PostData post = PostData.fromJson(res);
      posts.add(post);
    });
    return posts;
  }

  Future<List<UserDataModel>> getUsers() async{
    List<UserDataModel> users = [];
    var response = await http.get("https://jsonplaceholder.typicode.com/users");
    var responseBody = json.decode(response.body);

    responseBody.forEach((res) {
      UserDataModel post = UserDataModel.fromJson(res);
      users.add(post);
    });
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meetup posts"),
      ),
      body: Column(
        children: <Widget>[
          Image.asset("assets/images/logo.png")
        ],
      )
    );
  }
}
