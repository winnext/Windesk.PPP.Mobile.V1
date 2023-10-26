import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/constants/other/app_icons.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/constants/style/custom_paddings.dart';
import 'package:wm_ppp_4/feature/constants/style/font_sizes.dart';
import 'package:wm_ppp_4/feature/extensions/context_extension.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_details_model.dart';

import '../../constants/style/border_radius.dart';

class CustomWorkOrderDetailCard extends StatelessWidget {
  const CustomWorkOrderDetailCard({super.key, required this.data});

  final WorkOrderDetailsModel data;

  final double _elevation = 2;
  final String _noDescriptionText = 'Açıklama girilmemiş.';
  final String _noNameText = 'İsim girilmemiş.';
  final String _noLocationText = 'Konum bilgisi girilmemiş.';
  final String _noBarcodeLabel = 'Barkod bilgisi girilmemiş.';

  final String _locationLabel = 'Mahal Adresi';
  final String _deviceBarcodeLabel = 'Cihaz Barkod No';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPaddings.pageNormal,
      child: Card(
        elevation: _elevation,
        shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
        child: SizedBox(
          width: context.width,
          child: Padding(
            padding: CustomPaddings.pageNormal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(data.name ?? _noNameText, style: _boldStyle()),
                const SizedBox(height: 4),
                Text(data.description ?? _noDescriptionText, style: _lowStyle()),
                const SizedBox(height: 16),
                _ColumnRow(
                  iconData: AppIcons.location,
                  title: _locationLabel,
                  content: data.modulelocation ?? _noLocationText,
                  boldStyle: _boldStyle,
                  lowStyle: _lowStyle,
                ),
                const SizedBox(height: 16),
                _ColumnRow(
                  iconData: AppIcons.building,
                  title: _deviceBarcodeLabel,
                  content: data.downtime ?? _noBarcodeLabel,
                  boldStyle: _boldStyle,
                  lowStyle: _lowStyle,
                ),
                const SizedBox(height: 16),
                _ColumnRow(
                  iconData: AppIcons.clock,
                  title: '',
                  content: "${data.plannedStartdate} -> ${data.plannedEnddate}",
                  boldStyle: _boldStyle,
                  lowStyle: _lowStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _boldStyle() {
    return const TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  }

  TextStyle _lowStyle() {
    return const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      //overflow: TextOverflow.ellipsis,
    );
  }
}

class _ColumnRow extends StatelessWidget {
  const _ColumnRow({required this.iconData, required this.title, required this.content, required this.boldStyle, required this.lowStyle});

  final IconData iconData;
  final String title;
  final String content;
  final Function boldStyle;
  final Function lowStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(iconData, color: APPColors.Main.black, size: FontSizes.titleXLarge),
        SizedBox(width: context.width * 0.035),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: boldStyle()),
              const SizedBox(height: 2),
              Text(content, style: lowStyle(), maxLines: 2),
            ],
          ),
        )
      ],
    );
  }
}
