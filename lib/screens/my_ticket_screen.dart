import 'dart:developer';

import 'package:entry_ticket/models/my_ticket_model.dart';
import 'package:flutter/material.dart';

import '../services/service.dart';

class MyTicketScreen extends StatefulWidget {
  final token;
  const MyTicketScreen(this.token, {super.key});

  @override
  State<MyTicketScreen> createState() => _MyTicketScreenState();
}

class _MyTicketScreenState extends State<MyTicketScreen> {
  final List<MyItems> _myItem = [];

  void _getMyAllData() async {
    MyTicketModel ticketModel =
        (await ApiServiceData().getAllMyData('${widget.token}'))!;

    _myItem.addAll(ticketModel.items!);

    log("response data:  ${ticketModel}");
    log("response data:  ${ticketModel.items![0].pk}");

    setState(() {});
  }

  @override
  void initState() {
    _getMyAllData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MY TICKET',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: double.infinity,
            color: const Color(0xfffbe5ae),
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  right: 20,
                  left: 20,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.5, color: Theme.of(context).primaryColor),
                        color: const Color(0xffbf9c9c)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Image.asset('assets/images/logo.png'),
                              const Text('Wari'),
                              Divider(
                                color: Theme.of(context).primaryColor,
                              ),
                              const Text('Uttara'),
                              Divider(
                                color: Theme.of(context).primaryColor,
                              ),
                              const Text('Mirpur'),
                              Divider(
                                color: Theme.of(context).primaryColor,
                              ),
                              const Text('Bashundhara'),
                              Divider(
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              for (int i = 1; i <= 48; i++)
                                i.isEven
                                    ? Container(
                                        width: 4,
                                        height: 4,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                      )
                                    : const SizedBox(height: 3),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Child Ticket',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              for (int i = 0; i < _myItem.length; i++)
                                Text(
                                  'Serial Number: ${_myItem[i].pk}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              for (int i = 0; i < _myItem.length; i++)
                                Text(
                                  'Quantity: ${_myItem[i].qty}',
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.red),
                                ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.green),
                                child: const Text(
                                  'Price:0',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ]),
                  ),
                ),
                Positioned(
                  top: 10,
                  bottom: 300,
                  left: -45,
                  right: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xfffbe5ae), shape: BoxShape.circle),
                  ),
                ),
                Positioned(
                  left: 140,
                  right: 200,
                  top: 50,
                  bottom: -30,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xfffbe5ae), shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Colors.white,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        normText('Order Id'),
                        colorText('45463', context),
                        normText('Ticket purchase date'),
                        colorText('24th may 2022', context),
                        normText('Ticket Expairy Date'),
                        colorText('None', context),
                        normText('Price'),
                        colorText('0 tk', context),
                      ],
                    ),
                    Image.asset(
                      'assets/images/qr.png',
                      fit: BoxFit.cover,
                    ),
                  ]),
            ),
          ))
        ],
      ),
    );
  }

  Text colorText(String digit, BuildContext context) => Text(
        digit,
        style: TextStyle(fontSize: 13, color: Theme.of(context).primaryColor),
      );

  Text normText(String text) => Text(
        text,
        style: const TextStyle(fontSize: 13, color: Colors.grey),
      );
}
