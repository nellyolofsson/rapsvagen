import 'package:flutter/material.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  static final List<_GalleryImageData> _images = [
    _GalleryImageData('assets/2022-06-04.jpg', '2022-06-04'),
    _GalleryImageData('assets/2024-08-06.jpg', '2024-08-06'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Galleri',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFF412402),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(
              _images.length,
              (i) => _GalleryImage(
                asset: _images[i].asset,
                label: _images[i].label,
                index: i,
                images: _images,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GalleryImageData {
  final String asset;
  final String label;
  const _GalleryImageData(this.asset, this.label);
}

class _GalleryImage extends StatelessWidget {
  final String asset;
  final String label;
  final int index;
  final List<_GalleryImageData> images;
  const _GalleryImage({
    required this.asset,
    required this.label,
    required this.index,
    required this.images,
  });

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _GalleryDialog(images: images, initialIndex: index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showImageDialog(context),
      child: Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(asset),
            fit: BoxFit.cover,
            onError: (exception, stackTrace) {},
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GalleryDialog extends StatefulWidget {
  final List<_GalleryImageData> images;
  final int initialIndex;
  const _GalleryDialog({required this.images, required this.initialIndex});

  @override
  State<_GalleryDialog> createState() => _GalleryDialogState();
}

class _GalleryDialogState extends State<_GalleryDialog> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _showPrev() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 + widget.images.length) % widget.images.length;
    });
  }

  void _showNext() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final image = widget.images[_currentIndex];
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: InteractiveViewer(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(image.asset, fit: BoxFit.contain),
              ),
            ),
          ),
          // Left arrow
          Positioned(
            left: 8,
            child: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                size: 40,
                color: Colors.white,
              ),
              onPressed: _showPrev,
              splashRadius: 28,
              tooltip: 'Föregående',
            ),
          ),
          // Right arrow
          Positioned(
            right: 8,
            child: IconButton(
              icon: const Icon(
                Icons.chevron_right,
                size: 40,
                color: Colors.white,
              ),
              onPressed: _showNext,
              splashRadius: 28,
              tooltip: 'Nästa',
            ),
          ),
          // Label
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  image.label,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
