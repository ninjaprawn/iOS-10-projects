//
//  IntentHandler.swift
//  Intent
//
//  Created by George Dan on 15/06/2016.
//  Copyright © 2016 ninjaprawn. All rights reserved.
//

import Intents
import Darwin
import UIKit
import QuartzCore

// As an example, this class is set up to handle the Workout intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

struct Location : OptionSet {
	let rawValue: Int
	static let LS = Location(rawValue: 1 << 0)
	static let HS = Location(rawValue: 1 << 1)
}

extension UIImage {
	
	class func imageWithColor(color: UIColor) -> UIImage {
		
		let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
		UIGraphicsBeginImageContext(rect.size)
		let context = UIGraphicsGetCurrentContext()
		
		context!.setFillColor(color.cgColor)
		context!.fill(rect)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		return image!
		
	}
	
}

class IntentHandler: INExtension, INSendMessageIntentHandling {
    
    override func handler(for intent: INIntent) -> AnyObject {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
    // MARK: - INSendMessageIntentHandling
	
	
//	func confirm(sendMessage: INSendMessageIntent, completion: (INSendMessageIntentResponse) -> Void) {
//		
//	}
	
	func setDarkWallpaper() {
		
		let handle = dlopen("/System/Library/PrivateFrameworks/SpringBoardUI.framework/SpringBoardUI", RTLD_NOW)
		let symbol = dlsym(handle, "SBSUIWallpaperSetImageAsWallpaperForLocations")
		typealias signature = @convention(c) (AnyObject, NSInteger) -> ()
		let options: Location = [.LS, .HS]
		unsafeBitCast(symbol, to: signature.self)(UIImage.imageWithColor(color: UIColor.green()), options.rawValue)
		
	}
	
	func handle(sendMessage: INSendMessageIntent, completion: (INSendMessageIntentResponse) -> Void) {
		
		let userActivity = NSUserActivity(activityType: NSStringFromClass(INSendMessageIntent))
		print(sendMessage.content)
		self.setDarkWallpaper()
//		if sendMessage.content!.lowercased().contains("set") && sendMessage.content!.lowercased().contains("wallpaper") && sendMessage.content!.lowercased().contains("to") && sendMessage.content!.lowercased().contains("dark") && sendMessage.recipients![0] == "Apple" {
//			print("YAY")
//			let response = INSendMessageIntentResponse(code: .success, userActivity: userActivity)
//			completion(response)
//		} else {
			let response = INSendMessageIntentResponse(code: .success, userActivity: userActivity)
			completion(response)
//		}

	}
	
//	func resolveContent(forSendMessage: INSendMessageIntent, with: (INStringResolutionResult) -> Void) {
//		let contentResult = INStringResolutionResult.success(with: "Memes")
//		with(contentResult)
//	}
	
//	func resolveGroupName(forSendMessage: INSendMessageIntent, with: (INStringResolutionResult) -> Void) {
//		print("Group Name")
//	}
//	
//	func resolveRecipients(forSendMessage: INSendMessageIntent, with: ([INPersonResolutionResult]) -> Void) {
//		print("Receipients")
//	}
//	
//	func resolveSender(forSendMessage: INSendMessageIntent, with: (INPersonResolutionResult) -> Void) {
//		print("Sender")
//	}
//	
//	func resolveServiceName(forSendMessage: INSendMessageIntent, with: (INStringResolutionResult) -> Void) {
//		print("ServiceName")
//	}
	
}

