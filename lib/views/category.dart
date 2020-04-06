import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/category_model.dart';
import './home.dart';
class CategoryView extends StatefulWidget {
  final String category;
  CategoryView({this.category});
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
   List<CategoryModel> _categoryModel = new List<CategoryModel>();
  List<Article> _article = new List<Article>();
  bool _loading  = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }
  getNews() async 
  {
    CatNews newsClass = CatNews(category: widget.category);
    await newsClass.getCatNews();
    _article = newsClass.news;
    setState(() {
      
      _loading = false;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Row(
          children: <Widget>[
            Text(widget.category),
            Text("News",style: TextStyle(color: Colors.blue),)
          ],
          
        ),
      ),

      body: _loading ? Center(child: CircularProgressIndicator(),) : ListView.builder(
                      itemCount: _article.length,
                      // shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      
                      itemBuilder: (context,index)
                      {
                        return BlogTile(
                          imgUrl: _article[index].urlToImg,
                          title: _article[index].title,
                          desc: _article[index].desp,
                          blogUrl: _article[index].url,
                        );
                      },
                    ),
      
    );
  }
}