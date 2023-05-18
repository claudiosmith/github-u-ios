//
//  UserDetailView.swift
//  github-u-ios
//
//  Created by Claudio Smith on 15/05/23.
//

import SwiftUI

struct UserDetailView: View {
    
    @StateObject var viewModel = UserViewModel()
    @Environment(\.dismiss) private var dismiss
    
    let userViewdata: UserViewData
    var title: String { userViewdata.login }
    
    var body: some View {
        
            ZStack(alignment: .top) {
                Color.black.ignoresSafeArea()
                VStack(alignment: .center) {
                    if case .loading = viewModel.state { UserDetailView.progressView }
                    UserDetailDeepView(viewdata: viewModel.detailViewData)
                }
                .padding(.top, 10)
                .frame(minWidth: 100,
                        maxWidth: .infinity,
                        minHeight: 200,
                       maxHeight: .infinity, alignment: .top)
                
            }.onAppear {
                Task {
                    await viewModel.fetchUserDetail(userViewdata: userViewdata)
                }
            }.alert(item: $viewModel.errorNet) { error in
                Alert(errorMessage: error.localizedDescription, action: { dismiss() })
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userViewdata: .viewdata)
    }
}

