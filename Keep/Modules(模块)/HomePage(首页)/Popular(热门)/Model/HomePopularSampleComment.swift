//
//	HomePopularSampleComment.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomePopularSampleComment : NSObject, NSCoding, Mappable{

	var id : String?
	var author : HomePopularAuthor?
	var content : String?
	var created : String?


	class func newInstance(map: Map) -> Mappable?{
		return HomePopularSampleComment()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		id <- map["_id"]
		author <- map["author"]
		content <- map["content"]
		created <- map["created"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         id = aDecoder.decodeObject(forKey: "_id") as? String
         author = aDecoder.decodeObject(forKey: "author") as? HomePopularAuthor
         content = aDecoder.decodeObject(forKey: "content") as? String
         created = aDecoder.decodeObject(forKey: "created") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if id != nil{
			aCoder.encode(id, forKey: "_id")
		}
		if author != nil{
			aCoder.encode(author, forKey: "author")
		}
		if content != nil{
			aCoder.encode(content, forKey: "content")
		}
		if created != nil{
			aCoder.encode(created, forKey: "created")
		}

	}

}