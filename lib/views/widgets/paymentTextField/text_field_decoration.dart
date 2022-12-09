import 'package:book_store/utils/theme.dart';
import 'package:flutter/material.dart';

InputDecoration decoration(hintText) {
  final key = GlobalKey<State<Tooltip>>();
  return InputDecoration(
    fillColor: const Color.fromRGBO(248, 248, 248, 1),
    helperText: '',
    hintText: hintText,
    hintStyle: const TextStyle(
      color: hintColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 0.4,
    ),

    suffixIcon: hintText == '123'
        ? Tooltip(
            key: key,
            richMessage: const TextSpan(
              text: ' 3 digits usually found on \n the signature strip ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
            ),

            decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.circular(2)),
            padding: const EdgeInsets.all(10),
            preferBelow: false,
            verticalOffset: 20,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _onTap(key),
              child: const Icon(Icons.help_outline, size: 16.0,color: hintColor,),
            ),
          )
        : null,
    filled: true,
    enabledBorder: outlineInputBorder(borderColor),
    focusedBorder: outlineInputBorder(borderColor),
    errorBorder: outlineInputBorder(Colors.red),
    focusedErrorBorder: outlineInputBorder(borderColor),
  );


}


OutlineInputBorder  outlineInputBorder(Color color){
return OutlineInputBorder(
  borderSide:  BorderSide(color: color),
  borderRadius: BorderRadius.circular(4),
);
}

void _onTap(GlobalKey key) {
  final dynamic tooltip = key.currentState;
  tooltip?.ensureTooltipVisible();
}
