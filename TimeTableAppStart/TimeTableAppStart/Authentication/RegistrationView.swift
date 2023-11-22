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
}
struct RegistrationView: View {
    @State private var tabState: Visibility = .hidden
    @State private var viewModel =  SignInEmailModel()
    
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
                
                TextField("E-mail", text: $viewModel.email)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 53)
                    .background(Color("lightGrayLogIn"))
                    .clipShape(.rect(cornerRadius: 10))
                    .offset(y: -77)
                
                SecureField("Пароль", text: $viewModel.password)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 53)
                    .background(Color("lightGrayLogIn"))
                    .clipShape(.rect(cornerRadius: 10))
                    .offset(y: -64)
                
                TextField("Группа (Пример: ПО9)", text: $viewModel.email)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 53)
                    .background(Color("lightGrayLogIn"))
                    .clipShape(.rect(cornerRadius: 10))
                    .offset(y: -51)

                NavigationLink(destination: RegistrationView()){
                    Text("Зарегистрироваться")
                        .font(.custom("Ubuntu-Bold", size: 15))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 53)
                        .background(Color("LightBlueTimeTableSystem"))
                        .clipShape(.rect(cornerRadius: 10))
                        .offset(y: 0)
                }
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
}

#Preview {
    RegistrationView()
}
