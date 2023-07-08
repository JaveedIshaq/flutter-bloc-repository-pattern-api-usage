import 'package:blocwithapi/crews/data/spacex_crew_model.dart';
import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({Key? key, required this.crewMember}) : super(key: key);

  final SpaceXCrew crewMember;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      title: Row(
        children: [
          Text(
            crewMember.name ?? "",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(width: 4),
          if (crewMember.status == 'active')
            const Icon(
              Icons.check,
              color: Colors.green,
            )
          else
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            key: const Key('crewMemberDetailsPage_titleHeader_agencyRichText'),
            text: TextSpan(
              text: 'Agency',
              style: const TextStyle(
                color: Color(0xFFB3B3B3),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: crewMember.agency,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            key: const Key('crewMemberDetailsPage_titleHeader_launchRichText'),
            text: TextSpan(
              text: 'Has participated ins',
              style: const TextStyle(color: Color(0xFFB3B3B3)),
              children: <TextSpan>[
                TextSpan(
                  text:
                      // ignore: lines_longer_than_80_chars
                      '${crewMember.launches?.length ?? 0} ${crewMember.launches?.length == 1 ? 'launch' : 'launches'}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
