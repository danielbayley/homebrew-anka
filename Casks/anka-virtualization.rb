cask "anka-virtualization" do
  version "2.2.3.118"
  sha256 "3f8937ea296ff16e87940b541e9b8ff67ffa23fe3f8d341c9bf5ff699598f776"

  url "https://d1efqjhnhbvc57.cloudfront.net/Anka-#{version}.pkg"
  appcast "https://macupdater.net/cgi-bin/check_urls/check_url_redirect.cgi?url=https://veertu.com/downloads/anka-virtualization-latest"
  name "Anka Virtualization"
  homepage "https://veertu.com/"
  desc "Anka is software for creating and managing macOS VMs to run on top of Apple hardware and macOS. It enables the creation of or integration with existing container-like DevOps workflows. Unlike existing macOS virtualization solutions, Anka lets the macOS operating system manage virtual machines in the same manner as other native macOS applications. Anka virtualization uses macOS native Hypervisor features so it can run on any Apple hardware."

  pkg "Anka-#{version}.pkg"

  uninstall launchctl: [
    "com.veertu.nlimit",
    "com.veertu.vlaunch",
    "com.veertu.anka.lupd",
    "com.veertu.anka.ankakbd",
    "com.veertu.anka.ankanetd",
  ],script: {
      executable: "/Library/Application Support/Veertu/Anka/tools/uninstall.sh",
      args:       ["-f"],
      sudo:       true,
  }

  zap trash: [
    "~/.anka",
    "~/Library/Application Support/Veertu/Anka",
    "~/Library/Logs/Anka",
    "~/Library/Preferences/com.veertu.ankaview.plist",
    "/Library/Application Support/Veertu/Anka",
  ], rmdir: [
      "~/Library/Application Support/Veertu",
      "/Library/Application Support/Veertu",
  ]

  caveats do
    license "https://veertu.com/terms-and-conditions/"
  end
end