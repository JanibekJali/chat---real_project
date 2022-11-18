import 'package:flutter/material.dart';
import 'package:real_project/app/data/local_data/countries_with_flags_local_data.dart';

import '../../models/global_models/country_with_flags.dart';

class LocalDataRepo {
  static List<DropdownMenuItem<CountryWithFlags>> buildDropDownMenuItems() {
    return CountriesWithFlagsLocalData.buildDropDownMenuItems();
  }
}

final LocalDataRepo localDataRepo = LocalDataRepo();
