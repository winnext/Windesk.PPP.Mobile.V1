import 'package:flutter/material.dart';
import 'package:wm_ppp_4/feature/constants/other/colors.dart';
import 'package:wm_ppp_4/feature/models/work_order_models/work_order_list_model.dart';

class CustomWorkorderListCard extends StatelessWidget {
  const CustomWorkorderListCard({super.key, required this.model});

  final WorkOrderListModel model;
  final String _serviceTxt = 'Hizmet';
  final String _descTxt = 'Tanım';
  final String _locationTxt = 'Mahal';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: APPColors.Main.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _CardRow(
                leftTitle: model.code ?? '',
                rightTitle: model.statusname ?? '',
                isBold: true,
              ),
              const Divider(thickness: 1),
              _CardRow(
                leftTitle: _serviceTxt,
                rightTitle: model.serviceName.toString(),
                isBold: false,
              ),
              const Divider(thickness: 1),
              _CardRow(
                leftTitle: _descTxt,
                rightTitle: model.name.toString(),
                isBold: false,
              ),
              const Divider(thickness: 1),
              _CardRow(
                leftTitle: _locationTxt,
                rightTitle: model.modulelocation.toString(),
                isBold: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardRow extends StatelessWidget {
  const _CardRow({required this.leftTitle, required this.rightTitle, required this.isBold});

  final String leftTitle;
  final String rightTitle;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 60,
          child: Text(
            leftTitle,
            style: isBold ? _boldTextStyle(context) : _notBoldTextStyle(context),
            maxLines: 2,
          ),
        ),
        Flexible(
          flex: 40,
          child: Text(
            rightTitle,
            style: isBold ? _boldTextStyle(context) : _notBoldTextStyle(context),
            maxLines: 2,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  TextStyle _notBoldTextStyle(BuildContext context) {
    return TextStyle(color: APPColors.Secondary.black, fontSize: 18);
  }

  TextStyle _boldTextStyle(BuildContext context) {
    return TextStyle(color: APPColors.Secondary.black, fontSize: 18, fontWeight: FontWeight.bold);
  }
}
