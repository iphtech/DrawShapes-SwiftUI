//
//  RectangleModel.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 22/04/22.
//

import Foundation

public struct RectangleModel: Equatable,Identifiable, Hashable {
    public var id = UUID().uuidString
    var height: String = ""
    var width: String = ""
    var cornerRadius: String = ""
    var xPos: String = ""
    var yPos: String = ""
}
