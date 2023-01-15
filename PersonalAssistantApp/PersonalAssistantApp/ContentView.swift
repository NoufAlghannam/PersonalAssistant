
import SwiftUI

struct ContentView: View {
    
       let Text1 : LocalizedStringKey = "Text1"
       let Text2 : LocalizedStringKey = "Text2"
       let Text3 : LocalizedStringKey = "Text3"
       let Text4 : LocalizedStringKey = "Text4"
       let Text5 : LocalizedStringKey = "Text5"
       let Text6 : LocalizedStringKey = "Text6"


    
       static let ColorPrime = Color("Prime")
       static let ColorPrime2 = Color("Prime2")

       @State private var date = Date()
    
       @State var taskList: [String] = []
       @State  var task: String = ""
    
       @State  var showingSheet = false
    
       @State var currentTaime = Date()

       
       var body: some View {
           
           NavigationView{
               
               VStack{
                   
                   
                   VStack{
                       DatePicker( "Start Date", selection: $date, displayedComponents: [.date])
                       .datePickerStyle(.graphical)
                       .offset (y: 50)
                       .accentColor(.orange)
                   }
                   .padding()

                   
                   VStack{
                       
                       List{
                           
                           ForEach(taskList,id: \.self) {
                               tasks in
                               Text(tasks)
                                .font(.system(size: 18, design: .rounded))
                                .frame(height: 45)
                               
                                .accessibilityValue(Text(tasks))
                               
                                .swipeActions(allowsFullSwipe: true) {
                                    Button(action: {
                                          guard let index = self.taskList.firstIndex(of: tasks)
                                                    
                                               else { return }
                                               self.taskList.remove(at: index)
                                         }) {
                                             Image(systemName: "trash")
                                         }
                                        
                                         .tint(Color("Prime2"))
                                   }
                           }
                           
                       }
                           .ignoresSafeArea()
                           .offset(x:-10, y:45)
                           .background(.clear)
                           .scrollContentBackground(.hidden)

                   }
                   

                   if taskList.isEmpty {
                       
                       VStack{
                           Text(Text1)
                               .font(.system(size: 19, design: .rounded))
                               .bold()
                           
                               .accessibilityLabel(Text("You don't have any appointments"))
                           
                           Text(" ")
                           Text(Text2)
                               .font(.system(size: 15, design: .rounded))
                       }
                       .offset(y:-230)
                   }
                   
                   else {
                       
                       VStack{
                           Text(Text3)
                               .bold()
                               .font(.title2)
                           
                               .accessibilityLabel(Text("Upcoming"))

                       }
                       .offset(x:-115, y:-270)
                       .padding()
                   }
                   
            
                           Button() {
                               showingSheet.toggle()
                           } label: {
                               Label("", systemImage: "plus" )
                                   .foregroundColor(Color("Prime2"))
                                   .scaleEffect(1.80)
                           }
                           .offset(x:-146 , y:-730)
                   
                   
                   
                           .sheet(isPresented: $showingSheet) {
                               
                               VStack {
               
                                   Text(Text4)
                                       .bold()
                                       .font(.title3)
                                       .offset(y:-40)
                                   
                                       .accessibilityLabel(Text("Pick a date and time"))
                                       
                                   DatePicker("", selection: $currentTaime)
                                       .offset(x:-88, y:-35)
                                       .accentColor(.orange)
                                   
                                   Text(Text5)
                                       .bold()
                                       .font(.title3)
                                       .offset(y:15)
                                   
                                       .accessibilityLabel(Text("Title"))
                                   
                                   TextField("", text: $task)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                                       .padding()
                                   
                                   Button(Text6) {
                                       add()
                                   }
                                   .font(.title2)
                                   .foregroundColor(Color("Prime"))
                                   .bold()
                                  .offset(y:30)
                                   
                                  .accessibilityLabel(Text("Save"))
     
                               }
                               .presentationDetents([.height(370)])
                   }
             

               }
        
           }
                        
       
       }
       


       func add(){
           taskList.append(task)
           task = ""
       }
    
   }




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
