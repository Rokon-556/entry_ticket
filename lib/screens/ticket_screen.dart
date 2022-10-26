import 'dart:developer';

import 'package:flutter/material.dart';

import '../services/service.dart';
import '../models/user_ticket_model.dart';
import 'my_ticket_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Items> _item = [];

  @override
  void initState() {
    super.initState();

    _getAllData();
  }

  void _getAllData() async {
    print('Get Init Data');
    UserTicketModel memberModel = (await ApiServiceData().getAllDataFromApi())!;

    _item.addAll(memberModel.items!);

    log("response data:  ${memberModel}");
    log("response data:  ${memberModel.items![0].pk}");

    setState(() {});
  }

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
          return Card(
            elevation: 3,
            child: Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: CircleAvatar(
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
                                'Order ID: ${_item[index].pk}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                'Ticket Price: ${_item[index].total}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          MyTicketScreen(_item[index].pk)));
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
                          Text('Purchase Date:${_item[index].sellDate}'),
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
        itemCount: _item.length,
      ),
    );
  }
}
