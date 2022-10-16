import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'themes.dart';

const primaryColor = Color(0xFF2b234d);
const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

class DashBoardWeb extends StatelessWidget {
  const DashBoardWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppThemes.dashBoardWeb,
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Stack(
              fit: StackFit.expand,
              alignment: Alignment.bottomLeft,
              children: [
                const SideBar(),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 80,
                  right: MediaQuery.of(context).size.width * 0.25,
                  child: const Dashboard(),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: MediaQuery.of(context).size.width * 0.75,
                  right: 0,
                  child: const CalenderSideBar(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int index = 0;

  static const icons = [
    Icons.pie_chart_outline,
    Icons.calendar_today_outlined,
    Icons.folder_outlined,
    Icons.group_outlined,
    Icons.contact_mail_outlined,
    Icons.settings_outlined,
    Icons.power_settings_new,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFdfdaf9),
            Color(0xFFeaedf2),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              backgroundImage: AssetImage("assets/images/person_male.jpeg"),
            ),
            const SizedBox(height: 20),
            ...List<Widget>.generate(
              icons.length + 1,
              (i) {
                if (i == icons.length - 1) return const Spacer();
                if (i == icons.length) i--;

                return InkWell(
                  onTap: () => setState(() => index = i),
                  child: AbsorbPointer(
                    child: SidebarButton(
                      icon: icons[i],
                      selected: i == index,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarButton extends StatelessWidget {
  final IconData icon;
  final bool selected;

  const SidebarButton({
    super.key,
    required this.icon,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? Colors.white : Colors.transparent,
      child: IconButton(
        onPressed: () {},
        iconSize: 20,
        color: selected ? null : Colors.grey,
        icon: Icon(icon),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(25),
        ),
        border: Border.all(color: Colors.white),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFf8e2e2),
            Color(0xFFf0f1f3),
          ],
          begin: Alignment.bottomLeft,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dashboard",
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 20),
            const DashboardTags(),
            const SizedBox(height: 20),
            const GraphTitle(),
            const Graph(),
            const GraphLabels(),
          ],
        ),
      ),
    );
  }
}

class GraphLabels extends StatelessWidget {
  const GraphLabels({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days
          .map((e) => Text(
                e,
                style: Theme.of(context).textTheme.bodyText1,
              ))
          .toList(),
    );
  }
}

class Graph extends StatelessWidget {
  const Graph({super.key});

  static const line1 = [2, 1.9, 2.3, 2, 2.2, 2, 3.2, 3, 3, 2.8, 2.2, 2.5];
  static const line2 = [2.5, 2.9, 2.5, 2.5, 2.6, 2, 1.4, 1.6, 3.2, 3, 2, 2.2];

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 0),
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(isVisible: false),
      primaryYAxis: NumericAxis(
        borderWidth: 0,
        labelsExtent: 0,
        maximum: 4,
        minimum: 1,
        desiredIntervals: 3,
        axisLine: const AxisLine(width: 0),
      ),
      series: [
        SplineAreaSeries<num, num>(
          borderWidth: 4,
          borderGradient: const LinearGradient(
            colors: [Color(0xFFebaeab), Color(0xFF806aa5)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          gradient: const LinearGradient(
            colors: [Colors.transparent, Colors.transparent],
          ),
          animationDuration: 3000,
          dataSource: line1,
          xValueMapper: (_, i) => i,
          yValueMapper: (d, _) => d,
          color: Colors.transparent,
        ),
        SplineAreaSeries<num, num>(
          borderWidth: 4,
          borderGradient: LinearGradient(
            colors: [
              const Color(0xFFebaeab).withOpacity(0.3),
              const Color(0xFF806aa5).withOpacity(0.3),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          gradient: const LinearGradient(
            colors: [Colors.transparent, Colors.transparent],
          ),
          animationDuration: 3000,
          dataSource: line2,
          xValueMapper: (_, i) => i,
          yValueMapper: (d, _) => d,
          color: Colors.transparent,
        ),
      ],
    );
  }
}

class GraphTitle extends StatelessWidget {
  const GraphTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Portfilio visitors",
              style: Theme.of(context).textTheme.headline4,
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () {},
              label: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
              icon: Text(
                "This week",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            const Icon(
              Icons.circle_outlined,
              size: 16,
              color: primaryColor,
            ),
            const SizedBox(width: 5),
            Text(
              "Website",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(width: 50),
            const Icon(
              Icons.circle_outlined,
              size: 16,
              color: Colors.grey,
            ),
            const SizedBox(width: 5),
            Text(
              "Others",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ],
    );
  }
}

class DashboardTags extends StatelessWidget {
  const DashboardTags({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: const [
        Tag(
          icon: Icon(Icons.group_outlined),
          text: "Clients",
          subtext: "1992",
        ),
        Tag(
          icon: Icon(
            Icons.check_box_outlined,
            color: Colors.red,
          ),
          text: "Current Tasks",
          subtext: "1992",
        ),
        Tag(
          icon: Icon(
            Icons.flip_camera_android_outlined,
            color: Colors.orange,
          ),
          text: "Projects in negotiations",
          subtext: "31",
        ),
      ],
    );
  }
}

class Tag extends StatelessWidget {
  final String text;
  final String subtext;
  final Icon icon;

  const Tag({
    super.key,
    required this.text,
    required this.subtext,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      shape: const StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(text),
            const SizedBox(width: 30),
            Text(
              subtext,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}

class CalenderSideBar extends StatelessWidget {
  const CalenderSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFf2f5fa),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Calender",
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 15),
          const Calender(),
          const SizedBox(height: 30),
          Text(
            "Schedule",
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: Schedules(),
          ),
        ],
      ),
    );
  }
}

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: GridView.count(
        childAspectRatio: 1.5,
        padding: EdgeInsets.zero,
        crossAxisCount: 7,
        mainAxisSpacing: 10,
        children: List.generate(
          31 + 7 + 2,
          (i) {
            if (i < 7) {
              return Center(
                child: Text(
                  days[i],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              );
            }
            if (i < 7 + 2) return const SizedBox();

            int day = i - 8;
            return InkWell(
              onTap: () => setState(() => selected = day),
              child: CircleAvatar(
                backgroundColor: selected == day ? primaryColor.withOpacity(0.1) : Colors.transparent,
                child: Text(
                  day.toString(),
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class Schedules extends StatelessWidget {
  const Schedules({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ScheduleCard(
          subtitle: "Today, 10:30 - 11:00",
          title: "Project discussion with Jean Dominic",
          tags: ["Ui Designs", "Prototype", "Demo"],
        ),
        Divider(height: 50),
        ScheduleCard(
          subtitle: "Today, 12:30 - 13:00",
          title: "Meet with app development lead",
          tags: ["Planning", "Break"],
        ),
      ],
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    super.key,
    required this.tags,
    required this.subtitle,
    required this.title,
  });

  final String subtitle;
  final String title;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.circle_outlined,
              size: 14,
              color: Colors.red,
            ),
            const SizedBox(width: 10),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 15),
        Wrap(
          children: tags
              .map((e) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Chip(
                    backgroundColor: Colors.white,
                    label: Text(e),
                    labelStyle: TextStyle(
                      color: Colors.red.withBlue(e.hashCode),
                    ),
                  )))
              .toList(),
        ),
        const SizedBox(height: 20),
        const ScheduleAttachment(),
      ],
    );
  }
}

class ScheduleAttachment extends StatelessWidget {
  const ScheduleAttachment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Wireframe, concept, & references.pdf",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Chip(
            padding: EdgeInsets.all(10),
            avatar: Icon(Icons.arrow_downward, size: 16),
            label: Text(
              "Download",
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
