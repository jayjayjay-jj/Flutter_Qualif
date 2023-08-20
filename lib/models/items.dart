import 'package:qualif/models/comments.dart';

class Items {
  String name;
  String description;
  String price;
  String image;
  List<Comments> comments;

  Items({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.comments,
  });
}
