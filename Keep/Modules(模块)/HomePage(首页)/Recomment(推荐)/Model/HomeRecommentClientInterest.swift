//
//	HomeRecommentClientInterest.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomeRecommentClientInterest : NSObject, NSCoding, Mappable{

	var extDspClickAction : Int?
	var reporters : [AnyObject]?


	class func newInstance(map: Map) -> Mappable?{
		return HomeRecommentClientInterest()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		extDspClickAction <- map["extDspClickAction"]
		reporters <- map["reporters"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         extDspClickAction = aDecoder.decodeObject(forKey: "extDspClickAction") as? Int
         reporters = aDecoder.decodeObject(forKey: "reporters") as? [AnyObject]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if extDspClickAction != nil{
			aCoder.encode(extDspClickAction, forKey: "extDspClickAction")
		}
		if reporters != nil{
			aCoder.encode(reporters, forKey: "reporters")
		}

	}

}