#!/bin/bash

echo "🚀 : Generating credentials code..."

# Define the credentials directory to use
CREDENTIALS_DIR="$SRCROOT/credentials"

# Set credentials if local script for adding environment variables exist
if [ -f "$CREDENTIALS_DIR/add_credentials_to_env.sh" ]; then
  echo "🚀 : Adding credentials to environement..."
  source "$CREDENTIALS_DIR/add_credentials_to_env.sh"
  echo "🚀 : Completed sourcing credentials"
fi

# Run code generation to make the Google Maps API key available for use while building
$SRCROOT/Pods/Sourcery/bin/sourcery --templates "$CREDENTIALS_DIR/Credentials.stencil" --sources . --output "$SRCROOT/Runner" --args mapsApiKey=$MAPS_API_KEY

echo "🚀 : Added credentials to environment"