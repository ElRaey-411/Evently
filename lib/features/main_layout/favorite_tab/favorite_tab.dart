import 'package:evently/core/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/models/event_model.dart';
import '../../../core/widgets/event_item.dart';
import '../../../firebase/firebase_service.dart';
import '../../../l10n/app_localizations.dart';

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
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16.h),

              CustomTextForm(
                prefixIcon: const Icon(Icons.search),
                keyboardType: TextInputType.text,
                hintText: appLocalizations.search_for_event,
                controller: controller,
                onChanged: (value) {
                  setState(() {});
                },
              ),
              SizedBox(height: 16.h),

              Expanded(
                child: FutureBuilder<List<EventModel>>(
                  future: FirebaseService.getFavouriteEvents(
                    context,
                    searchKey: controller.text,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    }

                    final favouriteEvents = snapshot.data ?? [];

                    if (favouriteEvents.isEmpty) {
                      return Center(
                        child: Text(appLocalizations.no_favourite_events_found),
                      );
                    }

                    return ListView.builder(
                      itemCount: favouriteEvents.length,
                      itemBuilder: (context, index) {
                        final event = favouriteEvents[index];
                        return EventItem(
                          onFavourite: () {
                            setState(() {});
                          },
                          event: event,
                          isFavorite: true,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
