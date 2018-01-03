//
//  AmbienceConstraint.swift
//  Ambience
//
//  Created by Tiago Mergulhão on 25/09/2017.
//  Copyright © 2017 Tiago Mergulhão. All rights reserved.
//

import Foundation

public func ==(lhs: AmbienceConstraint, rhs: AmbienceConstraint) -> Bool {
    return lhs.hashValue == rhs.hashValue
}
public func <(lhs: AmbienceConstraint, rhs: AmbienceConstraint) -> Bool {
    return lhs.hashValue < rhs.hashValue
}

public typealias AmbienceConstraints = Set<AmbienceConstraint>

public enum AmbienceConstraint : Hashable, Comparable, CustomStringConvertible {
    case invert(upper : Brightness)
    case regular(lower : Brightness, upper : Brightness)
    case contrast(lower : Brightness)
    
    public var description : String {
        switch self {
        case .invert(let upper): return "Invert<\(upper)>"
        case .regular(let lower, let upper): return "Invert<\(lower), \(upper)>"
        case .contrast(let lower): return "Contrast<\(lower)>"
        }
    }
    
    public var state : AmbienceState {
        switch self {
        case .invert:   return AmbienceState.invert
        case .regular:  return AmbienceState.regular
        case .contrast: return AmbienceState.contrast
        }
    }
    
    public var hashValue : Int {
        return description.hashValue
    }
    
    internal var rangeFunctor : ((Brightness) -> Bool) {
        switch self {
        case .invert(let upper):
            return { $0 <= upper }
        case .regular(let lower, let upper):
            return { $0 <= upper && $0 >= lower }
        case .contrast(let lower):
            return { $0 >= lower }
        }
    }
}
