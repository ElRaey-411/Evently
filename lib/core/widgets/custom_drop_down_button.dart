import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownButton extends StatefulWidget {
  CustomDropDownButton({
    super.key,
    required this.selecetedItem,
    required this.itemsList,
    required this.onChanged,
  });

  String selecetedItem;
  List<String> itemsList;
  Function(String? value) onChanged;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: Theme.of(context).highlightColor),
    ),
    child: Padding(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text(
            widget.selecetedItem,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Spacer(),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).highlightColor,
              ),
              items: widget.itemsList
                  .map(
                    (lang) => DropdownMenuItem(value: lang, child: Text(lang)),
                  )
                  .toList(),
              onChanged: (value) {
                widget.onChanged(value);
              },
            ),
          ),
        ],
      ),
    ),
  );
}
