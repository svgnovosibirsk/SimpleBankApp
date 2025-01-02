//
//  QRCodeView.swift
//  SimpleBankApp
//
//  Created by Sergey on 02.01.2025.
//

import SwiftUI
import CoreImage.CIFilterBuiltins
import CodeScanner

struct QRCodeView: View {
    @AppStorage("name") private var item = "Доставка"
    @AppStorage("price") private var price = "1000"
    @AppStorage("account") private var account = "2345 9876 3456 4756"
    
    @State private var isShowingScanner = false
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Наименование") {
                    TextField("Товар / Услуга", text: $item)
                        .font(.title)
                }
                
                Section("Цена") {
                    TextField("Цена", text: $price)
                        .font(.title)
                }

                Section("Номер счета") {
                    TextField("Счет", text: $account)
                        .font(.title)
                }
                
                Image(uiImage: generateQRCode(from: "\(item)\n \(price)\n\(account)"))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .navigationTitle("Заполните поля")
            .toolbar {
                Button() {
                    isShowingScanner = true
                } label: {
                    Image(systemName: "qrcode")
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Доставка\n1200\n8976253412345876", completion: handleScan)
            }
        }
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
       isShowingScanner = false

        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }

            print("Scanning is successed")

        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView()
    }
}
