import 'package:flutter/material.dart';
import 'package:weather_forecast_app/core/constants/app_colors.dart';
import 'package:weather_forecast_app/domain/models/city.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  List<City> cities =
      City.citiesList.where((city) => city.isDefault == false).toList();
  List<City> selectedCities = City.getSelectedCities();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.secondaryColor,
        title: Text('${selectedCities.length}Selected'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 10, top: 20, right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: size.height * 0.8,
            width: size.width,
            decoration: BoxDecoration(
                // Change Border Color while Selecting a city
                border: cities[index].isSelected
                    ? Border.all(
                        color: AppColors.secondaryColor.withOpacity(.6),
                        width: 2)
                    : Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  cities[index].isSelected != cities[index].isSelected;
                });
              },
              child: Row(
                children: [
                  Image.asset(
                    cities[index].isSelected
                        ? 'assets/checked.png'
                        : 'assets/unchecked.png',
                    width: 30,
                  ),
                  Text(
                    cities[index].city,
                    style: TextStyle(
                        fontSize: 16,
                        color: cities[index].isSelected
                            ? AppColors.primaryColor
                            : Colors.black54),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondaryColor,
        onPressed: () {
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        },
        child: Icon(Icons.pin_drop),
      ),
    );
  }
}
