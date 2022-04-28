//
//  CircleViewModel.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 22/04/22.
//

import Foundation

class CircleViewModel: ObservableObject{
    @Published var currentCircle = CircleModel()
    @Published var selectedCircleId = ""
    @Published var circlesList: [CircleModel]
    var listHeaderHeight: Int
    
    init(){
        circlesList = []
#if os(macOS)
        listHeaderHeight = 40
#else
        listHeaderHeight = 100
#endif
    }
    
    func addCircle(){
        if !addIconDisabled(){
            circlesList.append(currentCircle)
            currentCircle = CircleModel()
            hideKeyboard()
        }
    }
    
    func removeCircle(){
        if selectedCircleId != ""{
            circlesList.removeAll(where: {$0.id == selectedCircleId})
            selectedCircleId = ""
            hideKeyboard()
        }
    }
    
    func addIconDisabled() -> Bool{
        let circle = currentCircle
        if circle.xHolePos == "" || circle.yHolePos == "" || circle.radius == ""{
            return true
        }
        return false
    }
}
