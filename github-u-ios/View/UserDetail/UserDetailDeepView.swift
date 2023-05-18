//
//  UserDetailDeepView.swift
//  github-u-ios
//
//  Created by Claudio Smith on 16/05/23.
//

import SwiftUI

struct UserDetailDeepView: View {
    
    @State private var isLinkActive = false
    let viewdata: UserDetailViewData
    
    var body: some View {
        VStack(alignment: .center) {

            ZStack(alignment: .top) {
                Rectangle()
                    .fill(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack(alignment: .center) {
                    AsyncImage(url: viewdata.avatarUrl) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    placeholder: {
                        UserDetailDeepView.progressView
                    }
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, maxHeight: LayoutUserDetail.imageHeight,
                           alignment: .center)
                    
                    VStack(alignment: .leading) {
                        Text(viewdata.name).font(.title)
                            .padding(.bottom, 15)
                            .foregroundColor(.frontRocketColor)

                        Text("Local:").font(.callout)
                            .padding(.bottom, 0.5)
                            .foregroundColor(.gray)
                        Text(viewdata.location).font(.callout)
                            .padding(.bottom, 20)
                            .foregroundColor(.white)
                        
                        Text("Seguidores:").font(.callout)
                            .padding(.bottom, 0.5)
                            .foregroundColor(.gray)
                        Text(viewdata.followers).font(.callout)
                            .padding(.bottom, 20)
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: UserRepoView(viewdata: viewdata)) {
                            Text("Ver repositórios").font(.callout)
                        }
                        .frame(width: 137, height: 40, alignment: .center)
                        .foregroundColor(.cyan)
                        .background(Color.rowRocketColor)
                        .cornerRadius(6)
                    }
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 20))
                    .frame(maxWidth: LayoutUserDetail.width, maxHeight: LayoutUserDetail.height,
                           alignment: .topLeading)
                    .background(Color.rowColor)
                    .cornerRadius(20)
                }
            }
            .frame(maxWidth: AppUI.layerWidth, maxHeight: .infinity, alignment: .trailing)
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: LayoutUserRow.height,
               maxHeight: .infinity, alignment: .top)
        .background(.black)
    }
}

struct UserDetailDeepView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailDeepView(viewdata: .viewdata)
    }
}
