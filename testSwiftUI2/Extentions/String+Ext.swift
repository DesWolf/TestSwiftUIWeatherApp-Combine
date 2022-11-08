//
//  String+Ext.swift
//  testSwiftUI2
//
//  Created by Max Okuneev on 19.10.2022.
//

import UIKit

extension String {
    /// From String to String
    func convertToDate(from: ToStringDateFormatter, to: ToStringDateFormatter) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = from.rawValue
        dateFormatter.locale = Locale(identifier: "ru_RU")

        guard let convertString = dateFormatter.date(from: self) else { return nil }
        dateFormatter.dateFormat = to.rawValue

        return dateFormatter.string(from: convertString)
    }
}

//2022-10-19 09:00:00 +0000

enum ToStringDateFormatter: String {

    /// yyyy-MM-dd'T'HH:mm:ssZ
    case ssZ = "yyyy-MM-dd'T'HH:mm:ssZ"

    /// yyyy-MM-dd'T'HH:mm:ss.SSSZ
    case SSSZ = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

    /// dd MM yyyy, HH:mm
    case time = "dd.MM.yyyy, HH:mm"

    /// dd.MM.yy, HH:mm
    case shortTime = "dd.MM.yy, HH:mm"

    /// dd.MM.yyyy
    case noTime = "dd.MM.yyyy"

    /// LLLL yyyy
    case LLLLyyyy = "LLLL yyyy"

    /// dd.MMMM.yyyy
    case noTimeFull = "dd MMMM yyyy"

    /// HH:mm
    case hoursMinutes = "HH:mm"

    /// dd.MM.yy HH:mm
    case shortTimeCross = "dd.MM.yy HH:mm"

    /// yyyy-MM-dd'T'HH:mm
    case noTimeZone = "yyyy-MM-dd'T'HH:mm"

    /// yyyy-MM-dd HH:mm:ss Z
    case ss_Z = "yyyy-MM-dd HH:mm:ss Z"

    /// yyyy-MM-dd
    case anotherMultiplatformDate = "yyyy-MM-dd"

    /// "E, d MMM yyyy"
    case anotherWebinarDate = "E, d MMM yyyy"
}

