import 'package:flutter/material.dart';
import 'package:qualif/models/items.dart';
import 'package:qualif/pages/detail_page.dart';
import 'package:qualif/pages/login_page.dart';

import '../main.dart';

class ItemPage extends StatefulWidget {
  final String username;
  const ItemPage({super.key,required this.username});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {

  List<Items> itemList = [
    Items(
      name: "Peperoni Pizza",
      description: "Pizza with Peperoni Topping",
      price: "IDR 55.000",
      image: "assets/peperoni.png",
      comments: [],
    ),
    Items(
      name: "American Pie",
      description: "Pizza with Beef and cheese",
      price: "IDR 65.000",
      image: "assets/american_pie.png",
      comments: [],
    ),
    Items(
      name: "Creamy Chicken",
      description: "Pizza with Chicken and Cream",
      price: "IDR 55.000",
      image: "assets/creamy_chicken.png",
      comments: [],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

        actions: [
          PopupMenuButton<int> (
            itemBuilder: (context) => [
              PopupMenuItem(
                // value: "Li",
                onTap: () {
                  MyApp.of(context).changeTheme("Light");
                },
                child: const Text("Light Theme"),
              ),
              PopupMenuItem(
                // value: 2,
                onTap: () {
                  MyApp.of(context).changeTheme("Dark");
                },
                child: const Text("Dark Theme"),
              )
            ],)
        ],
      ),

      body: Container(
        padding: const EdgeInsets.all(30.0),
    
        child: Column(
          children: [
            const Center(child: 
              Text(
                "Menu",
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ),

            const SizedBox(
              height: 15.0,
            ),
    
            Expanded(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  Items currentItem = itemList[index];
            
                  return ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                        context, 
                        MaterialPageRoute (
                          builder: (context) {
                            return DetailPage(username: widget.username, item: currentItem, comments: [],);
                          }
                        ),
                        (route) => false
                      );
                    },
                    title: Text(
                      currentItem.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(currentItem.price),
                    leading: Image.asset(currentItem.image),
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