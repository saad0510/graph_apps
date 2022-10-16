import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'themes.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppThemes.cryptoApp,
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: myAppBar,
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 20),
                Text(
                  "Current Wallet Balance",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 8),
                Text(
                  "\$3,293.46",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 5),
                const MyDropDown(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        CircularIcon(icon: Icon(Icons.ios_share_rounded)),
                        SizedBox(height: 10),
                        Text("Send"),
                      ],
                    ),
                    Column(
                      children: const [
                        CircularIcon(
                          icon: Icon(Icons.add_rounded),
                          selected: true,
                        ),
                        SizedBox(height: 10),
                        Text("Buy"),
                      ],
                    ),
                    Column(
                      children: const [
                        CircularIcon(icon: Icon(Icons.call_received_rounded)),
                        SizedBox(height: 10),
                        Text("Receive"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                const TokensHeadline(),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, __) => const TokenCard(),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: const MyBottomBar(),
          );
        },
      ),
    );
  }

  AppBar get myAppBar {
    return AppBar(
      leadingWidth: 100,
      leading: const Center(
        child: CircularIcon(
          image: "assets/images/four_dots.png",
        ),
      ),
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 15, 30, 15),
              decoration: const BoxDecoration(
                color: Color(0xFF2E3547),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(50),
                ),
              ),
              child: const Icon(
                Icons.notifications,
                size: 25,
              ),
            ),
            Positioned(
              bottom: 15,
              left: 24,
              child: CircleAvatar(
                radius: 9,
                backgroundColor: Colors.blueAccent.shade700,
                child: const Text(
                  "3",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int index = 2;

  static const labels = ["Home", "Favorite", "Signals", "Charts", "Swap"];
  static const icons = [
    Icons.home_outlined,
    Icons.stars_outlined,
    Icons.bar_chart,
    Icons.table_chart_outlined,
    Icons.change_circle_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 91,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        border: Border.all(color: Colors.black45),
      ),
      child: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: List<BottomNavigationBarItem>.generate(
          labels.length,
          (i) => i == index
              ? BottomNavigationBarItem(
                  label: labels[i],
                  icon: Container(
                    width: 50,
                    height: 45,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7264FF), Colors.deepPurple],
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Icon(icons[i]),
                  ),
                )
              : BottomNavigationBarItem(
                  label: labels[i],
                  icon: Icon(icons[i]),
                ),
        ),
        selectedIconTheme: const IconThemeData(size: 32),
        unselectedIconTheme: const IconThemeData(size: 28),
        unselectedFontSize: 12,
        showSelectedLabels: false,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        backgroundColor: const Color(0xFF202531),
      ),
    );
  }
}

class TokenCard extends StatelessWidget {
  const TokenCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF202531),
        borderRadius: BorderRadius.circular(25),
      ),
      width: 250,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            leading: Image.asset("assets/images/bitcoin.png", width: 25),
            title: Text(
              "Bitcoin",
              style: Theme.of(context).textTheme.headline5,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 70,
                  height: 30,
                  child: SfCartesianChart(
                    margin: EdgeInsets.zero,
                    plotAreaBorderWidth: 0,
                    primaryXAxis: CategoryAxis(isVisible: false),
                    primaryYAxis: CategoryAxis(isVisible: false),
                    series: [
                      SplineSeries<int, int>(
                        width: 2,
                        animationDuration: 3000,
                        dataSource: const [1, 1, 4, 2, 7, 4, 1, 1],
                        xValueMapper: (_, i) => i,
                        yValueMapper: (d, _) => d,
                        color: Colors.greenAccent.shade700,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            subtitle: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.subtitle2,
                children: [
                  TextSpan(
                    text: "+11%",
                    style: TextStyle(color: Colors.greenAccent.shade700),
                  ),
                  const TextSpan(text: " in 30m"),
                ],
              ),
            ),
          ),
          const Divider(),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "\$45,875.89",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const VerticalDivider(),
                Text(
                  "-12.77(%20)",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          const Divider(),
          const TimeFilter(),
        ],
      ),
    );
  }
}

class TimeFilter extends StatefulWidget {
  const TimeFilter({super.key});

  @override
  State<TimeFilter> createState() => _TimeFilterState();
}

class _TimeFilterState extends State<TimeFilter> {
  int index = 0;
  static const filters = ["30m", "1H", "4H", "1D"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        filters.length,
        (i) => InkWell(
          onTap: () => setState(() => index = i),
          child: Container(
            decoration: BoxDecoration(
              color: i == index ? const Color(0xFF343844) : null,
              borderRadius: BorderRadius.circular(13),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              filters[i],
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
      ),
    );
  }
}

class TokensHeadline extends StatelessWidget {
  const TokensHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Your Tokens",
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(width: 10),
        Text(
          "Swap",
          style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.grey),
        ),
        const Spacer(),
        TextButton.icon(
          onPressed: () {},
          label: const Icon(
            Icons.swap_vert,
            color: Colors.white,
          ),
          icon: Text(
            "Sort",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ],
    );
  }
}

class CircularIcon extends StatelessWidget {
  final bool selected;
  final Icon? icon;
  final String? image;

  const CircularIcon({
    super.key,
    this.icon,
    this.image,
    this.selected = false,
  }) : assert(icon != null ? image == null : image != null);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: selected ? const Color(0xFF7264FF) : const Color(0xFF2E3547),
      child: IconButton(
        onPressed: () {},
        color: Colors.white,
        icon: icon ??
            Image.asset(
              image!,
              color: Colors.white,
              height: 25,
            ),
      ),
    );
  }
}

class MyDropDown extends StatelessWidget {
  const MyDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: const SizedBox(
        width: 115,
        child: Center(
          child: Text("Smart Chain BEP-20"),
        ),
      ),
      avatar: const CircleAvatar(
        radius: 13,
        backgroundColor: Color(0xFF1C1B21),
        child: CircleAvatar(
          radius: 8,
          backgroundColor: Color(0xFF6A5D15),
          child: CircleAvatar(
            radius: 6,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 5,
              backgroundColor: Colors.yellow,
            ),
          ),
        ),
      ),
      deleteIcon: const Icon(Icons.keyboard_arrow_down),
      deleteIconColor: Colors.grey,
      onDeleted: () {},
    );
  }
}
