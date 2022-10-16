import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ui_demo/themes.dart';

const primaryColor = Color(0xFF29263d);
final primaryLightColor = Colors.deepPurple.shade100;
const textColor = Color(0xFF9994ba);
const accentColor = Color(0xFFf06d85);
const blueColor = Colors.blueAccent;

final data = [
  StockData(date: DateTime(2005, 09, 27), low: 19.10, open: 21.05, volume: 961200, high: 21.40, close: 19.30),
  StockData(date: DateTime(2005, 09, 28), low: 19.20, open: 19.30, volume: 5747900, high: 20.53, close: 20.50),
  StockData(date: DateTime(2005, 09, 29), low: 20.10, open: 20.40, volume: 1078200, high: 20.58, close: 20.21),
  StockData(date: DateTime(2005, 09, 30), low: 20.18, open: 20.26, volume: 3123300, high: 21.05, close: 21.01),
  StockData(date: DateTime(2005, 10, 03), low: 20.90, open: 20.90, volume: 1057900, high: 21.75, close: 21.50),
  StockData(date: DateTime(2005, 10, 04), low: 21.44, open: 21.44, volume: 1768800, high: 22.50, close: 22.16),
  StockData(date: DateTime(2005, 10, 05), low: 21.75, open: 22.10, volume: 904300, high: 22.31, close: 22.20),
  StockData(date: DateTime(2005, 10, 06), low: 22.40, open: 22.60, volume: 1614200, high: 23.00, close: 22.58),
  StockData(date: DateTime(2005, 10, 07), low: 21.80, open: 22.25, volume: 753400, high: 22.60, close: 22.15),
  StockData(date: DateTime(2005, 10, 10), low: 22.10, open: 22.28, volume: 538700, high: 22.29, close: 22.21),
  StockData(date: DateTime(2005, 10, 11), low: 21.80, open: 22.26, volume: 764600, high: 22.30, close: 21.98),
  StockData(date: DateTime(2005, 10, 12), low: 21.64, open: 21.90, volume: 912900, high: 22.05, close: 21.76),
  StockData(date: DateTime(2005, 10, 13), low: 21.40, open: 21.70, volume: 531300, high: 21.80, close: 21.71),
  StockData(date: DateTime(2005, 10, 14), low: 21.85, open: 21.85, volume: 887800, high: 22.40, close: 22.27),
  StockData(date: DateTime(2005, 10, 17), low: 21.85, open: 22.15, volume: 464000, high: 22.22, close: 22.08),
  StockData(date: DateTime(2005, 10, 18), low: 21.35, open: 22.06, volume: 1815500, high: 22.30, close: 21.49),
  StockData(date: DateTime(2005, 10, 19), low: 20.85, open: 21.37, volume: 1466000, high: 21.60, close: 21.38),
  StockData(date: DateTime(2005, 10, 20), low: 20.85, open: 21.35, volume: 640900, high: 21.48, close: 21.02),
  StockData(date: DateTime(2005, 10, 21), low: 21.01, open: 21.02, volume: 917000, high: 22.42, close: 21.96),
  StockData(date: DateTime(2005, 10, 24), low: 21.95, open: 22.01, volume: 508800, high: 22.36, close: 22.31),
  StockData(date: DateTime(2005, 10, 25), low: 21.70, open: 22.25, volume: 437300, high: 22.54, close: 22.00),
  StockData(date: DateTime(2005, 10, 26), low: 21.99, open: 22.00, volume: 543200, high: 22.45, close: 22.32),
  StockData(date: DateTime(2005, 10, 27), low: 22.20, open: 22.26, volume: 351200, high: 22.56, close: 22.56),
  StockData(date: DateTime(2005, 10, 28), low: 22.37, open: 22.55, volume: 1614900, high: 23.90, close: 23.90),
  StockData(date: DateTime(2005, 10, 31), low: 24.00, open: 24.00, volume: 706400, high: 25.35, close: 24.68),
  StockData(date: DateTime(2005, 11, 01), low: 24.69, open: 24.70, volume: 866800, high: 25.08, close: 25.02),
  StockData(date: DateTime(2005, 11, 02), low: 25.20, open: 25.23, volume: 2870200, high: 28.10, close: 27.55),
  StockData(date: DateTime(2005, 11, 03), low: 27.60, open: 27.60, volume: 906100, high: 28.10, close: 27.87),
  StockData(date: DateTime(2005, 11, 04), low: 27.77, open: 27.80, volume: 912600, high: 29.00, close: 28.80),
  StockData(date: DateTime(2005, 11, 07), low: 28.38, open: 29.00, volume: 486900, high: 29.43, close: 28.93),
  StockData(date: DateTime(2005, 11, 08), low: 29.00, open: 29.10, volume: 1395000, high: 29.70, close: 29.43),
  StockData(date: DateTime(2005, 11, 09), low: 29.43, open: 29.43, volume: 1312300, high: 31.30, close: 31.30),
  StockData(date: DateTime(2005, 11, 10), low: 31.15, open: 31.15, volume: 1948900, high: 33.96, close: 32.80),
  StockData(date: DateTime(2005, 11, 11), low: 33.00, open: 33.05, volume: 1183900, high: 33.95, close: 33.35),
  StockData(date: DateTime(2005, 11, 14), low: 33.45, open: 33.50, volume: 1059200, high: 34.50, close: 33.75),
  StockData(date: DateTime(2005, 11, 15), low: 32.84, open: 33.75, volume: 759200, high: 33.88, close: 33.88),
  StockData(date: DateTime(2005, 11, 16), low: 33.40, open: 33.51, volume: 542600, high: 33.85, close: 33.60),
  StockData(date: DateTime(2005, 11, 17), low: 33.23, open: 33.40, volume: 1011900, high: 34.55, close: 34.32),
  StockData(date: DateTime(2005, 11, 18), low: 32.86, open: 34.35, volume: 529800, high: 34.35, close: 33.05),
  StockData(date: DateTime(2005, 11, 21), low: 31.26, open: 32.75, volume: 636300, high: 32.75, close: 31.99),
  StockData(date: DateTime(2005, 11, 22), low: 31.60, open: 31.99, volume: 421900, high: 32.74, close: 32.50),
  StockData(date: DateTime(2005, 11, 23), low: 32.16, open: 32.20, volume: 671300, high: 33.68, close: 33.04),
  StockData(date: DateTime(2005, 11, 25), low: 32.72, open: 33.01, volume: 138500, high: 33.20, close: 32.85),
  StockData(date: DateTime(2005, 11, 28), low: 33.00, open: 33.05, volume: 630400, high: 33.85, close: 33.41),
  StockData(date: DateTime(2005, 11, 29), low: 32.63, open: 33.30, volume: 428600, high: 33.50, close: 32.90),
  StockData(date: DateTime(2005, 11, 30), low: 32.90, open: 32.90, volume: 690100, high: 33.80, close: 33.59),
  StockData(date: DateTime(2005, 12, 01), low: 34.00, open: 34.00, volume: 371800, high: 34.94, close: 34.28),
  StockData(date: DateTime(2005, 12, 02), low: 34.25, open: 34.40, volume: 428600, high: 34.65, close: 34.28),
  StockData(date: DateTime(2005, 12, 05), low: 31.38, open: 32.08, volume: 1124400, high: 32.64, close: 32.35),
  StockData(date: DateTime(2005, 12, 06), low: 32.04, open: 32.04, volume: 790600, high: 33.75, close: 33.62),
  StockData(date: DateTime(2005, 12, 07), low: 33.30, open: 33.40, volume: 783900, high: 34.18, close: 33.95),
  StockData(date: DateTime(2005, 12, 08), low: 33.53, open: 33.95, volume: 383700, high: 33.98, close: 33.66),
  StockData(date: DateTime(2005, 12, 09), low: 33.35, open: 33.41, volume: 409700, high: 34.07, close: 33.88),
  StockData(date: DateTime(2005, 12, 12), low: 33.71, open: 33.80, volume: 421500, high: 33.91, close: 33.76),
  StockData(date: DateTime(2005, 12, 13), low: 33.05, open: 33.76, volume: 226700, high: 33.80, close: 33.25),
  StockData(date: DateTime(2005, 12, 14), low: 33.25, open: 33.40, volume: 158400, high: 33.69, close: 33.54),
  StockData(date: DateTime(2005, 12, 15), low: 33.35, open: 33.64, volume: 313900, high: 33.88, close: 33.63),
  StockData(date: DateTime(2005, 12, 16), low: 33.68, open: 33.68, volume: 1646900, high: 35.50, close: 35.15),
  StockData(date: DateTime(2005, 12, 19), low: 34.89, open: 35.18, volume: 377400, high: 35.45, close: 35.25),
  StockData(date: DateTime(2005, 12, 20), low: 34.02, open: 35.25, volume: 564500, high: 35.46, close: 35.32),
  StockData(date: DateTime(2005, 12, 21), low: 35.33, open: 35.38, volume: 701200, high: 37.00, close: 36.51),
  StockData(date: DateTime(2005, 12, 22), low: 36.35, open: 36.60, volume: 247800, high: 37.05, close: 36.83),
  StockData(date: DateTime(2005, 12, 23), low: 36.73, open: 36.73, volume: 493000, high: 38.00, close: 37.73),
  StockData(date: DateTime(2005, 12, 27), low: 37.20, open: 37.99, volume: 476400, high: 38.80, close: 37.46),
  StockData(date: DateTime(2005, 12, 28), low: 36.35, open: 38.00, volume: 327800, high: 38.15, close: 37.45),
  StockData(date: DateTime(2005, 12, 29), low: 37.19, open: 37.45, volume: 189800, high: 37.95, close: 37.38),
  StockData(date: DateTime(2005, 12, 30), low: 36.92, open: 37.55, volume: 172800, high: 37.58, close: 37.14),
  StockData(date: DateTime(2006, 01, 03), low: 36.85, open: 37.20, volume: 1013200, high: 38.28, close: 37.45),
  StockData(date: DateTime(2006, 01, 04), low: 37.70, open: 37.70, volume: 1928400, high: 40.60, close: 39.20),
  StockData(date: DateTime(2006, 01, 05), low: 38.91, open: 39.18, volume: 317900, high: 39.71, close: 39.71),
  StockData(date: DateTime(2006, 01, 06), low: 38.14, open: 39.71, volume: 349200, high: 39.71, close: 39.00),
  StockData(date: DateTime(2006, 01, 09), low: 38.50, open: 38.80, volume: 220800, high: 38.88, close: 38.61),
  StockData(date: DateTime(2006, 01, 10), low: 37.40, open: 38.61, volume: 191300, high: 38.71, close: 37.80),
  StockData(date: DateTime(2006, 01, 11), low: 34.65, open: 37.80, volume: 974300, high: 37.80, close: 34.80),
  StockData(date: DateTime(2006, 01, 12), low: 32.96, open: 33.00, volume: 2008900, high: 35.35, close: 34.99),
  StockData(date: DateTime(2006, 01, 13), low: 33.31, open: 35.00, volume: 734200, high: 35.42, close: 34.05),
  StockData(date: DateTime(2006, 01, 17), low: 29.62, open: 33.55, volume: 2351200, high: 33.55, close: 30.00),
  StockData(date: DateTime(2006, 01, 18), low: 28.88, open: 29.10, volume: 1773700, high: 31.16, close: 31.00),
  StockData(date: DateTime(2006, 01, 19), low: 29.34, open: 30.80, volume: 857200, high: 31.24, close: 30.39),
  StockData(date: DateTime(2006, 01, 20), low: 28.60, open: 30.28, volume: 788700, high: 30.28, close: 29.24),
  StockData(date: DateTime(2006, 01, 23), low: 29.15, open: 29.49, volume: 530800, high: 30.05, close: 29.42),
  StockData(date: DateTime(2006, 01, 24), low: 29.75, open: 29.90, volume: 648900, high: 31.47, close: 31.02),
  StockData(date: DateTime(2006, 01, 25), low: 30.75, open: 31.15, volume: 836300, high: 31.51, close: 31.00),
  StockData(date: DateTime(2006, 01, 26), low: 30.00, open: 31.05, volume: 313700, high: 31.25, close: 30.25),
  StockData(date: DateTime(2006, 01, 27), low: 28.30, open: 30.20, volume: 518600, high: 30.20, close: 28.89),
  StockData(date: DateTime(2006, 01, 30), low: 28.73, open: 28.73, volume: 917300, high: 29.58, close: 29.00),
  StockData(date: DateTime(2006, 01, 31), low: 29.01, open: 29.17, volume: 490600, high: 30.41, close: 29.34),
  StockData(date: DateTime(2006, 02, 01), low: 28.35, open: 29.10, volume: 816800, high: 29.62, close: 29.38),
  StockData(date: DateTime(2006, 02, 02), low: 29.00, open: 29.38, volume: 767200, high: 30.20, close: 30.01),
  StockData(date: DateTime(2006, 02, 03), low: 29.20, open: 30.01, volume: 397600, high: 30.01, close: 29.55),
  StockData(date: DateTime(2006, 02, 06), low: 28.66, open: 29.20, volume: 550900, high: 29.70, close: 29.27),
  StockData(date: DateTime(2006, 02, 07), low: 28.62, open: 29.35, volume: 489800, high: 29.45, close: 29.00),
  StockData(date: DateTime(2006, 02, 08), low: 29.01, open: 29.10, volume: 869700, high: 30.76, close: 29.99),
  StockData(date: DateTime(2006, 02, 09), low: 29.55, open: 29.95, volume: 443400, high: 30.48, close: 30.35),
  StockData(date: DateTime(2006, 02, 10), low: 29.74, open: 30.50, volume: 403700, high: 30.50, close: 30.00),
  StockData(date: DateTime(2006, 02, 13), low: 30.55, open: 31.05, volume: 826000, high: 32.10, close: 31.17),
  StockData(date: DateTime(2006, 02, 14), low: 31.41, open: 31.50, volume: 668600, high: 32.90, close: 32.80),
  StockData(date: DateTime(2006, 02, 15), low: 32.35, open: 32.55, volume: 807800, high: 34.20, close: 33.75),
  StockData(date: DateTime(2006, 02, 16), low: 33.20, open: 33.66, volume: 244400, high: 33.90, close: 33.38),
];

class StockData {
  final DateTime date;
  final num open, close, low, high, volume;
  const StockData({
    required this.date,
    required this.low,
    required this.high,
    required this.volume,
    required this.open,
    required this.close,
  });
}

class StatsWeb extends StatelessWidget {
  const StatsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppThemes.statsWeb,
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Sidebar(),
                  InfoBody(),
                  Expanded(child: GraphBody()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class GraphBody extends StatelessWidget {
  const GraphBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SearchBar(),
          SizedBox(height: 30),
          Graph(),
          SizedBox(height: 30),
          TradeHeader(),
          SizedBox(height: 10),
          Expanded(child: TradeList()),
        ],
      ),
    );
  }
}

class TradeList extends StatefulWidget {
  const TradeList({super.key});

  @override
  State<TradeList> createState() => _TradeListState();
}

class _TradeListState extends State<TradeList> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, i) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selected == i ? Colors.white30 : Colors.white10,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            textTheme: TextTheme(
              subtitle2: TextStyle(
                color: selected == i ? Colors.white : primaryLightColor,
              ),
            ),
          ),
          child: Builder(
            builder: (context) {
              return InkWell(
                onTap: () => setState(() => selected = i),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${data[i].date.day}.${data[i].date.month}.${data[i].date.year}",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                        "${data[i].high}",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                        "${data[i].low}",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                        "${data[i].open}",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                        "${data[i].close}",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      const Icon(Icons.dialpad),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class TradeHeader extends StatelessWidget {
  const TradeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton.icon(
          onPressed: () {},
          label: const Icon(Icons.keyboard_arrow_down),
          icon: const Text("Trade History"),
        ),
        const Spacer(),
        const Icon(Icons.filter_alt_outlined),
        const SizedBox(width: 10),
        const Text(
          "BSCS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        Text(
          "Last 521 trades",
          style: Theme.of(context).textTheme.subtitle2,
        )
      ],
    );
  }
}

class Graph extends StatelessWidget {
  const Graph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff252238),
        borderRadius: BorderRadiusDirectional.circular(30),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          SfCartesianChart(
            margin: const EdgeInsets.fromLTRB(20, 30, 30, 50),
            plotAreaBorderWidth: 0,
            borderWidth: 0,
            primaryXAxis: NumericAxis(isVisible: false),
            primaryYAxis: NumericAxis(isVisible: false),
            series: [
              ColumnSeries(
                animationDuration: 2000,
                dataSource: data,
                pointColorMapper: (_, i) => i % 3 == 0 ? Colors.pinkAccent : blueColor,
                xValueMapper: (d, _) => d.open,
                yValueMapper: (d, _) => _,
              ),
            ],
          ),
          SfCartesianChart(
            margin: const EdgeInsets.fromLTRB(20, 30, 30, 20),
            plotAreaBorderWidth: 0,
            borderWidth: 0,
            primaryXAxis: DateTimeCategoryAxis(
              axisLine: const AxisLine(width: 0),
              majorGridLines: const MajorGridLines(width: 0),
            ),
            primaryYAxis: NumericAxis(
              decimalPlaces: 1,
              minimum: 15,
              maximum: 40,
              desiredIntervals: 6,
              axisLine: const AxisLine(width: 0),
              majorGridLines: const MajorGridLines(width: 0),
            ),
            trackballBehavior: TrackballBehavior(
              enable: true,
              lineColor: Colors.red.withOpacity(0.8),
              activationMode: ActivationMode.singleTap,
              shouldAlwaysShow: true,
            ),
            series: [
              CandleSeries<StockData, DateTime>(
                animationDuration: 2000,
                dataSource: data,
                xValueMapper: (d, _) => d.date,
                bearColor: Colors.pinkAccent,
                bullColor: blueColor,
                lowValueMapper: (d, _) => d.low,
                highValueMapper: (d, _) => d.high,
                openValueMapper: (d, _) => d.open,
                closeValueMapper: (d, _) => d.close,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 15, 0),
            child: IconSidebar(
              icons: [Icons.add, Icons.account_tree, Icons.dialpad],
              color: primaryColor,
              opacity: 1,
            ),
          )
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                prefixIconConstraints: BoxConstraints(minWidth: 50),
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Chip(
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.2),
          padding: const EdgeInsets.all(15),
          avatar: CircleAvatar(
            backgroundColor: Colors.deepPurpleAccent.shade700,
            child: const Icon(Icons.square, size: 8),
          ),
          label: Text(
            "Switch to ETH",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        const Spacer(),
        const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage("assets/images/person_male.jpeg"),
        )
      ],
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CircleAvatar(
          radius: 15,
          backgroundColor: blueColor,
          foregroundColor: Colors.white,
          child: Text("S"),
        ),
        Spacer(),
        Icon(Icons.home_outlined),
        Spacer(),
        IconSidebar(
          color: Colors.pinkAccent,
          icons: [
            Icons.search_outlined,
            Icons.rocket_launch_outlined,
            Icons.layers_outlined,
            Icons.save_outlined,
          ],
        ),
        SizedBox(height: 10),
        IconSidebar(
          color: Colors.deepPurpleAccent,
          icons: [
            Icons.bolt,
            Icons.repeat,
            Icons.file_download,
            Icons.link,
          ],
        ),
        Spacer(),
        Icon(Icons.show_chart),
        SizedBox(height: 10),
        Icon(Icons.diamond_outlined),
        Spacer(flex: 2),
        Icon(Icons.wb_twighlight),
      ],
    );
  }
}

class IconSidebar extends StatefulWidget {
  const IconSidebar({
    super.key,
    required this.icons,
    required this.color,
    this.opacity = 0.4,
  });

  final List<IconData> icons;
  final Color color;
  final double opacity;

  @override
  State<IconSidebar> createState() => _IconSidebarState();
}

class _IconSidebarState extends State<IconSidebar> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: widget.color.withOpacity(widget.opacity),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          widget.icons.length,
          (i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: selected == i ? widget.color : Colors.transparent,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(widget.icons[i]),
                iconSize: 16,
                color: selected == i ? Colors.white : null,
                onPressed: () => setState(() => selected = i),
                splashRadius: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InfoBody extends StatelessWidget {
  const InfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 400,
        maxWidth: 500,
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () {},
            label: const Icon(Icons.keyboard_arrow_down),
            icon: const Text("PancakeSwap pair"),
          ),
          const SizedBox(height: 20),
          const Header(),
          const Spacer(),
          const InfoGrid(),
          const Spacer(flex: 2),
          const Footer(),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Score",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 10),
                Text(
                  "97",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
            const PiChart()
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Text(
              "Community Trust",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const Spacer(flex: 3),
            const Icon(
              Icons.favorite,
              color: Colors.pinkAccent,
              size: 12,
            ),
            Text(
              "88%",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const Spacer(),
            Text(
              "25 VOTES",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 6,
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryLightColor,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: 0.6,
            heightFactor: 1,
            child: Container(
              decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PiChart extends StatelessWidget {
  const PiChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: SfCircularChart(
        margin: EdgeInsets.zero,
        borderWidth: 0,
        series: <CircularSeries>[
          PieSeries<int, int>(
            dataSource: [25, 25, 25, 25, 25],
            xValueMapper: (d, _) => d,
            yValueMapper: (_, i) => i,
          )
        ],
      ),
    );
  }
}

class InfoGrid extends StatelessWidget {
  const InfoGrid({super.key});

  static const icons = [
    Icons.functions,
    Icons.show_chart,
    Icons.rotate_left,
    Icons.rotate_right,
  ];
  static const List<Color> colors = [
    Colors.red,
    Colors.blueAccent,
    Colors.deepPurpleAccent,
    Colors.pink,
  ];
  static const List<String> titles = [
    "Total Liquidity",
    "Daily Volume",
    "Pooled BSC",
    "Pooled Cake",
  ];
  static const List<String> sutitles = [
    "2603805.5",
    "2372139.74",
    "1200.6",
    "271.35",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "\$ 983.47520",
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Icon(
              Icons.square,
              color: Colors.deepPurpleAccent,
              size: 14,
            ),
            const SizedBox(width: 5),
            Text(
              "0.2498488",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const Spacer(),
            Text(
              "24H: +5.74",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.change_history,
              color: blueColor,
              size: 14,
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 170,
          child: GridView.builder(
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 80,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (_, i) {
              return InfoCard(
                color: colors[i],
                icon: icons[i],
                title: titles[i],
                subtitle: "\$ ${sutitles[i]}",
              );
            },
          ),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, size: 20, color: color),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Card(
            color: const Color(0xff24c7d6),
            child: Image.asset("assets/images/pancake.png"),
          ),
          title: const Text("BSCS/Cake"),
          subtitle: Text(
            "PancakeSwap pair token 0X24rA...4f21Td",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          trailing: MyCard(
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            MyCard(
              child: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {},
              ),
            ),
            MyCard(
              child: IconButton(
                icon: const Icon(Icons.star),
                color: Colors.orangeAccent,
                onPressed: () {},
              ),
            ),
            MyCard(
              child: IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
            ),
            const Spacer(),
            const MyCard(
              padding: EdgeInsets.all(12),
              color: Colors.deepOrangeAccent,
              child: Text("Trade"),
            ),
          ],
        ),
      ],
    );
  }
}

class MyCard extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final EdgeInsets? padding;

  const MyCard({super.key, this.child, this.color, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color ?? primaryLightColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: child,
    );
  }
}
