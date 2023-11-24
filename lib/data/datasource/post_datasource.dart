import 'package:flutter_application_ab9/data/models/jsonn.dart';

import 'package:flutter_application_ab9/data/repository/dios.dart';

class PostDataSource {
  final MyApi api;

  PostDataSource(this.api);

  Future<Future<List<Post>>> getPosts() async {
    return api.getPosts();
  }
}
