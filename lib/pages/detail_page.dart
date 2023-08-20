import 'dart:html';

import 'package:flutter/material.dart';
import 'package:qualif/models/comments.dart';
import 'package:qualif/models/items.dart';
import 'package:qualif/pages/item_page.dart';
import 'package:qualif/pages/login_page.dart';

import '../main.dart';

class DetailPage extends StatefulWidget {
  final String username;
  final Items item;
  final List<Comments> comments;
  const DetailPage({super.key, required this.username, required this.item, required this.comments});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController commentController = TextEditingController();

  String? commentError;

  void resetValidation() {
    setState(() {
      commentError = null;
    });
  }

  void commentValidation() {
    resetValidation();

    String comment = commentController.text;

    if(comment.isEmpty) {
      SnackBar snackBar = const SnackBar(
        content: Text("Comment can't be empty"),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      return;
    }

    SnackBar snackBar = const SnackBar(
      content: Text("Comment successfully inserted"),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.green,
    );

    setState(() {
      widget.comments.add(
        Comments(
          username: widget.username, 
          comment: comment
        )
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    return;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.list),
                  title: const Text("Items"),
                  onTap: () {
                    Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                        context, 
                        MaterialPageRoute (
                          builder: (context) {
                            return ItemPage(username: widget.username);
                          }
                        ),
                      (route) => false
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Logout"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const LoginPage())
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
      
          appBar: AppBar(
            title:Row(
              children: [
                const Text(
                  "Hello, ",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  widget.username,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),

            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.playlist_play_sharp),
                ),
                Tab(
                  icon: Icon(Icons.comment),
                )
              ],
            ),
          ),

          body: TabBarView(
            children: [
              Column(
                children: [
                  const Padding(padding: EdgeInsets.all(10.0)),
                  Center(
                    child: 
                      Text(
                        widget.item.name,
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                  ),

                  Image.asset(
                    widget.item.image,
                    width: 200.0,
                    height: 200.0,
                  ),

                  Center(
                    child: 
                      Text(
                        widget.item.description,
                        style: const TextStyle(
                          fontSize: 15.0
                        )
                      ),
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),

                  Center(
                    child: 
                      Text(
                        widget.item.price,
                        style: const TextStyle(
                          fontSize: 15.0
                        )
                      ),
                  ),

                  const SizedBox(
                    height: 30.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: TextField(
                      controller: commentController,
                      decoration: const InputDecoration(
                        hintText: "Comment",
                        labelText: "Comment",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25.0,
                      right: 25.0,
                      top: 0.0,
                      bottom: 0.0,
                    ),
                    child: OutlinedButton(
                      onPressed: commentValidation, 
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(60), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        )// NEW
                      ),
                      child: const Text("Add Comment")
                    ),
                  ),
                ],
              ),

              Expanded(
              child: ListView.builder(
                itemCount: widget.comments.length,
                itemBuilder: (context, index) {
                  Comments currentComment = widget.comments.elementAt(index);
            
                  return ListTile(
                    onTap: () {},
                    title: Text(
                      currentComment.comment,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(currentComment.username),
                  );
                },
              ),
            ),
            ],
          ),
        ),
    );
  }
}