//
//  RoleView.swift
//  TimeTableAppStart
//
//  Created by Дарья Шубич on 14.11.23.
//

import SwiftUI


struct CheckboxRow: View {
    var role: RoleView.CheckboxRoles
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            
            Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(isSelected ? Color("LightBlueTimeTableSystem") : Color.black)
                    .onTapGesture {
                        action()
                    }

                Text(role.rawValue)
            }
        
    }
}

struct RoleView: View {
    enum CheckboxRoles: String, CaseIterable {
        case studentRole = "Студент/ка"
        case professorRole = "Преподаватель"
    }
    // value of ROLE
    @State private var selectedRole: CheckboxRoles? = .studentRole
    
    var body: some View {
        NavigationSplitView{
            VStack {
                Text("Кем Вы являетесь?")
                    .font(Font.custom("Ubuntu-Regular", size: 36))
                    .offset(y: -130)
                
                VStack(alignment: .leading){
                   ForEach(CheckboxRoles.allCases, id: \.self.rawValue) { role in
                    CheckboxRow(
                        role: role,
                        isSelected: role == selectedRole,
                        action: { selectedRole = role }
                    ).padding(4).offset(x:-50, y:-40).font(Font.custom("Ubuntu-Regular", size: 24))
                   }
                }
                
                NavigationLink(destination: selectedRole?.rawValue == "Студент/ка" ? AnyView(RegistrationView()) : AnyView(RegistrationForProffesor())){
                    Text("Далее")
                        .font(.custom("Ubuntu-Bold", size: 15))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 53)
                        .background(Color("LightBlueTimeTableSystem"))
                        .clipShape(.rect(cornerRadius: 10))
                        .offset(y: -19)
                }.padding(.top, 60)
                
                HStack{
                    Text("Уже есть аккаунт?").font(.custom("Ubuntu-Regular", size: 14))
                    // Переход На Регистрацию
                    NavigationLink(destination: LogIn()){
                        Text("Войдите!").font(.custom("Ubuntu-Regular", size: 14))
                    }
                }.offset(y: -15)
            }.padding()
                .navigationTitle("")
                .navigationBarBackButtonHidden(true)
                
        } detail: {
            
        }
    }
}

#Preview {
    RoleView()
}
