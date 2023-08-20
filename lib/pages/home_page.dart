import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:qualif/main.dart';
import 'package:qualif/pages/item_page.dart';
import 'package:qualif/pages/login_page.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var imageList = [
    Image.network("https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEglfuyvx7knhi2WwS7-on9gy0iIHNaWJZEp47VTt9Ook1F_8f7mSBdn3dxqHHIKT0dsJAm4IC50ydiwz-BN663pTwN5AY5xEytQ7mzjXLpWH3mne1m9_x6-guAsKTOeolkQ56AuwANBKtv9Ve6CD5iy9ltPbrrcuqKHEnGaxmi2rkOds8DNbVSDeG85/w400-h225/dominos-indonesia-american-pie-pizzas.jpg"),
    Image.network("https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2022/08/10/16601194454608.jpg"),
    Image.network("https://cdn.antaranews.com/cache/800x533/2021/12/30/pizza-ga2b3cb5a8_1280.jpg")
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

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 30.0,
          top: 30.0,
          right: 30.0,
          bottom: 0.0,
        ),
        child: Column(
        children: [
          CarouselSlider(
              items: imageList,
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
              ),
          ),

          const SizedBox(
            height: 35.0,
          ),

          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero
              )
            ),
            child: Center(
              child: Column(
                children: const [
                  Text(
                    "Welcome to Jomino Pizza!",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  SizedBox(
                    height: 18.0,
                  ),
            
                  Text(
                    "From a humble beginning as a single pizza restaurant 1960, Jomino's has become today's recognized world leader in pizza delivery. Jomino's provides pizza delivery and carryout services as well as dine-in services through the restaurant.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                    ),
                  ),
            
                  SizedBox(
                    height: 12.0,
                  ),
            
                  Text(
                    "Made from fresh and premium ingredients, our also provide a large number of menu from pizza, pasta, sandwiches & more. Grab yours now!",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      )
    );
  }
}