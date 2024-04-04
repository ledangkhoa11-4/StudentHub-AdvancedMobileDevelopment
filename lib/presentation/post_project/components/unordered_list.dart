import 'package:flutter/material.dart';

class UnorderedList extends StatelessWidget {
  UnorderedList(this.texts, this.title);
  final List<String> texts;
  final String title;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      // Add list item
      widgetList.add(UnorderedListItem(text));
      // Add space between items
      widgetList.add(SizedBox(height: 5.0));
    }

    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme!.labelSmall!.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10,),
          ...widgetList
        ]);
  }
}

class UnorderedListItem extends StatelessWidget {
  UnorderedListItem(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "• ",
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    );
  }
}
