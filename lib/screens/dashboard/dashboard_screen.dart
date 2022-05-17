import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

import '../../constants.dart';
import 'components/header.dart';
import 'components/my_fiels.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            SizedBox(height: 15.0),
            Header(),
            SizedBox(height: 54.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      /*if (!Responsive.isMobile(context)) MyFiels(),*/
                      SizedBox(height: defaultPadding),
                      Container(
                        height: 546,
                        child: Maps(),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) StarageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: StarageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Maps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        maxZoom: 17.0,
        minZoom: 15.0,
        center: LatLng(-13.860949, -40.101911),
        zoom: 17.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/sashife/ckun6g6kb0z2m17pki8xikrze/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2FzaGlmZSIsImEiOiJja3VuNXV0aTYyZzh5Mm9ydWx0M3BpbHZ3In0.zF6UYr5DVbo2EsefbS0DpA",
          additionalOptions: {
            'accessToken':
                'pk.eyJ1Ijoic2FzaGlmZSIsImEiOiJja3VuNXV0aTYyZzh5Mm9ydWx0M3BpbHZ3In0.zF6UYr5DVbo2EsefbS0DpA',
            'id': 'mapbox.mapbox-streets-v8',
          },
        ),
        MarkerLayerOptions(
          markers: [
            new Marker(
              width: 20.0,
              height: 20.0,
              point: LatLng(-13.860949, -40.101911),
              builder: (ctx) => Container(
                child: IconButton(
                  padding: EdgeInsets.all(0.0),
                  icon: SvgPicture.asset(
                    'assets/icons/pin.svg',
                    color: primaryColor,
                    width: 25.0,
                    height: 25.0,
                  ),
                  onPressed: () {
                    print("Marker pressed com zoom in ");
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
