//
//  RectangleViewModel.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 22/04/22.
//

import Foundation

class RectangleViewModel: ObservableObject{
    @Published var currentRect = RectangleModel()
    @Published var selectedRectId = ""
    @Published var rectList: [RectangleModel]
    var listHeaderHeight: Int
    
    init(){
        rectList = []
    #if os(macOS)
        listHeaderHeight = 40
    #else
        listHeaderHeight = 100
    #endif
    }
    
    func addRect(){
        if !addIconDisabled(){
            rectList.append(currentRect)
            currentRect = RectangleModel()
            hideKeyboard()
        }
    }
    
    func removeRect(){
        if selectedRectId != ""{
            rectList.removeAll(where: {$0.id == selectedRectId})
            selectedRectId = ""
            hideKeyboard()
        }
    }
    
    func addIconDisabled() -> Bool{
        let rect = currentRect
        if rect.xPos == "" || rect.yPos == "" || rect.width == "" || rect.height == "" || rect.cornerRadius == ""{
            return true
        }
        return false
    }
    
}
