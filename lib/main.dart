// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

// ignore: curly_braces_in_flow_control_structures
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Clock(),
    );
  }
}

class Clock extends StatelessWidget {
  Clock({
    Key? key,
  }) : super(key: key);

  Color firstcolor = const Color.fromARGB(255, 73, 84, 100);
  Color secondcolor = const Color.fromARGB(100, 187, 191, 202);
  Color thirdcolor = const Color.fromARGB(255, 232, 232, 232);
  Color fourthcolor = const Color.fromARGB(255, 244, 244, 244);

  Stream<Map<String, int>> seqAsyncValues() async* {
    for (var i = 0;; i++) {
      DateTime date = DateTime.now();
      await Future.delayed(const Duration(milliseconds: 10));
      Map<String, int> dateMap = {
        'hours': date.hour,
        'minutes': date.minute,
        'seconds': date.second,
        'mesconds': date.millisecond,
      };

      yield dateMap;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: fourthcolor,
        appBar: AppBar(
          title: const Center(child: Text('Flutter Clock')),
          backgroundColor: firstcolor,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  alignment: AlignmentDirectional.center,
                  decoration:
                      BoxDecoration(color: secondcolor, shape: BoxShape.circle),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      //Hours Angle
                      StreamBuilder<dynamic>(
                          initialData: const {
                            'hours': 0,
                            'minutes': 0,
                            'seconds': 0,
                            'mesconds': 0,
                          },
                          stream: seqAsyncValues(),
                          builder: (context, data) {
                            {
                              return Transform.rotate(
                                angle: ((data.data['hours'] - 12) * 60 +
                                        data.data['minutes']) *
                                    ((pi / 180) * 0.5),
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: firstcolor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        )),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ))
                                  ],
                                ),
                              );
                            }
                          }), //end of hours angle

                      //Minutes Angle
                      StreamBuilder<dynamic>(
                          stream: seqAsyncValues(),
                          builder: (context, data) {
                            if (!data.hasData) {
                              return const CircularProgressIndicator();
                            } else {
                              return Transform.rotate(
                                angle: (((data.data!['minutes']) * 60 +
                                        data.data['seconds']) *
                                    ((pi / 180) * 0.1)),
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: firstcolor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.015,
                                        )),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ))
                                  ],
                                ),
                              );
                            }
                          }), //end of Minutes angle
                      //seconds angle
                      StreamBuilder<dynamic>(
                          stream: seqAsyncValues(),
                          builder: (context, data) {
                            if (!data.hasData) {
                              return const CircularProgressIndicator();
                            } else {
                              return Transform.rotate(
                                angle: ((data.data['seconds'] * 1000 +
                                        data.data['mesconds']) *
                                    ((pi / 180) * 0.006)),
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        )),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        color: Colors.red,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ))
                                  ],
                                ),
                              );
                            }
                          }), //end of seconds angle
                      Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                          color: firstcolor,
                          shape: BoxShape.circle,
                        ),
                      ),

                      const Numbers(),
                      Transform.rotate(
                        angle: (pi / 180) * 30,
                        child: const Numbers(),
                      ),
                      Transform.rotate(
                        angle: (pi / 180) * 60,
                        child: const Numbers(),
                      ),
                      Transform.rotate(
                        angle: (pi / 180) * 90,
                        child: const Numbers(),
                      ),
                      Transform.rotate(
                        angle: (pi / 180) * 120,
                        child: const Numbers(),
                      ),
                      Transform.rotate(
                        angle: (pi / 180) * 150,
                        child: const Numbers(),
                      )
                    ],
                  ),
                ),
              ),
              //digital clock
              Expanded(
                flex: 1,
                child: StreamBuilder(
                  stream: seqAsyncValues(),
                  builder: (ctx, data) {
                    if (!data.hasData)
                      // ignore: curly_braces_in_flow_control_structures
                      return const CircularProgressIndicator();
                    else {
                      return (Center(
                        child: Text(
                            DateFormat('hh:mm:ss  a').format(DateTime.now()),
                            style: TextStyle(
                              fontSize: 40,
                              color: firstcolor,
                            )),
                      ));
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}

class Numbers extends StatelessWidget {
  const Numbers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            child: Center(
              child: Container(
                  //side black lines
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height * 0.01),
            ),
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.5),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.5),
        SizedBox(
            child: Center(
              child: Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.height * 0.01,
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.5),
      ],
    );
  }
}
