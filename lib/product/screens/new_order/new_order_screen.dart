import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:wm_ppp_4/feature/components/loading/custom_loading_indicator.dart';
import 'package:wm_ppp_4/feature/constants/functions/invalid_device_id_check.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/product/screens/new_order/new_order_provider.dart';

@RoutePage()
class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({super.key, this.photos, this.b64s});
  final List? photos;
  final List? b64s;
  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  List photoss = [];
  List b64ss = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    InvalidDeviceId().check(context);
    return ChangeNotifierProvider(
        create: (context) => NewOrderProvider(),
        child: Consumer<NewOrderProvider>(
            builder: (context, NewOrderProvider woProvider, child) {
          b64ss = widget.b64s ?? [''];
          photoss = widget.photos ?? [''];

          woProvider.woCreateHizmetListeArray.isEmpty
              ? woProvider.woCreateHizmetListesi()
              : null;

          // final woProvider =
          //     Provider.of<NewOrderProvider>(context, listen: true);
          // nProvider.clear = 1;
          var photos = woProvider.photos;

          // load(woProvider) async {
          //   await woProvider.woCreateHizmetListesi('sgnm1001');
          //   print('data');
          //   print(woProvider.woCreateHizmetListeArray);
          // }

          // load(woProvider);

          // ignore: no_leading_underscores_for_local_identifiers

          List<String> hizmet = woProvider.woCreateHizmetListeArray.isNotEmpty
              ? woProvider.woCreateHizmetListeArray[0]
              : ['Hizmet'];
          List hizmetDatasi = woProvider.woCreateHizmetListeArray;

          String dropdownvalueHizmet = !woProvider.loading
              ? hizmetDatasi[0].indexOf(woProvider.woCreateHizmetValue) != -1
                  ? woProvider.woCreateHizmetValue
                  : hizmet[0]
              : 'Hizmet';

//////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
//////////////////////  İş Emri Adı     /////////////////////////
/////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

          List<String> isEmriAdi = woProvider.woCreateIsEmriAdiListeArray[0];
          List isEmriAdiDatasi = woProvider.woCreateIsEmriAdiListeArray;

          String dropdownvalueIsEmriAdi = isEmriAdiDatasi[0]
                      .indexOf(woProvider.woCreateIsEmriAdiListeValue) !=
                  -1
              ? woProvider.woCreateIsEmriAdiListeValue
              : isEmriAdi[0];

//////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
//////////////////////  Öncelik     /////////////////////////
/////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////

          List<String> oncelik = woProvider.woCreateOncelikListeArray[0];
          List oncelikDatasi = woProvider.woCreateOncelikListeArray;

          String dropdownvalueOncelik =
              oncelikDatasi[0].indexOf(woProvider.woCreateOncelikListeValue) !=
                      -1
                  ? woProvider.woCreateOncelikListeValue
                  : oncelik[0];

          return Sizer(builder: (context, orientation, deviceType) {
            return Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: const Text(
                    'Yeni İş Emri',
                    style: TextStyle(color: Colors.black),
                  ),
                  centerTitle: true,
                  actions: const [],
                ),
                body: Center(
                    child: !woProvider.loading
                        ? SingleChildScrollView(
                            child: SizedBox(
                              width: 85.w,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: <Widget>[
                                        TextField(
                                          controller: woProvider.mahal,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            labelText: 'Mahal',
                                          ),
                                          onChanged: (inputValue) {},
                                        ),
                                        IconButton(
                                          icon:
                                              const Icon(Icons.qr_code_scanner),
                                          onPressed: () {
                                            woProvider.scanBarcodeNormal();
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                            // Your codes...
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField(
                                      isExpanded: true,

                                      // Initial Value
                                      value: dropdownvalueHizmet,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        labelText: 'Hizmet',
                                      ),

                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: hizmet.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (newValue) {
                                        // setState(() {
                                        //   dropdownvalueBina = newValue!;
                                        // });
                                        woProvider.setWoCreateHizmetValue =
                                            newValue!;

                                        // cek();
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField(
                                      isExpanded: true,

                                      // Initial Value
                                      value: dropdownvalueIsEmriAdi,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        labelText: 'İş Emri Adı',
                                      ),

                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: isEmriAdi.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (newValue) {
                                        // setState(() {
                                        //   dropdownvalueBina = newValue!;
                                        // });
                                        woProvider
                                                .setWoCreateIsEmriAdiListeValue =
                                            newValue!;

                                        // cek();
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: woProvider.aciklama,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        labelText: 'Açıklama',
                                      ),
                                      onChanged: (inputValue) {
                                        //print(searchProvider.vakaNo.text);
                                        // if(searchProvider.vakaNo.text == ''){
                                        //   vakaNo = 0;

                                        //   searchProvider.setVakaButonVisible = false;

                                        // } else{
                                        //   vakaNo =  1;
                                        //               searchProvider.setVakaButonVisible = true;

                                        //   }
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField(
                                      isExpanded: true,

                                      // Initial Value
                                      value: dropdownvalueOncelik,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        labelText: 'Öncelik',
                                      ),

                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: oncelik.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (newValue) {
                                        woProvider
                                                .setwoCreateOncelikListeValue =
                                            newValue!;

                                        // cek();
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: woProvider.varlik,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        labelText: 'Varlık',
                                      ),
                                      onChanged: (inputValue) {
                                        //print(searchProvider.vakaNo.text);
                                        // if(searchProvider.vakaNo.text == ''){
                                        //   vakaNo = 0;

                                        //   searchProvider.setVakaButonVisible = false;

                                        // } else{
                                        //   vakaNo =  1;
                                        //               searchProvider.setVakaButonVisible = true;

                                        //   }
                                      },
                                    ),
                                  ),
                                  const Text(''),
                                  // photoss.isNotEmpty
                                  //     ? Center(
                                  //         child: Padding(
                                  //           padding: const EdgeInsets.all(8.0),
                                  //           child: SizedBox(
                                  //               height: 25.h,
                                  //               width: 50.w,
                                  //               child: Card(
                                  //                 child: Column(
                                  //                   children: [
                                  //                     ElevatedButton(
                                  //                       style: ElevatedButton.styleFrom(
                                  //                         foregroundColor: Colors.white,
                                  //                         backgroundColor: Colors.red,
                                  //                         fixedSize: Size(
                                  //                             15.w, 2.h), // foreground
                                  //                       ),
                                  //                       onPressed: () {
                                  //                         woProvider.deletePhotos = 0;
                                  //                         woProvider.deleteB64 = 0;
                                  //                         setState(() {
                                  //                           b64ss = [];
                                  //                           photoss = [];
                                  //                         });
                                  //                       },
                                  //                       child:
                                  //                           Icon(size: 5.w, Icons.delete),
                                  //                     ),
                                  //                     SizedBox(
                                  //                       height: 13.h,
                                  //                       child:
                                  //                           Image.file(File(photoss[0])),
                                  //                     )
                                  //                   ],
                                  //                 ),
                                  //               )),
                                  //         ),
                                  //       )
                                  //     : const Text(''),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: SizedBox(
                                        width: 60.w,
                                        height: 5.h,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 30.w,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        APPColors.Login.red,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      20)),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    // BaseBottomSheet.show(
                                                    //     context,
                                                    //     ImageBottomSheet2(
                                                    //         workOrderCode: 'WO00001',
                                                    //         clearContext: context));
                                                    woProvider.setMahal = '';
                                                    woProvider.setAciklama = '';
                                                    woProvider
                                                            .setWoCreateHizmetValue =
                                                        woProvider
                                                                .woCreateHizmetListeArray[
                                                            0][0];
                                                    woProvider
                                                            .setWoCreateIsEmriAdiListeValue =
                                                        woProvider
                                                                .woCreateIsEmriAdiListeArray[
                                                            0][0];
                                                    woProvider
                                                            .setwoCreateOncelikListeValue =
                                                        woProvider
                                                                .woCreateOncelikListeArray[
                                                            0][0];

                                                    woProvider.clear = 1;
                                                    woProvider.setVarlik = '';
                                                  },
                                                  child: photos.isNotEmpty
                                                      ? (const Text('Vazgeç'))
                                                      : (const Text('Vazgeç'))),
                                            ),
                                            SizedBox(
                                              width: 30.w,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      APPColors.Login.blue,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  woProvider.woCreate(context);
                                                },
                                                child: const Text('Oluştur'),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const CustomLoadingIndicator()));
          });
        }));
  }
}
