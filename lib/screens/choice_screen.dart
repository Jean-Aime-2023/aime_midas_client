import 'package:flutter/material.dart';
import 'package:mijo/models/service.dart';
import 'package:mijo/screens/service_screen.dart';
import 'package:mijo/widgets/custom_side_drawer.dart';

class ChoiceScreen extends StatelessWidget {
  const ChoiceScreen({Key? key}) : super(key: key);
  
  static const String route = '/choice';

  @override
  Widget build(BuildContext context) {
      List<Service> services = [
      Service('Driver',
          'https://img.icons8.com/external-sbts2018-lineal-color-sbts2018/2x/external-driver-women-profession-sbts2018-lineal-color-sbts2018.png'),
      Service('Cleaning',
          'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-cleaning-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
      Service('Plumber',
          'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-plumber-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
      Service('Electrician',
          'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-multimeter-car-service-wanicon-flat-wanicon.png'),
      Service('Painter',
          'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-painter-male-occupation-avatar-itim2101-flat-itim2101.png'),
      Service('Carpenter', 'https://img.icons8.com/fluency/2x/drill.png'),
      Service('Gardener',
          'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-gardener-male-occupation-avatar-itim2101-flat-itim2101.png'),
      Service('Tailor', 'https://img.icons8.com/fluency/2x/sewing-machine.png'),
      Service('Maid', 'https://img.icons8.com/color/2x/housekeeper-female.png'),
      Service('Cook',
          'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-cooking-daily-routine-wanicon-flat-wanicon.png'),
    ];

    int selectedService = -1;

    return Scaffold(
      appBar: AppBar(
        title: const DefaultTextStyle(style: TextStyle(color:  Colors.black, fontSize: 30, fontStyle: FontStyle.normal), child: Text("What do you want?")),
      ),
      drawer: const CustomSideDrawer(),
      backgroundColor: Colors.white,
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        itemCount: services.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ), 
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              
              String category = services[index].name;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServiceScreen(category: category)
                ),
              );
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                color: selectedService == index
                    ? Colors.blue.shade50
                    : Colors.grey.shade100,
                border: Border.all(
                  color: selectedService == index
                      ? Colors.blue
                      : Colors.blue.withOpacity(0),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(services[index].imageURL, height: 80),
                    const SizedBox(
                      height: 20,
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      child: Text(services[index].name),
                    )
                  ]),
            ),
          );
        })
      );
  }
}
