import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vcard/utils/formatters.dart';
import 'package:vcard/utils/style.dart';
import '../utils/responsive.dart';
import '../widget/custom_textformfield_widget.dart';

class MoreTextfieldscreen extends StatefulWidget {
  final TextEditingController? websitecontroller;
  final TextEditingController? facebookcontroller;
  final TextEditingController? telegramcontroller;
  final TextEditingController? linkdinController;
  final TextEditingController? whatsappcontroller;

  const MoreTextfieldscreen(
      {required this.linkdinController,
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
      widget.websitecontroller!.text != ""
          ? const SizedBox.shrink()
          : CustomTextFormField(
              textCapitalization: TextCapitalization.none,
              labelText: "Website",
              inputFormatters: null,
              textInputType: TextInputType.text,
              textEditingController: widget.websitecontroller!,
              texteditinghinttext: 'Website',
              customobscuretext: true,
              customsuffixIcon: null,
              customprefixicon: const Icon(
                Icons.web,
                color: COLOR_PRIMARY_LIGHT,
              ),
            ),
      widget.websitecontroller!.text != ""
          ? const SizedBox.shrink()
          : SizedBox(height: hp(2, context)),
      widget.whatsappcontroller!.text != ""
          ? const SizedBox.shrink()
          : CustomTextFormField(
              textCapitalization: TextCapitalization.none,
              labelText: "WhatsApp",
              inputFormatters: [maskFormatter],
              textInputType: TextInputType.phone,
              textEditingController: widget.whatsappcontroller!,
              texteditinghinttext: 'WhatsApp',
              customobscuretext: true,
              customprefixicon: const Icon(
                FontAwesomeIcons.whatsapp,
                color: COLOR_PRIMARY_LIGHT,
              ),
            ),
      widget.whatsappcontroller!.text != ""
          ? const SizedBox.shrink()
          : SizedBox(height: hp(2, context)),
      widget.linkdinController!.text != ""
          ? const SizedBox.shrink()
          : CustomTextFormField(
              textCapitalization: TextCapitalization.none,
              labelText: "Linkdin",
              textInputType: TextInputType.text,
              textEditingController: widget.linkdinController!,
              texteditinghinttext: 'Linkdin',
              customobscuretext: true,
              customprefixicon: const Icon(
                Icons.link,
                color: COLOR_PRIMARY_LIGHT,
              ),
            ),
      widget.linkdinController!.text != ""
          ? const SizedBox.shrink()
          : SizedBox(height: hp(2, context)),
      widget.facebookcontroller!.text != ""
          ? const SizedBox.shrink()
          : CustomTextFormField(
              textCapitalization: TextCapitalization.none,
              labelText: "Facebook",
              textInputType: TextInputType.text,
              textEditingController: widget.facebookcontroller!,
              texteditinghinttext: 'Facebook',
              customobscuretext: true,
              customprefixicon: const Icon(
                Icons.facebook,
                color: COLOR_PRIMARY_LIGHT,
              ),
            ),
      widget.facebookcontroller!.text != ""
          ? const SizedBox.shrink()
          : SizedBox(height: hp(2, context)),
      widget.telegramcontroller!.text != ""
          ? const SizedBox.shrink()
          : CustomTextFormField(
              textCapitalization: TextCapitalization.none,
              labelText: "Telegram",
              inputFormatters: [maskFormatter],
              textInputType: TextInputType.phone,
              textEditingController: widget.telegramcontroller!,
              texteditinghinttext: 'Telegram',
              customobscuretext: true,
              customprefixicon: const Icon(
                Icons.telegram,
                color: COLOR_PRIMARY_LIGHT,
              ),
            ),
      SizedBox(height: hp(2, context)),
    ]);
  }
}
