import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/feed/gallery_image.dart';
import 'package:myafyahub/domain/core/entities/feed/image_detail.dart';
import 'package:myafyahub/domain/core/entities/feed/image_meta.dart';

import '../../../../mocks.dart';

void main() {
  group('GalleryImage', () {
    test('fromJson works correctly', () {
      expect(
        GalleryImage.fromJson(mockGalleryImage),
        GalleryImage(
          id: 2,
          image: ImageDetail(
            title: 'mockImage',
            meta: ImageMeta(imageDownloadUrl: 'testImage'),
          ),
        ),
      );
    });
  });
}
