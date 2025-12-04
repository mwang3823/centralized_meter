import 'package:flutter/material.dart';

extension StringParsing on String? {
  String removeAccents() {
    List<String> chars = this?.toLowerCase().split("") ?? [];
    String a = "áàảạãăắằẳặẵâấầẩẫậ";
    String d = "đ";
    String e = "éèẻẽẹêếềểễệ";
    String i = "íìỉĩị";
    String o = "óòỏõọôốồổỗộơớờởỡợ";
    String u = "úùủũụưứừửữự";
    String y = "ýỳỷỹỵ";
    String result = "";
    chars.forEach((element) {
      if (a.contains(element))
        element = "a";
      else if (d.contains(element)) {
        element = "d";
      } else if (e.contains(element)) {
        element = "e";
      } else if (i.contains(element)) {
        element = "i";
      } else if (o.contains(element)) {
        element = "o";
      } else if (u.contains(element)) {
        element = "u";
      } else if (y.contains(element)) {
        element = "y";
      }
      result += element;
    });
    return result;
  }

  Color toColor({Color? defaultColor}) {
    if ((this ?? "").isEmpty) {
      return defaultColor ?? Colors.black;
    }
    String value = this!.replaceAll("#", "");
    if (value.length == 6) {
      value = "FF" + value;
    }
    try {
      return Color(int.tryParse(value, radix: 16)!);
    } catch (_) {
      return defaultColor ?? Colors.black;
    }
  }
}