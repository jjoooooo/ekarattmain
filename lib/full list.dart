import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Products.dart';
import 'ResponceMain.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Products>?> getProducts() async {
    final response =
    await http.get(Uri.parse("https://dummyjson.com/products"));
    var jsonnn = jsonDecode(response.body);
    var resmain = ResponceMain.fromJson(jsonnn);
    var list = resmain.products;
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getProducts(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Products>?> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                Products o = snapshot.data![index];
                return GridTile(
                  child: Image.network('${o.thumbnail}'),
                  footer: Text('${o.title}'),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}