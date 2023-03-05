import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/lat_long_model.dart';
import '../../data/response/geocoding_repository.dart';
import '../../data/service/api_service.dart';
import '../../view_model/map_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_picker_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key, required this.latLong}) : super(key: key);
  final LatLong latLong;
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String dropdownvalue = 'house';

  // List of items in our dropdown menu
  var items = [
    "house",
    "locality",
    'street',
    'region',
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          MapViewModel(geocodingRepo: GeocodingRepo(apiService: ApiService())),
      builder: (context, child) {
        return Scaffold(

          body: Consumer<MapViewModel>(
            builder: (context, viewModel, child) {
              return SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    DropdownButton(

                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged:
                          (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<MapViewModel>().fetchAddress(
                            latLong: widget.latLong, kind: dropdownvalue);
                      },
                      child: Text("GET map Data"),
                    ),
                    InkWell(
                      onTap: ((){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MapPickerPage(latLong: widget.latLong)));
                      }),
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue

                         ),
                        child: const Center(
                          child: Text("Show in map", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 25),
                      child: Text(
                        "${viewModel.addressText}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),
                      ),
                    ),


                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}


