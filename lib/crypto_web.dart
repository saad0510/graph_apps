import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

const primaryColor = Color(0xFF2b234d);
const blueColor = Color(0xff5fadfb);
final bitCoinImage = Image.asset("assets/images/bitcoin.png", width: 30);

class CryptoWeb extends StatelessWidget {
  const CryptoWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff0b0d0f),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.all(20),
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            shape: const StadiumBorder(),
          ),
        ),
        chipTheme: const ChipThemeData(
          padding: EdgeInsets.all(10),
          backgroundColor: Colors.white10,
        ),
        iconTheme: const IconThemeData(
          size: 20,
          color: Colors.white,
        ),
        listTileTheme: ListTileThemeData(
          contentPadding: const EdgeInsets.only(left: 10),
          dense: true,
          visualDensity: VisualDensity.compact,
          minLeadingWidth: 0,
          horizontalTitleGap: 20,
          selectedTileColor: Colors.white12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          minVerticalPadding: 0,
        ),
        cardTheme: CardTheme(
          margin: const EdgeInsets.symmetric(vertical: 10),
          color: const Color(0xff17191a),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          subtitle1: TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
          bodyText2: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Sidebar(),
                  Expanded(
                    child: SingleChildScrollView(child: MainBody()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/crypto_logo.png",
              width: 50,
              fit: BoxFit.fitWidth,
            ),
            label: const Text("Saad"),
          ),
          const Spacer(),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/person_male.jpeg"),
            ),
            title: Text(
              "\$250,004.70",
              style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.normal),
            ),
            subtitle: Text(
              "Business Accouny",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          const Spacer(),
          const NavBar(
            icons: [
              Icons.home_outlined,
              Icons.branding_watermark,
              Icons.autorenew,
              Icons.animation,
            ],
            titles: ["Dashboard", "Borrow", "Lend with FIF", "Stake"],
            counts: [0, 0, 0, 12],
          ),
          const Spacer(),
          Text(
            "Mortgage",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 15),
          const NavBar(
            icons: [
              Icons.file_copy_outlined,
              Icons.scatter_plot_outlined,
              Icons.hotel_class_outlined,
              Icons.lightbulb_outline,
              Icons.border_color_outlined,
            ],
            titles: ["All Fifs", "My loans", "Rewards", "FAQ", "Support"],
            counts: [0, 8, 0, 0, 0],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
    required this.icons,
    required this.titles,
    required this.counts,
  });

  final List<IconData> icons;
  final List<String> titles;
  final List<int> counts;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.icons.length,
        (i) => InkWell(
          onTap: () => setState(() => selected = i),
          child: Opacity(
            opacity: selected == i ? 1 : 0.6,
            child: ListTile(
              selected: selected == i,
              leading: Icon(widget.icons[i], color: Colors.white),
              title: Text(
                widget.titles[i],
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: SizedBox(
                width: 60,
                child: widget.counts[i] != 0
                    ? Chip(
                        label: Text(widget.counts[i].toString()),
                      )
                    : Container(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff101213),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          MyAppBar(),
          SizedBox(height: 20),
          CryptoHeader(),
          SizedBox(height: 20),
          Report(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: LoanTitle(),
          ),
          MyLoans(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: CreditTitle(),
          ),
          MyCredits(),
        ],
      ),
    );
  }
}

class MyCredits extends StatelessWidget {
  const MyCredits({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        CreditsCard(),
        CreditsCard(),
        CreditsCard(),
      ],
    );
  }
}

class CreditsCard extends StatelessWidget {
  const CreditsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Amount",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const CoinTile(title: "8092.45 FTT", subtitle: "\$303,000.00"),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Status",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const ListTile(
                    horizontalTitleGap: 10,
                    leading: Icon(
                      Icons.check_circle,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "Accepted",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text("6 hrs ago"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyLoans extends StatelessWidget {
  const MyLoans({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: const [
            LoanTableHeader(),
            Divider(height: 10),
            LoanTableEntry(
              amount: CoinTile(title: "2047900.00 USDT", subtitle: "\$2400,000.000"),
              collateral: CoinTile(title: "31220.46 AVAX", subtitle: "\$2380,000.000"),
              daysAgo: 2,
              interest: 2.16,
            ),
            Divider(height: 10),
            LoanTableEntry(
              amount: CoinTile(title: "15670.00 UNI", subtitle: "\$147,000.000"),
              collateral: CoinTile(title: "145321.66 DAI", subtitle: "\$145,000.000"),
              daysAgo: 3,
              interest: 3.18,
            ),
            Divider(height: 10),
          ],
        ),
      ),
    );
  }
}

class CoinTile extends StatelessWidget {
  const CoinTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: bitCoinImage,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      subtitle: Text(subtitle),
    );
  }
}

class LoanTableHeader extends StatelessWidget {
  const LoanTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "Amount",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: Text(
              "Collateral",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: Text(
              "Status",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: Text(
              "Interest",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class LoanTableEntry extends StatelessWidget {
  const LoanTableEntry({
    super.key,
    required this.amount,
    required this.collateral,
    required this.daysAgo,
    required this.interest,
  });

  final CoinTile amount;
  final CoinTile collateral;
  final int daysAgo;
  final double interest;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: amount),
          Expanded(child: collateral),
          const Expanded(
            child: ListTile(
              leading: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.orange,
                ),
              ),
              title: Text("31220.46 AVAX"),
              subtitle: Text("\$2380,000.000"),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Chip(
                label: Text(interest.toString()),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: blueColor,
                    shape: const StadiumBorder(
                      side: BorderSide(width: 2, color: blueColor),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Details"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.red,
                    shape: const StadiumBorder(
                      side: BorderSide(width: 2, color: Colors.red),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Reject"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoanTitle extends StatelessWidget {
  const LoanTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "My loans",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(width: 5),
        const CircleAvatar(
          radius: 10,
          backgroundColor: Colors.red,
          child: Text(
            "2",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const Spacer(),
        const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "In progress",
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}

class CreditTitle extends StatelessWidget {
  const CreditTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "My credit lines",
          style: Theme.of(context).textTheme.headline6,
        ),
        const Spacer(),
        Text(
          "Show more",
          style: Theme.of(context).textTheme.subtitle1?.copyWith(color: blueColor),
        ),
      ],
    );
  }
}

class CryptoHeader extends StatelessWidget {
  const CryptoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cyrpto loans & mortage",
              style: Theme.of(context).textTheme.headline1,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Create loan"),
            )
          ],
        ),
        const SizedBox(height: 5),
        Text(
          "Borrow USDT, Ethereum, or USDC with three simple steps",
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 40,
      leadingWidth: 20,
      leading: const BackButton(color: Color(0xff5fadfb)),
      actions: [
        TextButton(
          child: Text(
            "Docs",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          onPressed: () {},
        ),
        TextButton.icon(
          label: const Icon(Icons.keyboard_arrow_down),
          icon: Text(
            "Company",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          onPressed: () {},
        ),
        TextButton(
          child: Text(
            "Smartcredit token",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          onPressed: () {},
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Chip(
            avatar: Icon(
              Icons.check_circle,
              color: Colors.teal,
              size: 16,
            ),
            label: Text("Oxf...d6a"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Chip(
                onDeleted: () {},
                label: const Text("Andrea Navaro "),
              ),
              const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage("assets/images/person_male.jpeg"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          children: const [
            Expanded(
              child: MonthlyReport(),
            ),
            Expanded(
              child: ReportStats(),
            ),
          ],
        ),
      ),
    );
  }
}

class MonthlyReport extends StatelessWidget {
  const MonthlyReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Monthly Report",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 5),
        Text(
          "Feb 1,2021 - Mar 1, 2022",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 40),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.subtitle1,
            children: const [
              TextSpan(text: "My profit:  "),
              TextSpan(
                text: "8.64%",
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "\$42,760.85",
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.subtitle1,
            children: const [
              TextSpan(text: "Increase increased "),
              TextSpan(
                text: "16%",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(text: " from last month"),
            ],
          ),
        ),
      ],
    );
  }
}

class ReportStats extends StatelessWidget {
  const ReportStats({super.key});

  static final graphData = [55, 51, 51, 60, 50, 53, 52, 41, 30, 40, 58, 56, 40, 50, 57, 59, 58];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Statistics",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              "62%",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(width: 15),
            Chip(
              padding: EdgeInsets.zero,
              backgroundColor: Colors.teal,
              label: const Text("5.62%"),
              onDeleted: () {},
              deleteIcon: const Icon(Icons.show_chart),
            ),
          ],
        ),
        SizedBox(
          height: 100,
          child: SfCartesianChart(
            margin: const EdgeInsets.only(top: 30, right: 30),
            plotAreaBorderWidth: 0,
            primaryXAxis: DateTimeAxis(isVisible: false),
            primaryYAxis: NumericAxis(
              borderWidth: 0,
              maximum: 60,
              decimalPlaces: 0,
              minimum: 20,
              desiredIntervals: 3,
              interval: 20,
              axisLine: const AxisLine(width: 0),
            ),
            trackballBehavior: TrackballBehavior(
              activationMode: ActivationMode.singleTap,
              enable: true,
              shouldAlwaysShow: true,
            ),
            series: [
              SplineAreaSeries<num, DateTime>(
                splineType: SplineType.monotonic,
                borderWidth: 2,
                borderGradient: const LinearGradient(
                  colors: [blueColor, blueColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                gradient: LinearGradient(
                  colors: [blueColor.withOpacity(0.5), blueColor.withOpacity(0.1)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                isVisible: true,
                animationDuration: 3000,
                dataSource: graphData,
                xValueMapper: (_, i) => DateTime(2021, i),
                yValueMapper: (d, _) => d,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
