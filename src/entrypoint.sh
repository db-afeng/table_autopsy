#!/bin/bash
set -e

# Go to the frontend directory
cd frontend

# Optional: install dependencies
if [ ! -d "node_modules" ]; then
  echo "Installing frontend dependencies..."
  npm install
fi

# Build the React app
echo "Building React app with Vite..."
npm run build

# Return to root directory
cd ..

# Run the Flask app
echo "Starting Flask app..."
gunicorn -w 4 -b 0.0.0.0:8000 app:app