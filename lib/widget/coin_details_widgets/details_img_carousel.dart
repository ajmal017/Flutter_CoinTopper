import 'package:carousel_slider/carousel_slider.dart';
import 'package:cointopper/entities/guides_entity.dart';
import 'package:flutter/material.dart';

class DetailsImageCarousel extends StatefulWidget {
  final List<GuidesEntity> guides;

  DetailsImageCarousel(this.guides);

  @override
  _DetailsImageCarouselState createState() => _DetailsImageCarouselState();
}

class _DetailsImageCarouselState extends State<DetailsImageCarousel> {
  @override
  Widget build(BuildContext context) {
    Widget carousel = widget.guides == null
        ? Center(
            child: Container(
              child: Text(
                "No Data Available",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          )
        : CarouselSlider(
            options: CarouselOptions(
              height: 120,
              autoPlay: true,
              viewportFraction: 1,
              aspectRatio: 1.5,
              enlargeCenterPage: true,
            ),
            items: widget.guides.map<Widget>((data) {
              return new Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(),
                  child: Container(
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.network(
                                data.photoFile,
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.titleEN,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          )),
                    ),
                  ));
            }).toList(),
          );
    return widget.guides != null
        ? Container(
            color: Colors.grey[100],
            child: Column(
              children: <Widget>[carousel],
            ),
          )
        : Container(
            child: Center(
              child: Text("No data"),
            ),
          );
  }
}
