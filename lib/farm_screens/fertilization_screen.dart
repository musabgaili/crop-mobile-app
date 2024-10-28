import 'package:cropsense/models/farm.dart';
import 'package:cropsense/models/operation.dart';
import 'package:cropsense/providers/operations_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../global_widgets/custom_appbar.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';

class FertilizationScreen extends ConsumerWidget {
  const FertilizationScreen({super.key, required this.farm});
  final Farm farm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opeationHistoryProvider = ref.watch(opeartionsProvider(farm));
    return Scaffold(
      backgroundColor: contrastColor,
      appBar: CustomAppBar(
        color: Colors.black26,
        image: farmer,
        body: [
          const Center(
            child: Text('Operations History',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 80),
          Container(
            height: 20,
            decoration: BoxDecoration(
                color: contrastColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: contrastColor,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Date',
                          style:
                              TextStyle(color: mediumGreyColor, fontSize: 11)),
                      Text('Operation Type',
                          style:
                              TextStyle(color: mediumGreyColor, fontSize: 11)),
                      Text('Area',
                          style:
                              TextStyle(color: mediumGreyColor, fontSize: 11)),
                    ],
                  ),
                  Container(
                      height: 0.5,
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      color: Colors.grey),
                       
                  if (opeationHistoryProvider.isLoading)
                   Padding(
                         padding: const EdgeInsets.symmetric(vertical: 10),
                         child: Center(
                                               child: CircularProgressIndicator(
                          color: mainColor,
                          strokeWidth: 5,
                                               ),
                                             ),
                       )
                  else
                    ...opeationHistoryProvider.operations
                        .map((e) => RowItem(operation: e,))
                        // ignore: unnecessary_to_list_in_spreads
                        .toList()
                ],
              )),
        ),
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  const RowItem({super.key,required this.operation});
  final Operation operation;

  convertDate(d){
      var formatter = DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(d);
  return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text('1/1/2025',
          // Text(DateTime.parse(operation.createdAt!).toString(),
          Text(convertDate(DateTime.parse(operation.createdAt!)),

              style: TextStyle(color: mediumGreyColor, fontSize: 11)),
          Text(operation.type!, style: TextStyle(color: mediumGreyColor, fontSize: 11)),
          Text(operation.area!, style: TextStyle(color: mediumGreyColor, fontSize: 11)),
        ],
      ),
    );
  }
}
