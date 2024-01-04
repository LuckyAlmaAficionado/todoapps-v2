import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:todo/app/constant/default.dart';

import '../../../widgets/custom_add_view.dart';
import '../../../widgets/custom_list_tile.dart';
import '../../add_task/views/add_task_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 0.2,
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your daily task\nalmost done!',
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const Gap(20),
                        Material(
                          color: primaryContainerColor,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                              child: Center(
                                child: Text(
                                  'View Task',
                                  style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Obx(() => (controller.lenghtList != 1 ||
                            controller.listData.length < 0)
                        ? Center(
                            child: CircularStepProgressIndicator(
                              width: 80,
                              height: 80,
                              totalSteps: 100,
                              currentStep: ((controller.taskDone.value /
                                          controller.lenghtList.value) *
                                      100)
                                  .toInt(),
                              roundedCap: (p0, p1) => true,
                              unselectedColor: primaryColor,
                              selectedColor: primaryContainerColor,
                              stepSize: 7,
                              child: Center(
                                child: Text(
                                  '${((controller.taskDone.value / controller.lenghtList.value) * 100).toInt()}%',
                                  style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Center(child: CircularProgressIndicator())),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Text(
                'Upcoming Task',
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const Gap(20),
              Obx(
                () => Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ...controller.listData
                          .asMap()
                          .entries
                          .map(
                            (e) => LongPressDraggable(
                              data: e,
                              onDragStarted: () =>
                                  controller.changeDeleting(true),
                              onDraggableCanceled: (_, __) =>
                                  controller.changeDeleting(false),
                              onDragEnd: (_) =>
                                  controller.changeDeleting(false),
                              feedback: Opacity(
                                opacity: 0.8,
                                child: TileListView(
                                  task: e.value,
                                  index: e.key,
                                ),
                              ),
                              child: TileListView(
                                task: e.value,
                                index: e.key,
                              ),
                            ),
                          )
                          .toList(),
                      AddView(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          try {
            Get.to(AddTaskView(), transition: Transition.fadeIn);
          } catch (e) {
            print("Error during task deletion: $e");
          }
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: primaryContainerColor,
      ),
    );
  }
}
