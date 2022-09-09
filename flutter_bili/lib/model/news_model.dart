class NewsListModel {
  List<Block>? block;

  NewsListModel({this.block});

  NewsListModel.fromJson(Map<String, dynamic> json) {
    if (json['block'] != null) {
      block = <Block>[];
      json['block'].forEach((v) {
        block!.add( Block.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (block != null) {
      data['block'] = block!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Block {
  int? id;
  String? name;
  String? type;
  int? templateStyle;
  String? templateStyleJson;
  int? displayTitle;
  int? displayMore;
  int? showData;
  String? cover;
  String? logo;
  int? allowShare;
  String? shareUrl;
  String? intro;
  List<Items>? items;

  Block(
      {this.id,
        this.name,
        this.type,
        this.templateStyle,
        this.templateStyleJson,
        this.displayTitle,
        this.displayMore,
        this.showData,
        this.cover,
        this.logo,
        this.allowShare,
        this.shareUrl,
        this.intro,
        this.items});

  Block.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    templateStyle = json['templateStyle'];
    templateStyleJson = json['templateStyleJson'];
    displayTitle = json['displayTitle'];
    displayMore = json['displayMore'];
    showData = json['showData'];
    cover = json['cover'];
    logo = json['logo'];
    allowShare = json['allowShare'];
    shareUrl = json['shareUrl'];
    intro = json['intro'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add( Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['templateStyle'] = templateStyle;
    data['templateStyleJson'] = templateStyleJson;
    data['displayTitle'] = displayTitle;
    data['displayMore'] = displayMore;
    data['showData'] = showData;
    data['cover'] = cover;
    data['logo'] = logo;
    data['allowShare'] = allowShare;
    data['shareUrl'] = shareUrl;
    data['intro'] = intro;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? type;
  int? status;
  int? templateStyle;
  String? title;
  String? titleColor;
  List<Cover>? cover;
  int? live;
  int? viewBaseNum;
  String? tags;
  int? duration;
  int? startTime;
  int? isVideo;
  int? endTime;
  String? subTitle;
  String? leadingTitle;
  String? intro;
  String? source;
  int? createdAt;
  Link? link;
  String? videoType;
  VideoExtra? videoExtra;
  String? shareUrl;
  int? allowShare;
  String? commentUuid;
  int? activityStartTime;
  int? activityEndTime;
  String? broadcastType;
  int? praiseBaseNum;
  String? wage;
  String? shortcutUrl;
  String? majorInfo;
  String? countdownToTime;
  String? isOriginal;

  Items(
      {this.id,
        this.type,
        this.status,
        this.templateStyle,
        this.title,
        this.titleColor,
        this.cover,
        this.live,
        this.viewBaseNum,
        this.tags,
        this.duration,
        this.startTime,
        this.isVideo,
        this.endTime,
        this.subTitle,
        this.leadingTitle,
        this.intro,
        this.source,
        this.createdAt,
        this.link,
        this.videoType,
        this.videoExtra,
        this.shareUrl,
        this.allowShare,
        this.commentUuid,
        this.activityStartTime,
        this.activityEndTime,
        this.broadcastType,
        this.praiseBaseNum,
        this.wage,
        this.shortcutUrl,
        this.majorInfo,
        this.countdownToTime,
        this.isOriginal});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    status = json['status'];
    templateStyle = json['templateStyle'];
    title = json['title'];
    titleColor = json['titleColor'];
    if (json['cover'] != null) {
      cover = <Cover>[];
      json['cover'].forEach((v) {
        cover!.add( Cover.fromJson(v));
      });
    }
    live = json['live'];
    viewBaseNum = json['viewBaseNum'];
    tags = json['tags'];
    duration = json['duration'];
    startTime = json['startTime'];
    isVideo = json['isVideo'];
    endTime = json['endTime'];
    subTitle = json['subTitle'];
    leadingTitle = json['leadingTitle'];
    intro = json['intro'];
    source = json['source'];
    createdAt = json['createdAt'];
    link = json['link'] != null ?  Link.fromJson(json['link']) : null;
    videoType = json['videoType'];
    videoExtra = json['videoExtra'] != null
        ?  VideoExtra.fromJson(json['videoExtra'])
        : null;
    shareUrl = json['shareUrl'];
    allowShare = json['allowShare'];
    commentUuid = json['commentUuid'];
    activityStartTime = json['activityStartTime'];
    activityEndTime = json['activityEndTime'];
    broadcastType = json['broadcastType'];
    praiseBaseNum = json['praiseBaseNum'];
    wage = json['wage'];
    shortcutUrl = json['shortcutUrl'];
    majorInfo = json['majorInfo'];
    countdownToTime = json['countdownToTime'];
    isOriginal = json['isOriginal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['status'] = status;
    data['templateStyle'] = templateStyle;
    data['title'] = title;
    data['titleColor'] = titleColor;
    if (this.cover != null) {
      data['cover'] = cover!.map((v) => v.toJson()).toList();
    }
    data['live'] = live;
    data['viewBaseNum'] = viewBaseNum;
    data['tags'] = tags;
    data['duration'] = duration;
    data['startTime'] = startTime;
    data['isVideo'] = isVideo;
    data['endTime'] = endTime;
    data['subTitle'] = subTitle;
    data['leadingTitle'] = leadingTitle;
    data['intro'] = intro;
    data['source'] = source;
    data['createdAt'] = createdAt;
    if (link != null) {
      data['link'] = link!.toJson();
    }
    data['videoType'] = videoType;
    if (videoExtra != null) {
      data['videoExtra'] = videoExtra!.toJson();
    }
    data['shareUrl'] = shareUrl;
    data['allowShare'] = allowShare;
    data['commentUuid'] = commentUuid;
    data['activityStartTime'] = activityStartTime;
    data['activityEndTime'] = activityEndTime;
    data['broadcastType'] = broadcastType;
    data['praiseBaseNum'] = praiseBaseNum;
    data['wage'] = wage;
    data['shortcutUrl'] = shortcutUrl;
    data['majorInfo'] = majorInfo;
    data['countdownToTime'] = countdownToTime;
    data['isOriginal'] = isOriginal;
    return data;
  }
}

class Cover {
  String? path;
  String? intro;

  Cover({this.path, this.intro});

  Cover.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    intro = json['intro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    data['intro'] = intro;
    return data;
  }
}

class Link {
  String? type;
  String? content;
  Settings? settings;

  Link({this.type, this.content, this.settings});

  Link.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    content = json['content'];
    settings = json['settings'] != null
        ?  Settings.fromJson(json['settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['type'] = type;
    data['content'] = content;
    if (settings != null) {
      data['settings'] = settings!.toJson();
    }
    return data;
  }
}

class Settings {
  String? id;
  String? mp;
  String? iosFuncName;
  String? redirectParams;
  String? androidFuncName;

  Settings(
      {this.id,
        this.mp,
        this.iosFuncName,
        this.redirectParams,
        this.androidFuncName});

  Settings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mp = json['mp'];
    iosFuncName = json['iosFuncName'];
    redirectParams = json['redirectParams'];
    androidFuncName = json['androidFuncName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mp'] = mp;
    data['iosFuncName'] = iosFuncName;
    data['redirectParams'] = redirectParams;
    data['androidFuncName'] = androidFuncName;
    return data;
  }
}

class VideoExtra {
  List<VideoList>? videoList;

  VideoExtra({this.videoList});

  VideoExtra.fromJson(Map<String, dynamic> json) {
    if (json['videoList'] != null) {
      videoList = <VideoList>[];
      json['videoList'].forEach((v) {
        videoList!.add( VideoList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (videoList != null) {
      data['videoList'] = videoList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VideoList {
  String? id;
  String? authorName;
  String? cover;
  List<ItemList>? itemList;
  int? duration;
  String? description;
  int? vmsId;
  String? keywords;
  String? title;

  VideoList(
      {this.id,
        this.authorName,
        this.cover,
        this.itemList,
        this.duration,
        this.description,
        this.vmsId,
        this.keywords,
        this.title});

  VideoList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authorName = json['authorName'];
    cover = json['cover'];
    if (json['itemList'] != null) {
      itemList = <ItemList>[];
      json['itemList'].forEach((v) {
        itemList!.add( ItemList.fromJson(v));
      });
    }
    duration = json['duration'];
    description = json['description'];
    vmsId = json['vmsId'];
    keywords = json['keywords'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['authorName'] = authorName;
    data['cover'] = cover;
    if (itemList != null) {
      data['itemList'] = itemList!.map((v) => v.toJson()).toList();
    }
    data['duration'] = duration;
    data['description'] = description;
    data['vmsId'] = vmsId;
    data['keywords'] = keywords;
    data['title'] = title;
    return data;
  }
}

class ItemList {
  String? path;
  String? rate;
  String? format;

  ItemList({this.path, this.rate, this.format});

  ItemList.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    rate = json['rate'];
    format = json['format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    data['rate'] = rate;
    data['format'] = format;
    return data;
  }
}