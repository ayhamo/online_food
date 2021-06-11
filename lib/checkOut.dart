import 'package:flutter/material.dart';
import 'main.dart';
import 'foodList.dart';

class CheckOutPage extends StatefulWidget {
  CheckOutPage();

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PaymentType pt = PaymentType.Cash;
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF7A9BEE),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('INVOICE',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  color: Colors.white)),
          centerTitle: true,
        ),
        body: Column(children: <Widget>[
          SizedBox(height: 20.0),
          Container(
              height: MediaQuery.of(context).size.height - 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 25, 0, 10),
                    child: Text("Your Total Price: $total \$",
                        style: TextStyle(
                            fontFamily: 'Montserrat', fontSize: 18.0)),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 16),
                          Text(
                            'Delivery Information',
                            style: TextStyle(
                                fontFamily: 'Montserrat', fontSize: 18.0),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    20,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your Name',
                                    labelText: 'Name',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    20,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your Phone Number',
                                    labelText: 'Phone Number',
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 8) {
                                      return 'Please enter a valid Phone';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    20,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your Province',
                                    labelText: 'Province',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid province';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    20,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your City',
                                    labelText: "City",
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the city you live in';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            width: MediaQuery.of(context).size.width - 20,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter your Delivery address',
                                  labelText: 'Delivery Address'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the delivery address';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Center(
                                child: Text("Payment Type",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 18.0))),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 70),
                                width: (MediaQuery.of(context).size.width / 2) -
                                    30,
                                child: ListTile(
                                  title: const Text('Cash'),
                                  leading: Radio(
                                    value: PaymentType.Cash,
                                    groupValue: pt,
                                    onChanged: (PaymentType? value) {
                                      setState(() {
                                        pt = value!;
                                        show = false;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    60,
                                child: ListTile(
                                  title: const Text('Visa'),
                                  leading: Radio(
                                    value: PaymentType.Visa,
                                    groupValue: pt,
                                    onChanged: (PaymentType? value) {
                                      setState(() {
                                        pt = value!;
                                        show = true;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          show
                              ? Row(
                                  children: [
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width /
                                                  2) -
                                              20,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter Credit Card No.',
                                            labelText: 'Credit Card Number'),
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length <= 16) {
                                            return 'Please enter Correct Credit Card number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width /
                                                  2) -
                                              20,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'On the back of the card',
                                            labelText: 'CCV'),
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length == 2) {
                                            return 'Please enter correct CCV';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              height: 65.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: InkWell(
                                child: Center(
                                  child: Text(' Confirm\nPurchase',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0)),
                                ),
                                onTap: () {
                                  if (!(_formKey.currentState!.validate())) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Please fill the required info!")));
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        // return object of type Dialog
                                        return ButtonBarTheme(
                                          data: ButtonBarThemeData(
                                              alignment:
                                                  MainAxisAlignment.center),
                                          child: AlertDialog(
                                            title: Icon(
                                              Icons
                                                  .check_circle_outline_rounded,
                                              color: Colors.green,
                                              size: 50,
                                            ),
                                            content: Text(
                                                'Thank you for your purchase\n Tracking ID: #2352452',
                                                textAlign: TextAlign.center),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    list.clear();
                                                    total = 0;
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        MyApp()),
                                                            (route) => false);
                                                  },
                                                  child: Text('OK',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors
                                                              .lightGreen))),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                              )),
                        ],
                      ),
                    ),
                  )
                ]),
              ))
        ]));
  }
}

enum PaymentType { Cash, Visa }
