//
//  LineInputView.swift
//  GraphicDemoApp
//
//  Created by IPHTECH 24 on 25/04/22.
//

import SwiftUI

struct LineInputView: View {
    @EnvironmentObject var viewModel: LineViewModel
    @State var showAlert = false
    
    var body: some View {
        HStack{
            CustomDecimalTextField(text: $viewModel.currentLine.startXPos, placeholder: "start x")
            CustomDecimalTextField(text: $viewModel.currentLine.startYPos, placeholder: "start y")
            CustomDecimalTextField(text: $viewModel.currentLine.endXPos, placeholder: "end X")
            CustomDecimalTextField(text: $viewModel.currentLine.endYPos, placeholder: "end Y")
            Spacer()
            
            CustomIconButton(imageName: "pencil", isDisabled: viewModel.addIconDisabled())
                .onTapGesture {
                    viewModel.addLine()
                }
            CustomIconButton(imageName: "trash", isDisabled: viewModel.selectedLineId == "")
                .onTapGesture {
                    showAlert = true
                }
        }.alert(isPresented: $showAlert, content: {
            Alert(
                title: Text("Are you sure you want to delete this line?"),
                primaryButton: .destructive(Text("Delete")) {
                    viewModel.removeLine()
                },
                secondaryButton: .cancel()
            )
        })
    }
}
