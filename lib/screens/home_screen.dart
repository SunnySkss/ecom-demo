import 'package:flutter/material.dart';
import 'package:flutter_app/common_widgets/loader.dart';
import 'package:flutter_app/model/request_product.dart';
import 'package:flutter_app/screens/produst_screen.dart';
import 'package:flutter_app/util/notifier.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    getData();

    super.initState();
  }
  int aa=1;

  var controller= ScrollController();
  getTabs(List<String> tabNames){
    List<Tab> tabs=List();
    tabNames.map((e) {
      tabs.add(Tab(
        child: Text(e,),
      ));
    }).toList();
    return tabs;
  }
  getData(){
    Provider.of<MyNotifier>(context,listen: false).getAllCategories(
        new RequestClass(categoryId: 0,deviceManufacturer: "Google",deviceModel: "Android SDK built for x86",deviceToken: "",pageIndex: 1));
  }
  var scroll= ScrollController();
  Size size;
  @override
  Widget build(BuildContext context) {

    size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Consumer<MyNotifier>(builder: (context,model,child){
        return model.result == null?
        Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title),
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                  icon: Icon(
                      Icons.filter_alt_outlined), onPressed: (){

              }),
              IconButton(
                  icon: Icon(
                      Icons.search), onPressed: (){

              }),

            ],
          ),
          body: Center(child: ShimmerLoader(),),
        ):
        DefaultTabController(
          length: model.tabNames.length,
          child: Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(widget.title),
              backgroundColor: Colors.black,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(55),
                child: TabBar(
                  tabs: getTabs(model.tabNames),
                  isScrollable: true,
                ),
              ),
              actions: [
                IconButton(
                    icon: Icon(
                        Icons.filter_alt_outlined), onPressed: (){

                }),
                IconButton(
                    icon: Icon(
                        Icons.search), onPressed: (){

                }),

              ],
            ),
            body:TabBarView(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.

              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  padding: EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      ListView.builder(
                          itemCount: model.result.category[0].subCategories.length,
                          controller: scroll,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                            var products=model.result.category[0].subCategories[index].product;
                            return Container(
                              height: 180,
                              width: size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(model.result.category[0].subCategories[index].name,
                                    style: new TextStyle(
                                        fontSize: 16,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ProductScreen(products,scroll,size),
                                ],
                              ),
                            );

                          })
                    ],
                  ),
                ),

                Container(
                  child: Text("From B"),
                ),
                Container(
                  child: Text("From C"),
                ),
                Container(
                  child: Text("From C"),
                ),
                Container(
                  child: Text("From C"),
                ),
                Container(
                  child: Text("From C"),
                ),
                Container(
                  child: Text("From C"),
                ),
                Container(
                  child: Text("From C"),
                ),
                Container(
                  child: Text("From C"),
                ),
                Container(
                  child: Text("From C"),
                ),
              ],

            ),

          ),
        );
      }),
    );

  }
}

