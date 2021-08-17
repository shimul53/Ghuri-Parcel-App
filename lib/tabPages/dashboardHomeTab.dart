import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardHomeTab extends StatefulWidget {
  @override
  _DashboardHomeTabState createState() => _DashboardHomeTabState();
}

class _DashboardHomeTabState extends State<DashboardHomeTab> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Pending', 1, Color.fromRGBO(51, 51, 51, 1)),
      ChartData('On pick up', 0, Color.fromRGBO(145, 177, 198, 1)),
      ChartData('Picked up', 0, Color.fromRGBO(107, 107, 107, 1)),
      ChartData('In hub', 0, Color.fromRGBO(108, 210, 112, 1)),
      ChartData('On delivery', 0, Color.fromRGBO(114, 163, 116, 1)),
      ChartData('Delivered', 0, Color.fromRGBO(68, 138, 255, 1)),
      ChartData('Return', 0, Color.fromRGBO(255, 106, 95, 1)),
      ChartData('Return Done', 0, Color.fromRGBO(212, 138, 133, 1)),
      ChartData('Payment Done', 0, Color.fromRGBO(255, 204, 0, 1)),
    ];
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 80.0, left: 20.0, right: 20.0, bottom: 20.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Dashboard",
                          style: TextStyle(
                            color: Color.fromRGBO(33, 33, 33, 1),
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        CircleAvatar(
                          backgroundColor: Color.fromRGBO(255, 204, 0, 1),
                          child: Image(
                            image: AssetImage("images/ghuri.png"),
                            height: 45,
                            width: 45,
                          ),
                          radius: 25.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Hello,',
                      style: TextStyle(
                        color: Color.fromRGBO(33, 33, 33, 1),
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Shimul Tamo",
                      style: TextStyle(
                        color: Color.fromRGBO(87, 87, 87, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 40.0, left: 20.0, right: 20.0),
            child: Container(
              height: 400,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Parcel Statistics"),
                        SizedBox(
                          width: 145,
                        ),
                        Card(
                          color: Color.fromRGBO(255, 204, 0, 1),
                          child: SizedBox(
                            height: 25,
                            width: 55,
                            child: Center(
                              child: Text(
                                "All",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                          child: SfCircularChart(

                              // Enables the legend
                              legend: Legend(
                                isVisible: true,
                                position: LegendPosition.right,
                                overflowMode: LegendItemOverflowMode.wrap,
                              ),
                              series: <CircularSeries>[
                            DoughnutSeries<ChartData, String>(
                              dataSource: chartData,
                              pointColorMapper: (ChartData data, _) =>
                                  data.color,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              dataLabelSettings: DataLabelSettings(
                                isVisible: true,
                              ),
                            ),
                          ])),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final String x;
  final int y;
  final Color? color;
  ChartData(this.x, this.y, [this.color]);
}
