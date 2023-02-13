import 'package:flutter/material.dart';
import 'package:zameenclone/Globals.dart';
import 'package:zameenclone/SelectLocationsPage.dart';
import 'package:collection/collection.dart';
import 'package:zameenclone/Widgets/SimplePillWidget.dart';

class PostAddPage extends StatefulWidget {
  PostAddPage({Key? key}) : super(key: key);

  @override
  State<PostAddPage> createState() => _PostAddPageState();
}

class SimplePill {
  final String title;
  bool isSelected = false;

  SimplePill(this.title);
}

class _PostAddPageState extends State<PostAddPage> {
  List<String> purposeList = ['Sell', 'Rent Out'];
  List<String> propertyTypeList = [
    'House',
    'Flat',
    'Upper Portion',
    'Lower Portion',
    'Farm House',
    'Room',
    'Penthouse'
  ];
  List<String> bedroomsList = ['Studio', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  List<String> bathroomsList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
  ];
  List<SimplePill> purposePills = [], propertyTypePills = [], bedroomPills = [], bathroomPills = [];

  String _selectedCity = 'Karachi';
  TextEditingController areaTextController = TextEditingController(text: '0');
  TextEditingController totalPriceTextController = TextEditingController(text: '0');
  TextEditingController titleTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  bool isInstallmentAvailable = false;
  bool isReadyForPossession = false;
  String? _selectedLocation;
  List<Map<String, String>> _tmpLocations = [];

  void purposePillsCallback(String title) {
    purposePills.forEach((item) {
      setState(() {
        item.isSelected = false;
      });
    });
    SimplePill? sp = purposePills.firstWhereOrNull((element) => element.title == title);
    if (sp != null) {
      setState(() {
        sp.isSelected = true;
      });
    }
  }

  void propertyTypePillsCallback(String title) {
    propertyTypePills.forEach((item) {
      setState(() {
        item.isSelected = false;
      });
    });
    SimplePill? sp = propertyTypePills.firstWhereOrNull((element) => element.title == title);
    if (sp != null) {
      setState(() {
        sp.isSelected = true;
      });
    }
  }

  void bedroomPillsCallback(String title) {
    bedroomPills.forEach((item) {
      setState(() {
        item.isSelected = false;
      });
    });
    SimplePill? sp = bedroomPills.firstWhereOrNull((element) => element.title == title);
    if (sp != null) {
      setState(() {
        sp.isSelected = true;
      });
    }
  }

  void bathPillsCallback(String title) {
    bathroomPills.forEach((item) {
      setState(() {
        item.isSelected = false;
      });
    });
    SimplePill? sp = bathroomPills.firstWhereOrNull((element) => element.title == title);
    if (sp != null) {
      setState(() {
        sp.isSelected = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    purposeList.forEach((item) {
      purposePills.add(SimplePill(item));
    });

    propertyTypeList.forEach((item) {
      propertyTypePills.add(SimplePill(item));
    });

    bedroomsList.forEach((item) {
      bedroomPills.add(SimplePill(item));
    });
    bathroomsList.forEach((item) {
      bathroomPills.add(SimplePill(item));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 1, color: Color.fromARGB(50, 70, 50, 12))),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
                child: Text(
                  'Save as Draft',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Post Ad',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 57,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              title: Text(
                'Post an Add',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              background: Container(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 20),
                            child: Icon(
                              Icons.real_estate_agent_sharp,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Purpose',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 0, top: 0, bottom: 0),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 5,
                          runAlignment: WrapAlignment.start,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [

                            ...purposePills.map(
                                    (e) => SimplePillWidget(purposePillsCallback, e.isSelected, e.title)
                            ),                        ],
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Container(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 20),
                            child: Icon(
                              Icons.location_city_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Select Property Type',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 0, top: 0, bottom: 0),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 5,
                          runAlignment: WrapAlignment.start,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            ...propertyTypePills.map(
                                    (e) => SimplePillWidget(propertyTypePillsCallback, e.isSelected, e.title)
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Container(height: 20,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 20),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'City',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 260,
                        child: DropdownButtonFormField(
                            value: _selectedCity,
                            items:
                                ['Karachi', 'Lahore', 'Islamabad', 'Pindi', 'Peshawar', 'Gawadar', 'Multan', 'Sialkot']
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e,
                                        ),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (c) {
                              setState(() {
                                _tmpLocations = [];
                                _selectedLocation = null;
                                _selectedCity = c ?? '';
                                gSelectedLocationValueNotifier.value = null;
                              });
                              Future.delayed(Duration(milliseconds: 1000), () {
                                setState(() {
                                  // _tmpLocations =
                                  //     _locations.where((element) => element['city'] == _selectedCity).toList();
                                });
                              });
                            }),
                      ),
                      Container(
                        height: 20,
                      ),
                      ValueListenableBuilder(
                        valueListenable: gSelectedLocationValueNotifier,
                        builder: (BuildContext context, value, Widget? child) {
                          return Container(
                            width: double.infinity,
                            height: 45,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
                              child: ElevatedButton(
                                onPressed: () {
                                  var tmpLocations =
                                      gLocations.where((element) => element['city'] == _selectedCity).toList();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => SelectLocationsPage(_selectedCity, tmpLocations)));
                                },
                                child: Text(
                                  gSelectedLocationValueNotifier.value != null ? gSelectedLocationValueNotifier.value! : 'Select Location',
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                    ],
                  ),
                  Divider(),
                  Container(height: 20,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 20),
                            child: Icon(
                              Icons.area_chart,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Area',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: TextField(
                                controller: areaTextController,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Container(
                              width: 10,
                            ),
                            SizedBox(
                              width: 70,
                              child: DropdownButtonFormField(
                                  value: 'Sq.Yd.',
                                  items: ['Sq.Ft.', 'Sq.M.', 'Sq.Yd.', 'Marla', 'Kanal']
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey.shade700),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      // areaTextController.text = value ?? '';
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                    ],
                  ),
                  Divider(),
                  Container(height: 20,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 20),
                            child: Icon(
                              Icons.price_change_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Total Price',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 280,
                              child: TextField(
                                decoration: InputDecoration(
                                  suffix: Text(
                                    'PKR',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                controller: totalPriceTextController,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                    ],
                  ),
                  Divider(),
                  Container(height: 20,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 20),
                            child: Icon(
                              Icons.integration_instructions_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Installments Available',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Switch(
                              value: isInstallmentAvailable,
                              onChanged: (value) {
                                setState(() {
                                  isInstallmentAvailable = value;
                                });
                              })
                        ],
                      ),
                      Container(
                        height: 20,
                      ),
                    ],
                  ),
                  Divider(),
                  Container(height: 20,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 20),
                            child: Icon(
                              Icons.polyline,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Ready for Possession',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Switch(
                              value: isReadyForPossession,
                              onChanged: (value) {
                                setState(() {
                                  isReadyForPossession = value;
                                });
                              })
                        ],
                      ),
                      Container(
                        height: 20,
                      ),
                    ],
                  ),
                  Divider(),
                  Container(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 20),
                            child: Icon(
                              Icons.bed_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Bedrooms',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 0, top: 0, bottom: 0),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 5,
                          runAlignment: WrapAlignment.start,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [

                            ...bedroomPills.map(
                                    (e) => SimplePillWidget(bedroomPillsCallback, e.isSelected, e.title)
                            ),


                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                    ],
                  ),
                  Divider(),
                  Container(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 20),
                            child: Icon(
                              Icons.bathtub_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Bathrooms',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 0, top: 0, bottom: 0),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 5,
                          runAlignment: WrapAlignment.start,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [

                            ...bathroomPills.map(
                                    (e) => SimplePillWidget(bathPillsCallback, e.isSelected, e.title)
                            ),                        ],
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                    ],
                  ),
                  Divider(),
                  Container(height: 20,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 20),
                            child: Icon(
                              Icons.tag,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Property Title',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 280,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Title e.g. Beautiful new house',
                          ),
                          controller: titleTextController,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                    ],
                  ),
                  Divider(),
                  Container(height: 20,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0, right: 20),
                            child: Icon(
                              Icons.description,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Property Description',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 280,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Describle your property in detail',
                          ),
                          controller: descriptionTextController,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                    ],
                  ),
                  Divider(),
                  Container(
                    height: 50,
                    child: Text(
                      '  ',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
