//
//  CircleInputView.swift
//  GraphicDemoApp
//
//  Created by IPHTECH 24 on 25/04/22.
//

import SwiftUI

struct CircleInputView: View {
    @EnvironmentObject var viewModel: CircleViewModel
    @State var showAlert = false
    
    var body: some View {
        HStack{
            CustomDecimalTextField(text: $viewModel.currentCircle.xHolePos, placeholder: "x (centre)")
            CustomDecimalTextField(text: $viewModel.currentCircle.yHolePos, placeholder: "y (centre)")
            CustomDecimalTextField(text: $viewModel.currentCircle.radius, placeholder: "Radius")
            Spacer()
            
            CustomIconButton(imageName: "pencil", isDisabled: viewModel.addIconDisabled())
                .onTapGesture {
                    viewModel.addCircle()
                }
            CustomIconButton(imageName: "trash", isDisabled: viewModel.selectedCircleId == "")
                .onTapGesture {
                    showAlert = true
                }
                
        }.alert(isPresented: $showAlert, content: {
            Alert(
                title: Text("Are you sure you want to delete this circle?"),
                primaryButton: .destructive(Text("Delete")) {
                    viewModel.removeCircle()
                },
                secondaryButton: .cancel()
            )
        })
    }
}
