import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class sliderrr extends StatefulWidget {
  const sliderrr({super.key});

  @override
  State<sliderrr> createState() => _sliderrrState();
}

class _sliderrrState extends State<sliderrr> {
  //CarouselController buttonCarouselController = CarouselController();
  List<String>image=["https://upload.wikimedia.org/wikipedia/en/1/17/Ekart_logistics.jpeg",
    "https://files.yappe.in/place/full/ekart-college-road-hub-4374273.webp",
    "https://d2kh7o38xye1vj.cloudfront.net/wp-content/uploads/2023/06/Ekart.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title:  SvgPicture.asset("assets/images/leedinglogo.svg", fit: BoxFit.cover),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_shopping_cart_rounded),
              tooltip: 'Cart',
              onPressed: () {

              },
            ),
            // backgroundColor: Colors.transparent,
          ]),
      body:
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                // Here you can implement your search logic
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
            child:
            CarouselSlider(
              options: CarouselOptions(height: 400.0,
                aspectRatio: 16/9,
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
                scrollDirection: Axis.horizontal,),

              items: image.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber
                        ),
                        child: Image.network("${i}",fit: BoxFit.fill,)

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
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 2,
                    wordSpacing: 5,
                    shadows: [
                      Shadow(color: Colors.blueAccent, offset: Offset(2,1), blurRadius:10)
                    ]
                ),
              ),
            ],
          ),

        ],
      ),


      )
    );
  }
}

class MyCategoryList extends StatelessWidget {
  final List<String> categories = [
    'Laptop',
    'Mobile',
    'Headphone',
    'Consoles',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.laptop_mac),
          title: Text(categories[index]),
        );
      },
    );
  }
}