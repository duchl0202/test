import 'package:auto_route/auto_route.dart';
import 'package:emi_calculator/core/extensions/theme_extension.dart';
import 'package:emi_calculator/generated/assets.gen.dart';
import 'package:emi_calculator/routers/app_router.gr.dart';
import 'package:emi_calculator/screen/widget/layout_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<CalculatorData> _calculatorData = [
      CalculatorData(
        title: 'EMI Calculator',
        icon: Assets.icons.icTest,
        onTap: () {
          context.router.push(const EmiCalculatorRoute());
        },
      ),
      CalculatorData(
        title: 'Compare Loans ',
        icon: Assets.icons.icTest,
        onTap: () {
          context.router.push(const EmiCalculatorRoute());
        },
      ),
      CalculatorData(
        title: 'EMI Calculator',
        icon: Assets.icons.icTest,
        onTap: () {
          context.router.push(const EmiCalculatorRoute());
        },
      ),
      CalculatorData(
        title: 'EMI Calculator',
        icon: Assets.icons.icTest,
        onTap: () {
          context.router.push(const EmiCalculatorRoute());
        },
      ),
      CalculatorData(
        title: 'EMI Calculator',
        icon: Assets.icons.icTest,
        onTap: () {
          context.router.push(const EmiCalculatorRoute());
        },
      ),
      CalculatorData(
        title: 'EMI Calculator',
        icon: Assets.icons.icTest,
        onTap: () {
          context.router.push(const EmiCalculatorRoute());
        },
      ),
      CalculatorData(
        title: 'EMI Calculator',
        icon: Assets.icons.icTest,
        onTap: () {
          context.router.push(const EmiCalculatorRoute());
        },
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: LayoutContent(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'EMI Calculator',
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 7,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 240 / 240,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return CalculatorItem(
                  icon: _calculatorData[index].icon,
                  title: _calculatorData[index].title,
                  onTap: _calculatorData[index].onTap,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorItem extends StatelessWidget {
  const CalculatorItem({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });
  final SvgGenImage icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon.svg(
              height: 40.h,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: context.textTheme.titleSmall?.copyWith(fontSize: 10.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorData {
  final String title;
  final SvgGenImage icon;
  final Function() onTap;

  CalculatorData({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
