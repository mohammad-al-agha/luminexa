import 'package:flutter/material.dart';
import 'package:luminexa_mobile/models/ledModel.dart';
import 'package:luminexa_mobile/models/systemModel.dart';
import 'package:luminexa_mobile/providers/LedsProvider.dart';
import 'package:luminexa_mobile/providers/SystemsProvider.dart';
import 'package:luminexa_mobile/widgets/listsWidget/ledsListWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';
import 'package:provider/provider.dart';

class LedsPage extends StatefulWidget {
  final String systemId;
  final String systemName;

  const LedsPage({
    required this.systemId,
    required this.systemName,
    super.key,
  });

  @override
  State<LedsPage> createState() => _LedsPageState();
}

class _LedsPageState extends State<LedsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SystemsProvider>(builder: (context, value, child) {
      List<Led> _leds = value.systems
          .firstWhere(
            (system) => system.id == widget.systemId,
          )
          .leds;

      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              titleWidget(title: "Edite LEDs in ${widget.systemName}"),
              ListView.builder(
                physics: ScrollPhysics(parent: null),
                shrinkWrap: true,
                itemCount: _leds.length,
                itemBuilder: (BuildContext context, int index) {
                  return ledListOption(
                      config: false,
                      system: widget.systemId,
                      led: _leds[index],
                      ledName: _leds[index].ledName,
                      status: _leds[index].ledStatus);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
