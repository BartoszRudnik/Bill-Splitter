import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pim/config/text_field_themes.dart';
import 'package:pim/provider/user_provider.dart';
import 'package:pim/widget/button/save_user_button.dart';
import 'package:provider/provider.dart';

class AddNewUserButton extends StatefulWidget {
  const AddNewUserButton({Key? key}) : super(key: key);

  @override
  State<AddNewUserButton> createState() => _AddNewUserButtonState();
}

class _AddNewUserButtonState extends State<AddNewUserButton> {
  final _formKey = GlobalKey<FormState>();
  FocusNode textSecondFocusNode = FocusNode();
  String name = '';
  double amount = 0.0;
  Uint8List? image;

  void save(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Provider.of<UserProvider>(context, listen: false).addNewUser(name, amount, image);

      setState(() {
        image = null;
      });
      _formKey.currentState!.reset();

      FocusScope.of(context).previousFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Theme.of(context).accentColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          isScrollControlled: true,
          context: context,
          builder: (ctx) => StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Padding(
                padding: MediaQuery.of(ctx).viewInsets,
                child: SizedBox(
                  height: MediaQuery.of(ctx).size.height * 0.38,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final ImagePicker _picker = ImagePicker();

                                XFile? newImage = await _picker.pickImage(source: ImageSource.camera);
                                final tmpImage = await newImage!.readAsBytes();

                                setState(() {
                                  image = tmpImage;
                                });
                              },
                              child: image == null
                                  ? const CircleAvatar(
                                      backgroundImage: AssetImage("assets/Profile_avatar_placeholder_large.png"),
                                    )
                                  : CircleAvatar(
                                      backgroundImage: MemoryImage(image!),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                              child: TextFormField(
                                focusNode: textSecondFocusNode,
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
              );
            },
          ),
        );
      },
      icon: const Icon(
        Icons.group_add_outlined,
        size: 36,
        color: Colors.white,
      ),
    );
  }
}
