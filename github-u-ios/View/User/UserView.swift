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
            Color.black.ignoresSafeArea()
            VStack(alignment: .center) {
                
                if case .loading = viewModel.state {
                    ProgressView().progressViewStyle(.automatic)
                        .frame(width: 40, height: 40, alignment: .center)
                        .tint(.white)   
                }
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
            Alert(title: Text("Erro"),
                  message: Text(error.localizedDescription),
                  dismissButton: .cancel())
        }
    }
    
    private var userView: some View {
        List {
            ForEach(viewModel.usersViewData, id: \.self) { user in
                
//                NavigationLink("Link 1", destination: UserDetailView(userViewdata: user))
                UserRowView(viewdata: user)
                    .overlay(NavigationLink(destination: UserDetailView(userViewdata: user), label: {
                        EmptyView()
                    }).opacity(0.0))
                
//                NavigationLink(destination: UserDetailView(userViewdata: user)) {
//
//                    UserRowView(viewdata: user)
//                }
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
extension NavigationLink where Label == EmptyView, Destination == EmptyView {

   static var empty: NavigationLink {
       self.init(destination: EmptyView(), label: { EmptyView() })
   }
}
