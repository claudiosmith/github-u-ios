//
//  UserView.swift
//  github-u-ios
//
//  Created by Claudio Smith on 15/05/23.
//

import SwiftUI

struct UserView: View {
    
    @StateObject var viewModel = UserViewModel()
    
    var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea(
            )
            VStack(alignment: .center) {
                if case .loading = viewModel.state { UserView.progressView }
                userView
            }
            .frame(minWidth: 100,
                    maxWidth: .infinity,
                    minHeight: 200,
                    maxHeight: .infinity, alignment: .topLeading)
            
        }.onAppear {
            Task {
                await viewModel.fetchUsers()
            }
        }.alert(item: $viewModel.errorNet) { error in
            Alert(errorMessage: error.localizedDescription, action: {})
        }
    }
    
    private var userView: some View {
        List {
            ForEach(viewModel.usersViewData, id: \.self) { user in
                UserRowView(viewdata: user)
                    .overlay(NavigationLink(destination: UserDetailView(userViewdata: user), label: {
                        EmptyView()
                    }).opacity(0.0))
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

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
