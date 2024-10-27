import 'package:flutter/material.dart';
import 'package:news_application/ui/News/news_container.dart';
import 'package:news_application/ui/category_details/tab_item.dart';
import '../../model/source.dart';

class TabContainer extends StatefulWidget {
 final List<Source> sourceList;

  const TabContainer({super.key, required this.sourceList});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              isScrollable: true,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              tabs: widget.sourceList
                  .map(
                    (source) => TabItem(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sourceList.indexOf(source),
                    ),
                  )
                  .toList()),
          Expanded(child: NewsContainer(sourceId: widget.sourceList[selectedIndex].id??''))

        ],
      ),
    );
  }
}
