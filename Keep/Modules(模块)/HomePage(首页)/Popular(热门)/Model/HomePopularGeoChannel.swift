//
//	HomePopularGeoChannel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomePopularGeoChannel : NSObject, NSCoding, Mappable{

	var descriptionField : String?
	var photo : String?
	var schema : String?
	var title : String?


	class func newInstance(map: Map) -> Mappable?{
		return HomePopularGeoChannel()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		descriptionField <- map["description"]
		photo <- map["photo"]
		schema <- map["schema"]
		title <- map["title"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         photo = aDecoder.decodeObject(forKey: "photo") as? String
         schema = aDecoder.decodeObject(forKey: "schema") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if photo != nil{
			aCoder.encode(photo, forKey: "photo")
		}
		if schema != nil{
			aCoder.encode(schema, forKey: "schema")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}

	}

}