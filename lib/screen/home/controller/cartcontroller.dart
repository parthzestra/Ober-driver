import 'package:get/get.dart';

class CancelController extends GetxController {
  var selecetedindex = 0.obs;
  var cancellist = [
    "Accidentally accepted trip",
    "Issue with pick-up route",
    "Pick-up isn’t worth it",
    "Not safe for pick-up",
    "Vehicle-related issue",
    "Other"
  ];
}
