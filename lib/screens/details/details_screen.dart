import 'package:first_blog_post/models/post_model.dart';
import 'package:first_blog_post/shared/components/components.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
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
  };
  final PostModel postModel;

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _authorController = TextEditingController();

  // create getter proparty
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
                    onPressed: () {},
                    color: Theme.of(context).primaryColor,
                    child: Text('Save', style: TextStyle(color: Colors.white))),
              )
            ],
          ),
        ));
  }
}
