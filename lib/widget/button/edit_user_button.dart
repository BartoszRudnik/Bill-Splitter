import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pim/config/text_field_themes.dart';
import 'package:pim/provider/user_provider.dart';
import 'package:pim/widget/button/save_user_button.dart';
import 'package:provider/provider.dart';

class EditUserButton extends StatefulWidget {
  const EditUserButton({
    Key? key,
    required this.id,
    required this.existingAmount,
    required this.existingName,
    required this.existingImage,
  }) : super(key: key);

  final int id;
  final String existingName;
  final double existingAmount;
  final Uint8List? existingImage;

  @override
  _EditUserButtonState createState() => _EditUserButtonState();
}

class _EditUserButtonState extends State<EditUserButton> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  double amount = 0.0;
  Uint8List? image;

  @override
  void initState() {
    super.initState();

    if (widget.existingImage != null) {
      setState(() {
        image = widget.existingImage;
      });
    }
  }

  void save(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _formKey.currentState!.reset();

      Provider.of<UserProvider>(context, listen: false).editById(widget.id, name, amount, image);

      image = null;

      Navigator.of(context).pop();
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
            builder: (context, setState) => Padding(
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
                              image = await newImage!.readAsBytes();

                              setState(() {});
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
                              initialValue: widget.existingName,
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
                              initialValue: widget.existingAmount.toStringAsFixed(2),
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
          ),
        );
      },
      icon: const Icon(
        Icons.edit_outlined,
      ),
    );
  }
}
