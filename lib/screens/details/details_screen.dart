import 'package:first_blog_post/shared/components/components.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create blog post'),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
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
