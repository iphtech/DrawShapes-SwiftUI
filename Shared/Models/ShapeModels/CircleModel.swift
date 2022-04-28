//
//  CircleModel.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 22/04/22.
//

import Foundation

public struct CircleModel: Equatable,Identifiable, Hashable, Encodable {
    public var id = UUID().uuidString
    var xHolePos: String = ""
    var yHolePos: String = ""
    var radius: String = ""
}
