import 'package:flutter/material.dart';

import '../../tools_dummy_data.dart';
import '../../widgets/tools_item.dart';

class ToolsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_TOOLS
          .map(
            (toolData) => ToolsItem(
              toolData.id,
              toolData.title,
              toolData.color,
            ),
          )
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
