import SwiftUI
import Foundation

struct GasingView: View {
    @State private var height = 0
    @State private var speed_value = 0
    @State private var mass = 0
    @State private var radius = 0
    @State private var showInfo = false

    var body: some View {
        VStack {
            NavigationView {
                
                ZStack {
                    
                    Image("spinningtop-background")
                        .edgesIgnoringSafeArea(.all)

                    Image("spinningtop")
                        .edgesIgnoringSafeArea(.all)
                    

                    VStack {
                        HStack{
                            Spacer()
                            Image("infoButton").padding(.horizontal, 80).onTapGesture {
                                showInfo = !showInfo
                            }
                            
                        }
                        
                        HStack() {
                            Spacer(minLength: 50)
                            HStack{
                                VStack(alignment: .center) {
                                    Text("Tinggi:  \(height)")
                                    HStack {
                                        Stepper("", value: $height, in: 1...5)
                                        Spacer(minLength: 40)
                                        
                                    }
                                }
                                Spacer()
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color.white.opacity(0.7))
                                    .shadow(radius: 15)
                            )
                            .padding()

                            Spacer(minLength: 50)

                            HStack{
                                VStack(alignment: .center) {
                                    Text("Berat:  \(mass)")
                                    HStack {
                                        Stepper("", value: $mass, in: 1...5)
                                        Spacer(minLength: 40)
                                        
                                    }
                                }
                                Spacer()
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color.white.opacity(0.7))
                                    .shadow(radius: 15)
                            )
                            .padding()

                            Spacer(minLength: 50)
                            
                            HStack{
                                VStack(alignment: .center) {
                                    Text("Radius:  \(radius)")
                                    HStack {
                                        Stepper("", value: $radius, in: 1...5)
                                        Spacer(minLength: 40)
                                        
                                    }
                                }
                                Spacer()
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color.white.opacity(0.7))
                                    .shadow(radius: 15)
                            )
                            .padding()
                            Spacer(minLength: 50)
                        }
                        .padding(.top, 200.0)
                    }
                    
                    
                    if(showInfo){
                        InfoViewText()
                    }
                    
                }
            }
            .navigationBarItems(trailing: NavigationLink(
                destination: GasingPlayView(height: height, speed: speed_value, mass: mass, radius: radius),
                label: {
                    VStack{
                        Text("Putar!").foregroundColor(.black).font(.system(size: 32)).bold().padding().background(RoundedRectangle(cornerRadius: 12).foregroundColor(Color.white.opacity(0.7))
                            .shadow(radius: 15))
                    }.padding(40)
                    
                }
            ))
        }
    }

}

struct InfoViewText: View{
    var body: some View{
        Text("Fisika pada Gasing\n\nLama putar Gasing dipengaruhi oleh tiga hal:\n\n1. Momen Inersia\n2. Friksi/Gesekan\n3. Titik Berat\n\nSemakin besar momen inersia gasing, dan semakin \nrendah titik berat gasing semakin lama gasing berputar. \nSemakin besar gesekan/friksi semakin cepat gasing jatuh. ").font(.title3).padding().background(RoundedRectangle(cornerRadius: 15).foregroundColor(.teal.opacity(0.90))).padding(40)
    }
}


struct GasingView_Previews: PreviewProvider {
    static var previews: some View {
        GasingView()
    }
}
