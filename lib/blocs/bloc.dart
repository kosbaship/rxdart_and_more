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

  // 1- hold list of posts (that in UI) here locally
  List<PostModel> _postModel;

  // fill the stream with dummy list of dummy data
  // here inside the class constructor
  BlocPostModel() {
    // delay for 3 seconds before fill the stream with data
    Future.delayed(Duration(seconds: 3)).then((value) {
      // 2 - get current list of posts and save it locally
      outData.listen((data) {
        _postModel = data;
      });

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

  // add new post to the list
  void addBlogPost(PostModel postModel) {
    // 3 - add (created) post to the list (this only one)
    _postModel.add(postModel);
    // 4 - add whole list into sink (stream)
    _inData.add(_postModel);
  }

  void updateBlogPost(PostModel postModel) {
    //again we save the whole list locally in the above list (_postModel) that initialized with the constructor
    // this variable hold (index to take action on it)
    final index = _postModel.indexOf(
        //return the post that meets this condition
        //  p.id ==> local list id
        //  postModel.id ==> id comes from the user
        // first function on the list to get the first match
        _postModel.where((p) => p.id == postModel.id).first);

    // add the post from the user to the local list override this index
    _postModel[index] = postModel;
    // add whole list (local list) into sink (stream)
    // to be updated in the ui
    _inData.add(_postModel);
  }

  // delete from the  (local list) here in this file and
  // it will affect the ui
  // cause we pass it to the stream
  void deleteBlogPost(int id) {
    _postModel.removeWhere((bp) => bp.id == id);
    // add the whole list to the stream after
    // deleting from to
    _inData.add(_postModel);
  }

  // stop the stream
  void dispose() {
    _controller.close();
  }
}
