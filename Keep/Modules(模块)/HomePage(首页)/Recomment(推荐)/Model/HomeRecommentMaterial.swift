//
//	HomeRecommentMaterial.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomeRecommentMaterial : NSObject, NSCoding, Mappable{

	var homeRecomment : HomeRecomment?


	class func newInstance(map: Map) -> Mappable?{
		return HomeRecommentMaterial()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		homeRecomment <- map["100"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         homeRecomment = aDecoder.decodeObject(forKey: "100") as? HomeRecomment

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if homeRecomment != nil{
			aCoder.encode(100, forKey: "100")
		}

	}

}
