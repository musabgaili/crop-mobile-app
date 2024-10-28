String logoGreen = 'assets/images/Logo 2.png';
String logoWhite = 'assets/images/Logo 1.png';
String farmer = 'assets/images/1716812669905.png';
String lock = 'assets/images/icons/Lock.png';
String carbs = 'assets/images/icons/Carbs.png';
String humidity = 'assets/images/icons/humidity.png';
String trash = 'assets/images/icons/Trash.png';
String notified = 'assets/images/icons/Bell_pin_fill.png';
String notified2 = 'assets/images/icons/v2/notification-icon-alert-3.png';
String faceID = 'assets/images/icons/v2/Face ID.png';

class IconMode {
  final List<String> mode;
  IconMode({required this.mode});
}

// v2
IconMode home2 = IconMode(mode: [
  'assets/images/icons/v2/Home_on.png',
  'assets/images/icons/v2/Home.png'
]);
IconMode calender2 = IconMode(mode: [
  'assets/images/icons/Calendar_on.png',
  'assets/images/icons/v2/Calendar.png'
]);
IconMode notifications2 = IconMode(mode: [
  'assets/images/icons/v2/Bell_on.png',
  'assets/images/icons/v2/Bell.png'
]);
IconMode profile2 = IconMode(mode: [
  'assets/images/icons/v2/Setting_line_on.png',
  'assets/images/icons/v2/Setting_line.png'
]);

// v1
IconMode home = IconMode(mode: [
  'assets/images/icons/HomeSelected.png',
  'assets/images/icons/Home.png'
]);
IconMode calender = IconMode(mode: [
  'assets/images/icons/Calendar_on.png',
  'assets/images/icons/Calendar.png'
]);
IconMode notifications = IconMode(
    mode: ['assets/images/icons/Bell_on.png', 'assets/images/icons/Bell.png']);
IconMode profile = IconMode(mode: [
  'assets/images/icons/Setting_alt_fill.png',
  'assets/images/icons/Setting_alt_fill_selected.png'
]);

class Categories {
  final String name;
  final String icon;
  Categories({required this.icon, required this.name});
}

List<Categories> categoriesList = [
  Categories(icon: carbs, name: 'Soil Health'),
  Categories(icon: humidity, name: 'Water Use'),
  Categories(icon: trash, name: 'Waste'),
];
