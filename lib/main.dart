import 'package:entry_ticket/models/user_data.dart';
import 'package:entry_ticket/screens/my_ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: const Color(0xFFFF8C1A),
//primarySwatch: Color(0xFFFF8C1A),
          textTheme: const TextTheme(
              titleMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              bodyLarge: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w400),
              bodyMedium: TextStyle(fontSize: 11, fontWeight: FontWeight.w400)),
          fontFamily: 'Poppins'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<UserData> user = getUser();

  MyHomePage({super.key});
  static List<UserData> getUser() {
    final data = [
      {
        'userId': '1',
        'orderId': '1',
        'price': 23.99,
        'date': DateTime.now(),
      },
      {
        'userId': '2',
        'orderId': '2',
        'price': 24.99,
        'date': DateTime.now(),
      },
      {
        'userId': '4',
        'orderId': '2',
        'price': 12.99,
        'date': DateTime.now(),
      }
    ];
    return data.map<UserData>(UserData.fromJson).toList();
  }

  //const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TICKETS'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: Icon(Icons.arrow_back),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final userData = user[index];
          final date = DateFormat.yMd().format(userData.date);
          return Card(
            elevation: 3,
            child: Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              // padding: EdgeInsets.symmetric(horizontal: 10),
              //color: Colors.amber,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: CircleAvatar(
                            //backgroundImage:  AssetImage('assets/images/logo.png',),
                            child: Image.asset('assets/images/logo.png'),
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'This Is Your Ticket',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                'Order ID: ${userData.orderId}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                'Ticket Price: ${userData.price}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const MyTicketScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor),
                                child: Text(
                                  'Activate',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: CircleAvatar(
                            child: Image.asset('assets/images/qr3.png'),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Purchase Date:$date'),
                          //Text('Purchased Date: ${userData.date}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Details',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_circle_right,
                                    color: Theme.of(context).primaryColor,
                                  ))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: user.length,
      ),
    );
  }
}

  



  




