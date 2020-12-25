//
//	HomePopularData.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomePopularData : NSObject, NSCoding, Mappable{

	var items : [HomePopularItem]?
	var lastId : String?
	var sessionId : String?


	class func newInstance(map: Map) -> Mappable?{
		return HomePopularData()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		items <- map["items"]
		lastId <- map["lastId"]
		sessionId <- map["sessionId"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         items = aDecoder.decodeObject(forKey: "items") as? [HomePopularItem]
         lastId = aDecoder.decodeObject(forKey: "lastId") as? String
         sessionId = aDecoder.decodeObject(forKey: "sessionId") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if items != nil{
			aCoder.encode(items, forKey: "items")
		}
		if lastId != nil{
			aCoder.encode(lastId, forKey: "lastId")
		}
		if sessionId != nil{
			aCoder.encode(sessionId, forKey: "sessionId")
		}

	}

}