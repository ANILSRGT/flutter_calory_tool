part of '../summary_page_imports.dart';

class _SummaryPageBody extends StatefulWidget {
  const _SummaryPageBody();

  @override
  State<_SummaryPageBody> createState() => _SummaryPageBodyState();
}

class _SummaryPageBodyState extends State<_SummaryPageBody> {
  final _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: AppValues.lg.ext.padding.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppValues.lg.ext.sizedBox.vertical,
              Text(
                'Summary',
                style: context.ext.theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              AppValues.lg.ext.sizedBox.vertical,
              Text(
                'Calories Consumed',
                style: context.ext.theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              AppValues.md.ext.sizedBox.vertical,
              SizedBox(
                width: 200,
                height: 200,
                child: CustomLineChart(
                  data:
                      List.generate(7, (index) {
                        final day = date.subtract(Duration(days: index));
                        return CustomLineChartData(
                          xLabel: DateFormat('E').format(day),
                          yLabel: (index + 1).toString(),
                          y: Random().nextInt(12).toDouble() + 2,
                        );
                      }).reversed.toList(),
                  minY: 0,
                  maxY: 14,
                ),
              ),
              AppValues.xl2.ext.sizedBox.vertical,
              Text(
                'Daily Planned Meals',
                style: context.ext.theme.textTheme.titleLarge,
              ),
              AppValues.md.ext.sizedBox.vertical,
              CustomTextField(
                controller: _controller,
                readOnly: true,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(2025),
                    lastDate: DateTime.now(),
                  ).then((value) {
                    if (value != null) {
                      _controller.text = DateFormat('yyyy-MM-dd').format(value);
                    }
                  });
                },
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              AppValues.md.ext.sizedBox.vertical,
              const _SummaryPageMealItem(
                meal: 'Meal',
                imagePath: 'assets/breakfast.png',
                calories: 2,
              ),
              const _SummaryPageMealItem(
                meal: 'Meal',
                imagePath: 'assets/breakfast.png',
                calories: 2,
              ),
              const _SummaryPageMealItem(
                meal: 'Meal',
                imagePath: 'assets/breakfast.png',
                calories: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
