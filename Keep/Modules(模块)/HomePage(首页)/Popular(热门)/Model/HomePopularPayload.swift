//
//	HomePopularPayload.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomePopularPayload : NSObject, NSCoding, Mappable{

	var authorId : String?
	var contentType : String?
	var entryType : String?
	var isFan : Bool?
	var itemId : String?
	var itemType : String?
	var label : String?
	var reason : String?
	var recommendSource : String?
	var source : String?
	var themeName : String?


	class func newInstance(map: Map) -> Mappable?{
		return HomePopularPayload()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		authorId <- map["author_id"]
		contentType <- map["content_type"]
		entryType <- map["entry_type"]
		isFan <- map["is_fan"]
		itemId <- map["item_id"]
		itemType <- map["item_type"]
		label <- map["label"]
		reason <- map["reason"]
		recommendSource <- map["recommendSource"]
		source <- map["source"]
		themeName <- map["theme_name"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         authorId = aDecoder.decodeObject(forKey: "author_id") as? String
         contentType = aDecoder.decodeObject(forKey: "content_type") as? String
         entryType = aDecoder.decodeObject(forKey: "entry_type") as? String
         isFan = aDecoder.decodeObject(forKey: "is_fan") as? Bool
         itemId = aDecoder.decodeObject(forKey: "item_id") as? String
         itemType = aDecoder.decodeObject(forKey: "item_type") as? String
         label = aDecoder.decodeObject(forKey: "label") as? String
         reason = aDecoder.decodeObject(forKey: "reason") as? String
         recommendSource = aDecoder.decodeObject(forKey: "recommendSource") as? String
         source = aDecoder.decodeObject(forKey: "source") as? String
         themeName = aDecoder.decodeObject(forKey: "theme_name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if authorId != nil{
			aCoder.encode(authorId, forKey: "author_id")
		}
		if contentType != nil{
			aCoder.encode(contentType, forKey: "content_type")
		}
		if entryType != nil{
			aCoder.encode(entryType, forKey: "entry_type")
		}
		if isFan != nil{
			aCoder.encode(isFan, forKey: "is_fan")
		}
		if itemId != nil{
			aCoder.encode(itemId, forKey: "item_id")
		}
		if itemType != nil{
			aCoder.encode(itemType, forKey: "item_type")
		}
		if label != nil{
			aCoder.encode(label, forKey: "label")
		}
		if reason != nil{
			aCoder.encode(reason, forKey: "reason")
		}
		if recommendSource != nil{
			aCoder.encode(recommendSource, forKey: "recommendSource")
		}
		if source != nil{
			aCoder.encode(source, forKey: "source")
		}
		if themeName != nil{
			aCoder.encode(themeName, forKey: "theme_name")
		}

	}

}