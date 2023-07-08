import 'package:blocwithapi/crews/bloc/crews_bloc.dart';
import 'package:blocwithapi/crews/data/spacex_crew_model.dart';
import 'package:blocwithapi/crews/view/crew_member_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CrewView extends StatelessWidget {
  const CrewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crews"),
      ),
      body: Center(
        child: BlocBuilder<CrewsBloc, CrewsState>(
          builder: (context, state) {
            if (state is CrewsLoading) {
              return const Center(
                key: Key('crewView_loading_indicator'),
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is CrewsError) {
              return Text(state.errorMessage);
            } else if (state is CrewsLoaded) {
              return _CrewMembersList(
                key: const Key('crewView_success_crewMemberList'),
                crewMembers: state.crewsData,
              );
            }
            return const Text("");
          },
        ),
      ),
    );
  }
}

class _CrewMembersList extends StatelessWidget {
  const _CrewMembersList({Key? key, required this.crewMembers})
      : super(key: key);

  final List<SpaceXCrew> crewMembers;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final crewMember in crewMembers) ...[
          ListTile(
            isThreeLine: true,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      CrewMemberDetailsView(crewMember: crewMember),
                ),
              );
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(crewMember.image ?? ""),
            ),
            title: Text(crewMember.name ?? ""),
            subtitle: Text(
              crewMember.agency ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.chevron_right_sharp),
          ),
          const Divider(),
        ],
      ],
    );
  }
}
