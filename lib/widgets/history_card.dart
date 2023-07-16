import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hubtel_test/models/history.dart';
import 'package:hubtel_test/models/history_status.dart';
import 'package:hubtel_test/utils/formatter.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(this.history, {super.key});
  final HistoryDTO history;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: themeData.colorScheme.secondary,
          )),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(FormatterUil.formattedTime(history.timeStamp)),
            _buildSecondRowOfHistoryCard(history),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(history.receiverPhone),
                Spacer(),
                Text("GHS ${history.amount}"),
                Divider(),
              ],
            )
          ]),
    );
  }
}

Row _buildSecondRowOfHistoryCard(HistoryDTO historyDTO) => Row(
      children: [
        Icon(Icons.abc),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(historyDTO.receiverName),
        ),
        _buildStatusCard(historyDTO.historyStatus)
      ],
    );

Widget _buildStatusCard(HistoryStatus historyStatus) {
  Color _successColor = Color(0xFFdbf7e0);
  Color failedColor = Color(0xFFfdb0ac);
  List<Widget> successStatusChildren = [
    Icon(
      Icons.check_circle,
      color: Color(0xFF70e083),
    ),
    SizedBox(
      width: 4,
    ),
    Text("Successful")
  ];
  List<Widget> failedStatusChildren = [
    Icon(
      Icons.cancel,
      color: Color(0xffbf5360),
    ),
    SizedBox(
      width: 4,
    ),
    Text("Failed")
  ];
  return Container(
    margin: EdgeInsets.all(30),
    padding: EdgeInsetsDirectional.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: historyStatus == HistoryStatus.successful
          ? Color(0xFFdbf7e0)
          : Color(0xFFfdb0ac),
    ),
    child: Row(
      children: historyStatus == HistoryStatus.successful
          ? successStatusChildren
          : failedStatusChildren,
    ),
  );
}
