import '../../global/skeleton_container_loading.dart';
import 'package:flutter/material.dart';
import '../../../colors/colors.dart';

class SkeletonProfileInfo extends StatelessWidget {
  const SkeletonProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SkeletonContainerLoading(
          height: 100,
          width: 100,
          borderRaduis: 99,
        ),
        const SizedBox(height: 7),
        const SkeletonContainerLoading(
          height: 25,
          width: 170,
        ),
        const SizedBox(height: 3),
        const SkeletonContainerLoading(
          height: 25,
          width: 100,
        ),
        const SizedBox(height: 12),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    height: 7,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: gray7.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      3,
                      (_) => const SkeletonContainerLoading(
                        height: 60,
                        width: 90,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(11, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SkeletonContainerLoading(
                                  height: 17,
                                  width: index == 7 || index == 6
                                      ? 180
                                      : index == 1 || index == 3 || index == 4
                                          ? 120
                                          : 150,
                                  borderRaduis: 5,
                                ),
                                const SkeletonContainerLoading(
                                  height: 17,
                                  width: 80,
                                  borderRaduis: 5,
                                ),
                              ],
                            ),
                            index != 10
                                ? const Divider(
                                    color: gray7,
                                    thickness: 1,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      );
                    }),
                  ),
                  const Spacer(flex: 2),
                  const Center(
                    child: SkeletonContainerLoading(
                      height: 25,
                      width: 120,
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
