import 'package:flutter/material.dart';

import '../../app_constants/text_styles/app_text_styles.dart';
import '../models/global_models/country_with_flags.dart';

class CountriesWithFlagsLocalData {
  static final List<CountryWithFlags> _countriesList = <CountryWithFlags>[
    CountryWithFlags(
      flag: Container(
        height: 35,
        width: 35,
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(30),
            child: Image.asset(
              'icons/flags/png/kg.png',
              package: 'country_icons',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      phoneCode: '+996',
    ),
    CountryWithFlags(
      flag: Container(
        height: 35,
        width: 35,
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(30),
            child: Image.asset(
              'icons/flags/png/ru.png',
              package: 'country_icons',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      phoneCode: '+7',
    ),
    CountryWithFlags(
      flag: Container(
        height: 35,
        width: 35,
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(30),
            child: Image.asset(
              'icons/flags/png/tr.png',
              package: 'country_icons',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      phoneCode: '+90',
    ),
  ];

  static List<DropdownMenuItem<CountryWithFlags>> buildDropDownMenuItems() {
    final List<DropdownMenuItem<CountryWithFlags>> items =
        <DropdownMenuItem<CountryWithFlags>>[];
    for (final CountryWithFlags country in _countriesList) {
      final item = DropdownMenuItem<CountryWithFlags>(
        value: country,
        child: Row(
          children: [
            country.flag!,
            Text(
              country.phoneCode!,
              style: AppTextStyles.mulishBlack14w600,
            ),
          ],
        ),
      );
      items.add(item);
    }
    return items;
  }
}
