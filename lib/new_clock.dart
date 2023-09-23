import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewClock extends StatefulWidget {
  const NewClock({super.key});

  @override
  State<NewClock> createState() => _NewClockState();
}

Stream<Map<String, int>> dateStream() async* {
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

Color firstcolor = const Color.fromARGB(255, 73, 84, 100);
Color secondcolor = const Color.fromARGB(255, 187, 191, 202);
Color thirdcolor = const Color.fromARGB(255, 232, 232, 232);
Color fourthcolor = const Color.fromARGB(255, 244, 244, 244);
final date = DateTime.now();

class _NewClockState extends State<NewClock> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return StreamBuilder(
      initialData: {
        'hours': date.hour,
        'minutes': date.minute,
        'seconds': date.second,
        'mesconds': date.millisecond,
      },
      stream: dateStream(),
      builder: (context, snapshot) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Flutter modern Analog Clock'),
          backgroundColor: firstcolor,
        ),
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: width,
                  height: height,
                  decoration: const BoxDecoration(
                      gradient: RadialGradient(
                    colors: [Color(0xffffffff), Color(0xffd1d1d1)],
                    stops: [0, 1],
                    center: Alignment.center,
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondcolor,
                  ),
                  child: Transform.rotate(
                      angle: ((snapshot.data!['hours']! - 12) * 60 +
                              snapshot.data!['minutes']!) *
                          ((pi / 180) * 0.5) *
                          -1,
                      child: Image.asset('assets/images/hours.png')),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: fourthcolor,
                  ),
                  child: Transform.rotate(
                      angle: (((snapshot.data!['minutes'])! * 60 +
                                  snapshot.data!['seconds']!) *
                              ((pi / 180) * 0.0976)) *
                          -1,
                      child: Image.asset('assets/images/seconds.png',
                          height: height * 0.4)),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondcolor,
                  ),
                  child: Transform.rotate(
                      angle: ((snapshot.data!['seconds']! * 1000 +
                                  snapshot.data!['mesconds']!) *
                              ((pi / 180) * 0.00595)) *
                          -1,
                      child: Image.asset('assets/images/seconds.png',
                          height: height * 0.3)),
                ),

                //angle
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 5,
                      height: height * 0.03,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: height * 0.22,
                      width: 5,
                      color: Colors.red,
                    ),
                    Container(
                      height: height * 0.25,
                      width: 5,
                      color: Colors.transparent,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.5,
                      color: Colors.transparent,
                    ),
                    SizedBox(
                      height: height * 0.2,
                    ),
                    Text(DateFormat('hh:mm:ss  a').format(DateTime.now()),
                        style: TextStyle(
                            fontSize: 40,
                            color: firstcolor,
                            fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
