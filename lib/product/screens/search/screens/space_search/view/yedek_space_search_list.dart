import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:wm_ppp_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:wm_ppp_4/product/screens/search/screens/space_search/provider/space_search_provider.dart';
import 'package:wm_ppp_4/product/screens/search/screens/space_search/view/space_search_detail.dart';
import 'package:wm_ppp_4/product/screens/search/service/search_service_repo_impl.dart';

class SpaceSearchList extends StatelessWidget {
  SpaceSearchList(
      {super.key,
      required this.mahalKodu,
      required this.mahalAdi,
      required this.binaKodu,
      required this.katKodu,
      required this.kanatKodu,
      required this.sinifKodu,
      required this.grupKodu,
      required this.liste});
  final List liste;
  final String mahalKodu;
  final String mahalAdi;
  final String binaKodu;
  final String katKodu;
  final String kanatKodu;
  final String sinifKodu;
  final String grupKodu;

  final SearchServiceRepoImpml apirepository = SearchServiceRepoImpml();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceSearchProvider(),
      child: Consumer<SpaceSearchProvider>(
          builder: (context2, SpaceSearchProvider searchProvider, child) {
        var data = liste;

        List<String> codes = [];
        List<String> locTrees = [];
        List<String> names = [];

        for (var element in data) {
          codes.add(element['CODE'] ?? '');
          locTrees.add(element['LOCTREE'] ?? '');
          names.add(element['NAME'] ?? '');
        }

        loadData(sayfa) async {
          codes = [];
          locTrees = [];  
          names = [];
          data = await searchProvider.mahalAramaListesi(
              context,
              mahalKodu,
              mahalAdi,
              binaKodu,
              katKodu,
              kanatKodu,
              sinifKodu,
              grupKodu,
              20,
              sayfa);

          for (var element in data) {
            codes.add(element['CODE'] ?? '');
            locTrees.add(element['LOCTREE'] ?? '');
            names.add(element['NAME'] ?? '');
          }
        }


        return Sizer(builder: (context, orientation, deviceType) {
          return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: const CustomMainAppbar(
                    title: Text(
                      'Mahal Arama',
                      style: TextStyle(color: Colors.black),
                    ),
                    returnBack: true),
                body: Container(
                  color: const Color.fromARGB(255, 224, 224, 224),
                  child: Center(
                      child: codes.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    for (int i = 0; i < codes.length; i++)
                                      Center(
                                          child: GestureDetector(
                                        onTap: () async {
                                          var summarySonuc = await apirepository
                                              .mahalAramaMahalDetaySummaryApi(
                                                  codes[i]);
                                          var slaSonuc = await apirepository
                                              .mahalAramaMahalDetaySlaApi(
                                                  codes[i]);
                                          var bakimIsEmri = await apirepository
                                              .mahalAraMahalDetayBakimIsEmri(
                                                  codes[i]);
                                          var anlikIsEmri = await apirepository
                                              .mahalAraMahalDetayAnlikIsEmri(
                                                  codes[i]);

                                          // ignore: use_build_context_synchronously
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SpaceSearchDetail(
                                                code: codes[i],
                                                name: names[i],
                                                locTree: locTrees[i],
                                                summary: summarySonuc,
                                                sla: slaSonuc,
                                                bakim_is_emri: bakimIsEmri,
                                                anlik_is_emri: anlikIsEmri,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 90.w,
                                            height: 19.h,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(9.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    codes[i],
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 25),
                                                  ),
                                                  Text(
                                                    names[i],
                                                    style: const TextStyle(
                                                        fontSize: 19),
                                                  ),
                                                  const Text(''),
                                                  Text(
                                                    locTrees[i],
                                                    style: const TextStyle(
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.all(4),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  if (int.parse(searchProvider
                                                          .sayfa) >
                                                      1) {
                                                    searchProvider
                                                        .setSayfa = (int.parse(
                                                                searchProvider
                                                                    .sayfa) -
                                                            1)
                                                        .toString();
                                                    loadData(int.parse(
                                                        searchProvider.sayfa));
                                                  }
                                                },
                                                child: const Text('<'))),
                                        Container(
                                            margin: const EdgeInsets.all(4),
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: Text(
                                                    searchProvider.sayfa))),
                                        Container(
                                            margin: const EdgeInsets.all(4),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  searchProvider.setSayfa =
                                                      (int.parse(searchProvider
                                                                  .sayfa) +
                                                              1)
                                                          .toString();

                                                  loadData(int.parse(
                                                      searchProvider.sayfa));
                                                },
                                                child: const Text('>'))),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          : null),
                ),
              ));
        });
      }),
    );
  }
}
