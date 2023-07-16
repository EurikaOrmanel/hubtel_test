import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hubtel_test/models/history.dart';
import 'package:hubtel_test/models/history_status.dart';
import 'package:hubtel_test/utils/formatter.dart';
import 'package:hubtel_test/widgets/history_card.dart';
import 'package:hubtel_test/widgets/search_input_field.dart';

class HistoryTab extends StatelessWidget {
  HistoryTab({super.key});
  final _tabs = ["History", "Transaction Summary"];
  List<HistoryDTO> _transactionHistories = [
    HistoryDTO(
        amount: 500,
        description: "Cool your heart wai",
        historyStatus: HistoryStatus.successful,
        logo: "/aseets/icons/mtn-momo.png",
        receiverName: "Emmanuel Rockson Kwabena Uncle Ebo",
        receiverPhone: "024 123 4567",
        timeStamp: DateTime(2023, 5, 24, 14, 45),
        type: "Personal")
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          // preferredSize: Size.fromHeight(screenSize.height * 0.25),
          title: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Color(0xffe6eaed),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Color.fromRGBO(158, 158, 158, 1),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              tabs: _tabs
                  .map(
                    (e) => Tab(
                        child: Container(
                      child: Text(e),
                    )),
                  )
                  .toList(),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Divider(),
            SearchAndToogle(),
            GroupedListView<HistoryDTO, DateTime>(
              groupSeparatorBuilder: (value) => _buildDateSeparator(value),
              shrinkWrap: true,
              primary: false,
              elements: _transactionHistories,
              groupBy: (element) => element.timeStamp,
              itemBuilder: (context, index) => HistoryCard(index),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDateSeparator(DateTime dateTime) => Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xFFe6eaed), borderRadius: BorderRadius.circular(20)),
      child: Text(
        FormatterUil.formattedDay(dateTime),
      ),
    );
