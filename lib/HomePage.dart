import 'dart:math' as Math;
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:zameenclone/Globals.dart';
import 'package:zameenclone/PostAddPage.dart';
import 'package:zameenclone/SearchAddsPage.dart';
import 'package:zameenclone/Services/RestService.dart';
import 'package:zameenclone/Widgets/CustomTabIndicator.dart';
import 'package:zameenclone/Widgets/HomePropShimmer.dart';
import 'package:zameenclone/Widgets/PillButton.dart';
import 'package:zameenclone/Widgets/PropTypesTabPage.dart';
import 'package:zameenclone/model/PropType.dart';
import 'package:zameenclone/model/SubType.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'WebViewPage.dart';

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

  // https://stackoverflow.com/questions/50909791/flutter-change-text-when-flexiblespacebar-is-collapsed

  int _bottomNavIndex = 2;

  final iconList = <IconData>[
    Icons.home_outlined,
    Icons.add_business_outlined,
    Icons.favorite_outline_rounded,
    Icons.account_circle_outlined,
  ];
  final bottomMenuTitles = <String>[
    'Home',
    'Projects',
    'Favourites',
        'Profile'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 75,
        child: FittedBox(
          child: FloatingActionButton(
            child: Icon(Icons.search),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>SearchAddsPage()));
            },
            //params
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,

        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.blue : HexColor('#373A36');
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  bottomMenuTitles[index],
                  maxLines: 1,
                  style: TextStyle(fontSize: 12, color: color),
                ),
              )
            ],
          );
        },
        backgroundColor: Colors.white,
        activeIndex: _bottomNavIndex,
        splashColor: Colors.blue.shade100,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.softEdge,
        gapLocation: GapLocation.center,
        onTap: (index) {
          setState(() => _bottomNavIndex = index);
          print('asdfklasd flaksdf ${index}');
          switch(index){
            case 2:
              // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> WebViewPage()));
              return;
          }
        },
        //other params
      ),
      drawer: Drawer(
        width: 270,
        child: Column(
          children: [
            Container(
              height: 40,
            ),
            Container(
              width: 142,
              height: 142,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/app_logo.jpg'),
                  fit: BoxFit.cover,
                  // colorFilter: ColorFilter.mode(
                  //     Colors.black.withOpacity(
                  //       0.6,
                  //     ),
                  //     BlendMode.darken),
                ),
              ),
            ),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  'Login or Create an Account',
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 10,
                            ),
                            child: Icon(
                              Icons.home,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 10,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Add Property',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 10,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Search Properties',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 10,
                            ),
                            child: Icon(
                              Icons.account_balance,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'New Projects',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 10,
                            ),
                            child: Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Favourites',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 10,
                            ),
                            child: Icon(
                              Icons.saved_search_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Saved Searches',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 10,
                            ),
                            child: Icon(
                              Icons.calculate_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Construction Cost Calculator',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 10,
                            ),
                            child: Icon(
                              Icons.settings,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 10,
                            ),
                            child: Icon(
                              Icons.info_outline,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'About Us',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 10,
                            ),
                            child: Icon(
                              Icons.phone,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Contact Us',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 10,
                            ),
                            child: Icon(
                              Icons.policy_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Terms & Privacy Policy',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ), // Populate the Drawer in the next step.
      ),
      body: Stack(
        children: [
          CustomScrollView(
            controller: customScrollViewController,
            slivers: <Widget>[
              SliverAppBar(
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
                collapsedHeight: 75,
                expandedHeight: 190,
                automaticallyImplyLeading: false,
                flexibleSpace: LayoutBuilder(builder: (context, constraints) {
                  return FlexibleSpaceBar(
                    expandedTitleScale: 1,
                    title: Container(
                      padding: const EdgeInsets.only(left: 0, right: 00, top: 0, bottom: 0),
                      height: 40,
                      decoration: BoxDecoration(
                          // color: Colors.blue,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.white.withOpacity(0.7),
                          //     spreadRadius: 3,
                          //     blurRadius: 5,
                          //     offset: Offset(-2, -2),
                          //   ),
                          // ],
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: InkWell(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey.shade600),
                                hintText: "Search property",
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.zero,
                                // contentPadding: EdgeInsets.only(left: -15),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.zero,
                                  child: Icon(
                                    Icons.search,
                                    size: 12,
                                  ),
                                ),
                              ),
                              maxLines: 1,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    titlePadding: EdgeInsetsDirectional.only(start: 20, bottom: 15, end: 20),
                    collapseMode: CollapseMode.parallax,
                    background: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/home_sliver_bk.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(
                                0.6,
                              ),
                              BlendMode.darken),
                        ),
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
                      // SizedBox(
                      //   height: 200,
                      //   child: Card(
                      //     elevation: 8,
                      //     child: Column(
                      //       children: [
                      //         // Column(
                      //         //   children: [
                      //         //     Text(
                      //         //         'Browse Properties ${propTypes.where((element) => element.id == selectedPropTypeId)}'),
                      //         //     // Text('${selectedPropTypeId}'),
                      //         //   ],
                      //         // ),
                      //         // tabController2 == null
                      //         //     ? Container()
                      //         //     : TabBar(
                      //         //         controller: tabController2,
                      //         //         labelColor: Colors.black,
                      //         //         // labelPadding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
                      //         //         isScrollable: true,
                      //         //         onTap: (index) {
                      //         //           setState(() {
                      //         //             selectedTabIndex = index;
                      //         //             selectedPropTypeId = propTypes[index].id;
                      //         //           });
                      //         //         },
                      //         //         // indicatorPadding: EdgeInsets.only(left: 25, right: 25),
                      //         //         padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                      //         //         tabs: [
                      //         //           ...propTypes.map(
                      //         //             (e) {
                      //         //               return Tab(
                      //         //                 iconMargin: EdgeInsets.zero,
                      //         //                 height: 40,
                      //         //                 icon: Icon(
                      //         //                   Icons.account_balance_wallet_outlined,
                      //         //                   size: 20,
                      //         //                   color: Colors.black,
                      //         //                 ),
                      //         //                 text: e.name,
                      //         //               );
                      //         //             },
                      //         //           ),
                      //         //         ],
                      //         //       ),
                      //         // tabController2 == null
                      //         //     ? Container()
                      //         //     : Expanded(
                      //         //         child: TabBarView(
                      //         //           controller: tabController2,
                      //         //           children: [
                      //         //             ...propTypes.map(
                      //         //               (pt) => PropTypesTabPage(
                      //         //                   subTypes.where((element) => element.typeId == pt.id).toList()),
                      //         //             ),
                      //         //           ],
                      //         //         ),
                      //         //       ),
                      //         // // TabBarView(children: [children])
                      //         // Center(
                      //         //   child: Row(
                      //         //     mainAxisAlignment: MainAxisAlignment.center,
                      //         //     children: [
                      //         //       ElevatedButton(
                      //         //         onPressed: () {
                      //         //           getTypes();
                      //         //         },
                      //         //         child: Text(
                      //         //           'Get Data',
                      //         //         ),
                      //         //       ),
                      //         //       Container(
                      //         //         width: 20,
                      //         //       ),
                      //         //       ElevatedButton(
                      //         //         onPressed: () {
                      //         //           setState(() {
                      //         //             // isPillSelected = !isPillSelected;
                      //         //             gSelectPill.value = !gSelectPill.value;
                      //         //             print('Pill Selected ? : ${gSelectPill.value}');
                      //         //           });
                      //         //         },
                      //         //         child: Text(
                      //         //           'Toggle Pill',
                      //         //         ),
                      //         //       ),
                      //         //     ],
                      //         //   ),
                      //         // ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 200,
                      //   child: Card(
                      //     child: Column(
                      //       children: [
                      //         Text(
                      //           'Construction Cost Calculator',
                      //         ),
                      //         TextFormField(
                      //           decoration: InputDecoration(
                      //             border: OutlineInputBorder(
                      //               borderRadius: BorderRadius.circular(50.0),
                      //             ),
                      //             filled: true,
                      //             hintStyle: TextStyle(color: Colors.grey.shade600),
                      //             hintText: "Search property",
                      //             fillColor: Colors.white70,
                      //             contentPadding: EdgeInsets.zero,
                      //             // contentPadding: EdgeInsets.only(left: -15),
                      //             prefixIcon: Padding(
                      //               padding: EdgeInsets.zero,
                      //               child: Icon(
                      //                 Icons.search,
                      //                 size: 16,
                      //               ),
                      //             ),
                      //           ),
                      //           maxLines: 1,
                      //           textAlignVertical: TextAlignVertical.center,
                      //           style: TextStyle(
                      //             fontSize: 16,
                      //             color: Colors.grey.shade800,
                      //           ),
                      //         ),
                      //         Text(
                      //           'Get a quick estimate of your house\'s construction cost.',
                      //         ),
                      //         Text(
                      //           'Try it Now',
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
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
                      SizedBox(
                        height: 200,
                        child: Card(
                          child: Column(
                            children: [
                              Text(
                                'Looking to sell or rent out your property?',
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>PostAddPage()));
                                },
                                child: Text('Post an Ad'),
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

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
