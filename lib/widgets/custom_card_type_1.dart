import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        const ListTile(
          leading: Icon(
            Icons.add_box_outlined,
            color: AppTheme.primary,
          ),
          title: Text("soy un titulo"),
          subtitle: Text(
              "Esse est non non sunt cupidatat duis anim. Cupidatat ea consectetur ea ut occaecat ea velit laboris anim non cillum amet. Est officia labore esse ea est consequat velit sit nostrud qui deserunt id exercitation. Laborum labore exercitation eiusmod nisi in commodo in ad. Quis proident labore aute do deserunt sunt exercitation consectetur."),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("Cancel"),
              ),
              TextButton(onPressed: () {}, child: const Text("Ok"))
            ],
          ),
        )
      ]),
    );
  }
}
