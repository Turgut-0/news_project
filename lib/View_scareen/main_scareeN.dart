import 'package:flutter/material.dart';
import 'package:news_project/models/modelsNews.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/newsDatA.dart';

class main_ScreeN extends StatefulWidget {
  const main_ScreeN({Key? key}) : super(key: key);

  @override
  State<main_ScreeN> createState() => _main_ScreeNState();
}

class _main_ScreeNState extends State<main_ScreeN> {
  List<Article>? articles;

  @override
  void initState() {
    super.initState();

    news_servies.getNewsInfo().then((value) {
      setState(() {
        articles = value!;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          child: Text(
            'News Flutte',
            style: TextStyle(color: Colors.black45),
          ),
          color: Colors.white,
        ),
      ),
      body: Center(
          child: FutureBuilder<Article>(builder: (context,snapshot){

            if (articles!.isNotEmpty) {
              return ListView.builder( itemCount: articles!.length, itemBuilder: (context,index){
                return GestureDetector(
                  onTap: () async {
                    await launch(articles![index].url.toString());
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(articles![index].urlToImage.toString()),

                        ListTile(
                          leading: Icon(Icons.arrow_drop_down_circle),
                          title: Text(articles![index].title.toString()),
                          //subtitle: Text(articles![index].author.toString()),
                        ),

                        /*Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(articles![index].description.toString()),
                        ),*/
                      ],
                    ),
                  ),
                );

              });
            }else{
              return CircularProgressIndicator();
            }
          })
      ),
    );
  }
}

class newCard extends StatelessWidget {
  String imageNet =
      'https://trthaberstatic.cdn.wp.trt.com.tr/mobile/static/images/trt-haber-share-logo.png';
  String title = 'sss';
  String url = 'sss';
  //int leth = 2;

  newCard(this.imageNet, this.title, this.url);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 3, itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () async {
          await launch(url);
        },
        child: Card(
          child: Column(
            children: [
              Image.network(imageNet),

              ListTile(
                leading: Icon(Icons.arrow_drop_down_circle),
                title: Text(title),
                //subtitle: Text(articles![index].author.toString()),
              ),

              /*Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(articles![index].description.toString()),
                      ),*/
            ],
          ),
        ),
      );
    });
  }
}

