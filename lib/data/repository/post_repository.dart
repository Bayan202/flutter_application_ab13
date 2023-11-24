import 'package:flutter_application_ab9/domain/entities/post_entities.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}
