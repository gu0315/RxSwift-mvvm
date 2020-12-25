//
//	HomeRecommentAdGroupInfo.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomeRecommentAdGroupInfo : NSObject, NSCoding, Mappable{

	var creativeInfos : [HomeRecommentCreativeInfo]?
	var endTime : Int?
	var id : Int?
	var lastModifyTime : Int?
	var spotId : Int?
	var startTime : Int?
	var status : Int?
	var trace : HomeRecommentAdTrace?


	class func newInstance(map: Map) -> Mappable?{
		return HomeRecommentAdGroupInfo()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		creativeInfos <- map["creativeInfos"]
		endTime <- map["endTime"]
		id <- map["id"]
		lastModifyTime <- map["lastModifyTime"]
		spotId <- map["spotId"]
		startTime <- map["startTime"]
		status <- map["status"]
		trace <- map["trace"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         creativeInfos = aDecoder.decodeObject(forKey: "creativeInfos") as? [HomeRecommentCreativeInfo]
         endTime = aDecoder.decodeObject(forKey: "endTime") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         lastModifyTime = aDecoder.decodeObject(forKey: "lastModifyTime") as? Int
         spotId = aDecoder.decodeObject(forKey: "spotId") as? Int
         startTime = aDecoder.decodeObject(forKey: "startTime") as? Int
         status = aDecoder.decodeObject(forKey: "status") as? Int
         trace = aDecoder.decodeObject(forKey: "trace") as? HomeRecommentAdTrace

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if creativeInfos != nil{
			aCoder.encode(creativeInfos, forKey: "creativeInfos")
		}
		if endTime != nil{
			aCoder.encode(endTime, forKey: "endTime")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if lastModifyTime != nil{
			aCoder.encode(lastModifyTime, forKey: "lastModifyTime")
		}
		if spotId != nil{
			aCoder.encode(spotId, forKey: "spotId")
		}
		if startTime != nil{
			aCoder.encode(startTime, forKey: "startTime")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if trace != nil{
			aCoder.encode(trace, forKey: "trace")
		}

	}

}