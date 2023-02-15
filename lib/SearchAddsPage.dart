import 'package:flutter/material.dart';
import 'package:zameenclone/Widgets/SearchAdsShimmer.dart';

class SearchAddsPage extends StatefulWidget {
  SearchAddsPage({Key? key}) : super(key: key);

  @override
  State<SearchAddsPage> createState() => _SearchAddsPageState();
}

enum SortOrder { popular, newest, lowToHigh, highToLow }

class _SearchAddsPageState extends State<SearchAddsPage> {
  final List<int> adds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  double overlayBoxHeight = 280;
  bool showSortBox = false;
  SortOrder? sortOrder = SortOrder.lowToHigh;

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
                          setState(() {
                            showSortBox = !showSortBox;
                          });
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
                        onPressed: () {},
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
                        onPressed: () {},
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
                        onPressed: () {},
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
          showSortBox
              ? InkWell(
                  onTap: () {
                    setState(() {
                      showSortBox = false;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black.withOpacity(0.5),
                  ),
                )
              : Container(),
          Positioned(
            bottom: 0,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: showSortBox ? overlayBoxHeight : 0,
              curve: Curves.easeInOut,
              duration: Duration(
                milliseconds: 350,
              ),
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
                            setState(() {
                              showSortBox = false;
                            });
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
            ),
          ),
        ],
      ),
    );
  }
}
