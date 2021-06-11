import 'package:flutter/material.dart';
import 'detailsPage.dart';
import 'cartPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Healthylicious Kitchen",
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Text('Welcome, Order Now!',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0)),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 120.0),
            child: Row(
              children: <Widget>[
                Text('Healthy',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Food Menu',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Container(
            height: MediaQuery.of(context).size.height - 130.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 260.0,
                        child: ListView(children: [
                          _buildFoodItem('assets/plate1.png', 'Salmon bowl',
                              24.50, '300', '200', 'A,B', '250'),
                          _buildFoodItem('assets/plate2.png', 'Spring bowl',
                              22.00, '200', '150', 'A,B', '1'),
                          _buildFoodItem('assets/plate3.png', 'Salmon Salad',
                              24.00, '69', '876', 'BC', '250'),
                          _buildFoodItem('assets/plate4.png', 'Curry Rice bowl',
                              24.00, '69', '876', 'BC', '250'),
                          _buildFoodItem('assets/plate5.png', 'Berry bowl',
                              24.00, '69', '876', 'BC', '250'),
                          _buildFoodItem('assets/plate6.png', 'Avocado bowl',
                              26.00, '900', '23', 'fucku', '-10'),
                          _buildFoodItem(
                              'assets/plate7.png',
                              'Rack lamb with potatoes',
                              24.00,
                              '69',
                              '876',
                              'BC',
                              '250'),
                          _buildFoodItem(
                              'assets/plate8.png',
                              'Steak with fries',
                              24.00,
                              '69',
                              '876',
                              'BC',
                              '250'),
                          _buildFoodItem(
                              'assets/plate9.png',
                              'Grilled Rabbit meat',
                              24.00,
                              '69',
                              '876',
                              'BC',
                              '250'),
                          _buildFoodItem(
                              'assets/plate10.png',
                              'Fried duck breasts',
                              24.00,
                              '69',
                              '876',
                              'BC',
                              '250'),
                          _buildFoodItem(
                              'assets/plate11.png',
                              'Rice Smoked vegetables',
                              24.00,
                              '69',
                              '876',
                              'BC',
                              '250'),
                        ]))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartPage()));
                      },
                      child: Container(
                        height: 65.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Icon(Icons.shopping_basket,
                              color: Colors.black, size: 40),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName, double price,
      String weight, String cal, String vit, String pro) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                        heroTag: imgPath,
                        foodName: foodName,
                        foodPrice: price,
                        weight: weight,
                        cal: cal,
                        vit: vit,
                        pro: pro,
                      )));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(children: [
                  Hero(
                      tag: imgPath,
                      child: Image(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0)),
                  SizedBox(width: 10.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(foodName,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                        Text('\$$price',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                color: Colors.grey))
                      ])
                ])),
                Icon(
                  Icons.search,
                  color: Colors.black,
                )
              ],
            )));
  }
}
