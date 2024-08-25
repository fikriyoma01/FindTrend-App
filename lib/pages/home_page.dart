import 'package:flutter/material.dart';
import 'area-details-page.dart';
import 'plant_recommendations_screen.dart';
import 'community_forum_screen.dart';
import 'recommendations_page.dart';
import 'shopping_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.green[400],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: IntrinsicHeight(
                    child: Center(
                      child: Opacity(
                        opacity: 0.8,
                        child: FeatureButton(
                          key: UniqueKey(),
                          icon: Icons.sunny,
                          title: 'Your Plants',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PlantRecommendationsScreen()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: IntrinsicHeight(
                    child: Center(
                      child: Opacity(
                        opacity: 0.8,
                        child: FeatureButton(
                          key: UniqueKey(),
                          icon: Icons.group,
                          title: 'Community',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommunityForumScreen()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: IntrinsicHeight(
                    child: Center(
                      child: Opacity(
                        opacity: 0.8,
                        child: FeatureButton(
                          key: UniqueKey(),
                          icon: Icons.list,
                          title: 'Shopping',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShoppingPage()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                // Expanded(
                //   child: IntrinsicHeight(
                //     child: Center(
                //       child: Opacity(
                //         opacity: 0.8,
                //         child: FeatureButton(
                //           key: UniqueKey(),
                //           icon: Icons.location_on,
                //           title: 'Area Details Page',
                //           onPressed: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => AreaDetailsPage()),
                //             );
                //           },
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  final Key key;
  final IconData icon;
  final String title;
  final void Function()? onPressed;

  const FeatureButton({
    required this.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 40.0,
              color: Colors.blueGrey[800],
            ),
            SizedBox(height: 4.0),
            Text(
              title,
              style: TextStyle(
                color: Colors.blueGrey[800],
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
