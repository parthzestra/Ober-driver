import 'package:get/get.dart';

import '../../history/view/ridehistoryscreen.dart';
import '../../home/view/homescreen.dart';
import '../../wallet/view/walletscreen.dart';


class BottomController extends GetxController{
      var bottomindex = 0.obs;

  var pages = const [
    HomeScreen(),
    WalletScreen(),
    RideHistoryScreen(),
  ];
}