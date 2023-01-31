import 'package:flutter/material.dart';

import '../model/SubType.dart';
import 'PillButton.dart';

class PropTypesTabPage extends StatefulWidget {
  final List<PropSubType> subTypes;

  PropTypesTabPage(this.subTypes, {Key? key}) : super(key: key);

  @override
  State<PropTypesTabPage> createState() => _PropTypesTabPageState();
}

class StaticTag {
  final String name;
  bool isSelected = false;

  StaticTag(this.name);
}

class _PropTypesTabPageState extends State<PropTypesTabPage> {
  pillCallback(String pill) {
    setState(() {
      for (var v in widget.subTypes) {
        setState(() {
          v.isSelected = false;
        });
      }
      widget.subTypes.where((element) => element.name == pill).toList()[0].isSelected = true;
    });
  }

  List<StaticTag> staticTags = [StaticTag('Popular'), StaticTag('Type'), StaticTag('Location'), StaticTag('Area Size')];

  staticTagsPillCallback(String pill) {
    setState(() {
      for (var v in staticTags) {
        setState(() {
          v.isSelected = false;
        });
      }
      staticTags.where((element) => element.name == pill).toList()[0].isSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...staticTags.map((e) => PillButton(
                    e.name,
                    null,
                    e.isSelected,
                    Colors.blue.shade100,
                    Colors.blue,
                    Colors.black,
                    false,
                    staticTagsPillCallback,
                  )),
            ],
          ),
        ),
        Wrap(
          runSpacing: 5,
          children: [
            ...widget.subTypes.map(
              (st) {
                return PillButton(
                  st.name,
                  null,
                  st.isSelected,
                  Colors.white,
                  Colors.blue,
                  Colors.black,
                  false,
                  pillCallback,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
