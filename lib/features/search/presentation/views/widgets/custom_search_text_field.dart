import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key, required this.onTextChanged});
  final ValueChanged<String> onTextChanged; // Callback لتلقي التحديثات
  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  TextEditingController controller = TextEditingController();

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        widget.onTextChanged(value);
      },
      decoration: InputDecoration(
        labelText: 'Search',
        labelStyle: const TextStyle(color: Colors.white70),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              setState(
                () {
                  searchText = controller.text;
                },
              );
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 20,
            ),
          ),
        ),
        suffixIconColor: Colors.white70,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
