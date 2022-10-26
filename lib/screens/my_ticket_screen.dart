import 'package:flutter/material.dart';

class MyTicketScreen extends StatelessWidget {
  const MyTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List place = ['Uttara', 'Wari', 'Badda', 'Mirpur'];

    String getPlace() {
      for (var p in place) {
        return p;
      }
      return getPlace();
    }

    return Scaffold(
      //backgroundColor: Color(0xffefcbd8),
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
      //Color(0xffbf9c9c)
      //Color(0xfff79999)
      //fbe5ae
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
                    //color: Colors.red,
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
                              for (int i = 1; i <= 47; i++)
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
                              Text(
                                'Serial Number: 12322',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const Text(
                                'Quantity',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.red),
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
                  bottom: 320,
                  left: 5,
                  right: 60,
                  child: Container(
                    height: 5,
                    width: 5,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                  ),
                ),
                Positioned(
                  left: 50,
                  right: 110,
                  top: 2,
                  bottom: 120,
                  child: Container(
                    height: 5,
                    width: 5,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
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
              child: Row( children: [
                //Divider(color: Theme.of(context).primaryColor,height: 3,),
                Container(height: 3,width: 20,color: Colors.amber,),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
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
