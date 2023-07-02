import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprojectfirebase/core/viewmodels/floorplan_model.dart';
import 'package:testprojectfirebase/view/shared/global.dart';
import 'package:testprojectfirebase/view/widgets/gridview_widget.dart';
import 'package:testprojectfirebase/view/widgets/overlay_widget.dart';
import 'package:testprojectfirebase/view/widgets/raw_gesture_detector_widget.dart';
import 'package:testprojectfirebase/view/widgets/reset_button_widget.dart';


class FloorPlanScreen extends StatelessWidget {
  const FloorPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final model = Provider.of<FloorPlanModel>(context);

    return ClipRRect(                      //for the border raduis on the map
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: Container(
          color: Global.blue,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                RawGestureDetectorWidget(
                  child: GridViewWidget(),
                ),
                model.hasTouched ? ResetButtonWidget() : OverlayWidget()
              ],
            ),
          ),
        ),
      );
  }
}

/*Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(                 //from above the empty space
        preferredSize: Size.fromHeight(100.0),
        child: AppBarWidget(),
      ),
      body: */