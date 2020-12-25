//
//	HomePopularLikeStatistic.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomePopularLikeStatistic : NSObject, NSCoding, Mappable{

	var like001 : Int?


	class func newInstance(map: Map) -> Mappable?{
		return HomePopularLikeStatistic()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		like001 <- map["like_001"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         like001 = aDecoder.decodeObject(forKey: "like_001") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if like001 != nil{
			aCoder.encode(like001, forKey: "like_001")
		}

	}

}