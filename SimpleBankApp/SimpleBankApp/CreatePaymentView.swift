//
//  CreatePaymentView.swift
//  SimpleBankApp
//
//  Created by Sergey on 01.01.2025.
//

import SwiftUI
import ViewModifiersModule

struct CreatePaymentView: View {
    @FocusState private var isFocused: Bool
    @State private var showingAlert = false
    @State private var showingDialog = false
    
    @State private var sum = 0.0
    @State private var recepient = ""
    @State private var inn = ""
    @State private var kpp = ""
    
    var disableButton: Bool {
        sum == 0 || recepient.isEmpty || inn.isEmpty || kpp.isEmpty
    }
        
    var body: some View {
        NavigationStack {
            Form {
                HStack {
                    Text("Сумма")
                    TextField("Сумма", value: $sum, format: .currency(code:""))
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                        .font(.title2)
                }
                .padding(10)
                
                HStack {
                    Text("Получатель")
                    TextField("Получатель", text: $recepient)
                        .focused($isFocused)
                        .font(.title3)
                }
                .padding(10)
                
                if sum != 0 && !recepient.isEmpty {
                    HStack {
                        Text("ИНН")
                        TextField("ИНН", text: $inn)
                            .keyboardType(.decimalPad)
                            .focused($isFocused)
                            .font(.title3)
                    }
                    .padding(10)
                    
                    HStack {
                        Text("КПП")
                        TextField("КПП", text: $kpp)
                            .keyboardType(.decimalPad)
                            .focused($isFocused)
                            .font(.title3)
                    }
                    .padding(10)
                }
            }
            
            Button("Создать платеж") {
                showingDialog = true
            }
            .roundedBlueStyle()
            .disabled(disableButton)
            .alert("Платеж успешно отправлен", isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text("")
            }
            .confirmationDialog("Платеж", isPresented: $showingDialog) {
                Button("Создать") { showingAlert = true }
                Button("Отменить", role: .cancel) { }
            } message: {
                Text("Подтвердите создание платежа")
            }
            
           .navigationTitle("Создать платеж")
           .toolbarBackground(.blue, for: .navigationBar)
        }
    }
}

struct CreatePaymentView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePaymentView()
    }
}
