import 'package:blocwithapi/home/widgets/home_page_content.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SpaceX App"),
        centerTitle: true,
      ),
      body: const Center(
        child: HomePageContent(),
      ),
    );
  }
}
