import 'package:flutter/material.dart';

class UiControllScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';
  const UiControllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, bike, boat, plane }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunche = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) => setState(() => isDeveloper = !isDeveloper),
        ),
        ExpansionTile(
          title: const Text('Vehicle Type'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar por carro'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(
                () => selectedTransportation = Transportation.car,
              ),
            ),
            RadioListTile(
              title: const Text('By Bike'),
              subtitle: const Text('Viajar por vicicleta'),
              value: Transportation.bike,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(
                () => selectedTransportation = Transportation.bike,
              ),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar por bote'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(
                () => selectedTransportation = Transportation.boat,
              ),
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar por carro'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(
                () => selectedTransportation = Transportation.plane,
              ),
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text('Breakfast?'),
          value: wantsBreakfast, 
          onChanged: (value) => setState(
            () => wantsBreakfast = !wantsBreakfast
          ),
        ),
        CheckboxListTile(
          title: const Text('Lunche?'),
          value: wantsDinner, 
          onChanged: (value) => setState(
            () => wantsDinner = !wantsDinner
          ),
        ),
        CheckboxListTile(
          title: const Text('Dinner?'),
          value: wantsLunche, 
          onChanged: (value) => setState(
            () => wantsLunche = !wantsLunche
          ),
        )
        
      ],
    );
  }
}
