//
//  LineListSection.swift
//  GraphicDemoApp
//
//  Created by IPHTECH 24 on 24/04/22.
//

import SwiftUI

struct LineListSection: View{
    @EnvironmentObject var viewModel: LineViewModel

    var body: some View{
        
        VStack(alignment:.leading){
            List{
                Section(
                    header: HStack{
                        ListHeaderText(heading: "start X")
                        ListHeaderText(heading: "start Y")
                        ListHeaderText(heading: "end X")
                        ListHeaderText(heading: "end Y")
                    }.listRowInsets(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 0))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                ){

                    ForEach(viewModel.linesList, id: \.id){ item in
                        HStack{
                            ListRowText(value: item.startXPos)
                            ListRowText(value: item.startYPos)
                            ListRowText(value: item.endXPos)
                            ListRowText(value: item.endYPos)
                        }.padding(.leading, 8).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading).background(viewModel.selectedLineId == item.id ? Color.blue : Color.white)
                            .listRowBackground(viewModel.selectedLineId == item.id ? Color.blue : Color.white).foregroundColor(viewModel.selectedLineId == item.id ? Color.white : Color.black.opacity(0.9))
                        
                        .onTapGesture {
                            if viewModel.selectedLineId == item.id{
                                viewModel.selectedLineId = ""
                            }else{
                                viewModel.selectedLineId = item.id
                            }
                        }
                    }
                }
            }
                .background(Color.white.opacity(0.8)).clipShape(RoundedRectangle(cornerRadius: 12)).listStyle(.plain)
        }.frame(height: (CGFloat(viewModel.linesList.count) * 20)+40 <= 160 ? CGFloat(viewModel.linesList.count * 20 + viewModel.listHeaderHeight) : 160)
    }
}
