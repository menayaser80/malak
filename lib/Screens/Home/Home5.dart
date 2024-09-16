import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home5 extends StatefulWidget {
  @override
  State<Home5> createState() => _Home5State();
}

class _Home5State extends State<Home5> {
  bool mena = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SwitchListTile(
                activeColor: Colors.green,
                title: Text(
                  'Notifications',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                secondary: Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.green,
                ),
                value: mena,
                onChanged: (value) {
                  setState(() {
                    mena = value;
                  });
                  if (mena == true) {
                    Fluttertoast.showToast(
                      msg:
                      "It's too high, so try lowering your blood sugar and seek medical help",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.grey.shade600,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                }),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                    height: 320,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffff7f00),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55.0),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            '160-240',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'mg/dl',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 400,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 160),
                        FlSpot(1, 170),
                        FlSpot(2, 200),
                        FlSpot(3, 220),
                        FlSpot(4, 240),
                        FlSpot(5, 180),
                        FlSpot(6, 230),
                      ],
                      isCurved: true,
                      color: Colors.black,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Color(0xffff7f00),
                      ),
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                              radius: 4,
                              color: Color(0xffff7f00),
                              strokeWidth: 2,
                              strokeColor: Colors.black,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
