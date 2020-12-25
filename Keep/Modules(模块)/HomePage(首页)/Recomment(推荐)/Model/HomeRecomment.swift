//
//	HomeRecomment100.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomeRecomment: NSObject, NSCoding, Mappable{

	var bind : Bool?
	var content : String?
	var destUrl : String?
	var photo : String?
	var richBannerType : String?
	var type : String?
	var videoLength : Int?


	class func newInstance(map: Map) -> Mappable?{
		return HomeRecomment()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		bind <- map["bind"]
		content <- map["content"]
		destUrl <- map["destUrl"]
		photo <- map["photo"]
		richBannerType <- map["richBannerType"]
		type <- map["type"]
		videoLength <- map["videoLength"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         bind = aDecoder.decodeObject(forKey: "bind") as? Bool
         content = aDecoder.decodeObject(forKey: "content") as? String
         destUrl = aDecoder.decodeObject(forKey: "destUrl") as? String
         photo = aDecoder.decodeObject(forKey: "photo") as? String
         richBannerType = aDecoder.decodeObject(forKey: "richBannerType") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String
         videoLength = aDecoder.decodeObject(forKey: "videoLength") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if bind != nil{
			aCoder.encode(bind, forKey: "bind")
		}
		if content != nil{
			aCoder.encode(content, forKey: "content")
		}
		if destUrl != nil{
			aCoder.encode(destUrl, forKey: "destUrl")
		}
		if photo != nil{
			aCoder.encode(photo, forKey: "photo")
		}
		if richBannerType != nil{
			aCoder.encode(richBannerType, forKey: "richBannerType")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
		if videoLength != nil{
			aCoder.encode(videoLength, forKey: "videoLength")
		}

	}

}
