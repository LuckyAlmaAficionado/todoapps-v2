import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:todo/app/models/model_task.dart';
import 'package:todo/app/models/model_tile_task.dart';
import 'package:todo/app/modules/home/controllers/home_controller.dart';
import 'package:todo/app/routes/app_pages.dart';

import '../controllers/detail_task_controller.dart';

class DetailTaskView extends GetView<DetailTaskController> {
  const DetailTaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: SafeArea(
          child: FutureBuilder(
            future: Get.put(DetailTaskController()).fetchDataFromDatabase(),
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                ModelTask data = snapshot.data as ModelTask;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          NavBarDetail(uuid: Get.arguments),
                          const Gap(15),
                          ListTile(
                            minLeadingWidth: 5,
                            title: Text(
                              data.title,
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            leading:
                                Get.put(HomeController()).icons[data.icons],
                          ),
                          Row(
                            children: [
                              const Gap(30),
                              Text(
                                '${data.content!.length} Tasks',
                                style: GoogleFonts.outfit(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              const Gap(20),
                              Expanded(
                                child: Obx(() => StepProgressIndicator(
                                      totalSteps:
                                          (controller.content.length == 0)
                                              ? 1
                                              : controller.content.length,
                                      currentStep: controller.currentStep.value,
                                      size: 10,
                                      padding: 0,
                                      selectedGradientColor: LinearGradient(
                                        colors: [
                                          Colors.blue,
                                          Colors.blue.withOpacity(0.4),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    )),
                              )
                            ],
                          ),
                          const Gap(20),
                          TextField(
                            style: GoogleFonts.outfit(),
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.done,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Obx(() => ListView.builder(
                            itemCount: controller.content.length,
                            itemBuilder: (context, index) {
                              ModelTileTask tileTask =
                                  controller.content[index];
                              return ListTile(
                                leading: Checkbox(
                                  onChanged: (value) {
                                    controller.updateCheckBox(
                                        tileTask.id, (tileTask.isDone == 0));
                                  },
                                  value: (tileTask.isDone == 0) ? false : true,
                                ),
                                title: Text(
                                  tileTask.subtitle,
                                  style: GoogleFonts.outfit(),
                                ),
                              );
                            })))
                  ],
                );
              } else {
                return Center(child: Text('Reload Page'));
              }
            },
          ),
        ),
      ),
    );
  }
}

class NavBarDetail extends StatelessWidget {
  const NavBarDetail({
    super.key,
    required this.uuid,
  });

  final String uuid;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.put(HomeController()).fetchDataFromDatabaseInstance();
            Get.toNamed(Routes.HOME);
            // Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        IconButton.filled(
          onPressed: () {
            Get.put(DetailTaskController()).deleteTaskByUuid(uuid);
            Get.toNamed(Routes.HOME);
          },
          icon: Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
