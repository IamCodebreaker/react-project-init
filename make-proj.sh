#!/bin/bash

# Function to prompt for project name and check for existence
get_project_name() {
  while true; do
    read -p "Enter the project name: " PROJECT_NAME

    # Check if the project name is empty
    if [ -z "$PROJECT_NAME" ]; then
      echo "Project name cannot be empty. Please try again."
      continue
    fi

    # Check if a directory with the project name already exists
    if [ -d "$PROJECT_NAME" ]; then
      echo "A directory named '$PROJECT_NAME' already exists. Please choose a different name."
    else
      # If directory does not exist, break the loop
      break
    fi
  done
}

# Call the function to get a valid project name
get_project_name

# Initialize the new React Native project with the provided name
echo "Creating React Native project '$PROJECT_NAME'..."
npx react-native init "$PROJECT_NAME"

# Navigate into the project directory
cd "$PROJECT_NAME" || { echo "Failed to navigate to $PROJECT_NAME directory. Exiting."; exit 1; }

# Install dependencies using Yarn
echo "Installing dependencies..."
yarn install

# Print a success message
echo "React Native project '$PROJECT_NAME' created and dependencies installed successfully!"

