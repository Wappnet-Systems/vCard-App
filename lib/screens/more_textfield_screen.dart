import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vcard/utils/constants_color.dart';
import 'package:vcard/utils/formatters.dart';
import 'package:vcard/utils/validator.dart';
import '../utils/responsive.dart';
import '../widget/custom_textformfield_widget.dart';

class MoreTextfieldscreen extends StatefulWidget {
  final TextEditingController? websitecontroller;
  final TextEditingController? facebookcontroller;
  final TextEditingController? telegramcontroller;
  final TextEditingController? linkController;
  final TextEditingController? whatsappcontroller;

  const MoreTextfieldscreen(
      {required this.linkController,
      required this.facebookcontroller,
      required this.telegramcontroller,
      required this.websitecontroller,
      required this.whatsappcontroller,
      super.key});
  @override
  State<MoreTextfieldscreen> createState() => _MoreTextfieldscreenState();
}

class _MoreTextfieldscreenState extends State<MoreTextfieldscreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomTextFormField(
        labelText: "Website",
        inputFormatters: null,
        textInputType: TextInputType.text,
        textEditingController: widget.websitecontroller!,
        texteditinghinttext: 'Website',
        customobscuretext: true,
        customsuffixIcon: null,
        customprefixicon: const Icon(
          Icons.web,
          color: grayColor,
        ),
        validationfunction: null,
      ),
      SizedBox(height: hp(2, context)),
      CustomTextFormField(
        labelText: "WhatsApp",
        inputFormatters: [maskFormatter],
        textInputType: TextInputType.phone,
        textEditingController: widget.whatsappcontroller!,
        texteditinghinttext: 'WhatsApp',
        customobscuretext: true,
        customsuffixIcon: null,
        customprefixicon: const Icon(
          FontAwesomeIcons.whatsapp,
          color: grayColor,
        ),
        validationfunction: null,
      ),
      SizedBox(height: hp(2, context)),
      CustomTextFormField(
        labelText: "Link",
        inputFormatters: null,
        textInputType: TextInputType.text,
        textEditingController: widget.linkController!,
        texteditinghinttext: 'Link',
        customobscuretext: true,
        customsuffixIcon: null,
        customprefixicon: const Icon(
          Icons.link,
          color: grayColor,
        ),
        validationfunction: null,
      ),
      SizedBox(height: hp(2, context)),
      CustomTextFormField(
        labelText: "Facebook",
        inputFormatters: null,
        textInputType: TextInputType.text,
        textEditingController: widget.facebookcontroller!,
        texteditinghinttext: 'Facebook',
        customobscuretext: true,
        customsuffixIcon: null,
        customprefixicon: const Icon(
          Icons.facebook,
          color: grayColor,
        ),
        validationfunction: null,
      ),
      SizedBox(height: hp(2, context)),
      CustomTextFormField(
        labelText: "Telegram",
        inputFormatters: [maskFormatter],
        textInputType: TextInputType.phone,
        textEditingController: widget.telegramcontroller!,
        texteditinghinttext: 'Telegram',
        customobscuretext: true,
        customsuffixIcon: null,
        customprefixicon: const Icon(
          Icons.telegram,
          color: grayColor,
        ),
        validationfunction: numbervalidator,
      ),
      SizedBox(height: hp(2, context)),
    ]);
  }
}
