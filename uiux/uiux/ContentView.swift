//
//  ContentView.swift
//  Text Input
//
//  Created by Bruneau on 9/7/25.
//

import SwiftUI

struct ContentView: View {
    @State var isLoggedIn = false
    @State var hasCompletedOnboarding = false
    
    var body: some View {
        if isLoggedIn {
            TabNavigationView()
        } else if hasCompletedOnboarding {
            singInForm(isLoggedIn: $isLoggedIn)
        } else {
            OnboardingView(hasCompletedOnboarding: $hasCompletedOnboarding)
        }
    }
}

struct singInForm: View {
    
    @State var username = ""
    @State var password = ""
    @State var isSignUpMode = false
    @Binding var isLoggedIn: Bool
    
    private var isFormValid: Bool {
        !username.trimmingCharacters(in: .whitespaces).isEmpty &&
        !password.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var body: some View {
        ZStack {
            // Background
            Color.white
                .ignoresSafeArea()
            
            // Background ellipses with gradient and blur
            Ellipse()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 252/255, green: 229/255, blue: 229/255),
                            Color(red: 251/255, green: 223/255, blue: 190/255)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 180.06, height: 292)
                .position(x: 66 + 90.03, y: 208 + 146)
                .blur(radius: 100)
            
            Ellipse()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 252/255, green: 229/255, blue: 229/255).opacity(0.3),
                            Color(red: 251/255, green: 223/255, blue: 190/255).opacity(0.2)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 340.82, height: 322.08)
                .position(x: 119 + 170.41, y: 255.99 + 161.04)
                .blur(radius: 30)
            
            // Main content
            VStack(spacing: 40) {
                Spacer()
                
                // BobaDiary branding
                VStack(spacing: 16) {
                    Text("🧋")
                        .font(.system(size: 80))
                    
                    Text("BobaDiary")
                        .font(.system(size: 36, weight: .thin))
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                // Login form
                VStack(spacing: 24) {
                    // Username field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Username")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black.opacity(0.7))
                        
                        TextField("Enter your username", text: $username)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.gray, lineWidth: 0.5)
                                    )
                            )
                    }
                    
                    // Password field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Password")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black.opacity(0.7))
                        
                        SecureField("Enter your password", text: $password)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.gray, lineWidth: 0.5)
                                    )
                            )
                    }
                    
                    // Login/Sign Up button
                    Button(action: {
                        print("Username: \(username)")
                        print("Password: \(password)")
                        isLoggedIn = true
                    }) {
                        Text(isSignUpMode ? "Sign Up" : "Login")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 252/255, green: 229/255, blue: 229/255),
                                        Color(red: 251/255, green: 223/255, blue: 190/255)
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(12)
                    }
                    .disabled(!isFormValid)
                    .opacity(isFormValid ? 1.0 : 0.6)
                    
                    Button(action: {
                        isSignUpMode.toggle()
                    }) {
                        Text(isSignUpMode ? "Already have an account? Sign in" : "Don't have an account? Sign up")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.black.opacity(0.7))
                    }
                }
                .padding(.horizontal, 32)
                
                Spacer()
            }
        }
    }
}

struct TabNavigationView: View {
    @State var activeTab = 0
    
    var body: some View {
        TabView(selection: $activeTab){
            ZStack {
                Color(red: 252/255, green: 229/255, blue: 229/255)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    // Header
                    VStack(spacing: 16) {
                        Text("🧋")
                            .font(.system(size: 60))
                        
                        Text("BobaDiary")
                            .font(.system(size: 28, weight: .thin))
                            .foregroundColor(.black)
                        
                        Text("Track your bubble tea journey")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.black.opacity(0.7))
                    }
                    .padding(.top, 50)
                    
                    VStack(spacing: 20) {
                        HStack(spacing: 20) {
                            VStack {
                                Text("7")
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundColor(.black)
                                Text("This Week")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.black.opacity(0.7))
                            }
                            .frame(width: 80, height: 80)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(16)
                            
                            VStack {
                                Text("23")
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundColor(.black)
                                Text("This Month")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.black.opacity(0.7))
                            }
                            .frame(width: 80, height: 80)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(16)
                            
                            VStack {
                                Text("156")
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundColor(.black)
                                Text("Total")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.black.opacity(0.7))
                            }
                            .frame(width: 80, height: 80)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(16)
                        }
                        
                        Text("Recording...")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(Color(red: 232/255, green: 185/255, blue: 189/255))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(Color.white.opacity(0.4))
                            .cornerRadius(20)
                    }
                    
                    Spacer()
                }
            }
            .tabItem {
                Label("Home", systemImage: "calendar")
            }
            .tag(0)
            
            // New Post Tab
            ZStack {
                Color(red: 232/255, green: 185/255, blue: 189/255)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    // Header
                    VStack(spacing: 16) {
                        Text("📝")
                            .font(.system(size: 60))
                        
                        Text("New Entry")
                            .font(.system(size: 28, weight: .thin))
                            .foregroundColor(.white)
                        
                        Text("Record your bubble tea experience")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.top, 50)
                    
                    // Form Elements
                    VStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Tea Type")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                            
                            TextField("e.g., Brown Sugar Boba", text: .constant(""))
                                .textFieldStyle(PlainTextFieldStyle())
                                .padding(.horizontal, 16)
                                .padding(.vertical, 14)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white.opacity(0.2))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                        )
                                )
                        }
                        
                        Button(action: {}) {
                            Text("Save Entry")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(Color.white)
                                .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal, 32)
                    
                    Spacer()
                }
            }
            .tabItem {
                Label("New Post", systemImage: "plus")
            }
            .tag(1)
            
            // Settings Tab
            ZStack {
                Color(red: 232/255, green: 185/255, blue: 189/255)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    // Header
                    VStack(spacing: 16) {
                        Text("⚙️")
                            .font(.system(size: 60))
                        
                        Text("Settings")
                            .font(.system(size: 28, weight: .thin))
                            .foregroundColor(.white)
                        
                        Text("Customize your experience")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.top, 50)
                    
                    // Settings Options
                    VStack(spacing: 16) {
                        SettingsRow(icon: "person.circle", title: "Profile", subtitle: "Manage your account")
                        SettingsRow(icon: "bell", title: "Notifications", subtitle: "Bubble tea reminders")
                        SettingsRow(icon: "chart.bar", title: "Statistics", subtitle: "View your drinking habits")
                        SettingsRow(icon: "heart", title: "Favorites", subtitle: "Your go-to drinks")
                        SettingsRow(icon: "questionmark.circle", title: "Help & Support", subtitle: "Get assistance")
                    }
                    .padding(.horizontal, 32)
                    
                    Spacer()
                }
            }
            .tabItem {
                Label("Setting", systemImage: "gearshape.fill")
            }
            .tag(2)
            
//            ZStack {
//                Color.orange
//                VStack{
//                    Text("Edit Posts")
//
//                    Button("Go Home"){
//                        activeTab = 0
//                    }
//                }
//            }
//            .tabItem {
//                Label("Edit", systemImage: "pencil")
//            }
//            .tag(3)
            
        }
    }
}

struct OnboardingView: View {
    @Binding var hasCompletedOnboarding: Bool
    
    var body: some View {
        VStack {
            TabView{
                ZStack {
                    // White background
                    Color.white
                    Ellipse()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 252/255, green: 229/255, blue: 229/255),
                                    Color(red: 251/255, green: 223/255, blue: 190/255)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 180.06, height: 292)
                        .position(x: 66 + 90.03, y: 208 + 146)
                        .blur(radius: 80)
                    
                    Ellipse()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 252/255, green: 229/255, blue: 229/255).opacity(0.3),
                                    Color(red: 251/255, green: 223/255, blue: 190/255).opacity(0.2)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 340.82, height: 322.08)
                        .position(x: 119 + 170.41, y: 255.99 + 161.04) // Center of ellipse
                        .blur(radius: 20)
                    
                    // Main content
                    VStack(spacing: 40) {
                        // BobaDiary title
                        Text("BobaDiary")
                            .font(.system(size: 40, weight: .thin))
                            .foregroundColor(.black)
                            .padding(.top, 100)
                        
                        Spacer()
                        
                        // Bubble tea emoji
                        Text("🧋")
                            .font(.system(size: 100))
                        
                        Spacer()
                        
                        // Description text
                        Text("Always forget your own bubble tea recipe?")
                            .font(.system(size: 24, weight: .thin))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 100)
                    }
                }
                ZStack {
                    Color.white
                    //LinearGradient(gradient: Gradient(colors: [ Color(red: 252/255, green: 229/255, blue: 229/255), Color(red:251/255, green: 223/255, blue: 190/255)]),
                                   //startPoint: .topLeading,
                                   //endPoint: .bottomTrailing)
                    Ellipse()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 252/255, green: 229/255, blue: 229/255),
                                    Color(red: 251/255, green: 223/255, blue: 190/255)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 180.06, height: 292)
                        .position(x: 66 + 90.03, y: 208 + 146) // Center of ellipse
                        .blur(radius: 80)
                    
                    Ellipse()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 252/255, green: 229/255, blue: 229/255).opacity(0.3),
                                    Color(red: 251/255, green: 223/255, blue: 190/255).opacity(0.2)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 340.82, height: 322.08)
                        .position(x: 119 + 170.41, y: 255.99 + 161.04) // Center of ellipse
                        .blur(radius: 20)
                    // Main content
                    VStack(spacing: 40) {
                        // BobaDiary title
                        Text("BobaDiary")
                            .font(.system(size: 40, weight: .thin))
                            .foregroundColor(.black)
                            .padding(.top, 100)
                        
                        Spacer()
                        
                        // Bubble tea emoji
                        Text("🤔")
                            .font(.system(size: 100))
                        
                        Spacer()
                        
                        // Description text
                        Text("Want to know how many cups of bubble tea you drink in a month?")
                            .font(.system(size: 24, weight: .thin))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 100)
                    }
                }
                
                ZStack {
                    // White background
                    Color.white
                    

                    Ellipse()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 252/255, green: 229/255, blue: 229/255),
                                    Color(red: 251/255, green: 223/255, blue: 190/255)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 180.06, height: 292)
                        .position(x: 66 + 90.03, y: 208 + 146) // Center of ellipse
                        .blur(radius: 100)
                    
                    Ellipse()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 252/255, green: 229/255, blue: 229/255).opacity(0.3),
                                    Color(red: 251/255, green: 223/255, blue: 190/255).opacity(0.2)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 340.82, height: 322.08)
                        .position(x: 119 + 170.41, y: 255.99 + 161.04) // Center of ellipse
                        .blur(radius: 30)
                    
                    // Main content
                    VStack(spacing: 40) {
                        // BobaDiary title
                        Text("BobaDiary")
                            .font(.system(size: 40, weight: .thin))
                            .foregroundColor(.black)
                            .padding(.top, 100)
                        
                        Spacer()
                        
                        // Bubble tea emoji
                        Text("🤩")
                            .font(.system(size: 100))
                        
                        Spacer()
                        
                        // Description text
                        Text("Everything you want is here!")
                            .font(.system(size: 24, weight: .thin))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                        
                        // Get started button
                        Button(action: signUp) {
                            Text("get started")
                                .font(.system(size: 24, weight: .thin))
                                .foregroundColor(.black)
                                .frame(width: 198, height: 43)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.black, lineWidth: 0.5)
                                )
                        }
                        .padding(.bottom, 100)
                    }
                }
            }.tabViewStyle(.page) .cornerRadius(10).padding(.horizontal, 10)
        }.background(.black).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
           
    }
    
    func signUp() {
        print("click")
        hasCompletedOnboarding = true
    }
}

struct SettingsRow: View {
    let icon: String
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(width: 24, height: 24)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                
                Text(subtitle)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.white.opacity(0.7))
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white.opacity(0.5))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(Color.white.opacity(0.1))
        .cornerRadius(12)
    }
}

#Preview {
    ContentView()
}


