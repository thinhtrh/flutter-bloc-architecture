import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final String taskName;
  final String status;
  final String taskId;
  final String createdDate;
  final String finishedDate;

  const TodoEntity(this.taskName, this.status, this.taskId, this.createdDate,
      this.finishedDate);

  Map<String, Object> toJson() {
    return {
      "taskName": taskName,
      "status": status,
      "taskId": taskId,
      "createdDate": createdDate,
      "finishedDate": finishedDate
    };
  }

  @override
  List<Object?> get props =>
      [taskName, status, taskId, createdDate, finishedDate];

  static TodoEntity fromSnapshot(DocumentSnapshot snapshot) {
    return TodoEntity(snapshot['taskName'], snapshot['status'],
        snapshot['taskId'], snapshot['createdDate'], snapshot['finishedDate']);
  }

  Map<String, Object> toDocument() {
    return {
      "taskName": taskName,
      "status": status,
      "taskId": taskId,
      "createdDate": createdDate,
      "finishedDate": finishedDate
    };
  }
}
