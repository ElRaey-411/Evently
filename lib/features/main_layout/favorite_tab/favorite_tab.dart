import 'package:evently/core/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/models/event_model.dart';
import '../../../core/widgets/event_item.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            CustomTextForm(
              prefixIcon: Icon(Icons.search),
              keyboardType: TextInputType.text,
              hintText: "Search for Event",
              controller: controller,
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemBuilder:
                    (context, index) => EventItem(
                  event: EventModel.events[index],
                ),
                itemCount: EventModel.events.length,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
