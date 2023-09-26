import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wm_ppp_4/feature/components/appbar/custom_main_appbar.dart';

import '../provider/asset_search_provider.dart';

@RoutePage()
class AssetSearchListPage extends StatelessWidget {
  const AssetSearchListPage({super.key, required this.assetSearchProviderx});
  final AssetSearchProvider assetSearchProviderx;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(  
        create: (context) => AssetSearchProvider(),
        child: Consumer<AssetSearchProvider>(
            builder: (context, AssetSearchProvider assetSearchProvider, child) {
          return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: const CustomMainAppbar(
                    title: Text('LocaleKeys.entitySearchResultTitle'),
                    returnBack: true),
                body: Container(
                  color: const Color.fromARGB(255, 224, 224, 224),
                  child: Center(
                      child: assetSearchProviderx
                              .assetSearchListPageModel.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    for (int i = 0;
                                        i <
                                            assetSearchProviderx
                                                .assetSearchListPageModel
                                                .length;
                                        i++)
                                      Center(
                                          child: GestureDetector(
                                        onTap: () async {
                                          // var summary_sonuc = await apirepository.mahalAramaVarlikDetaySummaryApi(codes[i]);
                                          // var sla_sonuc = await apirepository.mahalAramaVarlikDetaySlaApi(codes[i]);
                                          // var bakim_is_emri = await apirepository.mahalAraVarlikDetayBakimIsEmri(codes[i]);
                                          // var anlik_is_emri = await apirepository.mahalAraVarlikDetayAnlikIsEmri(codes[i]);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.19,
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
                                                    assetSearchProviderx
                                                        .assetSearchListPageModel[
                                                            i]
                                                        .code
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 25),
                                                  ),
                                                  Text(
                                                    assetSearchProviderx
                                                        .assetSearchListPageModel[
                                                            i]
                                                        .name
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 19),
                                                  ),
                                                  const Text(''),
                                                  Text(
                                                    assetSearchProviderx
                                                        .assetSearchListPageModel[
                                                            i]
                                                        .loctree
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                    // data.length == 20 ?
                                    //  Row(
                                    //  mainAxisAlignment: MainAxisAlignment.center,

                                    //   children: [
                                    //     Container( margin: EdgeInsets.all(4), child: ElevatedButton(onPressed: (){if(int.parse(searchProvider.sayfa) > 1){searchProvider.setSayfa = (int.parse(searchProvider.sayfa) - 1).toString(); loadData(int.parse(searchProvider.sayfa)); } }, child: Text('<'))),
                                    //     Container( margin: EdgeInsets.all(4), child: ElevatedButton(onPressed: (){}, child: Text(searchProvider.sayfa))),
                                    //     Container( margin: EdgeInsets.all(4), child: ElevatedButton(onPressed: (){searchProvider.setSayfa = (int.parse(searchProvider.sayfa) + 1).toString(); loadData(int.parse(searchProvider.sayfa)); }, child: Text('>'))),

                                    //   ],
                                    // )
                                    // :
                                    // Text('')
                                  ],
                                ),
                              ),
                            )
                          : null),
                ),
              ));
        }));
  }
}
