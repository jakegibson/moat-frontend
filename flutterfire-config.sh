#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'staging', or 'prod'."
  exit 1
fi

case $1 in
  staging)
    flutterfire config \
      --project=staging-warrantyhive-16532 \
      --out=lib/firebase_options_staging.dart \
      --ios-bundle-id=com.warrantyhive.staging \
      --ios-out=ios/flavors/staging/GoogleService-Info.plist \
      --android-package-name=com.warrantyhive.staging \
      --android-out=android/app/src/staging/google-services.json
    ;;
  prod)
    flutterfire config \
      --project=warrantyhive \
      --out=lib/firebase_options.dart \
      --ios-bundle-id=com.warrantyhive.warrantyhive \
      --ios-out=ios/flavors/prod/GoogleService-Info.plist \
      --android-package-name=com.warrantyhive.warrantyhive \
      --android-out=android/app/src/prod/google-services.json
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'staging', or 'prod'."
    exit 1
    ;;
esac