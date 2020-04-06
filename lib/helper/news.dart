import 'dart:convert';

import 'package:news_app/models/article.dart';
import 'package:http/http.dart' as http;

class News
{
  List<Article> news  = [];
  Future<void> getNews() async{
    String url = "http://newsapi.org/v2/top-headlines?country=in&category=general&apiKey=fab90806d7df4a2e9b362adfb79611b8";
    var response = await http.get(url);
    var jsondata = jsonDecode(response.body);
    if(jsondata['status'] == "ok")
    {
      jsondata["articles"].forEach((element){
          if(element["urlToImage"]!= null && element["description"]!=null)
          {
              Article _article = Article(
                
                    title: element['title'],
            author: element['author'],
            desp: element['description'],
            urlToImg: element['urlToImage'],
           
            content: element["content"],
            url: element["url"],
              );
              news.add(_article);
          }
          

      });
    }

    
  }
}


class CatNews
{
  final String category;
  CatNews({this.category});
  List<Article> news  = [];
  Future<void> getCatNews() async{
    String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=fab90806d7df4a2e9b362adfb79611b8";
    var response = await http.get(url);
    var jsondata = jsonDecode(response.body);
    if(jsondata['status'] == "ok")
    {
      jsondata["articles"].forEach((element){
          if(element["urlToImage"]!= null && element["description"]!=null)
          {
              Article _article = Article(
                
                    title: element['title'],
            author: element['author'],
            desp: element['description'],
            urlToImg: element['urlToImage'],
           
            content: element["content"],
            url: element["url"],
              );
              news.add(_article);
          }
          

      });
    }

    
  }
}