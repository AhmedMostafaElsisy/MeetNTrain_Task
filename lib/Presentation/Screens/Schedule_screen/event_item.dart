import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meet_n_train_task/Constants/app_constants.dart';
import 'package:meet_n_train_task/Data/Models/event_model.dart';
import 'package:meet_n_train_task/Helpers/shared.dart';
import 'package:meet_n_train_task/Presentation/Widgets/common_title_text.dart';

import '../build_stacked_images.dart';
import 'event_image_widget.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key, required this.event}) : super(key: key);
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.82,
          height: MediaQuery.of(context).size.height * 0.42,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: AppConstants.greyColor.withOpacity(0.3),
                    offset: Offset(0, 3),
                    blurRadius: 4)
              ],
              borderRadius: BorderRadius.circular(12),
              color: AppConstants.lightWhiteColor),
          child: Padding(
            padding:
                const EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ///main event image , tag and spots number
              ImageContainer(
                  imagePath: event.featuredImage ?? '',
                  tag: event.tag!,
                  spots: event.spots!),

              ///spacer
              getSpaceHeight(8),

              ///event date
              CommonTitleText(
                textKey: DateFormat(
                  'EEEE dd MMM  yyyy . hh:mm a',
                ).format(DateTime.parse(event.date!)),
                textColor: AppConstants.greyColor,
                textWeight: FontWeight.w400,
                textFontSize: AppConstants.xSmallFontSize,
              ),

              ///event title
              CommonTitleText(
                textKey: event.title!,
                textColor: AppConstants.lightBlackColor,
                textWeight: FontWeight.w400,
                textFontSize: AppConstants.mediumFontSize,
              ),

              ///event location
              SizedBox(
                width: getWidgetWidth(MediaQuery.of(context).size.width * 0.6),
                child: CommonTitleText(
                  textKey: event.placeName!,
                  textColor: AppConstants.greyColor,
                  textWeight: FontWeight.w400,
                  textFontSize: AppConstants.xSmallFontSize,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  ///remaining date for event
                  children: [
                    CommonTitleText(
                      textKey:
                          '${DateTime.parse(event.finishDate!).difference(DateTime.now()).inDays} days left',
                      textColor: AppConstants.primaryColor,
                      textWeight: FontWeight.w400,
                      textFontSize: AppConstants.xSmallFontSize,
                      textOverflow: TextOverflow.ellipsis,
                    ),

                    ///event payment
                    const Spacer(),
                    event.paymentMethod == 'CASH'
                        ? Container(
                            width: 20,
                            height: 20,
                            //padding: EdgeInsets.only(bottom: 1),
                            decoration: BoxDecoration(
                                color: AppConstants.lightWhiteColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppConstants.primaryColor)),
                            child: const Center(
                              child: CommonTitleText(
                                textKey: '\$',
                                textColor: AppConstants.primaryColor,
                                textWeight: FontWeight.w500,
                                textFontSize: AppConstants.smallFontSize,
                              ),
                            ))
                        : event.paymentMethod == 'BOTH'
                            ? Row(
                                children: [
                                  Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: AppConstants.lightWhiteColor,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color:
                                                  AppConstants.primaryColor)),
                                      child: const Center(
                                        child: CommonTitleText(
                                          textKey: '\$',
                                          textColor: AppConstants.primaryColor,
                                          textWeight: FontWeight.w500,
                                          textFontSize:
                                              AppConstants.smallFontSize,
                                        ),
                                      )),
                                  const Icon(
                                    Icons.credit_card,
                                    color: AppConstants.primaryColor,
                                  ),
                                  const Icon(
                                    Icons.wallet,
                                    color: AppConstants.primaryColor,
                                  ),
                                ],
                              )
                            : Row(
                                children: const [
                                  Icon(
                                    Icons.credit_card,
                                    color: AppConstants.primaryColor,
                                  ),
                                  Icon(
                                    Icons.wallet,
                                    color: AppConstants.primaryColor,
                                  ),
                                ],
                              ),
                  ],
                ),
              ),

              ///event fees
              Align(
                  alignment: Alignment.centerRight,
                  child: CommonTitleText(
                    textKey: event.price == 0 ? 'Free' : 'AED ${event.price}',
                    textColor: AppConstants.primaryColor,
                    textFontSize: AppConstants.normalFontSize,
                    textWeight: FontWeight.w400,
                  )),

              ///event user attend
              if (event.users!.isNotEmpty)
                SizedBox(
                    width: getWidgetWidth(120),
                    child: BuildStackedImages(userList: event.users!))
            ]),
          ),
        ),

        ///spacer
        getSpaceHeight(16)
      ],
    );
  }
}
