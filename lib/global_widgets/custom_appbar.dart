import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color color;
  final List<Widget>? actions;
  final String? title;
  final List<Widget>? body;
  final String? image;

  const CustomAppBar({
    super.key,
    required this.color,
    this.actions = const [],
    this.title = '',
    this.body = const [],
    this.image = '',
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 4);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        image: image!.isNotEmpty
            ? DecorationImage(image: AssetImage(image!), fit: BoxFit.fitWidth)
            : null,
      ),
      child: AppBar(
        elevation: 0,
        title: title?.isNotEmpty == true
            ? Center(
                child: Text(title!,
                    style: const TextStyle(fontSize: 22, color: Colors.white)))
            : null,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);

        }, icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
        actions: actions,
        flexibleSpace: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: body!,
          ),
        ),
      ),
    );
  }
}
