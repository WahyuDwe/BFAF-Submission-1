import 'package:bfaf_submission1/model/data/restaurant.dart';
import 'package:bfaf_submission1/ui/restaurant_detail_page.dart';
import 'package:flutter/material.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/resto_list_page';

  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final resto = parseRestaurants(snapshot.data);
          return ListView.builder(
            itemCount: resto.restaurants.length,
            itemBuilder: (context, index) {
              return _buildRestoItem(context, resto.restaurants[index]);
            },
          );
        },
      ),
    );
  }

  Padding _buildRestoItem(BuildContext context, Restaurant resto) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RestaurantDetailPage.routeName, arguments: resto);
        },
        child: SizedBox(
          height: 100,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Hero(
                    tag: resto.pictureId,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        bottomLeft: Radius.circular(12.0),
                      ),
                      child: Image.network(resto.pictureId, fit: BoxFit.cover),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 15.0, 2.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resto.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_sharp,
                              size: 14,
                              color: Colors.black54,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              resto.city,
                              style: const TextStyle(
                                  color: Colors.black54, fontSize: 12.0),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.black54,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              resto.rating.toString(),
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
