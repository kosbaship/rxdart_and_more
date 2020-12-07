import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // // this how we display our date
  // String formatDate(DateTime date) {
  //   return '${date.day}/${date.month}/${date.year}';
  // }

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
          /*Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => DetailsScreen()));*/
        },
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 8, bottom: 8),
                child: InkWell(
                  onTap: () {
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (_) => DetailsScreen()));
                  },
                  // ====================== Container As a Card
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // ====================== List Item Title
                        Text(
                          "blogPost.title",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 4),
                        // ====================== List Item Date
                        Text(
                          // formatDate(DateTime.now()),
                          'date',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
