//
//  LineInputView.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 22/04/22.
//

import SwiftUI

struct LineSection: View{
    @EnvironmentObject var viewModel: LineViewModel
    
    var body: some View{
        VStack(alignment: .leading){
            CustomText(text: "Line")
            LineInputView()
            if viewModel.linesList.count != 0{
                LineListSection()
            }
        }
    }
}
