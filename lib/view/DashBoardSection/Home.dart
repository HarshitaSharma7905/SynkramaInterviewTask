import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            //list 1
            SizedBox(
              height: 200.0, // Adjust the height according to your needs
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1, // If you have multiple images, adjust this accordingly
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                  Center(
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                  'assets/img4.jpg',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                  ),
                  ),
                  ),
                  SizedBox(width: 10,),
                  Center(
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                  'assets/img5.jpg',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                  ),
                  ),
                  ),
                      SizedBox(width: 10,),
                  Center(
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                  'assets/img6.jpg',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                  ),
                  ),
                  ),
                      SizedBox(width: 10,),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/img7.jpg',
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),SizedBox(height: 10,),
          //  list 2
            Row(
              children: [
                SizedBox(
                  width: 210,
                  height: 400.0, // Adjust the height according to your needs
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 1, // If you have multiple images, adjust this accordingly
                    itemBuilder: (context, index) {
                      return Column(
                        children: [

                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    'assets/img8.jpg',
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    'assets/img9.jpg',
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    'assets/img10.jpg',
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    'assets/img11.jpg',
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                        ],
                      );
                    },
                  ),
                ),
              //  list 3 grid view

                Center(
                  child: SizedBox(
                    width: 140,
                    height: 400.0, // Adjust the height according to your needs
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Set the number of items per row (1 for horizontal scrolling)
                        mainAxisSpacing: 10.0, // Adjust the spacing between rows
                        crossAxisSpacing: 10.0, // Adjust the spacing between items
                      ),
                      itemCount: 5, // Total number of items
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset('assets/img12.jpg',
                            width: 110.0,
                            height: 150.0,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
