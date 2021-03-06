#!/usr/bin/env bash

# Include required libraries
source ./pretty-print.sh
source ./install_helper.sh


### Guard ###
print_title "Check Installer:"

if [ -z `command -v mas` ]; then
  echo "\nRequired installer not found"
  exit 1
fi

result=`mas account 2> /dev/null`
if [ $? -ne 0 ]; then
  echo "\nAccount issue, please make sure you're connected to Mac AppStore" >&2
  exit 1
fi


### Apps Install ###
echo
print_title "Install Apps\n"
mas_apps=(

  # Tools
  "1333542190"  # 1Password 7 - Password Manager
  "425424353"   # The Unarchiver
  "1116599239"  # NordVPN-IKE-Unlimited-VPN
  "935235287"   # Encrypto-Secure-Your-Files

  # Developer
  "497799835"   # Xcode
  "1496833156"  # Swift Playgrounds
  "640199958"   # Apple Developer
  "1450874784"  # Transporter

  # Productivity
  "409203825"   # Numbers
  "409201541"   # Pages
  "409183694"   # Keynote
  "1274495053"  # Microsoft-To-Do
  "1278508951"  # Trello

  # Reference
  "430255202"   # MacTracker
  "568494494"   # Pocket

  # Communication
  "1176895641"  # Spark – Email App by Readdle
  "803453959"   # Slack
  "1482454543"  # Twitter
  "1480068668"  # Messenger
  "1147396723"  # WhatsApp Desktop

  # Media
  "461369673"   # Vox-Mp3-Flac-Music-Player

  # Media Editor
  "407963104"   # Pixelmator-Classic
  "408981434"   # iMovie

  # Games
  "512204619"   # Radiant Defense

  # Safari Extensions
  "1440147259"  # AdGuard-For-Safari
)
mas_batch_install mas_apps[@]


