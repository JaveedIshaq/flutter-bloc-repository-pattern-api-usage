import 'package:blocwithapi/core/extensions.dart';
import 'package:blocwithapi/crews/bloc/crews_bloc.dart';
import 'package:blocwithapi/crews/view/crew_page.dart';
import 'package:blocwithapi/home/widgets/spacex_category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: SpaceXCategoryCard(
                key: const Key('homePageContent_rocket_spaceXCategoryCard'),
                onTap: () => {},
                title: const Text("Rockets"),
                imageUrl: 'assets/images/img_spacex_rocket.jpeg',
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: SpaceXCategoryCard(
                key: const Key('homePageContent_crew_spaceXCategoryCard'),
                onTap: () {
                  "GetCrewsDataEvent is called".log();
                  context.read<CrewsBloc>().add(const GetCrewsDataEvent());

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CrewView(),
                    ),
                  );
                },
                title: const Text("Crew"),
                imageUrl: 'assets/images/img_spacex_crew.jpeg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
