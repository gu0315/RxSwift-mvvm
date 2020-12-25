//
//	HomeRecommentExpansion.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomeRecommentExpansion : NSObject, NSCoding, Mappable{

	var autoGenerated : Bool?
	var editTypes : [String]?
	var needAudited : Bool?


	class func newInstance(map: Map) -> Mappable?{
		return HomeRecommentExpansion()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		autoGenerated <- map["autoGenerated"]
		editTypes <- map["editTypes"]
		needAudited <- map["needAudited"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         autoGenerated = aDecoder.decodeObject(forKey: "autoGenerated") as? Bool
         editTypes = aDecoder.decodeObject(forKey: "editTypes") as? [String]
         needAudited = aDecoder.decodeObject(forKey: "needAudited") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if autoGenerated != nil{
			aCoder.encode(autoGenerated, forKey: "autoGenerated")
		}
		if editTypes != nil{
			aCoder.encode(editTypes, forKey: "editTypes")
		}
		if needAudited != nil{
			aCoder.encode(needAudited, forKey: "needAudited")
		}

	}

}