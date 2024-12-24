import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/application/enums/temperature_unit.dart';
import 'package:weather/features/common/presentation/blocs/temp_unit/temperature_unit_cubit.dart';
import 'package:weather/features/common/presentation/ui/widgets/app_ink_well_widget.dart';

class TemperatureUnitToggleSwitch extends StatelessWidget {
  const TemperatureUnitToggleSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWellWidget(
      padding: const EdgeInsets.all(12),
      onTap: () => context.read<TemperatureUnitCubit>().toggleTempUnit(),
      child: BlocBuilder<TemperatureUnitCubit, TemperatureUnit>(
        builder: (context, tempUnit) {
          return Text(
            tempUnit == TemperatureUnit.celsius ? '°C' : '°F',
            style: Theme.of(context).textTheme.titleLarge,
          );
        },
      ),
    );
  }
}
