import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String email;

  User({required this.id, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], email: json['email']);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    fetchUsersData();
  }

  Future<void> fetchUsersData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://jsonplaceholder.typicode.com/posts')); //https://jsonplaceholder.typicode.com/posts/

      if (response.statusCode == 200) {
        setState(() {
          _data = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to load user data');
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> createData() async {
    try {
      final response = await http.post(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          },
          body: jsonEncode(<String, dynamic>{
            'title': 'Flutter HTTP  CRUD',
            'body': 'This is a blog post about HTTP CRUD methods in Flutter',
            'userId': 1
          }));
      if (response.statusCode == 201) {
        fetchUsersData();
      } else {
        throw Exception('Failed to create data');
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> updateData(int id) async {
    final response = await http.put(
        Uri.parse('https://jsonplaceholder.typecode.com/posts/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: {
          'title': 'Flutter http Crud ',
          'body': 'This is an Updated Blog post about CRUD',
          'userId': 1
        });
    if (response.statusCode == 200) {
      fetchUsersData();
    } else {
      throw Exception('Failed to update data');
    }
  }

  Future<void> deleteData(int id) async {
    final response = await http
        .delete(Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"));
    if (response.statusCode == 200) {
      fetchUsersData();
    } else {
      throw Exception('Failed to delete data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Details'),
        ),
        body: ListView.builder(
            itemCount: _data.length,
            itemBuilder: (context, index) {
              final data = _data[index];
              return ListTile(
                leading: Text(data['id'].toString()),
                title: Text(data['title']),
                subtitle: Text(data['body']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          updateData(data['id']);
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        deleteData(data['id']);
                      },
                    ),
                  ],
                ),
              );
            }));
  }
}
