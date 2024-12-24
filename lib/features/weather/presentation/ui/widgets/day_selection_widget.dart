import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:weather/features/common/presentation/ui/widgets/custom_button_widget.dart';
import 'package:weather/features/weather/presentation/blocs/selected_day/selected_day_weather_cubit.dart';

class DaySelectionWidget extends StatelessWidget {
  const DaySelectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedDayWeatherCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtonWidget(
              label: 'Today',
              isSelected: state == 0,
              onTap: () => context.read<SelectedDayWeatherCubit>().selectDay(0),
            ),
            const Gap(8),
            CustomButtonWidget(
              label: state == 2 ? 'Third Day' : 'Next Day',
              isSelected: state != 0,
              onTap: () {
                if (state < 2) {
                  context.read<SelectedDayWeatherCubit>().selectDay(state + 1);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
