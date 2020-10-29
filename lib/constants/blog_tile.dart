import 'package:NewsApp/views/article_view.dart';
import 'package:flutter/material.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  final DateTime publishedAt;
  
  BlogTile({this.imageUrl, this.title, this.desc, this.url, this.publishedAt});

  @override
  Widget build(BuildContext context) {
    final String _publishedAtString = "Published At: ${publishedAt.day}/${publishedAt.month}/${publishedAt.year}";
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl: url,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 2.0, color: Theme.of(context).dividerColor))),
        child: Container(
          margin: EdgeInsets.only(bottom: 16, top: 16),
          child: Column(children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                _publishedAtString,
                style: TextStyle(color: Colors.black54),
                maxLines: 2,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                desc,
                style: TextStyle(color: Colors.black54),
                maxLines: 2,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
