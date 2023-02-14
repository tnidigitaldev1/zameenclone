import 'package:flutter/material.dart';
import 'package:zameenclone/Widgets/SearchAdsShimmer.dart';

class SearchAddsPage extends StatefulWidget {
  SearchAddsPage({Key? key}) : super(key: key);

  @override
  State<SearchAddsPage> createState() => _SearchAddsPageState();
}

class _SearchAddsPageState extends State<SearchAddsPage> {

  final List<int> adds = [1,2,3,4,5,6,7,8,9,10,11];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homes for Sale'),
      ),
      body: SingleChildScrollView(
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
                                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey.shade400),
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
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                            Container(
                              height: 10,
                            ),
                            Text(
                              'Flat for sale',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
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
                                      style: TextStyle(fontSize: 12,),
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
                                        Icon(Icons.call,size: 14,),
                                        Container(
                                          width: 4,
                                        ),
                                        Text(
                                          'Call',
                                          style: TextStyle(fontSize: 12,),
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
                                      child: Center(child: Icon(Icons.whatsapp,size: 20,)),
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(0)),
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
            ))
            ,
          ],
        ),
      ),
    );
  }
}
