import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/app/models/model_task.dart';
import 'package:todo/app/modules/home/controllers/home_controller.dart';
import 'package:todo/app/routes/app_pages.dart';

import '../controllers/add_task_controller.dart';

class AddTaskView extends GetView<AddTaskController> {
  const AddTaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(AddTaskController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: Get.width,
        height: Get.height,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavBarDetail(),
              const Gap(30),
              Text(
                'New Task',
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              TextField(
                controller: controller.taskCtrl,
                style: GoogleFonts.outfit(),
              ),
              Expanded(
                child: Obx(
                  () => ListView(
                    children: [
                      ...controller.modelTask.asMap().entries.map((e) {
                        ModelTask data = e.value;
                        return ListTile(
                          onTap: () {
                            controller.currentIndex.value = e.key;
                            controller.uuid.value = data.uuid;
                          },
                          leading: Get.put(HomeController()).icons[data.icons],
                          title: Text(data.title),
                          trailing: (controller.currentIndex.value == e.key)
                              ? Icon(Icons.done)
                              : SizedBox(),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavBarDetail extends StatelessWidget {
  const NavBarDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var addTask = Get.put(AddTaskController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.close,
            color: Colors.grey,
          ),
        ),
        Material(
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              addTask.addTileTaskToTaskFromUuid(
                addTask.uuid.value,
                addTask.taskCtrl.text,
              );
              Get.offAllNamed(Routes.HOME);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Done',
                style: GoogleFonts.outfit(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
