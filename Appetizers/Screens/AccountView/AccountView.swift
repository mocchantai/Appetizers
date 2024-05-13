//
//  AccountView.swift
//  Appetizers
//
//  Created by motomura on 2024/05/11.
//

import SwiftUI

struct AccountView: View {
    //MARK: - Properties
    @StateObject private var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            Form {
                //MARK: - Personal Info
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
//                    DatePicker("Birthday",
//                               selection: $viewModel.user.birthdate,
//                               displayedComponents: .date)
                    
                    DatePicker("Birthday",
                               selection: $viewModel.user.birthdate,
                               in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo,
                               displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }//: Section
                
                //MARK: - Requests
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }//: Section
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }//: Form
            .navigationTitle("👤Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }//: ToolbarItemGroup
            }
        }//: NavigationStack
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
