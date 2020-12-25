//
//	HomeRecommentFeedAdInfo.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomeRecommentFeedAdInfo : NSObject, NSCoding, Mappable{

	var adGroupInfo : HomeRecommentAdGroupInfo?
	var pos : Int?


	class func newInstance(map: Map) -> Mappable?{
		return HomeRecommentFeedAdInfo()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		adGroupInfo <- map["adGroupInfo"]
		pos <- map["pos"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         adGroupInfo = aDecoder.decodeObject(forKey: "adGroupInfo") as? HomeRecommentAdGroupInfo
         pos = aDecoder.decodeObject(forKey: "pos") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if adGroupInfo != nil{
			aCoder.encode(adGroupInfo, forKey: "adGroupInfo")
		}
		if pos != nil{
			aCoder.encode(pos, forKey: "pos")
		}

	}

}