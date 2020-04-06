import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/views/category.dart';
import './article.dart';
import 'package:news_app/models/category_model.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> _categoryModel = new List<CategoryModel>();
  List<Article> _article = new List<Article>();
  bool _loading  = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryModel = getCategory();
    getNews();
  }

  getNews() async 
  {
    News newsClass = News();
    await newsClass.getNews();
    _article = newsClass.news;
    setState(() {
      
      _loading = false;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
       
        title: Row(
          children: <Widget>[
            Text("Latest"),
            Text("News",style: TextStyle(color: Colors.blue),)
          ],
          
        ),
          centerTitle: true,
           elevation: 0.0,
      ),
          body: _loading ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ))
           : SingleChildScrollView(
                      child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      itemCount: _categoryModel.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index)
                      {
                        return CategoryTile(
                          catName: _categoryModel[index].catName,
                          imgUrl: _categoryModel[index].imgUrl,
                        );
                      }),
                  ),
                  Container(
                    padding: EdgeInsets.only(top:16),

                    child: ListView.builder(
                      itemCount: _article.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      
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
                  )
                ],
              ),
            ),
          ),
      
    );
  }
}
class CategoryTile extends StatelessWidget {
  final String imgUrl,catName;
 CategoryTile({this.imgUrl,this.catName});

  @override
  Widget build(BuildContext context) {
    
    
    return GestureDetector(
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryView(category: catName),));
      },
          child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(child: CachedNetworkImage(
              imageUrl: imgUrl,
            height: 60,width: 120,fit: BoxFit.cover,),
            borderRadius: BorderRadius.circular(6),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,

              ),
              child: Text(catName,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),)
              )
          ],
        ),
        
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imgUrl,title,desc,blogUrl;
  BlogTile({@required this.imgUrl, @required this.title,this.desc,@required this.blogUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(blogUrl: blogUrl,)));
      },
          child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(10),
        child: Column(
          
          children: <Widget>[
            ClipRRect(child: Image.network(imgUrl),borderRadius: BorderRadius.circular(6),),
            SizedBox(height: 8,),
            Text(title,style: TextStyle(
              fontSize: 17,
              color: Colors.black87,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 8,),
            Text(desc,style: TextStyle(
              color: Colors.black54
            ),)
          ],
        ),
        
      ),
    );
  }
}