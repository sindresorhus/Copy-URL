import SwiftUI

@main
struct AppMain: App {
	@NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

	var body: some Scene {
		Settings {}
	}
}

private final class AppDelegate: NSObject, NSApplicationDelegate {
	func application(_ application: NSApplication, open urls: [URL]) {
		guard let firstUrl = urls.first else {
			NSApp.terminate(nil)
			return
		}

		let pasteboardItem = NSPasteboardItem()
		pasteboardItem.setString(firstUrl.absoluteString, forType: .URL)
		pasteboardItem.setString(firstUrl.absoluteString, forType: .string)
		NSPasteboard.general.writeObjects([pasteboardItem])

		NSApp.terminate(nil)
	}
}
