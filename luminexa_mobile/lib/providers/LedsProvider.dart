import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/LedAPI.dart';
import 'package:luminexa_mobile/models/ledModel.dart';
import 'package:luminexa_mobile/providers/SystemsProvider.dart';
import 'package:provider/provider.dart';

class LedsProvider extends ChangeNotifier {
  List<Led> leds = [];

  LedsProvider({
    required this.leds,
  });

  Future<void> getLeds(systemId) async {
    final response = await LedsAPIs.getLeds(systemId);

    List<Led> _led = [];

    response.data.forEach((map) {
      final Led led = fromJSON(map);
      _led.add(led);
    });
    leds = _led;

    notifyListeners();
  }

  Future addLed(systemId, ledName) async {
    final response = await LedsAPIs.addLed(systemId, ledName);
    return response;
  }

  Future editLed(systemId, ledId, ledStatus, intensity, color, context) async {
    final response =
        await LedsAPIs.editLed(systemId, ledId, ledStatus, intensity, color);

    for (int i = 0; i < leds.length; i++) {
      if (leds[i].id == ledId) {
        leds[i] = leds[i].copyWith(
          color: color,
          intensity: intensity,
          ledStatus: ledStatus,
        );
        Provider.of<SystemsProvider>(context).updateLed(systemId, leds[i]);
      }
    }

    notifyListeners();
  }

  Future<void> editConfigs(BuildContext context, String systemId, String ledId,
      String ledStatus, int intensity, String color) async {
    final response = await LedsAPIs.editConfigs(
        systemId, ledId, ledStatus, intensity, color);
    print(response);

    for (int i = 0; i < leds.length; i++) {
      if (leds[i].id == ledId) {
        leds[i] = leds[i].copyWith(
          color: color,
          intensity: intensity,
          ledStatus: ledStatus,
        );
      }
    }

    notifyListeners();
  }

  Future getActiveLeds(systemId) async {
    final response = await LedsAPIs.getActiveLeds(systemId);
    return response;
  }

  static Led fromJSON(Map json) {
    final Led newLed = Led(
      id: json["_id"],
      ledName: json["ledName"],
      intensity: json["ledConfig"]["intensity"],
      ledStatus: json["ledConfig"]["ledStatus"],
      color: json["ledConfig"]["color"],
      histrory: [],
    );

    return newLed;
  }
}
