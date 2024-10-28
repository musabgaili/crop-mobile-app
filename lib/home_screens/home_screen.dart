import 'package:cropsense/farm_screens/farmers_screen.dart';
import 'package:cropsense/home_screens/notifications_screen.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../global_widgets/round_image.dart';
import 'widgets/custom_grid_widget.dart';
import 'widgets/tasks_detail_widget.dart';

double appbarheight = 120;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: appbarheight,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        leading: Align(
          // padding: const EdgeInsets.only(left:  8.0),
          
          child: RoundImage(
            image: farmer,
            size: 80,
            borderWidth: 0,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.02),
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const NotificationScreen()));
                  },
                  child: RoundImage(
                      image: notified,
                      size: 30,
                      borderWidth: 1,
                      color: mediumGreyColor),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 20),
            // SearchBarWidget(),
            // SizedBox(height: 30),
            // Padding(
            //   padding: EdgeInsets.only(left: 30.0, right: 30.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //   'My Farmer',
            //         style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            //       ),
            //       Text(
            //   'See All',
            //         style: TextStyle(
            //             fontSize: 11,
            //             fontWeight: FontWeight.w400,
            //             color: Colors.grey),
            //       ),
            //     ],
            //   ),
            // ),
            // CustomGridWidget(),
            const TasksDetailWidget(),
            const SizedBox(height: 20),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Farms',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                    onTap: () {
                      // print('Go Farms Screen');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FarmersScreens()));
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const CustomGridWidget2(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
