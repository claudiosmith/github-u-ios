//
//  UserRowView.swift
//  github-u-ios
//
//  Created by Claudio Smith on 15/05/23.
//

import SwiftUI

struct UserRowView: View {

    let viewdata: UserViewData
    
    var body: some View {
        VStack(alignment: .leading) {

            ZStack {
                     Rectangle()
                     .fill(Color.rowColor)
                     .frame(maxWidth: .infinity, maxHeight: LayoutUserRow.height)

                HStack {
                    AsyncImage(url: viewdata.avatarUrl) { image in
                              image
                                 .resizable()
                                 .aspectRatio(contentMode: .fit)
                          } placeholder: {
                              Image(.placeholder.user).resizable()
                                 .aspectRatio(contentMode: .fit)
                          }
                    
                    VStack(alignment: .trailing) {
                        Text(viewdata.login).font(.callout)
                            .padding(.bottom, 2)
                            .foregroundColor(.mint)
                        Text(viewdata.htmlUrl).font(.callout)
                            .foregroundColor(.white)
                        
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                     .frame(width: LayoutUserRow.textWidth, height: LayoutUserRow.imageHeight,
                            alignment: .topTrailing)
                }
                .background(Color.rowColor)
            }
            .frame(width: AppUI.layerWidth, height: LayoutUserRow.height, alignment: .trailing)

        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: LayoutUserRow.height,
               maxHeight: LayoutUserRow.height, alignment: .topLeading)
        .background(Color.rowColor)

    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(viewdata: .viewdata)
    }
}
