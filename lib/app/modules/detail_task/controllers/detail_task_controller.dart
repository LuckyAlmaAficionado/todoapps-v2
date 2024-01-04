import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/database/database_todo.dart';
import 'package:todo/app/models/model_task.dart';
import 'package:todo/app/models/model_tile_task.dart';

import '../../home/controllers/home_controller.dart';

class DetailTaskController extends GetxController {
  DatabaseInstance databaseInstance = DatabaseInstance();
  ModelTask? data;
  var content = <ModelTileTask>[].obs;
  var currentStep = 0.obs;
  List iconsWidget = [
    {
      'icon': Icon(
        Icons.person,
        color: Colors.deepPurple,
      ),
      'title': 'Personal',
    },
    {
      'icon': Icon(
        Icons.work,
        color: Colors.deepOrange,
      ),
      'title': 'Work',
    },
  ].obs;

  var currentIndex = 0.obs;

  fetchDataFromDatabase() async {
    await databaseInstance.getDatabase();
    data = await databaseInstance.fetchDataTaskByUuid(Get.arguments);
    content.value = data!.content!;
    currentStep.value =
        content.where((element) => element.isDone == 1).toList().length;
    print('perbaharui');
    return data;
  }

  updateCheckBox(int id, bool isDone) async {
    await databaseInstance.updateTileTask(id, {
      "isDone": (isDone) ? 1 : 0,
    });
    fetchDataFromDatabase();
  }

  curStep() {}

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  deleteTaskByUuid(String uuid) async {
    try {
      await databaseInstance.getDatabase();
      await databaseInstance.deleteTask(uuid);
      Get.put(HomeController()).fetchDataFromDatabaseInstance();
    } catch (e) {
      throw e;
    }
  }
}
