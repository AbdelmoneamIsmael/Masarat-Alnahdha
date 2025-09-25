import 'package:masarat_alnahdha/core/widgets/app_text_field.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';
import 'package:masarat_alnahdha/core/widgets/ui_function.dart';
import 'package:masarat_alnahdha/features/address/data/models/location_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import '../../../../core/themes/colors/colors.dart';
import '../../../../core/themes/styles/app_text_style.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  LatLng _selectedLocation = LatLng(
    30.07247787149545,
    31.251499789573934,
  ); // Default: London
  String _locationDetails = '';
  Map<String, dynamic>? _savedLocation;
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];
  bool _showBottomSheet = false;
  String? _errorMessage;
  final Debouncer _debouncer = Debouncer();

  Future<void> _searchLocation(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _errorMessage = null;
      });
      return;
    }

    // Debounce the search request
    _debouncer.debounce(
      duration: const Duration(milliseconds: 500),
      onDebounce: () async {
        try {
          final response = await http.get(
            Uri.parse(
              'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=5',
            ),
            headers: {'User-Agent': 'FlutterMapApp/1.0'},
          );
          if (response.statusCode == 200) {
            setState(() {
              _searchResults = json.decode(response.body);
              _errorMessage = null;
            });
          } else {
            setState(() {
              _searchResults = [];
              _errorMessage =
                  'Failed to fetch search results. Please try again.';
            });
          }
        } catch (e) {
          setState(() {
            _searchResults = [];
            _errorMessage =
                'An error occurred during search. Please check your connection.';
          });
        }
      },
    );
  }

  Future<void> _getLocationDetails(LatLng point) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        point.latitude,
        point.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        setState(() {
          _locationDetails = [
            place.street,
            place.locality,
            place.administrativeArea,
            place.country,
          ].where((e) => e != null && e.isNotEmpty).join(', ');
          _showBottomSheet = true;
          _errorMessage = null;
        });
      } else {
        setState(() {
          _locationDetails = 'No details available for this location';
          _showBottomSheet = true;
          _errorMessage = null;
        });
      }
    } catch (e) {
      setState(() {
        _locationDetails = 'Unable to fetch location details';
        _showBottomSheet = true;
        _errorMessage = 'Error fetching location details';
      });
    }
  }

  void _saveLocation() {
    setState(() {
      _savedLocation = {
        'latitude': _selectedLocation.latitude,
        'longitude': _selectedLocation.longitude,
        'details': _locationDetails,
      };
      // _showBottomSheet = false;
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Location saved: $_locationDetails')),
      // );
      LocationDetailsModel locationDetailsModel = LocationDetailsModel.fromJson(
        _savedLocation!,
      );
      GoRouter.of(context).pop(
        locationDetailsModel,
      ); // return locationDetailsModel to previous screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      topSafeArea: true,
      appBar: AppBar(title: const Text('تحديد الموقع')),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _selectedLocation,
              initialZoom: 9.0,
              onTap: (tapPosition, point) {
                setState(() {
                  _selectedLocation = point;
                  _searchResults = [];
                  _searchController.clear();
                  _errorMessage = null;
                });
                _getLocationDetails(point);
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName:
                    'com.puresoft.almasarat_alnahdha.almasarat_alnahdha',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _selectedLocation,
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Column(
              children: [
                AppTextField(
                  hint: 'بحث',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      setState(() => _searchResults = []);
                    },
                  ),
                  prefixIcon: Icon(Icons.search),
                  onChanged: _searchLocation,
                ),
                if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                if (_searchResults.isNotEmpty)
                  Container(
                    color: Colors.white,
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final result = _searchResults[index];
                        return ListTile(
                          title: Text(result['display_name']),
                          onTap: () {
                            final lat = double.parse(result['lat']);
                            final lon = double.parse(result['lon']);
                            setState(() {
                              _selectedLocation = LatLng(lat, lon);
                              _mapController.move(_selectedLocation, 13.0);
                              _searchResults = [];
                              _searchController.clear();
                              _errorMessage = null;
                            });
                            _getLocationDetails(_selectedLocation);
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
          if (_showBottomSheet)
            DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.2,
              maxChildSize: 0.5,
              builder: (context, scrollController) {
                return Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   'Location Details',
                          //   style: Theme.of(context).textTheme.titleLarge,
                          // ),
                          const SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: LightColors.greyColor,
                              borderRadius: BorderRadius.circular(6.r),
                              boxShadow: [UiHelper.shadow(context)],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'الموقع المحدد',
                                      style: AppTextStyle.bold16(context),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  _locationDetails,
                                  style: AppTextStyle.regular14(
                                    context,
                                  ).copyWith(color: Colors.blueGrey),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: _saveLocation,
                            child: const Text('تأكيد العنوان'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
