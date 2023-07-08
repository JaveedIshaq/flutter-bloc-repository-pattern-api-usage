import 'package:blocwithapi/crews/data/spacex_crew_model.dart';
import 'package:blocwithapi/crews/view/widgets/image_header.dart';
import 'package:blocwithapi/crews/view/widgets/title_header.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CrewMemberDetailsView extends StatelessWidget {
  const CrewMemberDetailsView({
    Key? key,
    required this.crewMember,
  }) : super(key: key);

  final SpaceXCrew crewMember;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(crewMember.name ?? ""),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              ImageHeader(
                key: const Key('crewMemberDetailsPage_imageHeader'),
                imageUrl: crewMember.image ?? "",
              ),
              TitleHeader(
                key: const Key('crewMemberDetailsPage_titleHeader'),
                crewMember: crewMember,
              ),
            ],
          ),
          Positioned(
            left: 16,
            bottom: 16,
            right: 16,
            child: SizedBox(
              height: 64,
              child: ElevatedButton(
                key: const Key(
                  'crewMemberDetailsPage_openWikipedia_elevatedButton',
                ),
                onPressed: () async {
                  if (await launchUrl(Uri.parse(crewMember.wikipedia ?? ""))) {
                    await launchUrl(Uri.parse(crewMember.wikipedia ?? ""));
                  }
                },
                child: const Text("Open Wikipedia"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
