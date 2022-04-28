//
//  LineViewModel.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 22/04/22.
//

import Foundation

class LineViewModel: ObservableObject{
    @Published var currentLine = LineModel()
    @Published var selectedLineId = ""
    @Published var linesList: [LineModel]
    var listHeaderHeight: Int
    
    init(){
        linesList = []
#if os(macOS)
        listHeaderHeight = 40
#else
        listHeaderHeight = 100
#endif
    }
    
    func addLine(){
        if !addIconDisabled(){
            linesList.append(currentLine)
            currentLine = LineModel()
            hideKeyboard()
        }
    }
    
    func removeLine(){
        if selectedLineId != ""{
            linesList.removeAll(where: {$0.id == selectedLineId})
            selectedLineId = ""
            hideKeyboard()
        }
    }
    
    func addIconDisabled() -> Bool{
        let line = currentLine
        if line.startXPos == "" || line.startYPos == "" || line.endXPos == "" || line.endYPos == ""{
            return true
        }
        return false
    }
}
