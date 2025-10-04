import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zhwa/core/theming/app_colors.dart';

class ConfirmReservation extends StatefulWidget {
  final String serviceName;
  final String servicePrice;

  const ConfirmReservation({
    super.key,
    required this.serviceName,
    required this.servicePrice,
  });

  @override
  State<ConfirmReservation> createState() => _ConfirmReservationState();
}

class _ConfirmReservationState extends State<ConfirmReservation> {
  DateTime? selectedDate;
  String? selectedTime;

  final List<String> timeSlots = [
    '9:00 ص',
    '10:00 ص',
    '11:00 ص',
    '12:00 م',
    '2:00 م',
    '3:00 م',
    '4:00 م',
    '5:00 م',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تأكيد الحجز',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.appPurple,
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.primary50,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الخدمة',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.appGreen.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    widget.serviceName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.appGreen,
                    ),
                  ),
                ],
              ),
              Text(
                widget.servicePrice,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.appPurple,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          'اختر التاريخ',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.appGreen,
          ),
        ),
        SizedBox(height: 12.h),
        GestureDetector(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 30)),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: AppColors.appPurple,
                      onPrimary: AppColors.white,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (picked != null) {
              setState(() {
                selectedDate = picked;
              });
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: selectedDate != null
                    ? AppColors.appPurple
                    : AppColors.offWhite,
              ),
            ),
            child: Row(
              children: [
                Icon(Iconsax.calendar, color: AppColors.appPurple, size: 20.sp),
                SizedBox(width: 12.w),
                Text(
                  selectedDate != null
                      ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                      : 'اختر التاريخ',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: selectedDate != null
                        ? AppColors.appGreen
                        : AppColors.appGreen.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          'اختر الوقت',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.appGreen,
          ),
        ),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: timeSlots.map((time) {
            final bool isSelected = selectedTime == time;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedTime = time;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.appPurple : AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.appPurple
                        : AppColors.offWhite,
                  ),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? AppColors.white : AppColors.appGreen,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 32.h),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  side: BorderSide(color: AppColors.appGreen),
                ),
                child: Text(
                  'إلغاء',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.appGreen,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ElevatedButton(
                onPressed: selectedDate != null && selectedTime != null
                    ? () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'تم تأكيد الحجز بنجاح!',
                              style: TextStyle(fontSize: 14.sp),
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: AppColors.appGreen,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appPurple,
                  disabledBackgroundColor: AppColors.appPurple.withOpacity(0.5),
                  foregroundColor: AppColors.white,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'تأكيد الحجز',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
