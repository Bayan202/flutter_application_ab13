import 'package:flutter_application_ab9/data/repository/post_repository.dart';
import 'package:flutter_application_ab9/domain/entities/post_entities.dart';

class GetPosts {
  final PostRepository repository;

  GetPosts(this.repository);

  Future<List<Post>> call() async {
    return repository.getPosts();
  }
}
