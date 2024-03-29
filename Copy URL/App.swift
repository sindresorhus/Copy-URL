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
		guard let firstURL = urls.first else {
			NSApp.terminate(nil)
			return
		}

		NSPasteboard.general.prepareForNewContents()

		let pasteboardItem = NSPasteboardItem()
		pasteboardItem.setString(firstURL.absoluteString, forType: .URL)
		pasteboardItem.setString(firstURL.absoluteString, forType: .string)
		NSPasteboard.general.writeObjects([pasteboardItem])

		NSApp.terminate(nil)
	}
}
