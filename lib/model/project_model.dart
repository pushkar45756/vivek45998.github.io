class ProjectDetail {
  ProjectDetail({
    this.id,
    this.projectName,
    this.projectId,
    this.clientName,
    this.status,
  });

  String? id;
  String? projectName;
  String? projectId;
  String? clientName;
  String? status;

  factory ProjectDetail.fromJson(Map<String, dynamic> json) => ProjectDetail(
        id: json["id"],
        projectName: json["projectName"],
        projectId: json["projectId"],
        clientName: json["clientName"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "projectName": projectName,
        "projectId": projectId,
        "clientName": clientName,
        "status": status,
      };
}
