//
//	HomePopularItem.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import RxDataSources

class HomePopularItem : NSObject, NSCoding, Mappable{

	var entry : HomePopularEntry?
	var geoChannel : HomePopularGeoChannel?
	var pattern : String?
	var payload : HomePopularPayload?


	class func newInstance(map: Map) -> Mappable?{
		return HomePopularItem()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		entry <- map["entry"]
		geoChannel <- map["geoChannel"]
		pattern <- map["pattern"]
		payload <- map["payload"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         entry = aDecoder.decodeObject(forKey: "entry") as? HomePopularEntry
         geoChannel = aDecoder.decodeObject(forKey: "geoChannel") as? HomePopularGeoChannel
         pattern = aDecoder.decodeObject(forKey: "pattern") as? String
         payload = aDecoder.decodeObject(forKey: "payload") as? HomePopularPayload

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if entry != nil{
			aCoder.encode(entry, forKey: "entry")
		}
		if geoChannel != nil{
			aCoder.encode(geoChannel, forKey: "geoChannel")
		}
		if pattern != nil{
			aCoder.encode(pattern, forKey: "pattern")
		}
		if payload != nil{
			aCoder.encode(payload, forKey: "payload")
		}

	}

}
/* ============================= SectionModel =============================== */

struct HomePopularSection {
    var items: [Item]
}

extension HomePopularSection: SectionModelType {
    typealias Item = HomePopularItem
    init(original: HomePopularSection, items: [HomePopularItem]) {
        self = original
        self.items = items
    }
}
