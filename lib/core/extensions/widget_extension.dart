import 'package:flutter/material.dart';

extension ListWidgetExtension on List<Widget> {
  List<Widget> withSpaceBetween({double? width, double? height}) => [
        for (int index = 0; index < length; index++) ...[
          if (index > 0) SizedBox(width: width, height: height),
          this[index],
        ],
      ];

  // List<Widget> withDivider({
  //   required BuildContext context,
  //   bool hasTop = false,
  //   bool hasBottom = false,
  //   double height = 8,
  // }) =>
  //     [
  //       for (int index = 0; index < length; index++) ...[
  //         if (hasTop || index > 0)
  //           Divider(
  //             thickness: 1,
  //             height: height,
  //             color: context.colorScheme.neutral5,
  //           ),
  //         this[index],
  //         if (hasBottom && index == length - 1)
  //           Divider(
  //             thickness: 1,
  //             color: context.colorScheme.neutral5,
  //             height: height,
  //           ),
  //       ],
  //     ];
}
