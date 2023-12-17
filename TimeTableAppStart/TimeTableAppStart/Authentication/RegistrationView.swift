//
//  RegistrationView.swift
//  TimeTableAppStart
//
//  Created by Дарья Шубич on 14.11.23.
//

import SwiftUI

@Observable class SignInEmailModel {
    var name = ""
    var email = ""
    var password = ""
    var group = ""
    var isStudent = true
}
struct RegistrationView: View {
    @State private var tabState: Visibility = .hidden
    @State private var viewModel =  SignInEmailModel()
    @State private var isGroupValid: Bool = false
    @State private var isEmailValid: Bool = false
    @State private var isNameValid: Bool = false
    @State private var isPasswordValid: Bool = false
    let fbManager = FirebaseManager()
    
    var body: some View {
        NavigationSplitView{
            VStack{
                Text("Регистрация")
                    .font(Font.custom("Ubuntu-Regular", size: 36))
                    .offset(y: -130)
                
                TextField("ФИО", text: $viewModel.name)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 53)
                    .background(Color("lightGrayLogIn"))
                    .clipShape(.rect(cornerRadius: 10))
                    .offset(y: -90)
                    .onChange(of: viewModel.name) { newValue, error in
                        checkNameIsCorrect()
                    }
                
                TextField("E-mail", text: $viewModel.email)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 53)
                    .background(Color("lightGrayLogIn"))
                    .clipShape(.rect(cornerRadius: 10))
                    .offset(y: -77)
                    .onChange(of: viewModel.email) { newValue, error in
                        if checkEmailIsCorrect(newValue) {
                            isEmailValid = true
                        }
                    }
                SecureField("Пароль", text: $viewModel.password)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 53)
                    .background(Color("lightGrayLogIn"))
                    .clipShape(.rect(cornerRadius: 10))
                    .offset(y: -64)
                    .onChange(of: viewModel.password) { newValue, error in
                        checkPasswordIsCorrect()
                    }
                TextField("Группа (Пример: ПО9)", text: $viewModel.group)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 53)
                    .background(Color("lightGrayLogIn"))
                    .clipShape(.rect(cornerRadius: 10))
                    .offset(y: -51)
                    .onChange(of: viewModel.group) { newValue, error in
                        checkGroupExists()
                    }
        
                NavigationLink(destination: LogIn()){
                        Text("Зарегистрироваться")
                            .font(.custom("Ubuntu-Bold", size: 15))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 53)
                            .background(Color("LightBlueTimeTableSystem"))
                            .clipShape(.rect(cornerRadius: 10))
                            .offset(y: 0)
                
                }.disabled(!isGroupValid || !isNameValid || !isEmailValid || !isPasswordValid).simultaneousGesture(TapGesture().onEnded{
                    if isGroupValid {
                        fbManager.registrateNewUser(user: UserData(name: viewModel.name, email: viewModel.email, password: viewModel.password, group: viewModel.group, isStudent: true))
                    }
                })

                HStack{
                    Text("Уже есть аккаунт?").font(.custom("Ubuntu-Regular", size: 14))
                    // Переход На Регистрацию
                    NavigationLink(destination: LogIn()){
                        Text("Войдите!").font(.custom("Ubuntu-Regular", size: 14))
                    }
                }.offset(y: 2)
            }
            .padding()
        }detail: {
            
        }.navigationTitle("Hello")
            .toolbar(tabState, for: .navigationBar)
    }
    func checkGroupExists(){
        fbManager.fetchGroups { groups in
            isGroupValid = groups.contains { $0.name == viewModel.group.uppercased() }
        }
    }
    func checkEmailIsCorrect(_ email: String) -> Bool {
               let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
               let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
               return emailPredicate.evaluate(with: email)
    }
    func checkPasswordIsCorrect() {
        if viewModel.password.count > 6 {
            isPasswordValid = true
        }
    }
    func checkNameIsCorrect() {
        if viewModel.name.count > 6 {
            isNameValid = true
        }
    }
}

#Preview {
    RegistrationView()
}
