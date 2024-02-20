//
//  Created by Mashael Abdulrahman on 23/07/1445 AH.
//


import SwiftUI

struct OnBoardingStep {
    let image: String
    let title: String
    let description: String
}

private let onBoardingSteps: [OnBoardingStep] = [
    OnBoardingStep(image: "DefaultOzzy", title: "Who am I?", description: "Hi my name is Ozzy!\n I am exist to make your duty more fun"),
    OnBoardingStep(image: "OzzyMoods", title: "My Modes", description: "I have different modes for you to simulate, \n such as eating, sleeping, and more upcoming!")
]

struct Tutorial: View {
    
    //@AppStorage("onboardingCompleted")
    //var onboardingCompleted: Bool = false
    
    // @AppStorage("screenShow")
    //  var screenShow: Bool = false
    
    @State private var currentStep = 0
    @State private var navigateToOtherView = false
    
  //  init() {
       // UIScrollView.appearance().bounces = false
      //  print(onboardingCompleted,"🤣")
    
    
    var body: some View {
      //  if onboardingCompleted {
            // Onboarding has been completed, navigate to the main view.
           ContentView()
                //.onAppear{
                 //   onboardingCompleted = true
                 //   print(onboardingCompleted,"😀")
               // }
     //   } else {
            NavigationView {
                ZStack {
                    // Background Image
                    Image("Background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        HStack {
                            Spacer()
                            NavigationLink(destination:ContentView()){
                                Text("Skip")
                                    .padding(16)
                                    .foregroundColor(.white)
                            }}
                        
                        Spacer()
                        
                        TabView(selection: $currentStep) {
                            ForEach(0..<onBoardingSteps.count) { it in
                                VStack {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(hex: "403F3F"))
                                        .overlay(
                                            VStack {
                                                Image(onBoardingSteps[it].image)
                                                    .resizable()
                                                    .frame(width: 250, height: 250)
                                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                                
                                                Text(onBoardingSteps[it].title)
                                                    .font(.title)
                                                    .bold()
                                                    .foregroundColor(.white)
                                                    .padding(.top, 8)
                                                
                                                Divider()
                                                    .background(Color.white)
                                                    .frame(width: 150, height: 2)
                                                    .padding(.vertical, 8)
                                                
                                                Text(onBoardingSteps[it].description)
                                                    .multilineTextAlignment(.center)
                                                    .padding(.horizontal, 32)
                                                    .foregroundColor(.white)
                                                    .padding(.top, 8)
                                                
                                                HStack {
                                                    ForEach(0..<onBoardingSteps.count) { index in
                                                        Button(action: {
                                                            self.currentStep = index
                                                        }) {
                                                            Circle()
                                                                .frame(width: 10, height: 10)
                                                                .foregroundColor(index == currentStep ? Color( "#D470F6") : Color.gray)
                                                        }
                                                    }
                                                }
                                                
                                                NavigationLink(destination: ContentView(), isActive: $navigateToOtherView){
                                                    Button(action: {
                                                        if self.currentStep < onBoardingSteps.count - 1 {
                                                            self.currentStep += 1
                                                        } else {
                                                            self.navigateToOtherView = true
                                                        }
                                                    }) {
                                                        Text(currentStep < onBoardingSteps.count - 1 ? "Next" : "Get started")
                                                            .padding(16)
                                                            .frame(width: 150, height: 40)
                                                            .background(Color(hex: "D470F6"))
                                                            .cornerRadius(16)
                                                            .foregroundColor(.white)
                                                    }}
                                                .buttonStyle(PlainButtonStyle())
                                                .padding(.top, 30) // Adjust the top padding
                                            }
                                        )
                                        .padding(.vertical, 8) // Adjust the vertical padding
                                }
                                .tag(it)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    }
                    .padding()
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .onAppear {
                    UIScrollView.appearance().bounces = false
                    
                    
                }
            }
//            .onAppear{
//                
//                onboardingCompleted = true}
            
            
        
}
}
    
    struct Tutorial_Previews: PreviewProvider {
        static var previews: some View {
            Tutorial()
        }
    }

    extension Color {
        init(hex: String) {
            var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
            
            var rgb: UInt64 = 0
            
            Scanner(string: hexSanitized).scanHexInt64(&rgb)
            
            let red = Double((rgb & 0xFF0000) >> 16) / 255.0
            let green = Double((rgb & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgb & 0x0000FF) / 255.0
            
            self.init(red: red, green: green, blue: blue)
        }
    }
    



