import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var count = "".obs;
  TextEditingController controller = TextEditingController();

  setCount() {
    count.value = controller.text;
  }
}
