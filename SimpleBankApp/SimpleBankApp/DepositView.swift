//
//  DepositView.swift
//  SimpleBankApp
//
//  Created by Sergey on 31.12.2024.
//

import SwiftUI

struct DepositView: View {
    @State private var showingConfirmationAlert = false
    @State private var showingResultAlert = false
    
    @State private var depositSum = 0.0
    @State private var depositTerm = 12
    @State private var depositPercentage = 20
    
    @FocusState private var isFocused: Bool
    
    let depositTerms = [3, 6, 9, 12, 24]
    
    var percentForTerm: Double {
        if depositTerm == 3 {
            return 20.1
        }
        if depositTerm == 6 {
            return 21.2
        }
        if depositTerm == 9 {
            return 22.3
        }
        if depositTerm == 12 {
            return 23.1
        }
        if depositTerm == 24 {
            return 23.5
        }
        
        return 0.0
    }
    
    var sumWithPercent: Double {
        let income = (depositSum / 100 ) * percentForTerm
        return depositSum + income
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Сумма") {
                    TextField("Сумма", value: $depositSum, format: .currency(code:""))
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                }
                
                Section("Период") {
                        Picker("Месяцы", selection: $depositTerm) {
                            ForEach(depositTerms, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                
                Section("Процент по депозиту") {
                    HStack {
                        Text(percentForTerm, format: .currency(code: ""))
                        Image(systemName: "percent")
                    }
                }
                
                Section("Сумма в конце срока") {
                    Text(sumWithPercent, format: .currency(code: ""))
                }
            }
            .navigationTitle("Депозит")
            .toolbar {
                if isFocused {
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
            
            Button("Разместить депозит") {
                showingConfirmationAlert = true
            }
            .roundedBlueStyle()
        }
        .alert("Разместить депозит", isPresented: $showingConfirmationAlert) {
            Button("OK") { showingResultAlert = true }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Пожалуйста подтвердите размещение депозита")
        }
        
        .alert("Депозит успешно размещен", isPresented: $showingResultAlert) {
            Button("OK") { }
        } message: {
            Text("")
        }
    }
}

struct DepositView_Previews: PreviewProvider {
    static var previews: some View {
        DepositView()
    }
}
