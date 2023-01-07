import 'package:bfaf_submission1/model/data/restaurant.dart';
import 'package:bfaf_submission1/ui/restaurant_detail_page.dart';
import 'package:bfaf_submission1/ui/restaurant_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RestaurantListPage.routeName,
      routes: {
        RestaurantListPage.routeName: (context) => const RestaurantListPage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              resto: ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
      },
    );
  }
}
