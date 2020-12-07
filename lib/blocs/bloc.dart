import 'dart:async';

import 'package:first_blog_post/models/post_model.dart';

// this bloc model for have stream controller
class BlocPostModel {
  // create stream to control the data
  final StreamController<List<PostModel>> _controller =
      StreamController<List<PostModel>>.broadcast();
  // get data from the stream
  Stream<List<PostModel>> get outData => _controller.stream;
  // add data to the stream
  Sink<List<PostModel>> get _inData => _controller.sink;

  // fill the stream with dummy list of dummy data
  // here inside the class constructor
  BlocPostModel() {
    // delay for 3 seconds before fill the stream with data
    Future.delayed(Duration(seconds: 3)).then((value) {
      _inData.add([
        PostModel(
            id: 1,
            author: 'Author',
            content:
                'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
            publishDate: DateTime.now(),
            title: 'Blog Post 1'),
        PostModel(
            id: 2,
            author: 'Author',
            content:
                'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
            publishDate: DateTime.now(),
            title: 'Blog Post 2'),
        PostModel(
            id: 3,
            author: 'Author',
            content:
                'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
            publishDate: DateTime.now(),
            title: 'Blog Post 3'),
        PostModel(
            id: 4,
            author: 'Author',
            content:
                'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
            publishDate: DateTime.now(),
            title: 'Blog Post 4'),
        PostModel(
            id: 5,
            author: 'Author',
            content:
                'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
            publishDate: DateTime.now(),
            title: 'Blog Post 5'),
        PostModel(
            id: 6,
            author: 'Author',
            content:
                'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
            publishDate: DateTime.now(),
            title: 'Blog Post 6'),
        PostModel(
            id: 7,
            author: 'Author',
            content:
                'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
            publishDate: DateTime.now(),
            title: 'Blog Post 7'),
        PostModel(
            id: 8,
            author: 'Author',
            content:
                'AuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthorAuthor',
            publishDate: DateTime.now(),
            title: 'Blog Post 8')
      ]);
    });
  }

  // stop the stream
  void dispose() {
    _controller.close();
  }
}
