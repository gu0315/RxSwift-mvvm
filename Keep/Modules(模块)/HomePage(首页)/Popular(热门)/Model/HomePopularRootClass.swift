//
//	HomePopularRootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomePopularRootClass : NSObject, NSCoding, Mappable{

	var data : HomePopularData?
	var errorCode : Int?
	var now : String?
	var ok : Bool?
	var text : String?
	var version : String?


	class func newInstance(map: Map) -> Mappable?{
		return HomePopularRootClass()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		data <- map["data"]
		errorCode <- map["errorCode"]
		now <- map["now"]
		ok <- map["ok"]
		text <- map["text"]
		version <- map["version"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         data = aDecoder.decodeObject(forKey: "data") as? HomePopularData
         errorCode = aDecoder.decodeObject(forKey: "errorCode") as? Int
         now = aDecoder.decodeObject(forKey: "now") as? String
         ok = aDecoder.decodeObject(forKey: "ok") as? Bool
         text = aDecoder.decodeObject(forKey: "text") as? String
         version = aDecoder.decodeObject(forKey: "version") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}
		if errorCode != nil{
			aCoder.encode(errorCode, forKey: "errorCode")
		}
		if now != nil{
			aCoder.encode(now, forKey: "now")
		}
		if ok != nil{
			aCoder.encode(ok, forKey: "ok")
		}
		if text != nil{
			aCoder.encode(text, forKey: "text")
		}
		if version != nil{
			aCoder.encode(version, forKey: "version")
		}

	}

}