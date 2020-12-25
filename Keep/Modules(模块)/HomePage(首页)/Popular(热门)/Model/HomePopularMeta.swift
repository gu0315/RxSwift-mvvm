//
//	HomePopularMeta.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomePopularMeta : NSObject, NSCoding, Mappable{

	var complete : Bool?
	var darkIcon : String?
	var finished : Bool?
	var icon : String?
	var name : String?
	var subtype : String?
	var workoutName : String?


	class func newInstance(map: Map) -> Mappable?{
		return HomePopularMeta()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		complete <- map["complete"]
		darkIcon <- map["darkIcon"]
		finished <- map["finished"]
		icon <- map["icon"]
		name <- map["name"]
		subtype <- map["subtype"]
		workoutName <- map["workoutName"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         complete = aDecoder.decodeObject(forKey: "complete") as? Bool
         darkIcon = aDecoder.decodeObject(forKey: "darkIcon") as? String
         finished = aDecoder.decodeObject(forKey: "finished") as? Bool
         icon = aDecoder.decodeObject(forKey: "icon") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         subtype = aDecoder.decodeObject(forKey: "subtype") as? String
         workoutName = aDecoder.decodeObject(forKey: "workoutName") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if complete != nil{
			aCoder.encode(complete, forKey: "complete")
		}
		if darkIcon != nil{
			aCoder.encode(darkIcon, forKey: "darkIcon")
		}
		if finished != nil{
			aCoder.encode(finished, forKey: "finished")
		}
		if icon != nil{
			aCoder.encode(icon, forKey: "icon")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if subtype != nil{
			aCoder.encode(subtype, forKey: "subtype")
		}
		if workoutName != nil{
			aCoder.encode(workoutName, forKey: "workoutName")
		}

	}

}
