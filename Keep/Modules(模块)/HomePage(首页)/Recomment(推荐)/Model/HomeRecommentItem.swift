//
//	HomeRecommentItem.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import RxDataSources

class HomeRecommentItem : NSObject, Mappable{

	var advertise : HomeRecommentAdvertise?
	var pattern : String?
	var payload : HomeRecommentPayload?
	var recommendEntry : HomeRecommentRecommendEntry?


	class func newInstance(map: Map) -> Mappable?{
		return HomeRecommentItem()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		advertise <- map["advertise"]
		pattern <- map["pattern"]
		payload <- map["payload"]
		recommendEntry <- map["entry"]
		
	}
}
/* ============================= SectionModel =============================== */

struct RecommentSection {
    var items: [Item]
}

extension RecommentSection: SectionModelType {
    typealias Item = HomeRecommentItem
    init(original: RecommentSection, items: [HomeRecommentItem]) {
        self = original
        self.items = items
    }
}
