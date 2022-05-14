import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomWidgets {
  static Widget textField(
    //parameter utk dipanggil nantinya ketika membuat textfield di beranda
    String title, 
      {bool isNumber = false,
      int? length,
      IconData? iconData,
      String? hintText,
      TextEditingController? textController,
      int lines = 1, }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xFF5E5E5E),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          TextFormField(
            maxLines: lines,
            controller: textController,
            maxLength: length,
            inputFormatters: [
              LengthLimitingTextInputFormatter(length),
            ],
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(hintText: hintText,
                counterText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                fillColor: Colors.white,
                filled: true),
          )
        ],
      ),
    );
  }
}
