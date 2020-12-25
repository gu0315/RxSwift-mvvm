//
//	HomeRecommentAdvertise.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomeRecommentAdvertise : NSObject, NSCoding, Mappable{

	var feedAdInfo : HomeRecommentFeedAdInfo?


	class func newInstance(map: Map) -> Mappable?{
		return HomeRecommentAdvertise()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		feedAdInfo <- map["feedAdInfo"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         feedAdInfo = aDecoder.decodeObject(forKey: "feedAdInfo") as? HomeRecommentFeedAdInfo

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if feedAdInfo != nil{
			aCoder.encode(feedAdInfo, forKey: "feedAdInfo")
		}

	}

}