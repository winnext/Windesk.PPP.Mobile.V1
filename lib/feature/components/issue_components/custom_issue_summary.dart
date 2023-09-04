// ignore_for_file:file_names, prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables,use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DetailListWidget extends StatefulWidget {
  DetailListWidget({Key? key}) : super(key: key);

  @override
  State<DetailListWidget> createState() => _DetailListWidgetState();
}

class _DetailListWidgetState extends State<DetailListWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          width: size.width,
          height: size.height / 1.8,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          widget.statusCode == 'OPlanned'
                              ? Container(
                                  decoration: BoxDecoration(color: APPColors.NewNotifi.blue, borderRadius: BorderRadius.circular(3)),
                                  padding: EdgeInsets.all(3),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('Randevulu Vakadır'),
                                      Text(widget.planedDate.toString()),
                                    ],
                                  ),
                                )
                              : widget.respondedTimer == '1'
                                  ? Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
                                      padding: EdgeInsets.all(3),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('Hedef Yanıtlama Tarihi'),
                                          widget.targetRDate == ''
                                              ? Text('')
                                              : Text(
                                                  timeRecover(widget.targetRDate).toString(),
                                                  style: fixStyle(widget.respondedTimer.toString(), widget.fixTimer.toString(),
                                                      widget.targetFDate.toString(), widget.fixedDate.toString()),
                                                )
                                        ],
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      padding: EdgeInsets.all(3),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('Yanıtlama Tarihi'),
                                          widget.respondedDate == ''
                                              ? Text('')
                                              : Text(
                                                  timeRecover(widget.respondedDate).toString(),
                                                  style: fixStyle(widget.respondedTimer.toString(), widget.fixTimer.toString(),
                                                      widget.targetFDate.toString(), widget.fixedDate.toString()),
                                                ),
                                        ],
                                      ),
                                    ),
                        ],
                      ),
                      Column(children: [
                        widget.fixTimer == '1'
                            ? Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
                                padding: EdgeInsets.all(3),
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Hedef Düzeltme Tarihi'),
                                    widget.targetFDate == ''
                                        ? Text('')
                                        : Text(
                                            timeRecover(widget.targetFDate).toString(),
                                            style: fixStyle(widget.respondedTimer.toString(), widget.fixTimer.toString(),
                                                widget.targetFDate.toString(), widget.fixedDate.toString()),
                                          ),
                                  ],
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                padding: EdgeInsets.all(3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Düzeltme Tarihi'),
                                    widget.fixedDate == ''
                                        ? Text('')
                                        : Text(
                                            timeRecover(widget.fixedDate).toString(),
                                            style: fixStyle(widget.respondedTimer.toString(), widget.fixTimer.toString(),
                                                widget.targetFDate.toString(), widget.fixedDate.toString()),
                                          ),
                                  ],
                                ),
                              ),
                      ])
                    ],
                  ),
                  Divider(height: 15, color: APPColors.Main.black),
                  widget.code != ''
                      ? Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                widget.code != '' ? widget.code.toString() : '',
                                style: TextStyle(
                                  color: APPColors.Secondary.black,
                                  fontSize: 15,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                widget.idate != '' ? widget.idate.toString() : '',
                                style: TextStyle(
                                  color: APPColors.Secondary.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  widget.statusName != ''
                      ? Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                widget.statusName != '' ? widget.statusName.toString() : '',
                                style: TextStyle(
                                  color: APPColors.Secondary.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Expanded(flex: 3, child: Text(''))
                          ],
                        )
                      : Container(),
                  Divider(
                    height: 15,
                  ),
                  issueSummaryRow('Açıklama', widget.description.toString()),
                  Divider(
                    height: 15,
                  ),
                  issueSummaryRow('Vaka Sahibi', widget.contactName.toString()),
                  Divider(
                    height: 15,
                  ),
                  issueSummaryRow('Mahal', widget.locName.toString()),
                  Divider(
                    height: 15,
                  ),
                  issueSummaryRow('Mahal Yeri', widget.locTree.toString()),
                  Divider(
                    height: 15,
                  ),
                  issueSummaryRow('Arama Nedeni', widget.title.toString()),
                  Divider(
                    height: 15,
                  ),
                  issueSummaryRow('Varlık Bilgisi', widget.cmdb.toString()),
                  Divider(
                    height: 15,
                  ),
                  issueSummaryRow('Açılma Tarihi', widget.idate.toString()),
                  Divider(
                    height: 15,
                  ),
                  issueSummaryRow('Arayan Numara', widget.ani.toString()),
                  Divider(
                    height: 15,
                  ),
                  issueSummaryRow('Hedef Yanıtlama', timeRecover(widget.targetRDate).toString()),
                  Divider(
                    height: 15,
                  ),
                  issueSummaryRow('Hedef Düzeltme', timeRecover(widget.targetFDate).toString()),
                  Divider(
                    height: 15,
                  ),
                  issueSummaryRow('HYS-48 saat', widget.hys.toString()),
                  Divider(
                    height: 15,
                  ),
                  issueSummaryRow('HDS-48 saat', widget.hds.toString()),
                  Divider(
                    height: 15,
                  ),
                  issueSummaryRow('Atama Grubu', widget.assignmentGroupName.toString()),
                  Divider(
                    height: 15,
                  ),
                  issueSummaryRow('Atanan Kişi', widget.assigneName.toString()),
                  Divider(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column issueSummaryRow(header, description) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                header,
                style: TextStyle(
                  color: APPColors.Secondary.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                description,
                style: TextStyle(color: APPColors.Secondary.black, fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        Divider(
          height: 15,
        ),
      ],
    );
  }
}
