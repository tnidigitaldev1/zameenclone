import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:zameenclone/Globals.dart';
import 'package:zameenclone/Services/RestService.dart';
import 'package:zameenclone/Widgets/CustomTabIndicator.dart';
import 'package:zameenclone/Widgets/HomePropShimmer.dart';
import 'package:zameenclone/Widgets/PillButton.dart';
import 'package:zameenclone/Widgets/PropTypesTabPage.dart';
import 'package:zameenclone/model/PropType.dart';
import 'package:zameenclone/model/SubType.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ScrollController customScrollViewController = ScrollController();
  ScrollController listScrollViewController = ScrollController();
  TabController? tabController1;
  TabController? tabController2;
  bool isDataLoaded = false;
  int selectedTabIndex = 0;
  String selectedPropTypeId = '';
  bool isPillSelected = false;

  @override
  void initState() {}

  List<PropType> propTypes = [];
  List<PropSubType> subTypes = [];
  List<PropSubType> tmpSubTypes = [];
  List<Widget> tabViewsZZZ = [];

  getTypes() {
    setState(() {
      isDataLoaded = false;
      propTypes = [];
    });
    RestService.handleGet(Api.getPropTypes).then((value) {
      value.forEach((v) {
        print('---------->>>> ${v}');
        Map<String, dynamic> tmp = v;
        setState(() {
          propTypes.add(PropType().fromMap(tmp));
        });
      });
      setState(() {
        subTypes = [];
      });
      // get sub types
      RestService.handleGet(Api.getSubTypes).then((value) {
        value.forEach((element) {
          Map<String, dynamic> tmp = element;
          setState(() {
            subTypes.add(PropSubType().fromMap(tmp));
          });
        });

        for (var pt in propTypes) {
          // tabViews.add(getTabView(subTypes.where((element) => element.typeId == pt.id).toList()));
        }

        Future.delayed(Duration(milliseconds: 500), () {
          setState(() {
            isDataLoaded = true;
            setState(() {
              tabController1 = TabController(initialIndex: 0, length: 5, vsync: this);
              tabController2 = TabController(initialIndex: 0, length: propTypes.length, vsync: this);
            });
          });
        });
      });
    });
  }

  String selectedPillBtnName = 'None';

  pillBtnCallback(String title) {
    setState(() {
      selectedPillBtnName = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: customScrollViewController,
            slivers: <Widget>[
              TransitionAppBar(
                // title: Text('asdlkf lasdf'),
                // leading: Text('++++++++'),
                // bottom: PreferredSize(
                //   preferredSize: Size.fromHeight(80),
                //   child:
                //
                //
                //   tabController1 == null
                //       ? Text('0000000')
                //       : TabBar(
                //           tabs: [
                //             Text(
                //               'Houses',
                //               style: TextStyle(color: Colors.white),
                //             ),
                //             Text('Properties'),
                //             Text('Flats'),
                //             Text('Plots'),
                //             Text('Warehosuses'),
                //           ],
                //         ),
                // ),
                snap: false,
                pinned: true,
                floating: false,
                collapsedHeight: 57,
                expandedHeight: 230,automaticallyImplyLeading: true,
                leading: Text('asdf'),
                actions: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                  ),
                ],
                flexibleSpace: LayoutBuilder(builder: (context, constraints) {
                  return FlexibleSpaceBar(
                    // expandedTitleScale: 1,
                    title: Container(
                      padding: const EdgeInsets.only(left: 0, right: 00, top: 0, bottom: 0),
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.7),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(-2,-2),
                          ),
                        ]
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey.shade600),
                          hintText: "Search property",
                          fillColor: Colors.white70,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                    titlePadding: EdgeInsetsDirectional.only(
                      start: 20,
                      bottom: 15,
                      end: 20
                    ),
                    collapseMode: CollapseMode.parallax,
                    background: SizedBox(
                      width: 300,
                      height: 200,
                      child: Image.asset(
                        'assets/home_sliver_bk.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  key: GlobalKey(),
                  controller: listScrollViewController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 200,
                        child: Card(
                          child: Column(
                            children: [
                              Text(
                                'Looking to sell or rent out your property?',
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Post an Ad'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: Card(
                          elevation: 12,
                          child: Column(
                            children: [
                              // Column(
                              //   children: [
                              //     Text(
                              //         'Browse Properties ${propTypes.where((element) => element.id == selectedPropTypeId)}'),
                              //     // Text('${selectedPropTypeId}'),
                              //   ],
                              // ),
                              // tabController2 == null
                              //     ? Container()
                              //     : TabBar(
                              //         controller: tabController2,
                              //         labelColor: Colors.black,
                              //         // labelPadding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
                              //         isScrollable: true,
                              //         onTap: (index) {
                              //           setState(() {
                              //             selectedTabIndex = index;
                              //             selectedPropTypeId = propTypes[index].id;
                              //           });
                              //         },
                              //         // indicatorPadding: EdgeInsets.only(left: 25, right: 25),
                              //         padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                              //         tabs: [
                              //           ...propTypes.map(
                              //             (e) {
                              //               return Tab(
                              //                 iconMargin: EdgeInsets.zero,
                              //                 height: 40,
                              //                 icon: Icon(
                              //                   Icons.account_balance_wallet_outlined,
                              //                   size: 20,
                              //                   color: Colors.black,
                              //                 ),
                              //                 text: e.name,
                              //               );
                              //             },
                              //           ),
                              //         ],
                              //       ),
                              // tabController2 == null
                              //     ? Container()
                              //     : Expanded(
                              //         child: TabBarView(
                              //           controller: tabController2,
                              //           children: [
                              //             ...propTypes.map(
                              //               (pt) => PropTypesTabPage(
                              //                   subTypes.where((element) => element.typeId == pt.id).toList()),
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              // // TabBarView(children: [children])
                              // Center(
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       ElevatedButton(
                              //         onPressed: () {
                              //           getTypes();
                              //         },
                              //         child: Text(
                              //           'Get Data',
                              //         ),
                              //       ),
                              //       Container(
                              //         width: 20,
                              //       ),
                              //       ElevatedButton(
                              //         onPressed: () {
                              //           setState(() {
                              //             // isPillSelected = !isPillSelected;
                              //             gSelectPill.value = !gSelectPill.value;
                              //             print('Pill Selected ? : ${gSelectPill.value}');
                              //           });
                              //         },
                              //         child: Text(
                              //           'Toggle Pill',
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: Card(
                          child: Column(
                            children: [
                              Text(
                                'Construction Cost Calculator',
                              ),
                              Text(
                                'Get a quick estimate of your house\'s construction cost.',
                              ),
                              Text(
                                'Try it Now',
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Recent Searches',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  height: 5,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 10, top: 0, bottom: 0),
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(minWidth: 160),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey.shade200,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Transform(
                                                        alignment: Alignment.center,
                                                        transform: Matrix4.rotationY(Math.pi),
                                                        child: Icon(
                                                          Icons.search_outlined,
                                                          size: 16,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      Text(
                                                        'House for Sale',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'All area sizes',
                                                    style: TextStyle(
                                                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                                                  ),
                                                  Container(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Transform(
                                                        alignment: Alignment.center,
                                                        transform: Matrix4.rotationY(Math.pi),
                                                        child: Icon(
                                                          Icons.location_on_outlined,
                                                          size: 16,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Karachi',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Transform(
                                                        alignment: Alignment.center,
                                                        transform: Matrix4.rotationY(Math.pi),
                                                        child: Icon(
                                                          Icons.local_offer_outlined,
                                                          size: 16,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Any Price',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 10, top: 0, bottom: 0),
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(minWidth: 160),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey.shade200,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Transform(
                                                        alignment: Alignment.center,
                                                        transform: Matrix4.rotationY(Math.pi),
                                                        child: Icon(
                                                          Icons.search_outlined,
                                                          size: 16,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Plots for Sale',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'All area sizes',
                                                    style: TextStyle(
                                                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                                                  ),
                                                  Container(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Transform(
                                                        alignment: Alignment.center,
                                                        transform: Matrix4.rotationY(Math.pi),
                                                        child: Icon(
                                                          Icons.location_on_outlined,
                                                          size: 16,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Karachi',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Transform(
                                                        alignment: Alignment.center,
                                                        transform: Matrix4.rotationY(Math.pi),
                                                        child: Icon(
                                                          Icons.local_offer_outlined,
                                                          size: 16,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Any Price',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 10, top: 0, bottom: 0),
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(minWidth: 160),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey.shade200,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Transform(
                                                        alignment: Alignment.center,
                                                        transform: Matrix4.rotationY(Math.pi),
                                                        child: Icon(
                                                          Icons.search_outlined,
                                                          size: 16,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Farm House for Sale',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'All area sizes',
                                                    style: TextStyle(
                                                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                                                  ),
                                                  Container(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Transform(
                                                        alignment: Alignment.center,
                                                        transform: Matrix4.rotationY(Math.pi),
                                                        child: Icon(
                                                          Icons.location_on_outlined,
                                                          size: 16,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Karachi',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Transform(
                                                        alignment: Alignment.center,
                                                        transform: Matrix4.rotationY(Math.pi),
                                                        child: Icon(
                                                          Icons.local_offer_outlined,
                                                          size: 16,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Any Price',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 10, top: 0, bottom: 0),
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(minWidth: 160),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey.shade200,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Transform(
                                                        alignment: Alignment.center,
                                                        transform: Matrix4.rotationY(Math.pi),
                                                        child: Icon(
                                                          Icons.search_outlined,
                                                          size: 16,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Flat for Sale',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'All area sizes',
                                                    style: TextStyle(
                                                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                                                  ),
                                                  Container(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Transform(
                                                        alignment: Alignment.center,
                                                        transform: Matrix4.rotationY(Math.pi),
                                                        child: Icon(
                                                          Icons.location_on_outlined,
                                                          size: 16,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Karachi',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Transform(
                                                        alignment: Alignment.center,
                                                        transform: Matrix4.rotationY(Math.pi),
                                                        child: Icon(
                                                          Icons.local_offer_outlined,
                                                          size: 16,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Any Price',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0, right: 10, top: 0, bottom: 0),
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(minWidth: 160),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey.shade200,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Transform(
                                                        alignment: Alignment.center,
                                                        transform: Matrix4.rotationY(Math.pi),
                                                        child: Icon(
                                                          Icons.search_outlined,
                                                          size: 16,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Home for Sale',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'All area sizes',
                                                    style: TextStyle(
                                                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                                                  ),
                                                  Container(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Transform(
                                                        alignment: Alignment.center,
                                                        transform: Matrix4.rotationY(Math.pi),
                                                        child: Icon(
                                                          Icons.location_on_outlined,
                                                          size: 16,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Karachi',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Transform(
                                                        alignment: Alignment.center,
                                                        transform: Matrix4.rotationY(Math.pi),
                                                        child: Icon(
                                                          Icons.local_offer_outlined,
                                                          size: 16,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Any Price',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  ),
                                                ],
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
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Viewed Properties',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          HomePropShimmer('SUPER HOT', '22 HRS AGO'),
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
                                                  fontSize: 14,
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
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.area_chart,
                                                size: 15,
                                              ),
                                              Text(
                                                '2000 Sq. Ft.',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          HomePropShimmer('HOT', '1 MONTH AGO'),
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
                                                '5.3 Crore',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Nazimabad, Karachi ',
                                            style: TextStyle(
                                                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Text(
                                            'House for sale',
                                            style: TextStyle(
                                                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.area_chart,
                                                size: 15,
                                              ),
                                              Text(
                                                '1950 Sq. Ft.',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          HomePropShimmer('SUPER HOT', '1 WEEK AGO'),
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
                                                '85 Lac',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Khokhrapar, Malir',
                                            style: TextStyle(
                                                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                                          ),
                                          Container(
                                            height: 10,
                                          ),
                                          Text(
                                            'Home for sale',
                                            style: TextStyle(
                                                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.area_chart,
                                                size: 15,
                                              ),
                                              Text(
                                                '80 Sq. Yd.',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          HomePropShimmer('HOT', '1 DAY AGO'),
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
                                                  fontSize: 14,
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
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.area_chart,
                                                size: 15,
                                              ),
                                              Text(
                                                '2000 Sq. Ft.',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          HomePropShimmer('SUPER HOT', '11 HRS AGO'),
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
                                                  fontSize: 14,
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
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.area_chart,
                                                size: 15,
                                              ),
                                              Text(
                                                '2000 Sq. Ft.',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // isDataLoaded
          true
              ? Container()
              : Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                )
        ],
      ),
    );
  }

  getTabViewZZZ(List<PropSubType> list) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(selectedPillBtnName),
        ),
      ],
    );
  }
}
