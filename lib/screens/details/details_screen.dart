import 'dart:math';

import 'package:first_blog_post/blocs/bloc.dart';
import 'package:first_blog_post/models/post_model.dart';
import 'package:first_blog_post/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DetailsScreen extends StatelessWidget {
  // SECOND get the registered instance of the Bloc
  BlocPostModel get _streamOfPosts => GetIt.I<BlocPostModel>();

  // receive a post to separate between Edit and Create Mode
  DetailsScreen({this.postModel}) {
    // here inside the initialization
    // if we have data on postModel (we editing)
    if (isEditing) {
      // access these data and display them inside the text fields
      _titleController.text = postModel.title;
      _contentController.text = postModel.content;
      _authorController.text = postModel.author;
    }
  }

  final PostModel postModel;

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _authorController = TextEditingController();

  // create getter property
  // this make sense if there is a post so we in edit mode
  bool get isEditing => postModel != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(isEditing ? 'Edit Post' : 'Create Post'),
          elevation: 0.0,
          actions: <Widget>[
            isEditing
                ? IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _streamOfPosts.deleteBlogPost(postModel.id);
                      Navigator.of(context).pop();
                    },
                  )
                : SizedBox()
          ],
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              defaultTextField(controller: _titleController, hint: 'Title'),
              Container(
                height: 12,
              ),
              defaultTextField(controller: _contentController, hint: 'Content'),
              Container(
                height: 12,
              ),
              defaultTextField(controller: _authorController, hint: 'Author'),
              Container(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                    onPressed: () {
                      // after Finish BlocPostModel code
                      // FIRST get new post data from the user
                      final post = PostModel(
                          title: _titleController.text,
                          content: _contentController.text,
                          author: _authorController.text,
                          // get the post id to update post and add to stream
                          id: isEditing
                              ? this.postModel.id
                              : Random().nextInt(100000),
                          publishDate: DateTime.now());
                      if (isEditing) {
                        // save changes to the list
                        _streamOfPosts.updateBlogPost(post);
                      } else {
                        // THIRD pass the new post to the stream
                        _streamOfPosts.addBlogPost(post);
                      }
                      Navigator.of(context).pop();
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text('Save', style: TextStyle(color: Colors.white))),
              )
            ],
          ),
        ));
  }
}
