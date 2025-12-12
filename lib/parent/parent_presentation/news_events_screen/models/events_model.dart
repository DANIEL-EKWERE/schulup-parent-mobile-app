import 'dart:convert';

EventsResponse eventsResponseFromJson(String str) =>
    EventsResponse.fromJson(json.decode(str));

String eventsResponseToJson(EventsResponse data) =>
    json.encode(data.toJson());

class EventsResponse {
  bool? success;
  String? message;
  EventData? data;

  EventsResponse({
    this.success,
    this.message,
    this.data,
  });

  EventsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? EventData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class EventData {
  int? totalCount;
  int? page;
  int? pageSize;
  int? totalPages;
  List<EventItem>? events;

  EventData({
    this.totalCount,
    this.page,
    this.pageSize,
    this.totalPages,
    this.events,
  });

  EventData.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    page = json['page'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
    if (json['events'] != null) {
      events = <EventItem>[];
      json['events'].forEach((v) {
        events!.add(EventItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['totalPages'] = totalPages;
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventItem {
  int? id;
  String? title;
  String? description;
  String? descriptionHtml;
  String? descriptionPreview;
  String? startDate;
  String? endDate;

  EventItem({
    this.id,
    this.title,
    this.description,
    this.descriptionHtml,
    this.descriptionPreview,
    this.startDate,
    this.endDate,
  });

  EventItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    descriptionHtml = json['descriptionHtml'];
    descriptionPreview = json['descriptionPreview'];
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['descriptionHtml'] = descriptionHtml;
    data['descriptionPreview'] = descriptionPreview;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    return data;
  }
}