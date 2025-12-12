import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class Base64Image extends StatelessWidget {
  final String? base64String;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final BorderRadius? borderRadius;

  const Base64Image({
    Key? key,
    required this.base64String,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (base64String == null || base64String!.isEmpty) {
      return placeholder ?? 
        Container(
          width: width,
          height: height,
          color: Colors.grey[300],
          child: Icon(Icons.person, size: 40, color: Colors.grey[600]),
        );
    }

    try {
      // Clean the base64 string
      String cleanBase64 = base64String!;
      
      // Remove data URI prefix if present (e.g., "data:image/jpeg;base64,")
      if (cleanBase64.contains(',')) {
        cleanBase64 = cleanBase64.split(',').last;
      }
      
      // Remove any whitespace
      cleanBase64 = cleanBase64.replaceAll(RegExp(r'\s+'), '');
      
      final Uint8List bytes = base64Decode(cleanBase64);
      
      Widget imageWidget = Image.memory(
        bytes,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: width,
            height: height,
            color: Colors.grey[300],
            child: Icon(Icons.broken_image, color: Colors.red),
          );
        },
      );

      if (borderRadius != null) {
        return ClipRRect(
          borderRadius: borderRadius!,
          child: imageWidget,
        );
      }

      return imageWidget;
    } catch (e) {
      print('Error decoding base64 image: $e');
      return Container(
        width: width,
        height: height,
        color: Colors.grey[300],
        child: Icon(Icons.error_outline, color: Colors.red),
      );
    }
  }
}