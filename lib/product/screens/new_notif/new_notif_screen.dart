import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_circular_home_button.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_elevated_button_with_icon.dart';
import 'package:wm_ppp_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:wm_ppp_4/feature/components/generic_bottom_sheet/base_bottom_sheet.dart';
import 'package:wm_ppp_4/feature/components/input_fields/date_input.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input.dart';
import 'package:wm_ppp_4/feature/components/input_fields/text_fields_input_with_action.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/feature/components/worker_order_bottom_sheets/image_bottom_sheet.dart';
import 'package:wm_ppp_4/feature/constants/other/app_icons.dart';
import 'package:wm_ppp_4/feature/constants/other/app_strings_gsh.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/l10n/locale_keys.g.dart';
import 'package:wm_ppp_4/feature/route/app_route.gr.dart';
import 'package:wm_ppp_4/product/screens/new_notif/provider/new_notif_provider.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:wm_ppp_4/product/screens/new_notif/widgets/add_photo.dart';

@RoutePage()
class NewNotifScreen extends StatelessWidget {
  NewNotifScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  get homeProvider => null;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewNotifProvider(),
      child: Consumer<NewNotifProvider>(
        builder: (context, NewNotifProvider newNotifProvider, child) {
          DateTime selectedDate = DateTime.now();
          final newNotifProvider = context.watch<NewNotifProvider>();

          Future<void> selectDate(BuildContext context) async {
            // final DateTime? pickedDate = await showDatePicker(

            //   context: context,
            //   initialDate: selectedDate,
            //   firstDate: DateTime(2000),
            //   lastDate: DateTime(2101),
            // );
            // if (pickedDate != null && pickedDate != selectedDate) {
            //   newNotifProvider.setDate(pickedDate.toString());
            // }

            // picker.DatePicker.showDatePicker(context,
            //     showTitleActions: true,
            //     minTime: DateTime(2018, 3, 5),
            //     maxTime: DateTime(2024, 12, 7),
            //     theme: picker.DatePickerTheme(
            //         headerColor: Colors.orange,
            //         backgroundColor: Colors.blue,
            //         itemStyle: TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 18),
            //         doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
            //     onChanged: (date) {
            //   print('change $date in time zone ' +
            //       date.timeZoneOffset.inHours.toString());
            // }, onConfirm: (date) {
            //   print('confirm $date');
            // }, currentTime: DateTime.now(), locale: picker.LocaleType.tr);
            picker.DatePicker.showDateTimePicker(context,
                showTitleActions: true, onChanged: (date) {
              print('change $date in time zone ' +
                  date.timeZoneOffset.inHours.toString());
            }, onConfirm: (date) {
              newNotifProvider.setDate(date.toString());
            },
                minTime: DateTime(2018, 3, 5),
                maxTime: DateTime(2026, 12, 31, 23, 00, 34),
                locale: picker.LocaleType.tr);
          }

          // SchedulerBinding.instance.addPostFrameCallback((_) {
          //   // widget.provider.getMyGroupWorkOrdersSecond(context.locale.languageCode, context);
          //   if (newNotifProvider.isSuccess) {

          //   }
          // });

          return SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              appBar: const CustomMainAppbar(
                title: Text(
                  LocaleKeys.newNotif,
                  style: TextStyle(color: Colors.black),
                ),
                returnBack: true,
              ),
              backgroundColor: APPColors.Main.white,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: <Widget>[
                          TextField(
                            controller: newNotifProvider.mahal,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              labelText: LocaleKeys.spaceCode,
                            ),
                            onChanged: (inputValue) {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.qr_code_scanner),
                            onPressed: () {
                              newNotifProvider.scanBarcodeNormal();
                              FocusScope.of(context).requestFocus(FocusNode());
                              // Your codes...
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: newNotifProvider.desc,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          labelText: LocaleKeys.description,
                        ),
                        onChanged: (inputValue) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: <Widget>[
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              labelText: newNotifProvider.date != ''
                                  ? newNotifProvider.date
                                  : LocaleKeys.meetDate,
                            ),
                            onChanged: (inputValue) {},
                          ),
                          IconButton(
                              onPressed: () => {selectDate(context)},
                              icon: const Icon(Icons.date_range))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: <Widget>[
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              labelText: LocaleKeys.addPhoto,
                            ),
                            onChanged: (inputValue) {},
                          ),
                          IconButton(
                              onPressed: () => BaseBottomSheet.show(
                                  context,
                                  AddPhotoSheet(
                                      workOrderCode: '23',
                                      clearContext: context)),
                              icon: const Icon(Icons.photo))
                        ],
                      ),
                    ),
                    CustomHalfButtons(
                        leftTitle: const Text(
                          AppStrings.clean,
                          style: TextStyle(color: Colors.white),
                        ),
                        rightTitle: const Text(
                          AppStrings.approve,
                          style: TextStyle(color: Colors.white),
                        ),
                        leftOnPressed: () {
                          newNotifProvider.cleanAll();
                        },
                        rightOnPressed: () async {
                          newNotifProvider.addIdariCallInfo(context,'');
                        })
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Expanded homePageIcons(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          rowIconButtonSection(
              context,
              LocaleKeys.newNotif,
              AppIcons.calendarMonth,
              const IssueTracingList(),
              LocaleKeys.suggestion,
              AppIcons.attachment,
              const IssueSearchRoute()),
          Expanded(
            flex: 2,
            child: CustomCircularHomeButton(
              title: LocaleKeys.caseComplaintSearch,
              icon: Icon(
                AppIcons.contentPasteSearch,
                size: MediaQuery.of(context).size.width / 10,
              ),
              onPressed: () {
                context.router.push(NewNotifRoute());
              },
              isBadgeVisible: false,
              badgeCount: '0',
            ),
          )
        ],
      ),
    );
  }

  Expanded rowIconButtonSection(
      BuildContext context,
      String buttonTitle1,
      IconData buttonIcon1,
      PageRouteInfo<dynamic> navigateRouteName1,
      String buttonTitle2,
      IconData buttonIcon2,
      PageRouteInfo<dynamic> navigateRouteName2) {
    return Expanded(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomCircularHomeButton(
              title: buttonTitle1,
              icon: Icon(
                buttonIcon1,
                size: MediaQuery.of(context).size.width / 10,
              ),
              onPressed: () {
                context.router.push(navigateRouteName1);
              },
              isBadgeVisible: false,
              badgeCount: '0',
            ),
            CustomCircularHomeButton(
              title: buttonTitle2,
              icon: Icon(
                buttonIcon2,
                size: MediaQuery.of(context).size.width / 10,
              ),
              onPressed: () {
                context.router.push(navigateRouteName2);
              },
              isBadgeVisible: false,
              badgeCount: '0',
            ),
          ],
        ),
      ),
    );
  }
}
