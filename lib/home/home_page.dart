import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
  List<String> _images = List();
  List<String> _headers = List();

  @override
  void initState() {
    _images
      ..add('images/img1.jpg')
      ..add('images/img2.jpg')
      ..add('images/img3.jpg')
      ..add('images/img4.jpg');
    _headers
      ..add('First Image')
      ..add('Second Image')
      ..add('Third Image')
      ..add('Fourth Image');
    super.initState();
  }

  Widget _customScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 250.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Collapsing Toolbar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  )),
              background: Swiper(
                itemCount: _images.length,
                itemBuilder: (BuildContext context, int index) => Image.asset(
                  _images[index],
                  fit: BoxFit.cover,
                ),
                autoplay: true,
              )),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 75,
                      color: Colors.black12,
                    ),
                  ),
              childCount: 10),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _customScrollView(),
    );
  }
}
