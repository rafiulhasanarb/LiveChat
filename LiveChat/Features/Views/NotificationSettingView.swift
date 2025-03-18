//
//  NotificationSettingView.swift
//  LiveChat
//
//  Created by Rafiul Hasan on 3/18/25.
//

import SwiftUI

struct NotificationSettingView: View {
    
    @StateObject var vm = NotificationSettingViewModel()
    
    var body: some View {
        VStack {
            Text("Notification permission: \(vm.hasPermission.description)")
            
            Spacer()
            
            Button {
                Task {
                    await vm.requestNotificationPermission()
                }
            } label: {
                Text("Request notification permission")
            }
            .padding()
            .buttonStyle(.bordered)
            .disabled(vm.hasPermission)
            .task {
                await vm.getAuthStatus()
            }
        }
        .padding()
    }
}

#Preview {
    NotificationSettingView()
}
