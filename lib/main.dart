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
          FutureBuilder(
            future: getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()),);
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    leading: CircleAvatar(child: Text(snapshot.data[index].name[0]),),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].email),
                  );
                },
              );
            },
          )
        ],
      )
    );
  }
}
