import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:real_estate_mania_yt/models/category_model.dart';
import 'package:real_estate_mania_yt/models/property_model.dart';
import 'details_page.dart';
import 'package:http/http.dart' as http;

class CategoryPage extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryPage({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  Future<List<PropertyModel>> getPro() async {
    List<PropertyModel> pros = [];
    try {
      var headers = {'Cookie': 'PHPSESSID=6dd87a440989b6bb168f4c5ebd79c0b1'};
      var request = http.Request(
          'GET', Uri.parse('https://debuggersinc.com/clairehomes/homes.php'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final res = await response.stream.bytesToString();
        pros = propertyModelFromJson(res);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {}
    return pros;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<PropertyModel>>(
          future: getPro(),
          builder: (context, AsyncSnapshot<List<PropertyModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snapshot.hasData) {
              print(snapshot.data!.length);
              return SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                              ),
                            ),
                            Text(
                              categoryModel.title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(LineIcons.search),
                              hintText: "Search...",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Popular",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "See All",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ExpandedRecommendationCard(
                              propertyModel: snapshot.data![index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Text('No data found!');
            }
          }),
    );
  }
}

class ExpandedRecommendationCard extends StatelessWidget {
  const ExpandedRecommendationCard({
    Key? key,
    required this.propertyModel,
  }) : super(key: key);

  final PropertyModel propertyModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(propertyModel: propertyModel),
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 8, top: 12, bottom: 12),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                //TODO: Edit the image area
                child: Image.network(
                  'https://i0.wp.com/buildnet.co.ug/wp-content/uploads/2021/04/Naalya-Project-11.jpg?fit=1920%2C1280&ssl=1',
                  // propertyModel.image,
                  // height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  propertyModel.name,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                const Icon(
                  LineIcons.starAlt,
                  color: Colors.amber,
                ),
                Text(
                  '4.3',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            // TODO: Missing data from theapi
            Text(
              "${propertyModel.rooms} rooms - ${propertyModel.rooms} square foots - ${propertyModel.rooms} floors",
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xffE6CD6B),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 5),
                              blurRadius: 20,
                              spreadRadius: 4,
                            )
                          ],
                        ),
                        height: 55,
                        width: 55,
                        child: Center(
                          child: Text(
                            "BUY NOW",
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.1),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 5),
                            blurRadius: 20,
                            spreadRadius: 4,
                          )
                        ],
                      ),
                      height: 55,
                      width: 55,
                      child: const Icon(
                        LineIcons.facebookMessenger,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// thanks for watching! 
// do subscribe to my channel to get more videos! <3 