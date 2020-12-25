//
//	HomeAttentionItem.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import RxDataSources

class HomeAttentionItem : NSObject, NSCoding, Mappable{

	var pattern : String?
	var payload : HomeAttentionPayload?
	var recommendEntry : HomeAttentionRecommendEntry?
	var userGuidance : HomeAttentionUserGuidance?


	class func newInstance(map: Map) -> Mappable?{
		return HomeAttentionItem()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		pattern <- map["pattern"]
		payload <- map["payload"]
		recommendEntry <- map["recommendEntry"]
		userGuidance <- map["userGuidance"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         pattern = aDecoder.decodeObject(forKey: "pattern") as? String
         payload = aDecoder.decodeObject(forKey: "payload") as? HomeAttentionPayload
         recommendEntry = aDecoder.decodeObject(forKey: "recommendEntry") as? HomeAttentionRecommendEntry
         userGuidance = aDecoder.decodeObject(forKey: "userGuidance") as? HomeAttentionUserGuidance

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if pattern != nil{
			aCoder.encode(pattern, forKey: "pattern")
		}
		if payload != nil{
			aCoder.encode(payload, forKey: "payload")
		}
		if recommendEntry != nil{
			aCoder.encode(recommendEntry, forKey: "recommendEntry")
		}
		if userGuidance != nil{
			aCoder.encode(userGuidance, forKey: "userGuidance")
		}

	}

}
/* ============================= SectionModel =============================== */

struct HomeAttentionSection {
    var items: [Item]
}

extension HomeAttentionSection: SectionModelType {
    typealias Item = HomeAttentionItem
    init(original: HomeAttentionSection, items: [HomeAttentionItem]) {
        self = original
        self.items = items
    }
}
