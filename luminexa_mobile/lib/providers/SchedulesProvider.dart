import 'package:flutter/material.dart';
import 'package:luminexa_mobile/APIs/ScheduleAPI.dart';
import 'package:luminexa_mobile/models/repeatModel.dart';
import 'package:luminexa_mobile/models/scheduleModel.dart';
import 'package:luminexa_mobile/providers/LedsProvider.dart';

class SchedulesProvider extends ChangeNotifier {
  List<Schedule> schedules = [];

  SchedulesProvider({
    required this.schedules,
  });

  Future<void> getSchedules(systemId) async {
    final response = await ScheduleAPIs.getSchedules(systemId);

    List<Schedule> _schedules = [];

    response.data.forEach((map) {
      final Schedule schedule = fromJSON(map);
      _schedules.add(schedule);
    });

    schedules = _schedules;

    notifyListeners();
  }

  Future addSchedule(String systemId, String scheduleTitle, DateTime timeStart,
      DateTime timeEnd, List<String> repeat) async {
    final response = await ScheduleAPIs.addSchedule(
        systemId, scheduleTitle, timeStart, timeEnd, repeat);

    List<Schedule> _schedules = [];

    response.data["schedules"].forEach((map) {
      final Schedule schedule = fromJSON(map);
      _schedules.add(schedule);
    });

    schedules = _schedules;

    notifyListeners();
  }

  Future toggleSchedule(systemId, scheduleId) async {
    final response = await ScheduleAPIs.toggleSchedule(systemId, scheduleId);
    List<Schedule> _schedules = [];

    response.data.forEach((map) {
      final Schedule schedule = fromJSON(map);
      _schedules.add(schedule);
    });

    schedules = _schedules;

    notifyListeners();
  }

  Future updateSchedule(
      systemId, scheduleId, scheduleTitle, timeStart, timeEnd, repeat) async {
    final response = await ScheduleAPIs.updateSchedule(
        systemId, scheduleId, scheduleTitle, timeStart, timeEnd, repeat);
    return response;
  }

  Future deleteSchedule(systemId, scheduleId) async {
    final response = await ScheduleAPIs.deleteSchedule(systemId, scheduleId);
    return response;
  }

  Schedule fromJSON(Map json) {
    final newSchedule = Schedule(
        id: json["_id"],
        scheduleTitle: json["scheduleTitle"],
        timeStart: DateTime.parse(json["timeStart"]),
        timeEnd: DateTime.parse(json["timeEnd"]),
        repeat: json["repeat"],
        leds: json["leds"].map((led) => {LedsProvider.fromJSON(led)}),
        scheduleStatus: json["scheduleStatus"]);
    return newSchedule;
  }
}
