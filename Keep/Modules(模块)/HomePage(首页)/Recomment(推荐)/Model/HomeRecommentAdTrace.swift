//
//	HomeRecommentAdTrace.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomeRecommentAdTrace : NSObject, NSCoding, Mappable{

	var adGroupId : Int?
	var campaignId : Int?
	var clientInterest : HomeRecommentClientInterest?
	var creativeId : Int?
	var degrade : Bool?
	var dspFetchType : Int?
	var hasAd : Bool?
	var materialType : Int?
	var spotId : Int?
	var trace : String?


	class func newInstance(map: Map) -> Mappable?{
		return HomeRecommentAdTrace()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		adGroupId <- map["adGroupId"]
		campaignId <- map["campaignId"]
		clientInterest <- map["clientInterest"]
		creativeId <- map["creativeId"]
		degrade <- map["degrade"]
		dspFetchType <- map["dspFetchType"]
		hasAd <- map["hasAd"]
		materialType <- map["materialType"]
		spotId <- map["spotId"]
		trace <- map["trace"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         adGroupId = aDecoder.decodeObject(forKey: "adGroupId") as? Int
         campaignId = aDecoder.decodeObject(forKey: "campaignId") as? Int
         clientInterest = aDecoder.decodeObject(forKey: "clientInterest") as? HomeRecommentClientInterest
         creativeId = aDecoder.decodeObject(forKey: "creativeId") as? Int
         degrade = aDecoder.decodeObject(forKey: "degrade") as? Bool
         dspFetchType = aDecoder.decodeObject(forKey: "dspFetchType") as? Int
         hasAd = aDecoder.decodeObject(forKey: "hasAd") as? Bool
         materialType = aDecoder.decodeObject(forKey: "materialType") as? Int
         spotId = aDecoder.decodeObject(forKey: "spotId") as? Int
         trace = aDecoder.decodeObject(forKey: "trace") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if adGroupId != nil{
			aCoder.encode(adGroupId, forKey: "adGroupId")
		}
		if campaignId != nil{
			aCoder.encode(campaignId, forKey: "campaignId")
		}
		if clientInterest != nil{
			aCoder.encode(clientInterest, forKey: "clientInterest")
		}
		if creativeId != nil{
			aCoder.encode(creativeId, forKey: "creativeId")
		}
		if degrade != nil{
			aCoder.encode(degrade, forKey: "degrade")
		}
		if dspFetchType != nil{
			aCoder.encode(dspFetchType, forKey: "dspFetchType")
		}
		if hasAd != nil{
			aCoder.encode(hasAd, forKey: "hasAd")
		}
		if materialType != nil{
			aCoder.encode(materialType, forKey: "materialType")
		}
		if spotId != nil{
			aCoder.encode(spotId, forKey: "spotId")
		}
		if trace != nil{
			aCoder.encode(trace, forKey: "trace")
		}

	}

}