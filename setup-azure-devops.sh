#!/bin/bash

# Azure DevOps Setup Script for SimpleWebApi
# This script helps set up Azure DevOps integration

echo "🚀 Azure DevOps Setup for SimpleWebApi"
echo "======================================"

# Check if Azure CLI is installed
if ! command -v az &> /dev/null; then
    echo "❌ Azure CLI not found. Please install it first."
    exit 1
fi

# Check if logged in
if ! az account show &> /dev/null; then
    echo "❌ Not logged into Azure. Please run 'az login' first."
    exit 1
fi

echo "✅ Azure CLI is installed and authenticated"

# Configure Azure DevOps CLI
echo "🔧 Configuring Azure DevOps CLI..."

# Try different organization names
ORGS=("pauledwards" "itsreallyluap" "itsreallyluapgmail")

for org in "${ORGS[@]}"; do
    echo "Trying organization: $org"
    if az devops project list --organization "https://dev.azure.com/$org" --output table &> /dev/null; then
        echo "✅ Found organization: $org"
        az devops configure --defaults organization="https://dev.azure.com/$org"
        break
    fi
done

# Create project
echo "📁 Creating SimpleWebApi project..."
az devops project create \
    --name "SimpleWebApi" \
    --organization "https://dev.azure.com/$org" \
    --visibility private \
    --source-control git \
    --process "Agile" \
    --description "Simple Web API project built with .NET 9"

if [ $? -eq 0 ]; then
    echo "✅ Project created successfully!"
    
    # Create repository
    echo "📚 Creating repository..."
    az repos create \
        --name "SimpleWebApi" \
        --organization "https://dev.azure.com/$org" \
        --project "SimpleWebApi"
    
    # Add remote and push
    echo "📤 Setting up Git remote and pushing code..."
    git remote add origin "https://dev.azure.com/$org/SimpleWebApi/_git/SimpleWebApi"
    git push -u origin main
    
    echo "🎉 Setup complete! Your project is now integrated with Azure DevOps."
    echo "🌐 View your project at: https://dev.azure.com/$org/SimpleWebApi"
else
    echo "❌ Failed to create project. Please create the organization manually at:"
    echo "   https://dev.azure.com/new"
    echo ""
    echo "Then run this script again."
fi