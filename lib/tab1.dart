import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json'));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final String token;
  final String price;

  const Album({
    required this.price,
    required this.token,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      token: json['chartName'],
      price: json['bpi']['USD']['rate'],
    );
  }
}

class tab1 extends StatefulWidget {
  const tab1({Key? key}) : super(key: key);

  @override
  State<tab1> createState() => _tab1State();
}

class _tab1State extends State<tab1> {
  Future<Album>? futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum() as Future<Album>?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Token: " + snapshot.data!.token,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "Price: " + snapshot.data!.price,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
