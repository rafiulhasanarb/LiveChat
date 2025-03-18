//
//  NotificationSettingViewModel.swift
//  LiveChat
//
//  Created by Rafiul Hasan on 3/18/25.
//

import UIKit
import Foundation
import UserNotifications


final class NotificationSettingViewModel: ObservableObject {
    
    @Published var hasPermission = false
    
    @MainActor
    func getAuthStatus() async {
        let status = await UNUserNotificationCenter.current().notificationSettings()
        switch status.authorizationStatus {
        case .authorized, .provisional, .ephemeral:
            self.hasPermission = true
        default:
            self.hasPermission = false
        }
    }
    
    @MainActor
    func requestNotificationPermission() async {
        do {
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            self.hasPermission = try await UNUserNotificationCenter.current().requestAuthorization(options: authOptions)
            UIApplication.shared.registerForRemoteNotifications()
        } catch {
            print(error.localizedDescription)
        }
    }
}
