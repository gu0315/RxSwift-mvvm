//
//	HomeRecommentRecommendEntry.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import YYText

class HomeRecommentRecommendEntry : NSObject, Mappable{

	var id : String?
	var achievements : [AnyObject]?
	var author : HomeRecommentAuthor?
	var clientIp : String?
	var commentUsers : Int?
	var comments : Int?
	var content : String?
	var contentType : [String]?
	var contentTypeStr : String?
	var created : String?
	var expansion : HomeRecommentExpansion?
	var externalShareCount : Int?
	var favoriteCount : Int?
	var feedback : [AnyObject]?
	var feel : Int?
	var geo : [AnyObject]?
	var hasFavorited : Bool?
	var hasLiked : Bool?
	var hashTags : [AnyObject]?
	var images : [String]?
	var internalShareCount : Int?
	var isAd : Bool?
	var likeRank : [String]?
	var likeStatistics : HomeRecommentLikeStatistic?
	var likes : Int?
	var longVideo : Bool?
	var manualViewCount : Int?
	var meta : HomeRecommentMeta?
	var noise : Bool?
	var payload : HomeRecommentPayload?
	var photo : String?
	var publicField : Bool?
	var quality : Float?
	var reason : String?
	var recommendReason : String?
	var relation : Int?
	var safeLevel : Int?
	var sampleComments : [AnyObject]?
	var shareTargetEntry : HomeRecommentMeta?
	var source : String?
	var sportsCorrelation : Int?
	var squadDayIndex : Int?
	var state : String?
	var stateValue : Int?
	var style : Int?
	var timezone : String?
	var type : String?
	var valueScore : Float?
	var valueScoreVersion : String?
	var viewCount : Int?
	var vlog : Bool?

    var gif: String?
    var video: String?
    var isClickMore: Bool?      ///是否点击查看更多

    var contentAttributed: NSMutableAttributedString {
        let contentAttributed: NSMutableAttributedString = NSMutableAttributedString.init(string: content ?? "")
        contentAttributed.yy_font = UIFont.systemFont(ofSize: 16)
        contentAttributed.yy_lineSpacing = 6;
        contentAttributed.yy_color = UIColor.gray
        return contentAttributed
    }

    var contentAllHeight: CGFloat {
        let layout = YYTextLayout.init(containerSize: CGSize.init(width: DEVICE_WIDTH - KHomeContentInset * 2, height: CGFloat.greatestFiniteMagnitude), text: contentAttributed)
        let ht: CGFloat = (layout?.textBoundingSize.height ?? 0) + 15
        return ht
    }

    var contentHeight: CGFloat {
        return contentAllHeight > 250.0 ? 250.0 : contentAllHeight
    }

    var imagesHeight: CGFloat {
        var ht: CGFloat = 0
        //计算图片的高度
        if (images?.count == 1) {
            let size = Event.share.imageSise(str: images?.first ?? "")
            if (size.width > 0.0) {
              ht += (size.height) / (size.width) * CGFloat(200);
            } else {
              ht += 200
            }
        } else {
            var row = 0
            switch images?.count {
            case 2,3:
                row = 1
                break
            case 4,5,6:
                row = 2
            case 7,8,9:
                row = 3
            default:
                row = (images?.count ?? 0) / 3
            }
            let itemWidth = KIsIpad ? 160 : (DEVICE_WIDTH - KHomeContentInset * 2 - 8 * 2) / 3
            ht += CGFloat(row) * itemWidth + CGFloat(row + 1) * 8
        }
        return ht
    }

    var itemHeight: CGFloat {
        //头部加底部高度  
        var ht: CGFloat = 106
        //计算文字的高度
        if isClickMore ?? false {
           ht += contentAllHeight
        } else {
           ht += contentHeight
        }
        //计算图片的高度
        ht += imagesHeight
        //底部间距
        ht += 10
        //查看跟多的高度
        if contentAllHeight > 250.0 {
           ht += 35
        }
        return ht
    }

	class func newInstance(map: Map) -> Mappable?{
		return HomeRecommentRecommendEntry()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		id <- map["_id"]
		achievements <- map["achievements"]
		author <- map["author"]
		clientIp <- map["clientIp"]
		commentUsers <- map["commentUsers"]
		comments <- map["comments"]
		content <- map["content"]
		contentType <- map["contentType"]
		contentTypeStr <- map["contentTypeStr"]
		created <- map["created"]
		expansion <- map["expansion"]
		externalShareCount <- map["externalShareCount"]
		favoriteCount <- map["favoriteCount"]
		feedback <- map["feedback"]
		feel <- map["feel"]
		geo <- map["geo"]
		hasFavorited <- map["hasFavorited"]
		hasLiked <- map["hasLiked"]
		hashTags <- map["hashTags"]
		images <- map["images"]
		internalShareCount <- map["internalShareCount"]
		isAd <- map["isAd"]
		likeRank <- map["likeRank"]
		likeStatistics <- map["likeStatistics"]
		likes <- map["likes"]
		longVideo <- map["longVideo"]
		manualViewCount <- map["manualViewCount"]
		meta <- map["meta"]
		noise <- map["noise"]
		payload <- map["payload"]
		photo <- map["photo"]
		publicField <- map["public"]
		quality <- map["quality"]
		reason <- map["reason"]
		recommendReason <- map["recommendReason"]
		relation <- map["relation"]
		safeLevel <- map["safeLevel"]
		sampleComments <- map["sampleComments"]
		shareTargetEntry <- map["shareTargetEntry"]
		source <- map["source"]
		sportsCorrelation <- map["sportsCorrelation"]
		squadDayIndex <- map["squadDayIndex"]
		state <- map["state"]
		stateValue <- map["stateValue"]
		style <- map["style"]
		timezone <- map["timezone"]
		type <- map["type"]
		valueScore <- map["valueScore"]
		valueScoreVersion <- map["valueScoreVersion"]
		viewCount <- map["viewCount"]
		vlog <- map["vlog"]

        gif <- map["gif"]
        video <- map["video"]
		
	}


}
