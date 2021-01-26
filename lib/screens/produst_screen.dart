import 'package:flutter/material.dart';
import 'package:flutter_app/pojo/model.dart';

class ProductScreen extends StatefulWidget {
  List<Product> subCategories;
  ScrollController scroll;
  Size size;
  ProductScreen(this.subCategories, this.scroll, this.size);

  @override
  _DemoClassState createState() => _DemoClassState();
}

class _DemoClassState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  @override
  // TODO: implement widget

  var controller = ScrollController();
  int aa = 1;
  @override
  void initState() {
    // TODO: implement initState
    widget.scroll.addListener(() {
      if (widget.scroll.position.pixels ==
          widget.scroll.position.maxScrollExtent) {
        setState(() {
          aa = aa + 1;
          print(aa);
        });
      } else {
        print("not");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: widget.subCategories.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext cntxt, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                width: widget.size.width * .45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Column(
                      //Image.network(widget.subCategories[index].imageName,fit: BoxFit.cover,)),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      widget.subCategories[index].imageName,
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, bottom: 8.0, top: 4),
                          child: Text(
                            widget.subCategories[index].name,
                            style: new TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          color: Colors.blue.shade400,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              widget.subCategories[index].priceCode,
                              style: new TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
