import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:wm_ppp_4/feature/components/cards/custom_activities_photo_card.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/constants/paths/service_tools.dart';
import '../../l10n/locale_keys.g.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_attachments_model.dart';

class CustomIssueAttachmentsCard extends StatelessWidget {
  const CustomIssueAttachmentsCard({super.key, required this.data});

  final IssueAttachmentsModel data;

  @override
  Widget build(BuildContext context) {
    final fileUrl = ServiceTools.attachPathLive + data.id.toString();
    bool? isPDF = data.dispfilename?.contains('pdf');
    bool? isXLSX = data.dispfilename?.contains('xlsx');
    bool? isDOCX = data.dispfilename?.contains('docx');
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 2.5,
                      child: Text('${data.dispfilename} ${data.id}'),
                    ),
                    Text(data.idate.toString())
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: (isPDF == true || isXLSX == true || isDOCX == true)
                        ? Link(
                            uri: Uri.parse(fileUrl),
                            target: LinkTarget.blank,
                            builder: (BuildContext ctx, FollowLink? openLink) {
                              return TextButton.icon(
                                onPressed: openLink,
                                label: const Text(LocaleKeys.clickthelink),
                                icon: const Icon(Icons.read_more),
                              );
                            },
                          )
                        : ActivitiesPhoto(
                            photoAdress: fileUrl,
                          )),
              ],
            ),
            Divider(
              height: 10,
              color: APPColors.Main.grey,
              thickness: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
