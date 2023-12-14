import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_activities_model.dart';

class CustomIssueActivitiesCard extends StatelessWidget {
  const CustomIssueActivitiesCard({super.key, required this.data});
  final IssueActivitiesModel data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width / 2, child: Text(data.name ?? '')),
              Text(data.idate.toString()),
            ],
          ),
          Text(data.description.toString()),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(''),
                    Text(data.iusername ?? ''),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 5,
            color: APPColors.Main.grey,
            thickness: 2.0,
          )
        ],
      ),
    );
  }
}
