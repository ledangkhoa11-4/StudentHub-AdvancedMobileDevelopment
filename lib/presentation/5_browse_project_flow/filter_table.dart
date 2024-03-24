import 'package:flutter/material.dart';

class FilterTable extends StatefulWidget {
  final void Function(
      String projectLength, int studentsNeeded, int proposalsLessThan) onFilter;

  const FilterTable({Key? key, required this.onFilter}) : super(key: key);

  @override
  _FilterTableState createState() => _FilterTableState();
}

class _FilterTableState extends State<FilterTable> {
  String _projectLength = '';
  int _studentsNeeded = 0;
  int _proposalsLessThan = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Filter by'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Project Length filter
            ListTile(
              title: Text('Project Length'),
              contentPadding: EdgeInsets.zero,
              subtitle: Column(
                children: <Widget>[
                  RadioListTile<String>(
                    title: Text('Less than one month'),
                    value: 'Less than one month',
                    groupValue: _projectLength,
                    onChanged: (newValue) {
                      setState(() {
                        _projectLength = newValue!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('1-3 months'),
                    value: '1-3 months',
                    groupValue: _projectLength,
                    onChanged: (newValue) {
                      setState(() {
                        _projectLength = newValue!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('4-6 months'),
                    value: '4-6 months',
                    groupValue: _projectLength,
                    onChanged: (newValue) {
                      setState(() {
                        _projectLength = newValue!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('More than 6 months'),
                    value: 'More than 6 months',
                    groupValue: _projectLength,
                    onChanged: (newValue) {
                      setState(() {
                        _projectLength = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            // Students Needed filter
            ListTile(
              title: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Students Needed'),
                onChanged: (value) {
                  setState(() {
                    _studentsNeeded = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
            // Proposals Less Than filter
            ListTile(
              title: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Proposals Less Than'),
                onChanged: (value) {
                  setState(() {
                    _proposalsLessThan = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            _clearFilters();
          },
          child: Text('Clear Filters'),
        ),
        TextButton(
          onPressed: () {
            widget.onFilter(
                _projectLength, _studentsNeeded, _proposalsLessThan);
            Navigator.of(context).pop();
          },
          child: Text('Apply Filter'),
        ),
      ],
    );
  }

  void _clearFilters() {
    setState(() {
      _projectLength = '';
      _studentsNeeded = 0;
      _proposalsLessThan = 0;
    });
  }
}
