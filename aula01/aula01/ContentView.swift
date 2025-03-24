import SwiftUI

struct ContentView: View {
    @State private var idadeHumana: String = ""
    @State private var idadeCanina: String = ""
    @State private var erro: Bool = false

    func calcularIdade() {
        if let idade = Int(idadeHumana), idade > 0 {
            let resultado = idade * 7
            idadeCanina = "\(resultado) anos"
            erro = false
        } else {
            idadeCanina = "Digite um número válido!"
            erro = true
        }
    }

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Calculadora de Idade Canina")
                .font(.headline)
                .padding()

            TextField(
                "Digite a idade humana",
                text: $idadeHumana
            )
            .keyboardType(.numberPad)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: calcularIdade) {
                Text("Calcular")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()

            if erro {
                Text(idadeCanina)
                    .foregroundColor(.red)
                    .padding()
            } else {
                Text(idadeCanina)
                    .padding()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
