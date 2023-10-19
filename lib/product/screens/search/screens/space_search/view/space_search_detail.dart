import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wm_ppp_4/feature/components/appbar/custom_main_appbar.dart';

class SpaceSearchDetail extends StatefulWidget {
  final String code;
  final String name;
  final String locTree;
  final Map summary;
  final List sla;
  // ignore: non_constant_identifier_names
  final List bakim_is_emri;
  final List anlik_is_emri;

  const SpaceSearchDetail(
      {super.key,
      required this.code,
      required this.name,
      required this.locTree,
      required this.summary,
      required this.sla,
      required this.bakim_is_emri,
      required this.anlik_is_emri});

  @override
  State<SpaceSearchDetail> createState() => _SpaceSearchDetailState();
}

class _SpaceSearchDetailState extends State<SpaceSearchDetail> {
  @override
  Widget build(BuildContext context) {
    print(widget.summary);
    const headerStyle = TextStyle(color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);

    return Sizer(builder: (context, orientation, deviceType) {
      return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: const CustomMainAppbar(
                title: Text(
                  'Mahal Arama Detayı',
                  style: TextStyle(color: Colors.black),
                ),
                returnBack: true),
            body: Container(
                color: const Color.fromARGB(255, 224, 224, 224),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 70.h,
                          width: 85.w,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 79, 93, 107),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 35.h,
                                  child: Container(
                                    decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              const Text('Mimari Adı : ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                              SizedBox(
                                                width: 50.w,
                                                child: Text(widget.summary['LOCTREE'] ?? 'Veri Yok',
                                                    maxLines: 6,
                                                    overflow: TextOverflow.clip,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    )),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text('Sınıf : ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                              SizedBox(
                                                  width: 50.w,
                                                  child: Text(widget.summary['CLASS'] ?? 'Veri Yok',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                      )))
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text('EK18 Mahal Grubu : ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                              Text(widget.summary['EK18GROUP'] ?? 'Veri Yok',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ))
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text('Alan : ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                              SizedBox(
                                                  width: 50.w,
                                                  child: Text(widget.summary['AREA'] ?? 'Veri Yok',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                      )))
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text('Ana Grup : ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                              SizedBox(
                                                  width: 50.w,
                                                  child: Text(widget.summary['TYPE'] ?? 'Veri Yok',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                      )))
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text('Grup : ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                              SizedBox(
                                                  width: 50.w,
                                                  child: Text(widget.summary['TYPE2'] ?? 'Veri Yok',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                      )))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                  child: Accordion(
                                    maxOpenSections: 2,
                                    headerBackgroundColorOpened: Colors.black,
                                    headerBackgroundColor: Colors.black54,
                                    scaleWhenAnimating: true,
                                    openAndCloseAnimation: true,
                                    headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                                    sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                                    sectionClosingHapticFeedback: SectionHapticFeedback.light,
                                    children: [
                                      AccordionSection(
                                          isOpen: false,
                                          leftIcon: const Icon(Icons.apps, color: Colors.white),
                                          header: const Text('SLA', style: headerStyle),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                for (int i = 0; i < widget.sla.length; i++)
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                        height: 10.h,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(color: Colors.black),
                                                            borderRadius: const BorderRadius.all(Radius.circular(12))),
                                                        alignment: Alignment.center,
                                                        child: Center(
                                                            child: ElevatedButton(
                                                          onPressed: () {
                                                            // print('Routing issue detail page');

                                                            // final detailViewProvider = Provider.of<DetailViewProvider>(context, listen: false);

                                                            // detailViewProvider.setIssueCode = widget.sla[i]['BM_CODE'];
                                                          },
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(widget.sla[i]['BM_CODE'] + ' - ' + widget.sla[i]['BM_STATUSNAME']),
                                                              Text(widget.sla[i]['TARGET_FDATE']),
                                                            ],
                                                          ),
                                                        ))),
                                                  ),
                                                widget.sla.isNotEmpty ? const Text('') : const Text(' Sonuç Bulunamadı ')
                                              ],
                                            ),
                                          )),
                                      AccordionSection(
                                          isOpen: false,
                                          leftIcon: const Icon(Icons.people, color: Colors.white),
                                          header: const Text('Bakım İş Emri', style: headerStyle),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                for (int i = 0; i < widget.bakim_is_emri.length; i++)
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                        height: 10.h,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(color: Colors.black),
                                                            borderRadius: const BorderRadius.all(Radius.circular(12))),
                                                        alignment: Alignment.center,
                                                        child: Center(
                                                            child: ElevatedButton(
                                                          onPressed: () {
                                                            print('Routing wo detail page');

                                                            ///////////////////////////////////
                                                            ///  İŞ EMRİ SAYFASINA GİDECEK ///
                                                            //////////////////////////////////
                                                          },
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(widget.bakim_is_emri[i]['WO_CODE'] + ' - ' + widget.bakim_is_emri[i]['WO_STATUS']),
                                                              Text(widget.bakim_is_emri[i]['WO_NAME']),
                                                              Text('Planlanan Bitiş Tarihi : ' + widget.bakim_is_emri[i]['PLANNED_ENDDATE']),
                                                            ],
                                                          ),
                                                        ))),
                                                  ),
                                                widget.bakim_is_emri.isNotEmpty ? const Text('') : const Text(' Sonuç Bulunamadı ')
                                              ],
                                            ),
                                          )),
                                      AccordionSection(
                                          isOpen: false,
                                          leftIcon: const Icon(Icons.flag, color: Colors.white),
                                          header: const Text('Anlık İş Emri', style: headerStyle),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                for (int i = 0; i < widget.anlik_is_emri.length; i++)
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                        height: 10.h,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(color: Colors.black),
                                                            borderRadius: const BorderRadius.all(Radius.circular(12))),
                                                        alignment: Alignment.center,
                                                        child: Center(
                                                            child: ElevatedButton(
                                                          onPressed: () {
                                                            print('Routing anlik is emri detail page');

                                                            // final detailViewProvider =
                                                            //     Provider.of<DetailViewProvider>(context, listen: false);

                                                            //     detailViewProvider.setIssueCode = widget.anlik_is_emri[i]['BM_CODE'];
                                                          },
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(widget.anlik_is_emri[i]['WO_CODE'] + ' - ' + widget.anlik_is_emri[i]['WO_STATUS']),
                                                              Text(widget.anlik_is_emri[i]['WO_NAME']),
                                                            ],
                                                          ),
                                                        ))),
                                                  ),
                                                widget.anlik_is_emri.isNotEmpty ? const Text('') : const Text(' Sonuç Bulunamadı ')
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 14.h,
                          width: 85.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.code}-${widget.name}',
                                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                const Text(''),
                                Text(
                                  widget.locTree,
                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ));
    });
  }
}
