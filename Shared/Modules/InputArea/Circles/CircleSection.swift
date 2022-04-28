//
//  CircleInputView.swift
//  GraphicDemoApp
//
//  Created by iPHTech39 on 22/04/22.
//

import SwiftUI

struct CircleSection: View{
    @EnvironmentObject var viewModel: CircleViewModel
    
    var body: some View{
        VStack(alignment: .leading){
            CustomText(text: "Circle")
            CircleInputView()
            if viewModel.circlesList.count != 0{
                CircleListSection()
            }
        }
    }
}
