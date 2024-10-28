
import 'package:cropsense/farm_screens/fertilization_screen.dart';
import 'package:cropsense/models/farm.dart';
import 'package:cropsense/providers/farm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../global_widgets/colored_button.dart';
import '../utils/colors.dart';
import 'widgets/field_widget.dart';

class FertilizationDataScreen extends ConsumerWidget {
  const FertilizationDataScreen({super.key, required this.farm});
  final Farm farm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final farmProvider = ref.watch(singleFarmProvider(farm));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back_ios),
        title: const Center(
          child:
              Text('Operation Data', style: TextStyle(color: Colors.black)),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: farmProvider.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),

              // Operation Type
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Operation Type",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 13)),
                  Container(
                    height: 95,
                    width: MediaQuery.of(context).size.width * 0.8,
                    alignment: Alignment.center,
                    child: DropdownButtonFormField(
                      items: farmProvider.operationTypes.map((type) {
                        return DropdownMenuItem(
                          value: type,
                          child: Text(type,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 13)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        // log(value.toString());
                        farmProvider.selectType(value.toString());
                      },
                      value: farmProvider.type,
                      decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(color: contrastColor),

                        // contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(15)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(15)),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'type',
                      ),
                    ),
                  ),
                ],
              ),
              // End
              // FieldsWidget(
              //     controller: farmProvider.fertilizerController,
              //     name: 'Fertilizer Type'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FieldsWidget(
                      keyboardType: TextInputType.number,
                      controller: farmProvider.quantityController,
                      size: 0.35,
                      name: 'Quantity'),
                  FieldsWidget(
                      keyboardType: TextInputType.number,
                      controller: farmProvider.areaController,
                      size: 0.35,
                      name: 'Space'),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),
              ColoredButton(
                  color: mainColor,
                  text: 'Done',
                  onPressed: () {
                    farmProvider.registerOperation();
                  }),
              const SizedBox(height: 10),
              ColoredButton(
                  color: contrastColor,
                  text: 'Operation History',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FertilizationScreen(farm: farm),
                      ),
                    );
                  }),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
