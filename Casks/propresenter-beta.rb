cask "propresenter-beta" do
  version "7.5,117768207"
  sha256 "4f38a33fb907cecad986ed21755207ed73d8a66dc34ffeb7d5814b17722b797d"

  url "https://renewedvision.com/downloads/propresenter/mac/ProPresenter_#{version.before_comma}_#{version.after_comma}.zip"
  name "ProPresenter"
  desc "Presentation and production application for live events"
  homepage "https://www.renewedvision.com/propresenter.php"

  livecheck do
    url "https://api.renewedvision.com/v1/pro/upgrade?platform=macos&osVersion=0&appVersion=0&buildNumber=0&includeNotes=0&channel=beta"
    strategy :page_match do |page|
      match = page.match(%r{/ProPresenter_(\d+(?:\.\d+)*)_(\d+)\.zip}i)
      "#{match[1]},#{match[2]}"
    end
  end

  auto_updates true
  conflicts_with cask: "propresenter"
  depends_on macos: ">= :mojave"

  app "ProPresenter.app"

  zap trash: [
    "~/Library/Application Support/RenewedVision/ProPresenter#{version.major}",
    "~/Library/Caches/KSCrashReports/ProPresenter #{version.major}",
    "~/Library/Caches/Sessions/ProPresenter #{version.major}",
    "~/Library/Caches/com.renewedvision.ProPresenter#{version.major}",
    "~/Library/Preferences/com.renewedvision.ProPresenter#{version.major}.plist",
    "/Library/Application Support/RenewedVision",
    "/Library/Caches/com.renewedvision.ProPresenter#{version.major}",
    "/Users/Shared/Renewed Vision Media",
  ],
      rmdir: [
        "~/Library/Application Support/RenewedVision",
        "~/Library/Caches/KSCrashReports",
        "~/Library/Caches/Sessions",
      ]
end
