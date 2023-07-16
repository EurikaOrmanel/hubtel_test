import 'package:hubtel_test/models/history_status.dart';

class HistoryDTO {
  HistoryDTO({
    required this.amount,
    required this.description,
    required this.historyStatus,
    required this.logo,
    required this.receiverName,
    required this.receiverPhone,
    required this.timeStamp,
    required this.type,
  });
  final String receiverName;
  final String receiverPhone;
  final int amount;
  final DateTime timeStamp;
  final HistoryStatus historyStatus;
  final String description;
  final String type;
  final String logo;
}
