//
//	HomeAttentionRecommendEntry.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import YYText

class HomeAttentionRecommendEntry : NSObject, NSCoding, Mappable{

	var id : String?
	var achievements : [AnyObject]?
	var alphabetTermIds : [String]?
	var author : HomeAttentionAuthor?
	var clientIp : String?
	var commentUsers : Int?
    var hasLiked : Bool?
	var comments : Int?
	var content : String?
	var contentType : [String]?
	var contentTypeStr : String?
	var created : String?
	var dayflowBookId : String?
	var expansion : HomeAttentionExpansion?
	var externalShareCount : Int?
	var favoriteCount : Int?
	var feedback : [AnyObject]?
	var feel : Int?
	var geo : [AnyObject]?
	var gif : String?
	var hasFavorited : Bool?
	var hashTags : [String]?
	var images : [String]?
	var internalShareCount : Int?
	var isAd : Bool?
	var likeRank : [String]?
	var likeStatistics : HomeAttentionLikeStatistic?
	var likes : Int?
	var longVideo : Bool?
	var manualViewCount : Int?
	var meta : HomeAttentionMeta?
	var noise : Bool?
	var payload : HomeAttentionPayload?
	var photo : String?
	var publicField : Bool?
	var quality : Float?
	var reason : String?
	var recAuthorReason : String?
	var relation : Int?
	var safeLevel : Int?
	var sampleComments : [HomeAttentionSampleComment]?
	var shareTargetEntry : HomeAttentionShareTargetEntry?
	var sportsCorrelation : Int?
	var squadDayIndex : Int?
	var state : String?
	var stateValue : Int?
	var style : Int?
	var timezone : String?
	var type : String?
	var valueScore : Float?
	var valueScoreVersion : String?
	var video : String?
	var videoBitRateUrls : [String]?
	var videoBitRates : [String]?
	var videoLength : Int?
	var videoPlayCount : Int?
	var videoVoice : Bool?
	var viewCount : Int?
	var vlog : Bool?


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
		return HomeAttentionRecommendEntry()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		id <- map["_id"]
		achievements <- map["achievements"]
		alphabetTermIds <- map["alphabetTermIds"]
		author <- map["author"]
		clientIp <- map["clientIp"]
		commentUsers <- map["commentUsers"]
		comments <- map["comments"]
		content <- map["content"]
		contentType <- map["contentType"]
		contentTypeStr <- map["contentTypeStr"]
		created <- map["created"]
		dayflowBookId <- map["dayflowBookId"]
		expansion <- map["expansion"]
		externalShareCount <- map["externalShareCount"]
		favoriteCount <- map["favoriteCount"]
		feedback <- map["feedback"]
		feel <- map["feel"]
		geo <- map["geo"]
		gif <- map["gif"]
		hasFavorited <- map["hasFavorited"]
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
		recAuthorReason <- map["recAuthorReason"]
		relation <- map["relation"]
		safeLevel <- map["safeLevel"]
		sampleComments <- map["sampleComments"]
		shareTargetEntry <- map["shareTargetEntry"]
		sportsCorrelation <- map["sportsCorrelation"]
		squadDayIndex <- map["squadDayIndex"]
		state <- map["state"]
		stateValue <- map["stateValue"]
		style <- map["style"]
		timezone <- map["timezone"]
		type <- map["type"]
		valueScore <- map["valueScore"]
		valueScoreVersion <- map["valueScoreVersion"]
		video <- map["video"]
		videoBitRateUrls <- map["videoBitRateUrls"]
		videoBitRates <- map["videoBitRates"]
		videoLength <- map["videoLength"]
		videoPlayCount <- map["videoPlayCount"]
		videoVoice <- map["videoVoice"]
		viewCount <- map["viewCount"]
		vlog <- map["vlog"]
        hasLiked <- map["hasLiked"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         id = aDecoder.decodeObject(forKey: "_id") as? String
         achievements = aDecoder.decodeObject(forKey: "achievements") as? [AnyObject]
         alphabetTermIds = aDecoder.decodeObject(forKey: "alphabetTermIds") as? [String]
         author = aDecoder.decodeObject(forKey: "author") as? HomeAttentionAuthor
         clientIp = aDecoder.decodeObject(forKey: "clientIp") as? String
         commentUsers = aDecoder.decodeObject(forKey: "commentUsers") as? Int
         comments = aDecoder.decodeObject(forKey: "comments") as? Int
         content = aDecoder.decodeObject(forKey: "content") as? String
         contentType = aDecoder.decodeObject(forKey: "contentType") as? [String]
         contentTypeStr = aDecoder.decodeObject(forKey: "contentTypeStr") as? String
         created = aDecoder.decodeObject(forKey: "created") as? String
         dayflowBookId = aDecoder.decodeObject(forKey: "dayflowBookId") as? String
         expansion = aDecoder.decodeObject(forKey: "expansion") as? HomeAttentionExpansion
         externalShareCount = aDecoder.decodeObject(forKey: "externalShareCount") as? Int
         favoriteCount = aDecoder.decodeObject(forKey: "favoriteCount") as? Int
         feedback = aDecoder.decodeObject(forKey: "feedback") as? [AnyObject]
         feel = aDecoder.decodeObject(forKey: "feel") as? Int
         geo = aDecoder.decodeObject(forKey: "geo") as? [AnyObject]
         gif = aDecoder.decodeObject(forKey: "gif") as? String
         hasFavorited = aDecoder.decodeObject(forKey: "hasFavorited") as? Bool
         hashTags = aDecoder.decodeObject(forKey: "hashTags") as? [String]
         images = aDecoder.decodeObject(forKey: "images") as? [String]
         internalShareCount = aDecoder.decodeObject(forKey: "internalShareCount") as? Int
         isAd = aDecoder.decodeObject(forKey: "isAd") as? Bool
         likeRank = aDecoder.decodeObject(forKey: "likeRank") as? [String]
         likeStatistics = aDecoder.decodeObject(forKey: "likeStatistics") as? HomeAttentionLikeStatistic
         likes = aDecoder.decodeObject(forKey: "likes") as? Int
         longVideo = aDecoder.decodeObject(forKey: "longVideo") as? Bool
         manualViewCount = aDecoder.decodeObject(forKey: "manualViewCount") as? Int
         meta = aDecoder.decodeObject(forKey: "meta") as? HomeAttentionMeta
         noise = aDecoder.decodeObject(forKey: "noise") as? Bool
         payload = aDecoder.decodeObject(forKey: "payload") as? HomeAttentionPayload
         photo = aDecoder.decodeObject(forKey: "photo") as? String
         publicField = aDecoder.decodeObject(forKey: "public") as? Bool
         quality = aDecoder.decodeObject(forKey: "quality") as? Float
         reason = aDecoder.decodeObject(forKey: "reason") as? String
         recAuthorReason = aDecoder.decodeObject(forKey: "recAuthorReason") as? String
         relation = aDecoder.decodeObject(forKey: "relation") as? Int
         safeLevel = aDecoder.decodeObject(forKey: "safeLevel") as? Int
         sampleComments = aDecoder.decodeObject(forKey: "sampleComments") as? [HomeAttentionSampleComment]
         shareTargetEntry = aDecoder.decodeObject(forKey: "shareTargetEntry") as? HomeAttentionShareTargetEntry
         sportsCorrelation = aDecoder.decodeObject(forKey: "sportsCorrelation") as? Int
         squadDayIndex = aDecoder.decodeObject(forKey: "squadDayIndex") as? Int
         state = aDecoder.decodeObject(forKey: "state") as? String
         stateValue = aDecoder.decodeObject(forKey: "stateValue") as? Int
         style = aDecoder.decodeObject(forKey: "style") as? Int
         timezone = aDecoder.decodeObject(forKey: "timezone") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String
         valueScore = aDecoder.decodeObject(forKey: "valueScore") as? Float
         valueScoreVersion = aDecoder.decodeObject(forKey: "valueScoreVersion") as? String
         video = aDecoder.decodeObject(forKey: "video") as? String
         videoBitRateUrls = aDecoder.decodeObject(forKey: "videoBitRateUrls") as? [String]
         videoBitRates = aDecoder.decodeObject(forKey: "videoBitRates") as? [String]
         videoLength = aDecoder.decodeObject(forKey: "videoLength") as? Int
         videoPlayCount = aDecoder.decodeObject(forKey: "videoPlayCount") as? Int
         videoVoice = aDecoder.decodeObject(forKey: "videoVoice") as? Bool
         viewCount = aDecoder.decodeObject(forKey: "viewCount") as? Int
         vlog = aDecoder.decodeObject(forKey: "vlog") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if id != nil{
			aCoder.encode(id, forKey: "_id")
		}
		if achievements != nil{
			aCoder.encode(achievements, forKey: "achievements")
		}
		if alphabetTermIds != nil{
			aCoder.encode(alphabetTermIds, forKey: "alphabetTermIds")
		}
		if author != nil{
			aCoder.encode(author, forKey: "author")
		}
		if clientIp != nil{
			aCoder.encode(clientIp, forKey: "clientIp")
		}
		if commentUsers != nil{
			aCoder.encode(commentUsers, forKey: "commentUsers")
		}
		if comments != nil{
			aCoder.encode(comments, forKey: "comments")
		}
		if content != nil{
			aCoder.encode(content, forKey: "content")
		}
		if contentType != nil{
			aCoder.encode(contentType, forKey: "contentType")
		}
		if contentTypeStr != nil{
			aCoder.encode(contentTypeStr, forKey: "contentTypeStr")
		}
		if created != nil{
			aCoder.encode(created, forKey: "created")
		}
		if dayflowBookId != nil{
			aCoder.encode(dayflowBookId, forKey: "dayflowBookId")
		}
		if expansion != nil{
			aCoder.encode(expansion, forKey: "expansion")
		}
		if externalShareCount != nil{
			aCoder.encode(externalShareCount, forKey: "externalShareCount")
		}
		if favoriteCount != nil{
			aCoder.encode(favoriteCount, forKey: "favoriteCount")
		}
		if feedback != nil{
			aCoder.encode(feedback, forKey: "feedback")
		}
		if feel != nil{
			aCoder.encode(feel, forKey: "feel")
		}
		if geo != nil{
			aCoder.encode(geo, forKey: "geo")
		}
		if gif != nil{
			aCoder.encode(gif, forKey: "gif")
		}
		if hasFavorited != nil{
			aCoder.encode(hasFavorited, forKey: "hasFavorited")
		}
		if hashTags != nil{
			aCoder.encode(hashTags, forKey: "hashTags")
		}
		if images != nil{
			aCoder.encode(images, forKey: "images")
		}
		if internalShareCount != nil{
			aCoder.encode(internalShareCount, forKey: "internalShareCount")
		}
		if isAd != nil{
			aCoder.encode(isAd, forKey: "isAd")
		}
		if likeRank != nil{
			aCoder.encode(likeRank, forKey: "likeRank")
		}
		if likeStatistics != nil{
			aCoder.encode(likeStatistics, forKey: "likeStatistics")
		}
		if likes != nil{
			aCoder.encode(likes, forKey: "likes")
		}
		if longVideo != nil{
			aCoder.encode(longVideo, forKey: "longVideo")
		}
		if manualViewCount != nil{
			aCoder.encode(manualViewCount, forKey: "manualViewCount")
		}
		if meta != nil{
			aCoder.encode(meta, forKey: "meta")
		}
		if noise != nil{
			aCoder.encode(noise, forKey: "noise")
		}
		if payload != nil{
			aCoder.encode(payload, forKey: "payload")
		}
		if photo != nil{
			aCoder.encode(photo, forKey: "photo")
		}
		if publicField != nil{
			aCoder.encode(publicField, forKey: "public")
		}
		if quality != nil{
			aCoder.encode(quality, forKey: "quality")
		}
		if reason != nil{
			aCoder.encode(reason, forKey: "reason")
		}
		if recAuthorReason != nil{
			aCoder.encode(recAuthorReason, forKey: "recAuthorReason")
		}
		if relation != nil{
			aCoder.encode(relation, forKey: "relation")
		}
		if safeLevel != nil{
			aCoder.encode(safeLevel, forKey: "safeLevel")
		}
		if sampleComments != nil{
			aCoder.encode(sampleComments, forKey: "sampleComments")
		}
		if shareTargetEntry != nil{
			aCoder.encode(shareTargetEntry, forKey: "shareTargetEntry")
		}
		if sportsCorrelation != nil{
			aCoder.encode(sportsCorrelation, forKey: "sportsCorrelation")
		}
		if squadDayIndex != nil{
			aCoder.encode(squadDayIndex, forKey: "squadDayIndex")
		}
		if state != nil{
			aCoder.encode(state, forKey: "state")
		}
		if stateValue != nil{
			aCoder.encode(stateValue, forKey: "stateValue")
		}
		if style != nil{
			aCoder.encode(style, forKey: "style")
		}
		if timezone != nil{
			aCoder.encode(timezone, forKey: "timezone")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
		if valueScore != nil{
			aCoder.encode(valueScore, forKey: "valueScore")
		}
		if valueScoreVersion != nil{
			aCoder.encode(valueScoreVersion, forKey: "valueScoreVersion")
		}
		if video != nil{
			aCoder.encode(video, forKey: "video")
		}
		if videoBitRateUrls != nil{
			aCoder.encode(videoBitRateUrls, forKey: "videoBitRateUrls")
		}
		if videoBitRates != nil{
			aCoder.encode(videoBitRates, forKey: "videoBitRates")
		}
		if videoLength != nil{
			aCoder.encode(videoLength, forKey: "videoLength")
		}
		if videoPlayCount != nil{
			aCoder.encode(videoPlayCount, forKey: "videoPlayCount")
		}
		if videoVoice != nil{
			aCoder.encode(videoVoice, forKey: "videoVoice")
		}
		if viewCount != nil{
			aCoder.encode(viewCount, forKey: "viewCount")
		}
		if vlog != nil{
			aCoder.encode(vlog, forKey: "vlog")
		}

	}

}
