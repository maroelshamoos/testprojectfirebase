import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprojectfirebase/core/viewmodels/floorplan_model.dart';
import 'package:testprojectfirebase/view/shared/global.dart';

class ResetButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FloorPlanModel>(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Global.blue, // foreground
            ),
            onPressed: () { model.reset(); },
            child: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          )
        /*RaisedButton (
          elevation: 10.0,
          color: Global.blue,
          onPressed: () {
            model.reset();
          },
          child: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        ),*/
      ),
    );
  }
}

