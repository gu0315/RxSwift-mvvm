//
//	HomeAttentionData.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomeAttentionData : NSObject, NSCoding, Mappable{

	var bannerItems : [AnyObject]?
	var items : [HomeAttentionItem]?
	var lastId : String?
	var updateCount : Int?


	class func newInstance(map: Map) -> Mappable?{
		return HomeAttentionData()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		bannerItems <- map["bannerItems"]
		items <- map["items"]
		lastId <- map["lastId"]
		updateCount <- map["updateCount"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         bannerItems = aDecoder.decodeObject(forKey: "bannerItems") as? [AnyObject]
         items = aDecoder.decodeObject(forKey: "items") as? [HomeAttentionItem]
         lastId = aDecoder.decodeObject(forKey: "lastId") as? String
         updateCount = aDecoder.decodeObject(forKey: "updateCount") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if bannerItems != nil{
			aCoder.encode(bannerItems, forKey: "bannerItems")
		}
		if items != nil{
			aCoder.encode(items, forKey: "items")
		}
		if lastId != nil{
			aCoder.encode(lastId, forKey: "lastId")
		}
		if updateCount != nil{
			aCoder.encode(updateCount, forKey: "updateCount")
		}

	}

}