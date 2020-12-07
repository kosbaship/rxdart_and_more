import 'package:first_blog_post/blocs/bloc.dart';
import 'package:first_blog_post/models/post_model.dart';
import 'package:first_blog_post/screens/details/details_screen.dart';
import 'package:first_blog_post/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatelessWidget {
  // get the registered instance of the Bloc
  BlocPostModel get _streamOfPosts => GetIt.I<BlocPostModel>();

  // // this how we display our date
  String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Feed"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        elevation: 30,
        child: Icon(Icons.add),
        onPressed: () {
          navigateTo(context, DetailsScreen());
        },
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          // wrap the list view with StreamBuilder
          // to read from stream flutter way
          child: StreamBuilder<List<PostModel>>(
              // pass the steam in order to make stream builder parse it
              stream: _streamOfPosts.outData,
              builder: (context, snapshot) {
                // if the data snapshot is empty return progress bar
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                // receive the list of posts from the stream
                final posts = snapshot.data;

                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    // extract every post from the list
                    final post = posts[index];

                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 8, bottom: 8),
                      child: InkWell(
                        onTap: () {
                          navigateTo(context, DetailsScreen());
                        },
                        // ====================== Container As a Card
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // ====================== List Item Title
                              Text(
                                // extract post title
                                post.title,
                                // posts.title,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 4),
                              // ====================== List Item Date
                              Text(
                                // extract post publish date
                                formatDate(post.publishDate),
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              })),
    );
  }
}
