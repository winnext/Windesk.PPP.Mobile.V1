import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:wm_ppp_4/feature/constants/paths/service_tools.dart';

@RoutePage()
class IssueDetailScreen extends StatelessWidget {
  const IssueDetailScreen({super.key, required this.workOrderCode});

  final String workOrderCode;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomMainAppbar(title: Text(workOrderCode), returnBack: true,),
      body: const DefaultTabController(initialIndex:0, length: ServiceTools.appName == 'antep' ? 4 : 3, child: TabBar(
        indicatorColor: Colors.black,
        labelStyle: TextStyle(fontSize: 11),
        labelColor: Colors.black,
        tabs: ServiceTools.appName == 'antep'
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
      ),));
  }
}
