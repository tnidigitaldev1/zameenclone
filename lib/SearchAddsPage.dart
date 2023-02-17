import 'package:flutter/material.dart';
import 'package:zameenclone/Widgets/SearchAdsShimmer.dart';
import 'package:intl/intl.dart';

class SearchAddsPage extends StatefulWidget {
  SearchAddsPage({Key? key}) : super(key: key);

  @override
  State<SearchAddsPage> createState() => _SearchAddsPageState();
}

enum SortOrder { popular, newest, lowToHigh, highToLow }

class _SearchAddsPageState extends State<SearchAddsPage> {
  final List<int> adds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  SortOrder? sortOrder = SortOrder.lowToHigh;
  String? selectedCurrencyDropDownValue = 'PKR';
  String? selectedAreaUnitDropDownValue = 'Marla';
  TextEditingController minPriceTxtController = TextEditingController(text: '0');
  TextEditingController maxPriceTxtController = TextEditingController(text: 'Any');
  RangeValues priceSelectedRange = RangeValues(0, 1000000000);
  var priceNumberFormatter = NumberFormat('#,###,###,000');

  TextEditingController minAreaTxtController = TextEditingController(text: '0');
  TextEditingController maxAreaTxtController = TextEditingController(text: 'Any');
  RangeValues areaSelectedRange = RangeValues(0, 5000);
  var areaNumberFormatter = NumberFormat('#,###,###,000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homes for Sale'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 0, top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.filter_alt_outlined,
                              size: 12,
                            ),
                            Container(
                              width: 3,
                            ),
                            Text(
                              'Filter',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              // Change your radius here
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 265,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.sort_by_alpha,
                                            size: 18,
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Text(
                                            'Sort by',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(Icons.clear_outlined),
                                          ),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star_border_outlined,
                                            size: 18,
                                            color: Colors.grey.shade500,
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Text(
                                            'Popular',
                                            style: TextStyle(
                                              fontSize: 16,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          Radio<SortOrder>(
                                            value: SortOrder.popular,
                                            groupValue: sortOrder,
                                            onChanged: (SortOrder? value) {
                                              setState(() {
                                                sortOrder = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.watch_later_outlined,
                                            size: 18,
                                            color: Colors.grey.shade500,
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Text(
                                            'Newest',
                                            style: TextStyle(
                                              fontSize: 16,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          Radio<SortOrder>(
                                            value: SortOrder.newest,
                                            groupValue: sortOrder,
                                            onChanged: (SortOrder? value) {
                                              setState(() {
                                                sortOrder = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.trending_up_rounded,
                                            size: 18,
                                            color: Colors.grey.shade500,
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Text(
                                            'Price (low to high)',
                                            style: TextStyle(
                                              fontSize: 16,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          Radio<SortOrder>(
                                            value: SortOrder.lowToHigh,
                                            groupValue: sortOrder,
                                            onChanged: (SortOrder? value) {
                                              setState(() {
                                                sortOrder = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.trending_down_rounded,
                                            size: 18,
                                            color: Colors.grey.shade500,
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Text(
                                            'Price (high to low)',
                                            style: TextStyle(
                                              fontSize: 16,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          Radio<SortOrder>(
                                            value: SortOrder.highToLow,
                                            groupValue: sortOrder,
                                            onChanged: (SortOrder? value) {
                                              setState(() {
                                                sortOrder = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.sort_by_alpha,
                              size: 12,
                            ),
                            Container(
                              width: 3,
                            ),
                            Text(
                              'Sort',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              // Change your radius here
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.pin_drop_outlined,
                              size: 12,
                            ),
                            Container(
                              width: 3,
                            ),
                            Text(
                              'Location',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Container(
                              width: 3,
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 18,
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              // Change your radius here
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            isScrollControlled: true,
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                child: SizedBox(
                                  height: 265,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.price_check_rounded,
                                              size: 18,
                                            ),
                                            Container(
                                              width: 10,
                                            ),
                                            Text(
                                              'Price Range',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Spacer(),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.clear_outlined),
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                        SizedBox(
                                          width: 120,
                                          height: 50,
                                          child: DropdownButtonFormField(
                                            value: selectedCurrencyDropDownValue,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              contentPadding: EdgeInsets.only(left: 10, right: 10),
                                            ),
                                            items: <String>['PKR', 'CAD', 'SAR', 'AED', 'GBP', 'USD']
                                                .map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: TextStyle(fontSize: 14),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedCurrencyDropDownValue = newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                        StatefulBuilder(builder: (context, state) {
                                          return RangeSlider(
                                            values: priceSelectedRange,
                                            min: 0,
                                            max: 1000000000,
                                            divisions: 20,
                                            labels: RangeLabels(
                                                '${priceNumberFormatter.format(priceSelectedRange.start)}',
                                                '${priceNumberFormatter.format(priceSelectedRange.end)}'),
                                            onChanged: (RangeValues newRange) {
                                              state(() {
                                                priceSelectedRange = newRange;
                                                minPriceTxtController.text =
                                                    priceNumberFormatter.format(priceSelectedRange.start);
                                                maxPriceTxtController.text =
                                                    priceNumberFormatter.format(priceSelectedRange.end);
                                              });
                                            },
                                          );
                                        }),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 140,
                                              height: 40,
                                              child: TextField(
                                                controller: minPriceTxtController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
                                              child: Text('TO'),
                                            ),
                                            SizedBox(
                                              width: 140,
                                              height: 40,
                                              child: TextField(
                                                controller: maxPriceTxtController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            height: 45,
                                            width: MediaQuery.of(context).size.width,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Apply',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.price_check_outlined,
                              size: 12,
                            ),
                            Container(
                              width: 3,
                            ),
                            Text(
                              'Price Range',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Container(
                              width: 3,
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 18,
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              // Change your radius here
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            isScrollControlled: true,
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                child: SizedBox(
                                  height: 265,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.area_chart_outlined,
                                              size: 18,
                                            ),
                                            Container(
                                              width: 10,
                                            ),
                                            Text(
                                              'Area Range',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Spacer(),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.clear_outlined),
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                        SizedBox(
                                          width: 120,
                                          height: 50,
                                          child: DropdownButtonFormField(
                                            value: selectedAreaUnitDropDownValue,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              contentPadding: EdgeInsets.only(left: 10, right: 10),
                                            ),
                                            items: <String>['Sq.Ft.', 'Sq.M.', 'Sq.Yd.', 'Marla', 'Kanal']
                                                .map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: TextStyle(fontSize: 14),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedAreaUnitDropDownValue = newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                        StatefulBuilder(builder: (context, state) {
                                          return RangeSlider(
                                            values: areaSelectedRange,
                                            min: 0,
                                            max: 5000,
                                            divisions: 20,
                                            labels: RangeLabels(
                                                '${areaNumberFormatter.format(areaSelectedRange.start)}',
                                                '${areaNumberFormatter.format(areaSelectedRange.end)}'),
                                            onChanged: (RangeValues newRange) {
                                              state(() {
                                                areaSelectedRange = newRange;
                                                minAreaTxtController.text =
                                                    areaNumberFormatter.format(areaSelectedRange.start);
                                                maxAreaTxtController.text =
                                                    areaNumberFormatter.format(areaSelectedRange.end);
                                              });
                                            },
                                          );
                                        }),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 140,
                                              height: 40,
                                              child: TextField(
                                                controller: minAreaTxtController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
                                              child: Text('TO'),
                                            ),
                                            SizedBox(
                                              width: 140,
                                              height: 40,
                                              child: TextField(
                                                controller: maxAreaTxtController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            height: 45,
                                            width: MediaQuery.of(context).size.width,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Apply',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.area_chart_outlined,
                              size: 12,
                            ),
                            Container(
                              width: 3,
                            ),
                            Text(
                              'Area Range',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Container(
                              width: 3,
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 18,
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              // Change your radius here
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 265,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.more_horiz_outlined,
                                            size: 18,
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Text(
                                            'More Filters',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(Icons.clear_outlined),
                                          ),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        children: [
                                          Container(
                                            width: 18,
                                            height: 18,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius: BorderRadius.circular(
                                                3,
                                              ),
                                            ),
                                            child: Center(
                                                child: Icon(
                                                  Icons.check,
                                                  size: 14,
                                                  color: Colors.blue,
                                                )),
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Text(
                                            'Show Verified Ads Only',
                                            style: TextStyle(
                                              fontSize: 16,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          Switch(
                                            value: false,
                                            onChanged: (value) {
                                              setState(() {
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.video_camera_back_outlined,
                                            size: 18,
                                            color: Colors.grey.shade500,
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Text(
                                            'Show Ads With Videos Only',
                                            style: TextStyle(
                                              fontSize: 16,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          Switch(
                                            value: false,
                                            onChanged: (value) {
                                              setState(() {
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 45,
                                          width: MediaQuery.of(context).size.width,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Apply',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.more_horiz_outlined,
                              size: 12,
                            ),
                            Container(
                              width: 3,
                            ),
                            Text(
                              'More',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Container(
                              width: 3,
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 18,
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              // Change your radius here
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...adds.map((e) => Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
                                child: Container(
                                  height: 175,
                                  width: 334,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SearchAdsShimmer(
                                        'SUPER HOT',
                                        '22 HRS AGO',
                                      ),
                                      Container(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 179,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '22 hours ago',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.grey.shade400),
                                                ),
                                                Spacer(),
                                                Container(
                                                  width: 18,
                                                  height: 18,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius: BorderRadius.circular(
                                                      3,
                                                    ),
                                                  ),
                                                  child: Center(
                                                      child: Icon(
                                                    Icons.check,
                                                    size: 14,
                                                    color: Colors.blue,
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                'PKR ',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                '6.5 Crore',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Bath Island, Karachi ',
                                            style: TextStyle(
                                                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Text(
                                            'Flat for sale',
                                            style: TextStyle(
                                                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
                                          ),
                                          Container(
                                            width: 179,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.bed_outlined,
                                                  size: 15,
                                                ),
                                                Container(
                                                  width: 3,
                                                ),
                                                Text(
                                                  '4',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    // fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Container(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  Icons.bathtub_outlined,
                                                  size: 15,
                                                ),
                                                Container(
                                                  width: 3,
                                                ),
                                                Text(
                                                  '4',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    // fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Container(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  Icons.area_chart,
                                                  size: 15,
                                                ),
                                                Container(
                                                  width: 3,
                                                ),
                                                Text(
                                                  '6.2 Marla',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    // fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Spacer(),
                                                Icon(
                                                  Icons.favorite_outline_rounded,
                                                  size: 15,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 16,
                                          ),
                                          Container(
                                            height: 32,
                                            child: Row(
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'SMS',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                                    shape: MaterialStateProperty.all(
                                                      RoundedRectangleBorder(
                                                        // Change your radius here
                                                        borderRadius: BorderRadius.circular(10),
                                                        side: BorderSide(
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 6,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {},
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.call,
                                                        size: 14,
                                                      ),
                                                      Container(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        'Call',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  style: ButtonStyle(
                                                    // backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                    // foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),

                                                    shape: MaterialStateProperty.all(
                                                      RoundedRectangleBorder(
                                                        // Change your radius here
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 6,
                                                ),
                                                SizedBox(
                                                  width: 42,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    child: Center(
                                                        child: Icon(
                                                      Icons.whatsapp,
                                                      size: 20,
                                                    )),
                                                    style: ButtonStyle(
                                                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                                          EdgeInsets.all(0)),
                                                      // backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                      // foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),

                                                      shape: MaterialStateProperty.all(
                                                        RoundedRectangleBorder(
                                                          // Change your radius here
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
