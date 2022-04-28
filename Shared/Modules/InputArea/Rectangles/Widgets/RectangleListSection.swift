//
//  RectangleListSection.swift
//  GraphicDemoApp
//
//  Created by IPHTECH 24 on 24/04/22.
//

import SwiftUI

struct RectangleListSection: View{
    @EnvironmentObject var viewModel: RectangleViewModel
    
    var body: some View{
        VStack(alignment:.leading){
            List{
                Section(
                    header: HStack{
                        ListHeaderText(heading: "xPos")
                        ListHeaderText(heading: "yPos")
                        ListHeaderText(heading: "Width")
                        ListHeaderText(heading: "Height")
                        ListHeaderText(heading: "Corner")
                    }.listRowInsets(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 0))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                ){
                    ForEach(viewModel.rectList, id: \.id){ item in
                        HStack{
                            ListRowText(value: item.xPos)
                            ListRowText(value: item.yPos)
                            ListRowText(value: item.width)
                            ListRowText(value: item.height)
                            ListRowText(value: item.cornerRadius)
                        }.foregroundColor(viewModel.selectedRectId == item.id ? Color.white : Color.black.opacity(0.9)).padding(.leading, 8).frame(maxWidth: .infinity, alignment: .leading).background(viewModel.selectedRectId == item.id ? Color.blue : Color.white)
                            .listRowBackground(viewModel.selectedRectId == item.id ? Color.blue : Color.white)
                            
                            .onTapGesture {
                            if viewModel.selectedRectId == item.id{
                                viewModel.selectedRectId = ""
                            }else{
                                viewModel.selectedRectId = item.id
                            }
                        }
                    }
                
                }
            }.background(Color.white.opacity(0.8)).clipShape(RoundedRectangle(cornerRadius: 12)).listStyle(.plain)
        }.frame(height: (CGFloat(viewModel.rectList.count) * 20)+40 <= 160 ? CGFloat(viewModel.rectList.count * 20 + viewModel.listHeaderHeight) : 160)
    }
}
