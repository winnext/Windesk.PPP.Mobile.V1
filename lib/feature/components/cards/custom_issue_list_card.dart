// ignore_for_file:file_names, prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables,use_key_in_widget_constructors

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/constants/style/color_calculator.dart';
import 'package:wm_ppp_4/feature/constants/style/custom_paddings.dart';
import 'package:wm_ppp_4/feature/constants/style/font_sizes.dart';
import 'package:wm_ppp_4/feature/mixins/custom_issue_list_card_mixin.dart';
import 'package:wm_ppp_4/feature/models/issue_models/issue_list_model.dart';
import '../../constants/functions/null_check_widget.dart';
import '../../constants/other/time_functions.dart';

class CustomIssueListCard extends StatefulWidget {
  final Function onPressed;
  final Function onPressedLong;
  final IssueListModel issueListElement;

  const CustomIssueListCard(
      {Key? key,
      required this.onPressed,
      required this.issueListElement,
      required this.onPressedLong})
      : super(key: key);

  @override
  State<CustomIssueListCard> createState() => _CustomIssueListCardState();
}

class _CustomIssueListCardState extends State<CustomIssueListCard>
    with CustomIssueListCardConstantsMixin, CustomIssueListCardStylesMixin {
  String dateNow = DateFormat("yyyyMMddHHmmss").format(DateTime.now());
  //formatı pm am şeklinde düzeltilmeli
  late final Timer _timer;

  void changeTime() {
    if (mounted) {
      setState(() {
        dateNow = DateFormat("yyyyMMddHHmmss").format(DateTime.now());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      changeTime();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => widget.onPressed(widget.issueListElement.code.toString()),
      onLongPress: () => widget.onPressedLong(),
      child: Padding(
        padding: CustomPaddings.pageNormal,
        child: Container(
          width: size.width,
          decoration: containerDecoration,
          child: Padding(
            padding: containerPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                codeWidget(size),
                statusNameWidget(size),
                NullCheckWidget().nullCheckWidget(
                  widget.issueListElement.location.toString(),
                  SizedBox(),
                  issueListText(size, locationStr,
                      widget.issueListElement.location.toString()),
                ),
                NullCheckWidget().nullCheckWidget(
                  widget.issueListElement.space.toString(),
                  SizedBox(),
                  issueListText(
                      size, placeStr, widget.issueListElement.space.toString()),
                ),
                NullCheckWidget().nullCheckWidget(
                  widget.issueListElement.description.toString(),
                  SizedBox(),
                  issueListText(size, descriptionStr,
                      widget.issueListElement.description.toString()),
                ),
                NullCheckWidget().nullCheckWidget(
                  widget.issueListElement.idate.toString(),
                  SizedBox(),
                  issueListText(size, descriptionDateStr,
                      widget.issueListElement.idate.toString()),
                ),
                widget.issueListElement.statuscode.toString() ==
                        statusCodeCheckTxt
                    ? plannedlWidget(
                        size, widget.issueListElement.planneddate.toString())
                    : widget.issueListElement.response_timer == zeroStr &&
                            widget.issueListElement.fixed_timer == zeroStr
                        ? Column(
                            children: [
                              happeningTimeWidget(
                                  size,
                                  happenedResponse,
                                  widget.issueListElement.responded_idate !=
                                          null
                                      ? widget.issueListElement.responded_idate
                                          .toString()
                                      : numErrorStr,
                                  widget.issueListElement.target_rdate != null
                                      ? widget.issueListElement.target_rdate
                                          .toString()
                                      : numErrorStr),
                              NullCheckWidget().nullCheckWidget(
                                widget.issueListElement.fixed_idate.toString(),
                                happeningTimeWidget(
                                    size,
                                    happenedDescriptionDaterError,
                                    numErrorStr,
                                    widget.issueListElement.target_fdate != null
                                        ? widget.issueListElement.target_fdate
                                            .toString()
                                        : numErrorStr),
                                happeningTimeWidget(
                                    size,
                                    happenedFix,
                                    widget.issueListElement.fixed_idate != null
                                        ? widget.issueListElement.fixed_idate
                                            .toString()
                                        : numErrorStr,
                                    widget.issueListElement.target_fdate != null
                                        ? widget.issueListElement.target_fdate
                                            .toString()
                                        : numErrorStr),
                              ),
                            ],
                          )
                        : widget.issueListElement.response_timer == zeroStr &&
                                widget.issueListElement.fixed_timer == oneStr
                            ? Column(
                                children: [
                                  happeningTimeWidget(
                                      size,
                                      happenedResponse,
                                      widget.issueListElement.responded_idate
                                          .toString(),
                                      widget.issueListElement.target_rdate !=
                                              null
                                          ? widget.issueListElement.target_rdate
                                              .toString()
                                          : numErrorStr),
                                  timerRecoverText(
                                      size,
                                      goalFix,
                                      widget.issueListElement.target_fdate !=
                                              null
                                          ? widget.issueListElement.target_fdate
                                              .toString()
                                          : numErrorStr),
                                  timerDifferenceText(
                                      size,
                                      remainDate,
                                      widget.issueListElement.target_fdate !=
                                              null
                                          ? widget.issueListElement.target_fdate
                                              .toString()
                                          : numErrorStr),
                                ],
                              )
                            : Column(
                                children: [
                                  timerRecoverText(
                                      size,
                                      goalResponse,
                                      widget.issueListElement.target_rdate !=
                                              null
                                          ? widget.issueListElement.target_rdate
                                              .toString()
                                          : numErrorStr),
                                  timerDifferenceText(
                                      size,
                                      remainDate,
                                      widget.issueListElement.target_rdate !=
                                              null
                                          ? widget.issueListElement.target_rdate
                                              .toString()
                                          : numErrorStr),
                                  timerRecoverText(
                                      size,
                                      goalFix,
                                      widget.issueListElement.target_fdate !=
                                              null
                                          ? widget.issueListElement.target_fdate
                                              .toString()
                                          : numErrorStr),
                                  timerDifferenceText(
                                      size,
                                      remainDate,
                                      widget.issueListElement.target_fdate !=
                                              null
                                          ? widget.issueListElement.target_fdate
                                              .toString()
                                          : numErrorStr),
                                ],
                              ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Flexible plannedlWidget(Size size, plannedDate) {
    return Flexible(
      child: SizedBox(
        width: size.width,
        child: Padding(
          padding: CustomPaddings.onlyBottomLow,
          child: Text('$datedCase ${TimeClass().timeRecover(plannedDate)}',
              style: commonStyle),
        ),
      ),
    );
  }

  Container happeningTimeWidget(
      Size size, String header, String fixedDate, String targetDate) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: CustomColorCalculator()
              .colorCalculatorBackground(fixedDate, targetDate)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          '$header ${TimeClass().timeRecover(fixedDate).toString()}',
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(
            fontSize: FontSizes.caption - 1,
            letterSpacing: letterSpacing,
            color: CustomColorCalculator()
                .colorCalculatorText(fixedDate, targetDate),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  SizedBox timerDifferenceText(Size size, String header, String targetTime) {
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: CustomPaddings.topAndBottomLow,
        child: Text(
          key: Key(remainDateKey),
          '$header${TimeClass().timeDifference(targetTime)}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: CustomColorCalculator()
                .colorCalculator(dateNow.toString(), targetTime),
            fontSize: FontSizes.caption - 1,
            letterSpacing: letterSpacing,
          ),
        ),
      ),
    );
  }

  SizedBox timerRecoverText(Size size, String header, String targetTime) {
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: CustomPaddings.topAndBottomLow,
        child: Text(
          key: Key(goalResponseKey),
          '$header ${TimeClass().timeRecover(targetTime)}',
          maxLines: 1,
          style: TextStyle(
            color: CustomColorCalculator()
                .colorCalculator(dateNow.toString(), targetTime),
            fontSize: FontSizes.caption - 1,
            letterSpacing: letterSpacing,
          ),
        ),
      ),
    );
  }

  Flexible statusNameWidget(Size size) {
    return Flexible(
      child: SizedBox(
        width: size.width / 1,
        child: Padding(
          padding: CustomPaddings.onlyBottomLow,
          child: Text(widget.issueListElement.statusname.toString(),
              style: commonStyle),
        ),
      ),
    );
  }

  Flexible codeWidget(Size size) {
    return Flexible(
      child: SizedBox(
        width: size.width / 2.0,
        child: Padding(
          padding: CustomPaddings.onlyTopLow,
          child: Text(
            widget.issueListElement.code.toString(),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Color(0xff025273),
                fontSize: FontSizes.caption,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Flexible issueListText(Size size, String header, String description) {
    return Flexible(
      child: SizedBox(
        width: size.width,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: CustomPaddings.onlyBottomLow,
                child: Text(
                    key: Key(issueListTextKey),
                    '$header : $description',
                    style: commonStyle),
              ),
            ),
            Divider(height: 5),
          ],
        ),
      ),
    );
  }
}
