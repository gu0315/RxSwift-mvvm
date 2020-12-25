//
//  StringExtension.swift
//  GkIos
//
//  Created by 顾钱想 on 2020/8/21.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import UIKit

import UIKit

extension String {

    public func classType<T>(_ type: T.Type) -> T.Type? {

        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            return nil
        }
        guard let nameSpaceClass = NSClassFromString(nameSpace + "." + self) else {
            return nil
        }
        guard let classType = nameSpaceClass as? T.Type else {
            return nil
        }
        return classType
    }

    public func classObject<T: NSObject>(_ type: T.Type) -> T? {

        guard let classType = classType(T.self) else {
            return nil
        }
        return classType.init()
    }

    // MARK: - 计算大小
    public func size(_ width: CGFloat, _ font: UIFont, _ lineSpeace: CGFloat? = 0) -> CGSize {

        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)

        // 行距
        let paragraphStye = NSMutableParagraphStyle()
        paragraphStye.lineSpacing = lineSpeace ?? 0
        // 字体属性
        let attributes = [NSAttributedString.Key.font: font,
                          NSAttributedString.Key.paragraphStyle: paragraphStye]
        // 计算宽高
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        return boundingBox.size
    }

    // MARK: 字符串转字典
    func stringValueDic() -> [String : Any]? {
        let data = self.data(using: String.Encoding.utf8)
        if let dict = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any] {
            return dict
        }
        return nil
    }

}

