import 'package:flutter/material.dart';

import '../../global/skeleton_container_loading.dart';

class SkeletonWorkouts extends StatelessWidget {
  const SkeletonWorkouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                7,
                (_) => SkeletonContainerLoading(
                  height: 77,
                  width: MediaQuery.of(context).size.width / 7 - 10,
                  borderRaduis: 70,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                (_) => SkeletonContainerLoading(
                  height: 30,
                  width: MediaQuery.of(context).size.width / 4 - 12,
                ),
              ),
            ),
            const SizedBox(height: 22),
            SkeletonContainerLoading(
              width: MediaQuery.of(context).size.width - 30,
              height: 200,
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkeletonContainerLoading(
                  width: 150,
                  height: 45,
                  borderRaduis: 40,
                ),
                SkeletonContainerLoading(
                  width: 70,
                  height: 30,
                  borderRaduis: 40,
                ),
              ],
            ),
            const SizedBox(height: 30),
            SkeletonContainerLoading(
              width: MediaQuery.of(context).size.width - 30,
              height: 200,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
