import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'full list.dart';
import 'main.dart';

void main() {
  runApp(MaterialApp(
    home: SliderExample(),
  ));
}


class SliderExample extends StatefulWidget {
  const SliderExample({Key? key}) : super(key: key);

  @override
  _SliderExampleState createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  List<Map<String, dynamic>> categories = [
    {'name': 'Laptop', 'iconPath': 'assets/images/laptop.png'},
    {'name': 'Mobile', 'iconPath': 'assets/images/mobile.png'},
    {'name': 'Headphone', 'iconPath': 'assets/images/hedph.png'},
    {'name': 'Console', 'iconPath': 'assets/images/consol.png'},
    {'name': 'Console', 'iconPath': 'assets/images/tab.png'},

  ];

  List<String> images = [
    "https://upload.wikimedia.org/wikipedia/en/1/17/Ekart_logistics.jpeg",
    "https://files.yappe.in/place/full/ekart-college-road-hub-4374273.webp",
    "https://d2kh7o38xye1vj.cloudfront.net/wp-content/uploads/2023/06/Ekart.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: SvgPicture.asset("assets/images/leedinglogo.svg", fit: BoxFit.cover),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_shopping_cart_rounded),
            tooltip: 'Cart',
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  print('Searching for: $value');
                },
                decoration: InputDecoration(
                  labelText: 'Search Product',
                  hintText: 'Enter product name',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
              Container(
                height: 400,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: images.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                          ),
                          child: Image.network(
                            i,
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "  Category",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2,
                      wordSpacing: 5,
                      shadows: [
                        Shadow(color: Colors.blueAccent, offset: Offset(2, 1), blurRadius: 10),
                      ],
                    ),
                  ),
        
                ],
        
              ),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    var s=categories[index]['iconPath'];
                    print(s);
                    return InkWell(
                      onTap: () {
                        // Navigate to the new page here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              categoryName: categories[index]['name'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Container(
        
                              margin: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                        child: Image.asset(categories[index]['iconPath']),
        
        
                              ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              categories[index]['name'],
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
        
                          ],
                        ),
                      ),
        
                    );
                  },
                ),
        
              ),
              Text(
                "  Top Products",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2,
                  wordSpacing: 5,
                  shadows: [
                    Shadow(color: Colors.blueAccent, offset: Offset(2, 1), blurRadius: 10),
                  ],
                ),
              ),
              Container(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: '',)),
                  );
                },
                child: Text("View More"),
              ),
            ],
        
          ),
        
        ),
      ),

    );
  }
}

class DetailPage extends StatelessWidget {
  final String categoryName;

  DetailPage({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: Text(
          'Details for $categoryName',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}