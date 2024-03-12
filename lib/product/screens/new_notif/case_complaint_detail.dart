import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/constants/paths/service_tools.dart';
import 'package:wm_ppp_4/product/screens/issue/view/issue_summary_screen.dart';
import 'package:wm_ppp_4/product/screens/issue/view/issue_activities_screen.dart';
import 'package:wm_ppp_4/product/screens/issue/view/issue_files_screen.dart';
import 'package:wm_ppp_4/product/screens/issue/view/issue_notes_screen.dart';
import 'package:wm_ppp_4/product/screens/new_notif/widgets/alert_dialog_route_page.dart';

@RoutePage()
class CaseCompDetail extends StatelessWidget {
  const CaseCompDetail({super.key, required this.issueCode});

  final String issueCode;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      initialIndex: 0,
      length: ServiceTools.appName == "antep" ? 4 : 3,
      child: Scaffold(
        appBar: _issueSummaryAppbar(size, context, issueCode),
        body: TabBarView(
          children: ServiceTools.appName == "antep"
              ? <Widget>[
                  IssueSummaryScreen(
                    issueCode: issueCode,
                  ),
                  IssueActivitiesScreen(issueCode: issueCode),
                  IssueFilesScreen(issueCode: issueCode),
                  const IssueNotesScreen()
                ]
              : <Widget>[
                  IssueSummaryScreen(issueCode: issueCode),
                  IssueActivitiesScreen(issueCode: issueCode),
                  IssueFilesScreen(issueCode: issueCode),
                ],
        ),
        floatingActionButton: ElevatedButton(
            onPressed: () {
              AlertDialogRoute().showAlertDialog(context, issueCode);
            },
            child: const Text(
              'Vaka Şikayeti',
              style: TextStyle(color: Colors.red),
            )),
      ),
    );
  }
}

AppBar _issueSummaryAppbar(Size size, BuildContext context, String issueCode) {
  return AppBar(
    title: Text(
      issueCode,
      style: const TextStyle(color: Colors.black),
      textAlign: TextAlign.center,
    ),
    backgroundColor: APPColors.Main.white,
    toolbarHeight: size.height / 20,
    centerTitle: true,
    leading: IconButton(
      onPressed: () => {Navigator.pop(context)},
      icon: Icon(Icons.arrow_back_rounded, color: APPColors.Main.black),
      alignment: Alignment.topCenter,
    ),
    bottom: const TabBar(
      indicatorColor: Colors.black,
      labelStyle: TextStyle(fontSize: 11),
      labelColor: Colors.black,
      tabs: ServiceTools.appName == "antep"
          ? <Widget>[
              Tab(
                text: 'Özet',
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              Tab(
                text: 'Aktivite',
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              Tab(
                text: 'Dosyalar',
                icon: Icon(
                  Icons.attach_file,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              Tab(
                text: 'Notlar',
                icon: Icon(
                  Icons.note_outlined,
                  color: Colors.black,
                  size: 25,
                ),
              )
            ]
          : <Widget>[
              Tab(
                text: 'Özet',
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              Tab(
                text: 'Aktivite',
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              Tab(
                text: 'Dosyalar',
                icon: Icon(
                  Icons.attach_file,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ],
    ),
  );
}
