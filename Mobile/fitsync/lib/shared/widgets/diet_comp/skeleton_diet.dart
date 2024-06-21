import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../global/skeleton_container_loading.dart';

class SkeletonDiet extends StatelessWidget {
  const SkeletonDiet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            SkeletonContainerLoading(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 20,
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  6,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      right: index != 5 ? 18 : 0,
                    ),
                    child: const SkeletonContainerLoading(
                      width: 150,
                      height: 120,
                      borderRaduis: 10,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 45),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkeletonContainerLoading(
                  width: 160,
                  height: 35,
                  borderRaduis: 10,
                ),
                SkeletonContainerLoading(
                  width: 110,
                  height: 36,
                  borderRaduis: 7,
                ),
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  6,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      right: index != 5 ? 18 : 0,
                    ),
                    child: const SkeletonContainerLoading(
                      width: 150,
                      height: 120,
                      borderRaduis: 10,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 45),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkeletonContainerLoading(
                  width: 160,
                  height: 35,
                  borderRaduis: 10,
                ),
                SkeletonContainerLoading(
                  width: 110,
                  height: 36,
                  borderRaduis: 7,
                ),
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  6,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      right: index != 5 ? 18 : 0,
                    ),
                    child: const SkeletonContainerLoading(
                      width: 150,
                      height: 120,
                      borderRaduis: 10,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
