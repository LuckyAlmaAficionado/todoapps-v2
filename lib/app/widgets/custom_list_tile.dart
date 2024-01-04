import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:todo/app/modules/detail_task/views/detail_task_view.dart';
import 'package:todo/app/modules/home/controllers/home_controller.dart';

import '../models/model_task.dart';

class TileListView extends StatelessWidget {
  const TileListView({
    super.key,
    required this.task,
    required this.index,
  });

  final ModelTask task;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: Colors.grey.shade400,
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
      ),
      child: Material(
        color: (index % 2 == 0)
            ? Color.fromARGB(255, 9, 190, 223)
            : Color.fromARGB(255, 253, 120, 73),
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Get.to(DetailTaskView(),
                transition: Transition.cupertino, arguments: task.uuid);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: 44,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: Get.put(HomeController()).icons[task.icons],
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const Gap(20),
                    LinearPercentIndicator(
                      padding: EdgeInsets.all(0),
                      animation: true,
                      lineHeight: 10,
                      animationDuration: 2000,
                      percent: ((task.content!.isEmpty)
                              ? 0
                              : ((task.content!
                                          .where(
                                              (element) => element.isDone == 1)
                                          .toList()
                                          .length) /
                                      task.content!.length) *
                                  100) /
                          100,
                      barRadius: Radius.circular(10),
                      progressColor: Colors.white,
                      backgroundColor: Colors.white38,
                    ),
                    const Gap(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Progress',
                          style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        Text(
                          '${(task.content!.isEmpty) ? 'No task' : "${((((task.content!.where((element) => element.isDone == 1).toList().length) / task.content!.length) * 100).toInt())}%"}',
                          style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
