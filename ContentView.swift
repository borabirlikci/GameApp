import SwiftUI

struct ContentView: View {
    @State private var isProfileViewActive = false
    @State private var isSettingsViewActive = false
    @State private var showLaunch1 = true
    @State private var showLaunch2 = false

    var body: some View {
        if(!showLaunch1 && !showLaunch2){
            NavigationView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        CardView(imageName: "gasingThumbnail", title: "Gasing", description: "Cobalah untuk mengalahkan gasing lawan!", destination: GasingView())
                        CardView(imageName: "hopScotchThumbnail", title: "Dampu Bulan", description: "Rancanglah arena dampu bulan kamu sendiri!", destination: HopscotchView())
                        CardView(imageName: "comingSoonThumbnail", title: "Permainan lain akan datang", description: "", destination: ProfileView())
                    }
                    .padding()
                }
                .navigationBarTitle("Game App") // Set the title of the NavigationView
                /*.toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(destination: ProfileView(), isActive: $isProfileViewActive) {
                            Button(action: {
                                isProfileViewActive = true
                            }) {
                                Text("Profile")
                            }
                        }
                    }

                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SettingsView(), isActive: $isSettingsViewActive) {
                            Button(action: {
                                isSettingsViewActive = true
                            }) {
                                Text("Settings")
                            }
                        }
                    }
                }*/.background(content: {Image("backgroundMainPage")})
            }
        }else if(showLaunch1 && !showLaunch2){
            Image("launch1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .edgesIgnoringSafeArea(.all)
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    showLaunch1 = false
                                    showLaunch2 = true
                                }
                            }
        }else{
            Image("launch2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .edgesIgnoringSafeArea(.all)
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    showLaunch2 = false
                                }
                            }
        }
        
    }
}

struct CardView<Destination: View>: View {
    let imageName: String
    let title: String
    let description: String
    let destination: Destination

    var body: some View {
        if(description != ""){
            VStack(alignment: .leading, spacing: 20.0) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .padding(.horizontal)

                Text(title)
                    .font(.title)
                    .fontWeight(.bold)

                Text(description).font(.system(size: 14))

                Spacer()

                NavigationLink("Mainkan", destination: destination)
            }
            .frame(width: 200) // Set a fixed width for the card
            .padding()
            .background(Rectangle().foregroundColor(.white).cornerRadius(15).shadow(radius: 15))
        }
        else{
            VStack(alignment: .leading, spacing: 20.0) {

//TODO: Center align text
                
                Spacer()
                HStack{
                    Spacer()
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                

                Spacer()

                
            }
            .frame(width: 200) // Set a fixed width for the card
            .padding()
            .background(Rectangle().foregroundColor(.white).cornerRadius(15).shadow(radius: 15))

        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
