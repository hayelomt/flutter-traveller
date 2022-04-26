import 'package:flutter/material.dart';

class LandingScroller extends StatelessWidget {
  LandingScroller({Key? key}) : super(key: key);

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withAlpha(250),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: const [
          Place(
            travel: 'Trips',
            place: 'Sunset',
            image: 'assets/imgs/bg1.jpg',
            activeIndex: 0,
          ),
          Place(
            travel: 'Travel',
            place: 'Waterfalls',
            image: 'assets/imgs/bg2.jpg',
            activeIndex: 1,
          ),
          Place(
            travel: 'Experience',
            place: 'Mountains',
            image: 'assets/imgs/bg3.jpg',
            activeIndex: 2,
          ),
        ],
      ),
    );
  }
}

class Place extends StatelessWidget {
  const Place({
    Key? key,
    required this.travel,
    required this.place,
    required this.image,
    required this.activeIndex,
  }) : super(key: key);

  final String travel;
  final String place;
  final String image;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double topPadding = size.height * 0.15;

    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Stack(
            children: [
              Container(
                height: size.height * 0.6,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                top: -2,
                child: Container(
                  height: size.height * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.center,
                      end: FractionalOffset.topCenter,
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.white,
                      ],
                      stops: const [0.0, 1],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: topPadding, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(travel,
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 6.0),
                      Text(place,
                          style:
                              TextStyle(fontSize: 22.0, color: Colors.black45)),
                    ],
                  ),
                  Column(
                      children: List.generate(
                          3,
                          (index) => Container(
                                margin: EdgeInsets.only(bottom: 4.0),
                                height: index == activeIndex ? 24.0 : 8.0,
                                width: 8.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: index == activeIndex
                                      ? Color(0xff535CB6)
                                      : Colors.black26,
                                ),
                              )))
                ],
              ),
              SizedBox(height: 10.0),
              SizedBox(
                  width: size.width * 0.7,
                  child: Text(
                      'Nulla consequat massa quis Nulla consequat massa quis Nulla consequat massa'
                      'uis, Nulla consequat massa quis Nulla consequat massa quis Nulla consequat massa quis,',
                      style: TextStyle(color: Colors.black87.withOpacity(.8)))),
              SizedBox(height: 18.0),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('home');
                },
                child: Container(
                  height: 50,
                  width: 120,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Color(0xff535CB6),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.white, size: 6),
                        SizedBox(width: 2.0),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.white, size: 8),
                        SizedBox(width: 2.0),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.white, size: 10),
                        SizedBox(width: 2.0),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.white, size: 12),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
