//
//	HomeAttentionGuidance.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomeAttentionGuidance : NSObject, NSCoding, Mappable{

	var background : String?
	var buttonTitle : String?
	var buttonUrl : String?
	var desc : String?
	var payload : HomeAttentionPayload?
	var photo : String?
	var suppressDuration : Int?
	var title : String?
	var type : String?


	class func newInstance(map: Map) -> Mappable?{
		return HomeAttentionGuidance()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		background <- map["background"]
		buttonTitle <- map["buttonTitle"]
		buttonUrl <- map["buttonUrl"]
		desc <- map["desc"]
		payload <- map["payload"]
		photo <- map["photo"]
		suppressDuration <- map["suppressDuration"]
		title <- map["title"]
		type <- map["type"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         background = aDecoder.decodeObject(forKey: "background") as? String
         buttonTitle = aDecoder.decodeObject(forKey: "buttonTitle") as? String
         buttonUrl = aDecoder.decodeObject(forKey: "buttonUrl") as? String
         desc = aDecoder.decodeObject(forKey: "desc") as? String
         payload = aDecoder.decodeObject(forKey: "payload") as? HomeAttentionPayload
         photo = aDecoder.decodeObject(forKey: "photo") as? String
         suppressDuration = aDecoder.decodeObject(forKey: "suppressDuration") as? Int
         title = aDecoder.decodeObject(forKey: "title") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if background != nil{
			aCoder.encode(background, forKey: "background")
		}
		if buttonTitle != nil{
			aCoder.encode(buttonTitle, forKey: "buttonTitle")
		}
		if buttonUrl != nil{
			aCoder.encode(buttonUrl, forKey: "buttonUrl")
		}
		if desc != nil{
			aCoder.encode(desc, forKey: "desc")
		}
		if payload != nil{
			aCoder.encode(payload, forKey: "payload")
		}
		if photo != nil{
			aCoder.encode(photo, forKey: "photo")
		}
		if suppressDuration != nil{
			aCoder.encode(suppressDuration, forKey: "suppressDuration")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}

	}

}