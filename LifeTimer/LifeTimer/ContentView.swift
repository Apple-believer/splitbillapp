import SwiftUI

struct ContentView: View {
    @State private var billAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    let tipPercentages = [0,5,10,15, 20, 25,30]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(billAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack{
                        TextField("合計", text: $billAmount)
                        Text("円")}
                        
                        .keyboardType(.decimalPad)
                    Picker("人数", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) 人")
                        }
                    }
                }
                Section(header: Text("どれくらい多めに支払いますか?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("\(totalPerPerson, specifier: "%.2f")円")
                }
            }
            .navigationBarTitle("割り勘アプリ")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
