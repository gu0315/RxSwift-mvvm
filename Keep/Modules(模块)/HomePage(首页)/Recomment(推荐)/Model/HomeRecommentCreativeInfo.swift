//
//	HomeRecommentCreativeInfo.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomeRecommentCreativeInfo : NSObject, NSCoding, Mappable{

	var adGroupId : Int?
	var adTrace : HomeRecommentAdTrace?
	var created : Int?
	var creativeType : Int?
	var id : Int?
	var materials : HomeRecommentMaterial?
	var modified : Int?
	var status : Int?
	var style : Int?
	var type : Int?


	class func newInstance(map: Map) -> Mappable?{
		return HomeRecommentCreativeInfo()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		adGroupId <- map["adGroupId"]
		adTrace <- map["adTrace"]
		created <- map["created"]
		creativeType <- map["creativeType"]
		id <- map["id"]
		materials <- map["materials"]
		modified <- map["modified"]
		status <- map["status"]
		style <- map["style"]
		type <- map["type"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         adGroupId = aDecoder.decodeObject(forKey: "adGroupId") as? Int
         adTrace = aDecoder.decodeObject(forKey: "adTrace") as? HomeRecommentAdTrace
         created = aDecoder.decodeObject(forKey: "created") as? Int
         creativeType = aDecoder.decodeObject(forKey: "creativeType") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? Int
         materials = aDecoder.decodeObject(forKey: "materials") as? HomeRecommentMaterial
         modified = aDecoder.decodeObject(forKey: "modified") as? Int
         status = aDecoder.decodeObject(forKey: "status") as? Int
         style = aDecoder.decodeObject(forKey: "style") as? Int
         type = aDecoder.decodeObject(forKey: "type") as? Int

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
		if adTrace != nil{
			aCoder.encode(adTrace, forKey: "adTrace")
		}
		if created != nil{
			aCoder.encode(created, forKey: "created")
		}
		if creativeType != nil{
			aCoder.encode(creativeType, forKey: "creativeType")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if materials != nil{
			aCoder.encode(materials, forKey: "materials")
		}
		if modified != nil{
			aCoder.encode(modified, forKey: "modified")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if style != nil{
			aCoder.encode(style, forKey: "style")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}

	}

}