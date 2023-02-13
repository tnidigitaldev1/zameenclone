import 'package:flutter/material.dart';
import 'package:zameenclone/Globals.dart';

class SelectLocationsPage extends StatefulWidget {
  final List<Map<String, String>> locations;
  final String city;

  SelectLocationsPage(this.city, this.locations, {Key? key}) : super(key: key);

  @override
  State<SelectLocationsPage> createState() => _SelectLocationsPageState();
}

class _SelectLocationsPageState extends State<SelectLocationsPage> {
  void _runFilter(String enteredKeyword) {
    List<Map<String, String>> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget.locations;
    } else {
      results = widget.locations.where((l) => l['loc']!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      filteredLocations = results;
    });
  }

  List<Map<String, String>> filteredLocations = [];

  @override
  initState() {
    filteredLocations = widget.locations;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location in ${widget.city}'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: TextField(
              onChanged: (value) {
                if (widget.locations.isNotEmpty) {
                  _runFilter(value);
                }
              },
              decoration: const InputDecoration(labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLocations.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      gSelectedLocationValueNotifier.value = filteredLocations[index]['loc'];
                      Navigator.pop(context);
                    });
                  },
                  title: Text('${filteredLocations[index]['loc']}, ${filteredLocations[index]['city']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
