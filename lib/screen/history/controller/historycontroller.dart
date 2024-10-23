

import 'package:get/get.dart';
import 'package:ober_driver_app/constant/images.dart';

class HistoryController extends  GetxController{
  var selectedindex = 0.obs;

  var completedlist = [
    {"img": rh1, "price": "50.20", "type": "Cash","name":"James Anderson"},
    {"img": rh2, "price": "150.20", "type": "eWallet","name":"William Carter"},
    {"img": rh3, "price": "250.20", "type": "eWallet","name":"Ethan Thompson"}
  ];
  var cancelledlist = [
    {"img": rh4, "price": "0.0","name":"Oliver Bennett"},
    {"img": rh5, "price": "0.0","name":"Henry Walker"},
    {"img": rh6, "price": "0.0","name":"Mason Johnson"}
  ];
}