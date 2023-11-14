//
//  LogIn.swift
//  TimeTableAppStart
//
//  Created by Дарья Шубич on 13.11.23.
//

import SwiftUI

@Observable class LogInEmailModel {
    var email = ""
    var password = ""
}

struct LogIn: View {
    @State private var viewModel = LogInEmailModel()
    var body: some View {
        VStack{
            Text("Авторизация")
                .font(Font.custom("Ubuntu-Regular", size: 36))
                .offset(y: -180)
            
            TextField("E-mail", text: $viewModel.email)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 53)
                .background(Color("lightGrayLogIn"))
                .clipShape(.rect(cornerRadius: 10))
                .offset(y: -100)
            
            SecureField("Пароль", text: $viewModel.password)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 53)
                .background(Color("lightGrayLogIn"))
                .clipShape(.rect(cornerRadius: 10))
                .offset(y: -87)
            
            Button{
                Task{
                    // Logic
                }
            }label: {
                Text("Войти")
                    .font(.custom("Ubuntu-Bold", size: 15))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 53)
                    .background(Color("LightBlueTimeTableSystem"))
                    .clipShape(.rect(cornerRadius: 10))
                    .offset(y: -19)
            }
            
            HStack{
                Text("Еще нет аккаунта?").font(.custom("Ubuntu-Regular", size: 14))
                Button{
                    Task {
                        // Logic
                    }
                }label:{
                    Text("Зарегистрируйся!").font(.custom("Ubuntu-Regular", size: 14))
                }
            }.offset(y: -15)
        }.padding()
    }
}

#Preview {
    LogIn()
}
