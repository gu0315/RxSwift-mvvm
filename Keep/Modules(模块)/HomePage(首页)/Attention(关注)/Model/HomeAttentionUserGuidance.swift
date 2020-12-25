//
//	HomeAttentionUserGuidance.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomeAttentionUserGuidance : NSObject, NSCoding, Mappable{

	var guidances : [HomeAttentionGuidance]?


	class func newInstance(map: Map) -> Mappable?{
		return HomeAttentionUserGuidance()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		guidances <- map["guidances"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         guidances = aDecoder.decodeObject(forKey: "guidances") as? [HomeAttentionGuidance]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if guidances != nil{
			aCoder.encode(guidances, forKey: "guidances")
		}

	}

}