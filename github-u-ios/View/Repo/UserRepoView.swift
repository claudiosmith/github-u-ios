//
//  UserRepoView.swift
//  github-u-ios
//
//  Created by Claudio Smith on 16/05/23.
//

import SwiftUI

struct UserRepoView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = UserViewModel()
    
    let viewdata: UserDetailViewData
    var title: String { "Repos de: \(viewdata.login)" }
    
    var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .center) {
                if case .loading = viewModel.state { UserRepoView.progressView }
                repoView
            }
            .frame(minWidth: 100,
                    maxWidth: .infinity,
                    minHeight: 200,
                    maxHeight: .infinity, alignment: .topLeading)
            
        }.onAppear {
            Task {
                await viewModel.fetchRepos(detailViewdata: viewdata)
            }
        }.alert(item: $viewModel.errorNet) { error in
            Alert(errorMessage: error.localizedDescription, action: { dismiss() })
        }
    }
    
    private var repoView: some View {
        List {
            ForEach(viewModel.reposViewData, id: \.self) { user in
                UserRepoRowView(viewdata: user)
               .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            }
            .listRowBackground(Color.black)
                .clipped()
                .cornerRadius(20)
        }
        .scrollContentBackground(.hidden)
        .background(Color.black)
    }
}

struct UserRepoView_Previews: PreviewProvider {
    static var previews: some View {
        UserRepoView(viewdata: .viewdata)
    }
}
