class ModelTileTask {
  final int id;
  final String uuid;
  final String subtitle;
  final int isDone;

  ModelTileTask({
    required this.id,
    required this.uuid,
    required this.subtitle,
    required this.isDone,
  });

  factory ModelTileTask.fromJson(Map<String, dynamic> json) => ModelTileTask(
        id: json['id'],
        uuid: json['uuid'],
        subtitle: json['subtitle'],
        isDone: json['isDone'],
      );
}
