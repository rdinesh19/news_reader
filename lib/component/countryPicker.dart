import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

/// Shows the country picker dialog and returns the selected country code and name.
void showCountryPickerDialog({
  required BuildContext context,
  required Function(String, String) onCountrySelected, // Callback for country code and name
}) {
  showCountryPicker(
    context: context,
    showPhoneCode: false, // Disable showing phone codes, since we only need the country name
    onSelect: (Country country) {
      // Pass the selected country code and name back to the calling widget
      onCountrySelected(country.countryCode.toLowerCase(), country.name); // Returns code and name
    },
  );
}
