import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:wm_ppp_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:wm_ppp_4/feature/components/snackBar/snackbar.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/product/screens/search/screens/space_search/provider/space_search_provider.dart';

class SpaceSearchPage extends StatefulWidget {
  const SpaceSearchPage({super.key});

  @override
  State<SpaceSearchPage> createState() => _SpaceSearchPageState();
}

class _SpaceSearchPageState extends State<SpaceSearchPage> {
  final globalKey = GlobalKey();
  cek() async {
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

    var secilenDegerKat =
        katDatasi[1][katDatasi[0].indexOf(dropdownvalueKat)];

    await searchProvider.mahalAramaKanatFetchData(secilenDegerKat);
    await searchProvider.mahalAramaSinifFetchData('');
    await searchProvider.mahalAramaGrupFetchData();
  }

  @override
  void initState() {
    super.initState();

    cek();
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider =
        Provider.of<SpaceSearchProvider>(context, listen: true);
    //searchProvider.mahalAramaKampusFetchData();


    //print(_scrollController);
    ///////////////////////////////////////////////////////
    //////////////////////////////        ///////////////////////
    ///////////////////////       KAMPUS     ////////////////////////
    //////////////////////////           ///////////////////////
    //////////////////////////////////////////////////////////
    List<String> kampus = searchProvider.mahalAraKampusArray[0];
    //print(searchProvider.mahalAraKampusArray);
    List kampusDatasi = searchProvider.mahalAraKampusArray;

    String dropdownvalueKampus =
        kampusDatasi[0].indexOf(searchProvider.mahalAraKampusValue) != -1
            ? searchProvider.mahalAraKampusValue
            : kampus[0];

   

   

    //searchProvider.mahalAramaBinaFetchData(secilen_deger_kampus);
    //print(searchProvider.mahalAraBinaArray);

    ///////////////////////////////////////////////////////
    //////////////////////////////        ///////////////////////
    ///////////////////////       BINA       ////////////////////////
    //////////////////////////           ///////////////////////
    //////////////////////////////////////////////////////////
    List binaDatasi = searchProvider.mahalAraBinaArray;
    List<String> bina = searchProvider.mahalAraBinaArray[0];

    String dropdownvalueBina =
        binaDatasi[0].indexOf(searchProvider.mahalAraBinaValue) != -1
            ? searchProvider.mahalAraBinaValue
            : bina[0];
   
   

    //print(searchProvider.mahalAraKatArray[0]);

    ///////////////////////////////////////////////////////
    //////////////////////////////        ///////////////////////
    ///////////////////////       KAT        ////////////////////////
    //////////////////////////           ///////////////////////
    //////////////////////////////////////////////////////////

    List<String> kat = searchProvider.mahalAraKatArray[0];
    List katDatasi = searchProvider.mahalAraKatArray;

    String? dropdownvalueKat =
        katDatasi[0].indexOf(searchProvider.mahalAraKatValue) != -1
            ? searchProvider.mahalAraKatValue
            : kat[0];

   
    ///////////////////////////////////////////////////////
    //////////////////////////////        ///////////////////////
    ///////////////////////       KANAT      /////////////////////
    //////////////////////////           ///////////////////////
    //////////////////////////////////////////////////////////

    List<String> kanat = searchProvider.mahalAraKanatArray[0];
    List kanatDatasi = searchProvider.mahalAraKanatArray;

    String dropdownvalueKanat =
        kanatDatasi[0].indexOf(searchProvider.mahalAraKanatValue) != -1
            ? searchProvider.mahalAraKanatValue
            : kanat[0];

   

    ///////////////////////////////////////////////////////
    //////////////////////////////        ///////////////////////
    ///////////////////////       SINIF     ////////////////////////
    //////////////////////////           ///////////////////////
    //////////////////////////////////////////////////////////

    //searchProvider.mahalAramaSinifFetchData(secilen_deger_kanat);
    List<String> sinif = searchProvider.mahalAraSinifArray[0];


    String dropdownvalueSinif = searchProvider.mahalAraSinifValue;

   
    ///////////////////////////////////////////////////////
    //////////////////////////////        ///////////////////////
    ///////////////////////       GRUP     ////////////////////////
    //////////////////////////           ///////////////////////
    //////////////////////////////////////////////////////////

    //searchProvider.mahalAramaSinifFetchData(secilen_deger_kanat);
    List<String> grup = searchProvider.mahalAraGrupArray[0];

    String dropdownvalueGrup = searchProvider.mahalAraGrupValue;


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
                                      controller:
                                          searchProvider.mahalAramaMahalKodu,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        labelText: 'Mahal Kodu',
                                      ),
                                      onChanged: (inputValue) {
                                        //print(searchProvider.varliKodu.text);
                                        if (searchProvider.varliKodu.text ==
                                            '') {

                                          searchProvider.setVakaButonVisible =
                                              false;
                                        } else {
                                          searchProvider.setVakaButonVisible =
                                              true;
                                        }
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.qr_code_scanner),
                                      onPressed: () {
                                        searchProvider.scanBarcodeNormal(
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
                                  controller: searchProvider.mahalAramaMahalAdi,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    labelText: 'Mahal Adı',
                                  ),
                                  onChanged: (inputValue) {
                                    //print(searchProvider.vakaNo.text);
                                    if (searchProvider.vakaNo.text == '') {

                                      searchProvider.setVakaButonVisible =
                                          false;
                                    } else {
                                      searchProvider.setVakaButonVisible = true;
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
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    labelText: 'Kampüs',
                                  ),

                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),

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
                                    searchProvider.setmahalAraKampusValue =
                                        newValue!;
                                    cek();
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
                                          searchProvider.setmahalAraBinaValue =
                                              newValue!;

                                          cek();
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
                                            searchProvider.setMahalAraKatValue =
                                                newValue!;
                                          });
                                          cek();
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
                                          searchProvider.setMahalAraKanatValue =
                                              newValue!;
                                          cek();
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
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    labelText: 'Sınıf',
                                  ),

                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),

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
                                    searchProvider.setMahalAraSinifValue =
                                        newValue!;
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
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    labelText: 'Grup',
                                  ),

                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),

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
                                    searchProvider.setMahalAraGrupValue =
                                        newValue!;
                                  },
                                ),
                              ),
                              searchProvider.mahalAramaMahalKodu.text != '' ||
                                      searchProvider.mahalAramaMahalAdi.text !=
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
                                            searchProvider
                                                    .setmahalAraKampusValue =
                                                'Kampüs';
                                            searchProvider
                                                .setmahalAraBinaValue = 'Bina';
                                            searchProvider.setMahalAraKatValue =
                                                'Kat';
                                            searchProvider
                                                    .setMahalAraKanatValue =
                                                'Kanat';
                                            searchProvider
                                                    .setMahalAraSinifValue =
                                                'Sınıf';
                                            searchProvider
                                                .setMahalAraGrupValue = 'Grup';
                                            searchProvider
                                                .setMahalAramaMahalAdi = '';
                                            searchProvider
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
                                    onPressed: () {
                                      List binaDatasi =
                                          searchProvider.mahalAraBinaArray;
                                      List<String> bina =
                                          searchProvider.mahalAraBinaArray[0];
                                      String dropdownvalueBina = binaDatasi[0]
                                                  .indexOf(searchProvider
                                                      .mahalAraBinaValue) !=
                                              -1
                                          ? searchProvider.mahalAraBinaValue
                                          : bina[0];

                                      List<String> kat =
                                          searchProvider.mahalAraKatArray[0];
                                      List katDatasi =
                                          searchProvider.mahalAraKatArray;
                                      String dropdownvalueKat = katDatasi[0]
                                                  .indexOf(searchProvider
                                                      .mahalAraKatValue) !=
                                              -1
                                          ? searchProvider.mahalAraKatValue
                                          : kat[0];

                                      List<String> kanat =
                                          searchProvider.mahalAraKanatArray[0];
                                      List kanatDatasi =
                                          searchProvider.mahalAraKanatArray;
                                      String dropdownvalueKanat = kanatDatasi[0]
                                                  .indexOf(searchProvider
                                                      .mahalAraKanatValue) !=
                                              -1
                                          ? searchProvider.mahalAraKanatValue
                                          : kanat[0];

                                      List sinifDatasi =
                                          searchProvider.mahalAraSinifArray;
                                      String dropdownvalueSinif =
                                          searchProvider.mahalAraSinifValue;

                                      List grupDatasi =
                                          searchProvider.mahalAraGrupArray;
                                      String dropdownvalueGrup =
                                          searchProvider.mahalAraGrupValue;

                                      var mahalKodu = searchProvider
                                          .mahalAramaMahalKodu.text;
                                      var mahalAdi = searchProvider
                                          .mahalAramaMahalAdi.text;

                                      var binaKodum =
                                          searchProvider.mahalAraBinaArray[1][
                                              binaDatasi[0]
                                                  .indexOf(dropdownvalueBina)];
                                      var binaKodu =
                                          binaKodum != 'Bina' ? binaKodum : '';

                                      var katKodum =
                                          searchProvider.mahalAraKatArray[1][
                                              katDatasi[0]
                                                  .indexOf(dropdownvalueKat)];
                                      var katKodu =
                                          katKodum != 'Kat' ? katKodum : '';

                                      var kanatKodum =
                                          searchProvider.mahalAraKanatArray[1][
                                              kanatDatasi[0]
                                                  .indexOf(dropdownvalueKanat)];
                                      var kanatKodu = kanatKodum != 'Kanat'
                                          ? kanatKodum
                                          : '';

                                      var sinifKodum =
                                          searchProvider.mahalAraSinifArray[1][
                                              sinifDatasi[0]
                                                  .indexOf(dropdownvalueSinif)];
                                      var sinifKodu = sinifKodum != 'Sınıf'
                                          ? sinifKodum
                                          : '';

                                      var grupKodum =
                                          searchProvider.mahalAraGrupArray[1][
                                              grupDatasi[0]
                                                  .indexOf(dropdownvalueGrup)];
                                      var grupKodu =
                                          grupKodum != 'Grup' ? grupKodum : '';

                                      // var kat = dropdownvalueKat != 'Kat' ? dropdownvalueKat : '';
                                      // var kanat = dropdownvalueKanat != 'Kanat' ? dropdownvalueKanat : '';
                                      // var sinif = dropdownvalueSinif != 'Sınıf' ? dropdownvalueSinif : '';
                                      //var grup = dropdownvalueGrup != 'Grup' ? dropdownvalueGrup : '';
                                      if (searchProvider
                                                  .mahalAramaMahalKodu.text ==
                                              '' &&
                                          searchProvider
                                                  .mahalAramaMahalAdi.text ==
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
                                        searchProvider.setSayfa = '1';
                                        searchProvider.mahalAramaListesi(
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
  }
}
