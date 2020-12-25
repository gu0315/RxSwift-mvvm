//
//	HomePopularAuthor.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class HomePopularAuthor : NSObject, NSCoding, Mappable{

	var id : String?
	var avatar : String?
	var bio : String?
	var desc : String?
	var gender : String?
	var keepValue : Float?
	var kgLevel : Int?
	var maxKeepValue : Float?
	var memberStatus : Int?
	var membershipSchema : String?
	var username : String?
	var verifiedIconResourceId : String?
	var verifiedIconResourceIdWithSide : String?
	var verifiedIconUrl : String?
	var verifiedIconUrlWithSide : String?
	var verifyType : Int?


	class func newInstance(map: Map) -> Mappable?{
		return HomePopularAuthor()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		id <- map["_id"]
		avatar <- map["avatar"]
		bio <- map["bio"]
		desc <- map["desc"]
		gender <- map["gender"]
		keepValue <- map["keepValue"]
		kgLevel <- map["kgLevel"]
		maxKeepValue <- map["maxKeepValue"]
		memberStatus <- map["memberStatus"]
		membershipSchema <- map["membershipSchema"]
		username <- map["username"]
		verifiedIconResourceId <- map["verifiedIconResourceId"]
		verifiedIconResourceIdWithSide <- map["verifiedIconResourceIdWithSide"]
		verifiedIconUrl <- map["verifiedIconUrl"]
		verifiedIconUrlWithSide <- map["verifiedIconUrlWithSide"]
		verifyType <- map["verifyType"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         id = aDecoder.decodeObject(forKey: "_id") as? String
         avatar = aDecoder.decodeObject(forKey: "avatar") as? String
         bio = aDecoder.decodeObject(forKey: "bio") as? String
         desc = aDecoder.decodeObject(forKey: "desc") as? String
         gender = aDecoder.decodeObject(forKey: "gender") as? String
         keepValue = aDecoder.decodeObject(forKey: "keepValue") as? Float
         kgLevel = aDecoder.decodeObject(forKey: "kgLevel") as? Int
         maxKeepValue = aDecoder.decodeObject(forKey: "maxKeepValue") as? Float
         memberStatus = aDecoder.decodeObject(forKey: "memberStatus") as? Int
         membershipSchema = aDecoder.decodeObject(forKey: "membershipSchema") as? String
         username = aDecoder.decodeObject(forKey: "username") as? String
         verifiedIconResourceId = aDecoder.decodeObject(forKey: "verifiedIconResourceId") as? String
         verifiedIconResourceIdWithSide = aDecoder.decodeObject(forKey: "verifiedIconResourceIdWithSide") as? String
         verifiedIconUrl = aDecoder.decodeObject(forKey: "verifiedIconUrl") as? String
         verifiedIconUrlWithSide = aDecoder.decodeObject(forKey: "verifiedIconUrlWithSide") as? String
         verifyType = aDecoder.decodeObject(forKey: "verifyType") as? Int

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
		if avatar != nil{
			aCoder.encode(avatar, forKey: "avatar")
		}
		if bio != nil{
			aCoder.encode(bio, forKey: "bio")
		}
		if desc != nil{
			aCoder.encode(desc, forKey: "desc")
		}
		if gender != nil{
			aCoder.encode(gender, forKey: "gender")
		}
		if keepValue != nil{
			aCoder.encode(keepValue, forKey: "keepValue")
		}
		if kgLevel != nil{
			aCoder.encode(kgLevel, forKey: "kgLevel")
		}
		if maxKeepValue != nil{
			aCoder.encode(maxKeepValue, forKey: "maxKeepValue")
		}
		if memberStatus != nil{
			aCoder.encode(memberStatus, forKey: "memberStatus")
		}
		if membershipSchema != nil{
			aCoder.encode(membershipSchema, forKey: "membershipSchema")
		}
		if username != nil{
			aCoder.encode(username, forKey: "username")
		}
		if verifiedIconResourceId != nil{
			aCoder.encode(verifiedIconResourceId, forKey: "verifiedIconResourceId")
		}
		if verifiedIconResourceIdWithSide != nil{
			aCoder.encode(verifiedIconResourceIdWithSide, forKey: "verifiedIconResourceIdWithSide")
		}
		if verifiedIconUrl != nil{
			aCoder.encode(verifiedIconUrl, forKey: "verifiedIconUrl")
		}
		if verifiedIconUrlWithSide != nil{
			aCoder.encode(verifiedIconUrlWithSide, forKey: "verifiedIconUrlWithSide")
		}
		if verifyType != nil{
			aCoder.encode(verifyType, forKey: "verifyType")
		}

	}

}