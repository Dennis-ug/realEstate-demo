// class PropertyModel {
//   String title;
//   String subTitle;
//   String details;
//   String thumbnail;
//   List<String> images;
//   int rooms;
//   int area;
//   int floors;
//   int price;
//   double rating;
//   PropertyModel({
//     required this.title,
//     required this.subTitle,
//     required this.details,
//     required this.thumbnail,
//     required this.images,
//     required this.rooms,
//     required this.area,
//     required this.floors,
//     required this.price,
//     required this.rating,
//   });
// }

// List<PropertyModel> properties = [
//   PropertyModel(
//     title: 'Apartment House',
//     subTitle: "Kampala",
//     details:
//         'Est pariatur pariatur nisi cupidatat deserunt incididunt enim eiusmod do minim exercitation. Exercitation mollit enim officia cupidatat occaecat quis cillum cupidatat consectetur ad. Amet in dolore occaecat labore non anim. Laborum anim occaecat eiusmod occaecat ut sit. Est excepteur Lorem culpa deserunt anim duis quis anim ea in tempor exercitation exercitation. Veniam magna pariatur irure commodo mollit ut irure. Tempor aute consequat in labore magna sunt et commodo ut cupidatat.',
//     thumbnail: 'images/demohouse.png',
//     images: [
//       'images/demohouse.png',
//       'images/demohouse.png',
//       'images/demohouse.png'
//     ],
//     rooms: 5,
//     area: 3000,
//     floors: 3,
//     price: 3000,
//     rating: 4.3,
//   ),
//   PropertyModel(
//     title: 'New House',
//     subTitle: "Kampala",
//     details:
//         'Est pariatur pariatur nisi cupidatat deserunt incididunt enim eiusmod do minim exercitation. Exercitation mollit enim officia cupidatat occaecat quis cillum cupidatat consectetur ad. Amet in dolore occaecat labore non anim. Laborum anim occaecat eiusmod occaecat ut sit. Est excepteur Lorem culpa deserunt anim duis quis anim ea in tempor exercitation exercitation. Veniam magna pariatur irure commodo mollit ut irure. Tempor aute consequat in labore magna sunt et commodo ut cupidatat.',
//     thumbnail: 'images/demohouse.png',
//     images: [
//       'images/demohouse.png',
//       'images/demohouse.png',
//       'images/demohouse.png'
//     ],
//     rooms: 5,
//     area: 3000,
//     floors: 3,
//     price: 3000,
//     rating: 4.3,
//   ),
//   PropertyModel(
//     title: 'Bangalow House',
//     subTitle: "Kampala",
//     details:
//         'Est pariatur pariatur nisi cupidatat deserunt incididunt enim eiusmod do minim exercitation. Exercitation mollit enim officia cupidatat occaecat quis cillum cupidatat consectetur ad. Amet in dolore occaecat labore non anim. Laborum anim occaecat eiusmod occaecat ut sit. Est excepteur Lorem culpa deserunt anim duis quis anim ea in tempor exercitation exercitation. Veniam magna pariatur irure commodo mollit ut irure. Tempor aute consequat in labore magna sunt et commodo ut cupidatat.',
//     thumbnail: 'images/demohouse.png',
//     images: [
//       'images/demohouse.png',
//       'images/demohouse.png',
//       'images/demohouse.png'
//     ],
//     rooms: 5,
//     area: 3000,
//     floors: 3,
//     price: 3000,
//     rating: 4.3,
//   ),
// ];
// To parse this JSON data, do
//
//     final propertyModel = propertyModelFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

List<PropertyModel> propertyModelFromJson(String str) => List<PropertyModel>.from(json.decode(str).map((x) => PropertyModel.fromJson(x)));

String propertyModelToJson(List<PropertyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PropertyModel {
    PropertyModel({
        required this.id,
        required this.name,
        required this.status,
        required this.info,
        required this.rooms,
        required this.bath,
        required this.map,
        required this.image,
    });

    String id;
    String name;
    String status;
    String info;
    String rooms;
    String bath;
    String map;
    String image;

    factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        info: json["info"],
        rooms: json["rooms"],
        bath: json["bath"],
        map: json["map"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "info": info,
        "rooms": rooms,
        "bath": bath,
        "map": map,
        "image": image,
    };
}
