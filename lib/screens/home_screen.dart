import 'package:flutter/material.dart';
import 'package:travel_app/screens/detail_screen.dart';

class Category {
  String text;
  Color color;
  IconData icon;

  Category(this.text, this.color, this.icon);
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text('Discover',
                      style: TextStyle(
                          fontSize: 28.0, fontWeight: FontWeight.bold))),
              _buildTabs(),
              Container(
                height: 280,
                margin: EdgeInsets.only(top: 12.0),
                child: _buildImageList(),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Text('Explore more',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold))),
              SizedBox(height: 8.0),
              SizedBox(
                height: 100,
                child: _buildMoreList(),
              ),
              SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoreList() {
    final categories = [
      Category('Football', Colors.green, Icons.sports_football),
      Category('Hiking', Colors.black26, Icons.terrain),
      Category('Soccer', Colors.blueAccent, Icons.sports_soccer),
      Category('Soccer', Colors.blueGrey, Icons.downhill_skiing),
      Category('Football', Colors.green, Icons.sports_football),
      Category('Hiking', Colors.black26, Icons.terrain),
      Category('Soccer', Colors.blueAccent, Icons.sports_soccer),
      Category('Soccer', Colors.blueGrey, Icons.downhill_skiing),
      Category('Football', Colors.green, Icons.sports_football),
      Category('Hiking', Colors.black26, Icons.terrain),
      Category('Soccer', Colors.blueAccent, Icons.sports_soccer),
      Category('Soccer', Colors.blueGrey, Icons.downhill_skiing),
    ];

    return ListView.builder(
      itemCount: categories.length,
      padding: EdgeInsets.only(left: 20),
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, i) => Container(
        margin: EdgeInsets.only(right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: categories[i].color.withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Center(
                        child: Icon(
                      categories[i].icon,
                      color: categories[i].color,
                      size: 32.0,
                    )))),
            SizedBox(height: 4),
            Text(
              categories[i].text,
              style: TextStyle(
                  color: categories[i].color, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget _imageCard(BuildContext context, String img, int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          'detail',
          arguments: DetailArgs(img, 'detail$index'),
        );
      },
      child: Container(
        height: 280,
        width: 200,
        margin: EdgeInsets.only(right: 12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Hero(
            tag: 'detail$index',
            child: Image(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageList() {
    return ListView.builder(
      padding: EdgeInsets.only(left: 20.0),
      itemCount: 10,
      itemBuilder: (context, int i) =>
          _imageCard(context, 'assets/imgs/mountain${i % 4 + 1}.jpg', i),
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Text('Places',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.only(top: 6.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.deepPurpleAccent),
              )
            ],
          ),
          SizedBox(width: 20),
          Text('Inspiration',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black38)),
          SizedBox(width: 20),
          Text('Emotions',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black38)),
        ],
      ),
    );
  }
}
