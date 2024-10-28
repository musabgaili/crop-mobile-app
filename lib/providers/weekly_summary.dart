import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define the list of weekly summaries
final weeklySummariesProvider = Provider<List<List<double>>>((ref) {
  return [
    [100, 200, 150, 300, 250, 400, 350],
    [80, 180, 130, 290, 240, 380, 330],
    [120, 210, 160, 310, 260, 410, 340],
    [90, 190, 140, 280, 230, 370, 320],
    [110, 200, 150, 300, 270, 390, 330],
  ];
});

// State provider for the currently selected index
final selectedWeekIndexProvider = StateProvider<int>((ref) {
  return 0; // Default to the first set of summaries
});

// Provider for the selected weekly summary
final selectedWeekProvider = Provider<List<double>>((ref) {
  final index = ref.watch(selectedWeekIndexProvider);
  final summaries = ref.watch(weeklySummariesProvider);
  return summaries[index];
});
