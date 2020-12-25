//
//	HomePopularEntry.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomePopularEntry : NSObject, Mappable{

	var id : String?
	var achievements : [AnyObject]?
	var author : HomePopularAuthor?
	var city : String?
	var citycode : String?
	var clientIp : String?
	var commentUsers : Int?
	var comments : Int?
	var content : String?
	var contentType : [String]?
	var contentTypeStr : String?
	var country : String?
	var created : String?
	var expansion : HomePopularExpansion?
	var externalShareCount : Int?
	var favoriteCount : Int?
	var feel : Int?
	var geo : [Float]?
	var hasFavorited : Bool?
	var hasLiked : Bool?
	var hashTags : [String]?
	var images : [String]?
	var internalShareCount : Int?
	var isAd : Bool?
	var likeRank : [String]?
	var likeStatistics : HomePopularLikeStatistic?
	var likes : Int?
	var longVideo : Bool?
	var manualViewCount : Int?
	var meta : HomePopularMeta?
	var nationCode : String?
	var noise : Bool?
	var payload : HomePopularPayload?
	var photo : String?
	var province : String?
	var publicField : Bool?
	var quality : Float?
	var reason : String?
	var relation : Int?
	var safeLevel : Int?
	var sampleComments : [HomePopularSampleComment]?
	var schema : String?
	var shareTargetEntry : HomePopularShareTargetEntry?
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

    var itemHeight: CGFloat {
        var size = CGSize.zero
        if images?.count ?? 0 > 0 {
            size = Event.share.imageSise(str: images?.first ?? "")
            if (size.width > 0.0) {
                size = CGSize.init(width: (DEVICE_WIDTH - 25) / 2, height:  (size.height) / (size.width) * (DEVICE_WIDTH - 25) / 2)
            }
        }
        return size.height + 30
    }

	class func newInstance(map: Map) -> Mappable?{
		return HomePopularEntry()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{

		id <- map["_id"]
		achievements <- map["achievements"]
		author <- map["author"]
		city <- map["city"]
		citycode <- map["citycode"]
		clientIp <- map["clientIp"]
		commentUsers <- map["commentUsers"]
		comments <- map["comments"]
		content <- map["content"]
		contentType <- map["contentType"]
		contentTypeStr <- map["contentTypeStr"]
		country <- map["country"]
		created <- map["created"]
		expansion <- map["expansion"]
		externalShareCount <- map["externalShareCount"]
		favoriteCount <- map["favoriteCount"]
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
		nationCode <- map["nationCode"]
		noise <- map["noise"]
		payload <- map["payload"]
		photo <- map["photo"]
		province <- map["province"]
		publicField <- map["public"]
		quality <- map["quality"]
		reason <- map["reason"]
		relation <- map["relation"]
		safeLevel <- map["safeLevel"]
		sampleComments <- map["sampleComments"]
		schema <- map["schema"]
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
