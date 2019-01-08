//
//  Date+String.swift
//  UKExtensions
//
//  Created by Alok Choudhary on 1/7/19.
//  Copyright © 2019 Alok Choudhary. All rights reserved.
//

import Foundation

// MARK: - Extension on Foundation object Date
public extension Date {
    
    /// Getting string from Date instance for given date format
    ///
    /// - Parameter format: Date format string e.g YYYY_MM_DD or MM_DD_YYYY
    /// - Returns: string of date instance
    public func toString( dateFormat format  : String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    /// String from Date instance for format YYYY_MM_DD_HH_mm_ss
    ///
    /// - Returns: returns date in `YYYY_MM_DD_HH_mm_ss`
    public func stringFormatYYYY_MM_DD_HH_mm_ss() -> String {
        return toString(dateFormat: "yyyy-MM-dd HH:mm:ss")
    }
    
    /// Returns Seconds since Unix Epoch
    ///
    /// - Returns: 64 bit integer number to represent seconds since Unix Epoch
    public func currentTimeInSeconds() -> Int64 {
        return Int64(self.timeIntervalSince1970)
    }
    
    /// Timestamp seconds since unix epoch
    ///
    /// - Parameter timestamp: seconds as 64bit integer
    /// - Returns: Date calculated from seconds
    public func getDate(from timestamp: Int64) -> Date {
        let timeInterval = TimeInterval(timestamp)
        return Date(timeIntervalSince1970: TimeInterval(timeInterval))
    }
    
    public func currentTimeInSecondsString() -> String {
        return String(Int64(self.timeIntervalSince1970))
    }
    
    public func getDateString(from timestamp: Int64) -> String {
        let timeInterval = TimeInterval(timestamp)
        return Date(timeIntervalSince1970: TimeInterval(timeInterval)).stringFormatYYYY_MM_DD_HH_mm_ss()
    }
    
}
