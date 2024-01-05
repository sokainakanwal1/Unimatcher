import 'package:flutter/material.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class UMTable extends StatelessWidget {
  UMTable({Key? key}) : super(key: key);

  final List<String> criteriaList = [
    'QS Rank',
    'HEC Rank',
    'Fee Structure',
    'Location ',
    'Single Gender',
    'Hostel Facility',
    'Phone Number',
    'Sector',
    'Apply Online Link',
    'Scholarships ',
    'Wi-Fi',
    'Transport Facility',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          UMSizes.defaultSpace * 0.01,
          UMSizes.defaultSpace,
          UMSizes.defaultSpace * 0.4,
          UMSizes.defaultSpace),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
                label: Text('Criteria',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .apply(color: UMColors.primary))),
            DataColumn(
                label: Text('University 1',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .apply(color: UMColors.primary))),
            DataColumn(
                label: Text('University 2',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .apply(color: UMColors.primary))),
          ],
          rows: List.generate(
            criteriaList.length,
            (index) => DataRow(
              cells: [
                DataCell(
                  Text(
                    criteriaList[index],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .apply(color: UMColors.primary),
                  ),
                ),
                const DataCell(Text('Data')),
                const DataCell(Text('Data')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
