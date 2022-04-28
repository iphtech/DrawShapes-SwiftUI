//
//  LineModel.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 25/04/22.
//

import Foundation

public struct LineModel: Equatable,Identifiable, Hashable {
    public var id = UUID().uuidString
    var startXPos: String = ""
    var startYPos: String = ""
    var endXPos: String = ""
    var endYPos: String = ""
}
