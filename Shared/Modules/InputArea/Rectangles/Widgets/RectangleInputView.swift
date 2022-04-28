//
//  RectangleInputView.swift
//  GraphicDemoApp
//
//  Created by IPHTECH 24 on 25/04/22.
//

import SwiftUI

struct RectangleInputView: View {
    @EnvironmentObject var viewModel: RectangleViewModel
    @State var showAlert = false

    var body: some View {
        HStack{
            CustomDecimalTextField(text: $viewModel.currentRect.xPos, placeholder: "x (centre)")
            CustomDecimalTextField(text: $viewModel.currentRect.yPos, placeholder: "y (centre)")
            CustomDecimalTextField(text: $viewModel.currentRect.width, placeholder: "Width")
            CustomDecimalTextField(text: $viewModel.currentRect.height, placeholder: "Height")
            CustomDecimalTextField(text: $viewModel.currentRect.cornerRadius, placeholder: "Corners")
            Spacer()
            CustomIconButton(imageName: "pencil", isDisabled: viewModel.addIconDisabled())
                .onTapGesture {
                    viewModel.addRect()
                }
            CustomIconButton(imageName: "trash", isDisabled: viewModel.selectedRectId == "")
                .onTapGesture {
                    showAlert = true
                }
        }.alert(isPresented: $showAlert, content: {
            Alert(
                title: Text("Are you sure you want to delete this rectangle?"),
                primaryButton: .destructive(Text("Delete")) {
                    viewModel.removeRect()
                },
                secondaryButton: .cancel()
            )
        })
    }
}
