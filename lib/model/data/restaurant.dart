import 'dart:convert';

class Restaurants {
  List<Restaurant> restaurants;

  Restaurants({
    required this.restaurants,
  });

  factory Restaurants.fromJson(Map<String, dynamic> json) =>
      Restaurants(
        restaurants: List<Restaurant>.from(
            json['restaurants'].map((json) => Restaurant.fromJson(json))),
      );
}

class Restaurant {
  final String id;
  final String name;
  final String desc;
  final String pictureId;
  final String city;
  final double rating;
  Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.desc,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      Restaurant(
        id: json['id'],
        name: json['name'],
        desc: json['description'],
        pictureId: json['pictureId'],
        city: json['city'],
        rating: json['rating'].toDouble(),
        menus: Menus.fromJson(json['menus']),
      );
}

class Menus {
  List<Menu> foods;
  List<Menu> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) =>
      Menus(
        foods: List<Menu>.from(
            json['foods'].map((json) => Menu.fromJson(json))),
        drinks: List<Menu>.from(
            json['drinks'].map((json) => Menu.fromJson(json))),
      );
}

class Menu {
  final String name;

  Menu({
    required this.name,
  });

  factory Menu.fromJson(Map<String, dynamic> json) =>
      Menu(
        name: json['name'],
      );
}

// Restaurants parseRestaurants(String? data) => Restaurants.fromJson(json.decode(data!));

Restaurants parseRestaurants(String? dataJson) {
  if (dataJson == null) {
    return Restaurants(restaurants: []);
  }

  final Map<String, dynamic> data = json.decode(dataJson);
  return Restaurants.fromJson(data);

}
