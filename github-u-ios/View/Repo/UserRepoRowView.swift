//
//  UserRepoRowView.swift
//  github-u-ios
//
//  Created by Claudio Smith on 17/05/23.
//

import SwiftUI

struct UserRepoRowView: View {
    
    let viewdata: UserRepoViewData
    
    var body: some View {
        VStack(alignment: .center) {

            ZStack {
                     Rectangle()
                     .fill(Color.rowColor)
                    .frame(maxWidth: .infinity, maxHeight: LayoutUserRepo.height)

                VStack(alignment: .leading) {
                    
                    Text(viewdata.stars).font(.callout)
                        .padding(.bottom, 0.5)
                        .foregroundColor(.yellow)
                    Text(viewdata.repoUrl).font(.caption)
                        .foregroundColor(.frontRocketColor)

                }.padding(EdgeInsets(top: 7, leading: 10, bottom: 10, trailing: 0))
                 .frame(maxWidth: LayoutUserRepo.width, maxHeight: LayoutUserRepo.height,
                           alignment: .topLeading)
                .background(Color.rowColor)
                
            }
            .frame(maxWidth: .infinity, maxHeight: LayoutUserRow.height, alignment: .leading)

        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: LayoutUserRepo.height,
               maxHeight: LayoutUserRepo.height, alignment: .topLeading)
        .background(Color.rowColor)

    }
}

struct UserRepoRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRepoRowView(viewdata: .viewdata)
    }
}
