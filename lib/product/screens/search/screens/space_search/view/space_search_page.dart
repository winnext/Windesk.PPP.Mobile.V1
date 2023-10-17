import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:wm_ppp_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/product/screens/search/screens/space_search/provider/space_search_provider.dart';
import 'package:wm_ppp_4/product/screens/search/screens/space_search/view/space_search_list.dart';

class SpaceSearchPage extends StatefulWidget {
  const SpaceSearchPage({super.key});

  @override
  State<SpaceSearchPage> createState() => _SpaceSearchPageState();
}

class _SpaceSearchPageState extends State<SpaceSearchPage> {
  final globalKey = GlobalKey();
  cek(context) async {
    final searchProvider =
        Provider.of<SpaceSearchProvider>(context, listen: false);

    await searchProvider.mahalAramaKampusFetchData();
    List<String> kampus = searchProvider.mahalAraKampusArray[0];
    List kampusDatasi = searchProvider.mahalAraKampusArray;
    String dropdownvalueKampus =
        kampusDatasi[0].indexOf(searchProvider.mahalAraKampusValue) != -1
            ? searchProvider.mahalAraKampusValue
            : kampus[0];
    var secilenDegerKampus =
        kampusDatasi[1][kampusDatasi[0].indexOf(dropdownvalueKampus)];

    await searchProvider.mahalAramaBinaFetchData(secilenDegerKampus);
    List binaDatasi = searchProvider.mahalAraBinaArray;
    List<String> bina = searchProvider.mahalAraBinaArray[0];
    String dropdownvalueBina =
        binaDatasi[0].indexOf(searchProvider.mahalAraBinaValue) != -1
            ? searchProvider.mahalAraBinaValue
            : bina[0];
    var secilenDegerBina =
        binaDatasi[1][binaDatasi[0].indexOf(dropdownvalueBina)];

    await searchProvider.mahalAramaKatFetchData(secilenDegerBina);
    List<String> kat = searchProvider.mahalAraKatArray[0];
    List katDatasi = searchProvider.mahalAraKatArray;

    String dropdownvalueKat =
        katDatasi[0].indexOf(searchProvider.mahalAraKatValue) != -1
            ? searchProvider.mahalAraKatValue
            : kat[0];

    var secilenDegerKat = katDatasi[1][katDatasi[0].indexOf(dropdownvalueKat)];

    await searchProvider.mahalAramaKanatFetchData(secilenDegerKat);
    await searchProvider.mahalAramaSinifFetchData('');
    await searchProvider.mahalAramaGrupFetchData();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceSearchProvider(),
      child: Consumer<SpaceSearchProvider>(
          builder: (context, SpaceSearchProvider spaceSearchProvider, child) {
        //spaceSearchProvider.mahalAramaKampusFetchData();
        spaceSearchProvider.mahalAraKampusArray.isNotEmpty
            ? null
            : cek(context);
        //print(_scrollController);
        ///////////////////////////////////////////////////////
        //////////////////////////////        ///////////////////////
        ///////////////////////       KAMPUS     ////////////////////////
        //////////////////////////           ///////////////////////
        //////////////////////////////////////////////////////////
        List<String> kampus = spaceSearchProvider.mahalAraKampusArray[0];
        //print(spaceSearchProvider.mahalAraKampusArray);
        List kampusDatasi = spaceSearchProvider.mahalAraKampusArray;

        String dropdownvalueKampus =
            kampusDatasi[0].indexOf(spaceSearchProvider.mahalAraKampusValue) !=
                    -1
                ? spaceSearchProvider.mahalAraKampusValue
                : kampus[0];

        //spaceSearchProvider.mahalAramaBinaFetchData(secilen_deger_kampus);
        //print(spaceSearchProvider.mahalAraBinaArray);

        ///////////////////////////////////////////////////////
        //////////////////////////////        ///////////////////////
        ///////////////////////       BINA       ////////////////////////
        //////////////////////////           ///////////////////////
        //////////////////////////////////////////////////////////
        List binaDatasi = spaceSearchProvider.mahalAraBinaArray;
        List<String> bina = spaceSearchProvider.mahalAraBinaArray[0];

        String dropdownvalueBina =
            binaDatasi[0].indexOf(spaceSearchProvider.mahalAraBinaValue) != -1
                ? spaceSearchProvider.mahalAraBinaValue
                : bina[0];

        //print(spaceSearchProvider.mahalAraKatArray[0]);

        ///////////////////////////////////////////////////////
        //////////////////////////////        ///////////////////////
        ///////////////////////       KAT        ////////////////////////
        //////////////////////////           ///////////////////////
        //////////////////////////////////////////////////////////

        List<String> kat = spaceSearchProvider.mahalAraKatArray[0];
        List katDatasi = spaceSearchProvider.mahalAraKatArray;

        String? dropdownvalueKat =
            katDatasi[0].indexOf(spaceSearchProvider.mahalAraKatValue) != -1
                ? spaceSearchProvider.mahalAraKatValue
                : kat[0];

        ///////////////////////////////////////////////////////
        //////////////////////////////        ///////////////////////
        ///////////////////////       KANAT      /////////////////////
        //////////////////////////           ///////////////////////
        //////////////////////////////////////////////////////////

        List<String> kanat = spaceSearchProvider.mahalAraKanatArray[0];
        List kanatDatasi = spaceSearchProvider.mahalAraKanatArray;

        String dropdownvalueKanat =
            kanatDatasi[0].indexOf(spaceSearchProvider.mahalAraKanatValue) != -1
                ? spaceSearchProvider.mahalAraKanatValue
                : kanat[0];

        ///////////////////////////////////////////////////////
        //////////////////////////////        ///////////////////////
        ///////////////////////       SINIF     ////////////////////////
        //////////////////////////           ///////////////////////
        //////////////////////////////////////////////////////////

        //spaceSearchProvider.mahalAramaSinifFetchData(secilen_deger_kanat);
        List<String> sinif = spaceSearchProvider.mahalAraSinifArray[0];

        String dropdownvalueSinif = spaceSearchProvider.mahalAraSinifValue;

        ///////////////////////////////////////////////////////
        //////////////////////////////        ///////////////////////
        ///////////////////////       GRUP     ////////////////////////
        //////////////////////////           ///////////////////////
        //////////////////////////////////////////////////////////

        //spaceSearchProvider.mahalAramaSinifFetchData(secilen_deger_kanat);
        List<String> grup = spaceSearchProvider.mahalAraGrupArray[0];

        String dropdownvalueGrup = spaceSearchProvider.mahalAraGrupValue;

        return Sizer(builder: (context, orientation, deviceType) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: const CustomMainAppbar(
                    title: Text('Mahal Arama'), returnBack: true),
                body: Center(
                    child: grup.isNotEmpty &&
                            kampus.isNotEmpty &&
                            bina.isNotEmpty &&
                            kat.isNotEmpty &&
                            kanat.isNotEmpty &&
                            sinif.isNotEmpty &&
                            grup.isNotEmpty
                        ? SingleChildScrollView(
                            child: SizedBox(
                              width: 85.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: <Widget>[
                                        TextField(
                                          controller: spaceSearchProvider
                                              .mahalAramaMahalKodu,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            labelText: 'Mahal Kodu',
                                          ),
                                          onChanged: (inputValue) {
                                            //print(spaceSearchProvider.varliKodu.text);
                                            if (spaceSearchProvider
                                                    .varliKodu.text ==
                                                '') {
                                              spaceSearchProvider
                                                  .setVakaButonVisible = false;
                                            } else {
                                              spaceSearchProvider
                                                  .setVakaButonVisible = true;
                                            }
                                          },
                                        ),
                                        IconButton(
                                          icon:
                                              const Icon(Icons.qr_code_scanner),
                                          onPressed: () {
                                            spaceSearchProvider
                                                .scanBarcodeNormal(
                                                    'setMahalAramaMahalKodu');
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
                                    child: TextField(
                                      controller: spaceSearchProvider
                                          .mahalAramaMahalAdi,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        labelText: 'Mahal Adı',
                                      ),
                                      onChanged: (inputValue) {
                                        //print(spaceSearchProvider.vakaNo.text);
                                        if (spaceSearchProvider.vakaNo.text ==
                                            '') {
                                          spaceSearchProvider
                                              .setVakaButonVisible = false;
                                        } else {
                                          spaceSearchProvider
                                              .setVakaButonVisible = true;
                                        }
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField(
                                      isExpanded: true,

                                      // Initial Value
                                      value: dropdownvalueKampus,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        labelText: 'Kampüs',
                                      ),

                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: kampus.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalueKampus = newValue!;
                                        });
                                        spaceSearchProvider
                                            .setmahalAraKampusValue = newValue!;
                                        cek(context);
                                      },
                                    ),
                                  ),
                                  dropdownvalueKampus != 'Kampüs'
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownButtonFormField(
                                            isExpanded: true,

                                            // Initial Value
                                            value: dropdownvalueBina,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              labelText: 'Bina',
                                            ),

                                            // Down Arrow Icon
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),

                                            // Array list of items
                                            items: bina.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items),
                                              );
                                            }).toList(),
                                            // After selecting the desired option,it will
                                            // change button value to selected value
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalueBina = newValue!;
                                              });
                                              spaceSearchProvider
                                                      .setmahalAraBinaValue =
                                                  newValue!;

                                              cek(context);
                                            },
                                          ),
                                        )
                                      : Container(),
                                  dropdownvalueBina != 'Bina'
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownButtonFormField(
                                            isExpanded: true,

                                            // Initial Value
                                            value: dropdownvalueKat,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              labelText: 'Kat',
                                            ),

                                            // Down Arrow Icon
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),

                                            // Array list of items
                                            items: kat.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items),
                                              );
                                            }).toList(),
                                            // After selecting the desired option,it will
                                            // change button value to selected value
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalueKat = newValue;
                                                spaceSearchProvider
                                                        .setMahalAraKatValue =
                                                    newValue!;
                                              });
                                              cek(context);
                                            },
                                          ),
                                        )
                                      : Container(),
                                  dropdownvalueKat != 'Kat'
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownButtonFormField(
                                            isExpanded: true,

                                            // Initial Value
                                            value: dropdownvalueKanat,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              labelText: 'Kanat',
                                            ),

                                            // Down Arrow Icon
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),

                                            // Array list of items
                                            items: kanat.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items),
                                              );
                                            }).toList(),
                                            // After selecting the desired option,it will
                                            // change button value to selected value
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalueKanat = newValue!;
                                              });
                                              spaceSearchProvider
                                                      .setMahalAraKanatValue =
                                                  newValue!;
                                              cek(context);
                                            },
                                          ),
                                        )
                                      : Container(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField(
                                      isExpanded: true,

                                      // Initial Value
                                      value: dropdownvalueSinif,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        labelText: 'Sınıf',
                                      ),

                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: sinif.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalueSinif = newValue!;
                                        });
                                        spaceSearchProvider
                                            .setMahalAraSinifValue = newValue!;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField(
                                      isExpanded: true,

                                      // Initial Value
                                      value: dropdownvalueGrup,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        labelText: 'Grup',
                                      ),

                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: grup.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalueGrup = newValue!;
                                        });
                                        spaceSearchProvider
                                            .setMahalAraGrupValue = newValue!;
                                      },
                                    ),
                                  ),
                                  spaceSearchProvider
                                                  .mahalAramaMahalKodu.text !=
                                              '' ||
                                          spaceSearchProvider
                                                  .mahalAramaMahalAdi.text !=
                                              '' ||
                                          dropdownvalueKampus != 'Kampüs' ||
                                          dropdownvalueBina != 'Bina' ||
                                          dropdownvalueKat != 'Kat' ||
                                          dropdownvalueKanat != 'Kanat' ||
                                          dropdownvalueSinif != 'Sınıf' ||
                                          dropdownvalueGrup != 'Grup'
                                      ? Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SizedBox(
                                            width: 45.w,
                                            height: 8.h,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                // ignore: deprecated_member_use
                                                primary: APPColors.Main.red,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20), // <-- Radius
                                                ),
                                              ),
                                              onPressed: () {
                                                spaceSearchProvider
                                                        .setmahalAraKampusValue =
                                                    'Kampüs';
                                                spaceSearchProvider
                                                        .setmahalAraBinaValue =
                                                    'Bina';
                                                spaceSearchProvider
                                                        .setMahalAraKatValue =
                                                    'Kat';
                                                spaceSearchProvider
                                                        .setMahalAraKanatValue =
                                                    'Kanat';
                                                spaceSearchProvider
                                                        .setMahalAraSinifValue =
                                                    'Sınıf';
                                                spaceSearchProvider
                                                        .setMahalAraGrupValue =
                                                    'Grup';
                                                spaceSearchProvider
                                                    .setMahalAramaMahalAdi = '';
                                                spaceSearchProvider
                                                    .setMahalAramaMahalKodu = '';
                                              },
                                              child: const Text('Temizle'),
                                            ),
                                          ),
                                        )
                                      : const Text(''),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      width: 45.w,
                                      height: 8.h,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          // ignore: deprecated_member_use
                                          primary: APPColors.Login.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                20), // <-- Radius
                                          ),
                                        ),
                                        onPressed: () async {
                                          List binaDatasi = spaceSearchProvider
                                              .mahalAraBinaArray;
                                          List<String> bina =
                                              spaceSearchProvider
                                                  .mahalAraBinaArray[0];
                                          String dropdownvalueBina = binaDatasi[
                                                          0]
                                                      .indexOf(spaceSearchProvider
                                                          .mahalAraBinaValue) !=
                                                  -1
                                              ? spaceSearchProvider
                                                  .mahalAraBinaValue
                                              : bina[0];

                                          List<String> kat = spaceSearchProvider
                                              .mahalAraKatArray[0];
                                          List katDatasi = spaceSearchProvider
                                              .mahalAraKatArray;
                                          String dropdownvalueKat = katDatasi[0]
                                                      .indexOf(spaceSearchProvider
                                                          .mahalAraKatValue) !=
                                                  -1
                                              ? spaceSearchProvider
                                                  .mahalAraKatValue
                                              : kat[0];

                                          List<String> kanat =
                                              spaceSearchProvider
                                                  .mahalAraKanatArray[0];
                                          List kanatDatasi = spaceSearchProvider
                                              .mahalAraKanatArray;
                                          String
                                              dropdownvalueKanat =
                                              kanatDatasi[0].indexOf(
                                                          spaceSearchProvider
                                                              .mahalAraKanatValue) !=
                                                      -1
                                                  ? spaceSearchProvider
                                                      .mahalAraKanatValue
                                                  : kanat[0];

                                          List sinifDatasi = spaceSearchProvider
                                              .mahalAraSinifArray;
                                          String dropdownvalueSinif =
                                              spaceSearchProvider
                                                  .mahalAraSinifValue;

                                          List grupDatasi = spaceSearchProvider
                                              .mahalAraGrupArray;
                                          String dropdownvalueGrup =
                                              spaceSearchProvider
                                                  .mahalAraGrupValue;

                                          var mahalKodu = spaceSearchProvider
                                              .mahalAramaMahalKodu.text;
                                          var mahalAdi = spaceSearchProvider
                                              .mahalAramaMahalAdi.text;

                                          var binaKodum = spaceSearchProvider
                                                  .mahalAraBinaArray[1][
                                              binaDatasi[0]
                                                  .indexOf(dropdownvalueBina)];
                                          var binaKodu = binaKodum != 'Bina'
                                              ? binaKodum
                                              : '';

                                          var katKodum = spaceSearchProvider
                                                  .mahalAraKatArray[1][
                                              katDatasi[0]
                                                  .indexOf(dropdownvalueKat)];
                                          var katKodu =
                                              katKodum != 'Kat' ? katKodum : '';

                                          var kanatKodum = spaceSearchProvider
                                                  .mahalAraKanatArray[1][
                                              kanatDatasi[0]
                                                  .indexOf(dropdownvalueKanat)];
                                          var kanatKodu = kanatKodum != 'Kanat'
                                              ? kanatKodum
                                              : '';

                                          var sinifKodum = spaceSearchProvider
                                                  .mahalAraSinifArray[1][
                                              sinifDatasi[0]
                                                  .indexOf(dropdownvalueSinif)];
                                          var sinifKodu = sinifKodum != 'Sınıf'
                                              ? sinifKodum
                                              : '';

                                          var grupKodum = spaceSearchProvider
                                                  .mahalAraGrupArray[1][
                                              grupDatasi[0]
                                                  .indexOf(dropdownvalueGrup)];
                                          var grupKodu = grupKodum != 'Grup'
                                              ? grupKodum
                                              : '';

                                          // var kat = dropdownvalueKat != 'Kat' ? dropdownvalueKat : '';
                                          // var kanat = dropdownvalueKanat != 'Kanat' ? dropdownvalueKanat : '';
                                          // var sinif = dropdownvalueSinif != 'Sınıf' ? dropdownvalueSinif : '';
                                          //var grup = dropdownvalueGrup != 'Grup' ? dropdownvalueGrup : '';
                                          if (spaceSearchProvider
                                                      .mahalAramaMahalKodu
                                                      .text ==
                                                  '' &&
                                              spaceSearchProvider
                                                      .mahalAramaMahalAdi
                                                      .text ==
                                                  '' &&
                                              dropdownvalueKampus == 'Kampüs' &&
                                              dropdownvalueBina == 'Bina' &&
                                              dropdownvalueKat == 'Kat' &&
                                              dropdownvalueKanat == 'Kanat') {
                                            snackBar(
                                                context,
                                                'Arama yaparken en az bir kriter seçilmelidir',
                                                'info');
                                          } else {
                                            spaceSearchProvider.setSayfa = '1';
                                            List liste =
                                                await spaceSearchProvider
                                                    .mahalAramaListesi(
                                                        context,
                                                        mahalKodu,
                                                        mahalAdi,
                                                        binaKodu,
                                                        katKodu,
                                                        kanatKodu,
                                                        sinifKodu,
                                                        grupKodu,
                                                        20,
                                                        1);
                                            //push button
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SpaceSearchList(
                                                          mahalKodu: mahalKodu,
                                                          mahalAdi: mahalAdi,
                                                          binaKodu: binaKodu,
                                                          katKodu: katKodu,
                                                          kanatKodu: kanatKodu,
                                                          sinifKodu: sinifKodu,
                                                          grupKodu: grupKodu,
                                                          liste: liste)),
                                            );
                                          }
                                        },
                                        child: const Text('Ara'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const Text('data'))),
          );
        });
      }),
    );
  }
}
