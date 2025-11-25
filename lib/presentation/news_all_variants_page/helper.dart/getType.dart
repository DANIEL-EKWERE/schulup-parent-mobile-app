enum PreviewType { image, video, youtube, text }

PreviewType getPreviewType(String html) {
  final data = html.toLowerCase();

  if (data.contains("<iframe") && data.contains("youtube.com")) {
    return PreviewType.youtube;
  }
  if (data.contains("<iframe")) {
    return PreviewType.video;
  }
  if (data.contains("<video")) {
    return PreviewType.video;
  }
  if (data.contains("<img")) {
    return PreviewType.image;
  }

  return PreviewType.text;
}
