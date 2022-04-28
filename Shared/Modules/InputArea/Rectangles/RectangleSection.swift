//
//  RectangleInputView.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 22/04/22.
//

import SwiftUI

struct RectangleSection: View {
    @EnvironmentObject var viewModel: RectangleViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            CustomText(text: "Rectangle")
            RectangleInputView()
            if viewModel.rectList.count != 0{
                RectangleListSection()
            }
        }
    }
}
