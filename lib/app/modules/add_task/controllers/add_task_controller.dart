import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/database/database_todo.dart';
import 'package:todo/app/models/model_task.dart';

class AddTaskController extends GetxController {
  var modelTask = <ModelTask>[].obs;

  DatabaseInstance databaseInstance = DatabaseInstance();
  late TextEditingController taskCtrl;
  var uuid = "".obs;

  fetchDataTask() async {
    await databaseInstance.getDatabase();
    modelTask.value = await databaseInstance.getDataModelTask();
  }

  addTileTaskToTaskFromUuid(String uuid, String subtitle) async {
    await databaseInstance.getDatabase();
    await databaseInstance.insertTileTask({
      "uuid": uuid,
      "subtitle": subtitle,
      "isDone": 0,
    });
  }

  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    taskCtrl = TextEditingController();
    fetchDataTask();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    taskCtrl.dispose();
    super.onClose();
  }
}
