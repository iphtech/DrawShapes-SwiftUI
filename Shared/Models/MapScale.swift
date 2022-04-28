//
//  MapScale.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 22/04/22.
//

import Foundation

class ScaleFactor: ObservableObject {
    var initialHScale: Double = 750
    var initialVScale: Double = 650
    @Published var hScaleValue: Double
    @Published var vScaleValue: Double
    @Published var mapWidth: Double = 500
    @Published var mapHeight: Double = 500
    
    init(){
        hScaleValue = initialHScale
        vScaleValue = initialVScale
    }
    
    func vScaleValueChanged(scale: Double){
        vScaleValue = scale
    }
    
    func resetScale(){
        hScaleValue = initialHScale
        vScaleValue = initialVScale
        hideKeyboard()
    }
}
