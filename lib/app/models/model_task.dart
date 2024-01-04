import 'package:todo/app/models/model_tile_task.dart';

class ModelTask {
  final int id;
  final String uuid;
  final String title;
  final int icons;
  List<ModelTileTask>? content;

  ModelTask({
    required this.id,
    required this.uuid,
    required this.title,
    required this.icons,
    this.content,
  });

  factory ModelTask.fromJson(Map<String, dynamic> json) => ModelTask(
        id: json['id'],
        uuid: json['uuid'],
        title: json['title'],
        icons: json['icons'],
        content: json['content'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        "uuid": uuid,
        "title": title,
        "icons": icons,
        "content": content,
      };
}
