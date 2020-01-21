import 'package:flutter/material.dart';

class StepWidget extends StatelessWidget {
  final IconData iconData;

  final num stepNumber;

  final String stepName;

  final Function onTap;

  const StepWidget({
    Key key,
    @required this.iconData,
    @required this.stepNumber,
    @required this.stepName,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () => onTap(context),
            leading: Icon(
              iconData,
              size: 64,
              color: Colors.white,
            ),
            title: Text(
              "Step $stepNumber",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              stepName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            contentPadding: EdgeInsets.all(24),
          )
        ],
      ),
    );
  }
}
