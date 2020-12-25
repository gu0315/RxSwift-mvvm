//
//	HomeAttentionPayload.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomeAttentionPayload : NSObject, NSCoding, Mappable{

	var authorId : String?
	var contentType : String?
	var entryType : String?
	var itemId : String?
	var itemType : String?
	var recommendReason : String?
	var themeName : String?
	var reason : String?
	var recAuthorReason : String?


	class func newInstance(map: Map) -> Mappable?{
		return HomeAttentionPayload()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		authorId <- map["author_id"]
		contentType <- map["content_type"]
		entryType <- map["entry_type"]
		itemId <- map["item_id"]
		itemType <- map["item_type"]
		recommendReason <- map["recommend_reason"]
		themeName <- map["theme_name"]
		reason <- map["reason"]
		recAuthorReason <- map["recAuthorReason"]
		
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
         itemId = aDecoder.decodeObject(forKey: "item_id") as? String
         itemType = aDecoder.decodeObject(forKey: "item_type") as? String
         recommendReason = aDecoder.decodeObject(forKey: "recommend_reason") as? String
         themeName = aDecoder.decodeObject(forKey: "theme_name") as? String
         reason = aDecoder.decodeObject(forKey: "reason") as? String
         recAuthorReason = aDecoder.decodeObject(forKey: "recAuthorReason") as? String

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
		if itemId != nil{
			aCoder.encode(itemId, forKey: "item_id")
		}
		if itemType != nil{
			aCoder.encode(itemType, forKey: "item_type")
		}
		if recommendReason != nil{
			aCoder.encode(recommendReason, forKey: "recommend_reason")
		}
		if themeName != nil{
			aCoder.encode(themeName, forKey: "theme_name")
		}
		if reason != nil{
			aCoder.encode(reason, forKey: "reason")
		}
		if recAuthorReason != nil{
			aCoder.encode(recAuthorReason, forKey: "recAuthorReason")
		}

	}

}