import 'package:flutter/material.dart';

class DetailArgs {
  String imgPath;
  String tag;

  DetailArgs(this.imgPath, this.tag);
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailArgs;
    final size = MediaQuery.of(context).size;
    final imgHeight = size.height * .55;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: imgHeight,
            width: double.infinity,
            child: Stack(
              children: [
                SizedBox(
                  height: imgHeight,
                  child: Hero(
                    tag: args.tag,
                    child: Image(
                      image: AssetImage(args.imgPath),
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.noRepeat,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: buildMiniList(),
                ),
              ],
            ),
          ),
          _buildAppBar(context),
          Container(
            margin: EdgeInsets.only(top: imgHeight - 30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: buildSummary(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 65.0,
              margin: EdgeInsets.only(left: 10.0, right: 10, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Row(
                children: const [
                  Expanded(
                      child: Center(
                          child: Text('BOOK NOW',
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 4.0,
                                  fontWeight: FontWeight.bold)))),
                  Icon(Icons.arrow_forward_ios, color: Colors.white),
                  SizedBox(width: 16.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSummary() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ras Dashen\nMountain',
                    style:
                        TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold)),
                Row(
                  children: const [
                    Text('\$98',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22.0)),
                    SizedBox(width: 4.0),
                    Text('/person')
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text('Overview',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0)),
            SizedBox(height: 14.0),
            Row(
              children: [
                Row(
                  children: [
                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child:
                            Icon(Icons.watch_later, color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('DURATION',
                            style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                        SizedBox(height: 2.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text(
                              '3',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(width: 4.0),
                            Text('hours',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(Icons.star, color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('RATING',
                            style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                        SizedBox(height: 2.0),
                        Text('3.5 out of 5',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Text(
                "As you can see from the output, the widget returned by"
                " flightShuttleBuilder will be displayed during transition."
                " The position of the in-flight widget is always the same as"
                " the position of the widget during the transition. In other"
                " words, the new widget is animated to the position on the new"
                " route. Although we only define flightShuttleBuilder on the"
                " second page's Hero, it turns out that the custom widget is"
                " displayed during the transition from the first",
                style: TextStyle(height: 1.6, color: Colors.black54)),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Container buildMiniList() {
    return Container(
      margin: EdgeInsets.only(right: 20, bottom: 40),
      // height: 50,
      // width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.white, width: 4),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage('assets/imgs/mountain4.jpg'),
                      fit: BoxFit.cover))),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.white, width: 4),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage('assets/imgs/mountain2.jpg'),
                      fit: BoxFit.cover))),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.white, width: 4),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage('assets/imgs/mountain3.jpg'),
                      fit: BoxFit.cover))),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                child: Center(
                    child: Icon(Icons.arrow_back_ios_sharp,
                        color: Colors.blue, size: 16)),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.grey, width: 4),
                ),
              ),
            ),
            Container(
              child: Center(
                  child: Icon(Icons.favorite_outline,
                      color: Colors.blue, size: 16)),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.grey, width: 4),
              ),
            ),
          ],
        ));
  }
}
