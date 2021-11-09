import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pim/config/text_field_themes.dart';
import 'package:pim/provider/user_provider.dart';
import 'package:pim/widget/button/save_user_button.dart';
import 'package:provider/provider.dart';

class AddNewUser {
  static void showAddUserForm(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    String name = '';
    double amount = 0.0;
    Uint8List image = 0 as Uint8List;

    void save() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        _formKey.currentState!.reset();

        Provider.of<UserProvider>(context, listen: false).addNewUser(name, amount, image);
      }
    }

    showModalBottomSheet(
      backgroundColor: Theme.of(context).accentColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Padding(
        padding: MediaQuery.of(ctx).viewInsets,
        child: SizedBox(
          height: MediaQuery.of(ctx).size.height * 0.38,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () async {
                  final ImagePicker _picker = ImagePicker();

                  final newImage = await _picker.pickImage(source: ImageSource.gallery);

                  image = await newImage!.readAsBytes();
                },
                child: CircleAvatar(
                  backgroundImage: MemoryImage(image),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter name";
                          } else {}
                        },
                        onSaved: (value) {
                          name = value!;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: TextFieldThemes.textFieldDecoration("Name", ctx),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                      child: TextFormField(
                        validator: (value) {
                          if (double.tryParse(
                                    value!.replaceAll(',', "."),
                                  ) ==
                                  null ||
                              double.parse(
                                    value.replaceAll(',', "."),
                                  ) <
                                  0) {
                            return "Invalid value";
                          } else {}
                        },
                        onSaved: (value) {
                          amount = double.parse(
                            value!.replaceAll(",", "."),
                          );
                        },
                        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
                        style: const TextStyle(color: Colors.white),
                        decoration: TextFieldThemes.textFieldDecoration("Amount", ctx),
                      ),
                    ),
                  ],
                ),
              ),
              SaveUserButton(
                save: save,
                ctx: ctx,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
