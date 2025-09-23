# SimpleWebApi

A simple Web API project built with .NET 9.0 and ASP.NET Core.

## Features

- Built with .NET 9.0
- ASP.NET Core Web API
- OpenAPI/Swagger support
- Minimal API design

## Getting Started

### Prerequisites

- .NET 9.0 SDK
- Visual Studio Code or Visual Studio

### Running the Application

1. Clone the repository
2. Navigate to the project directory
3. Run the application:

```bash
dotnet run
```

The API will be available at `https://localhost:7000` (or the port specified in `launchSettings.json`).

### API Documentation

Once the application is running, you can access the Swagger UI at:
- `https://localhost:7000/swagger` (HTTPS)
- `http://localhost:5000/swagger` (HTTP)

## Project Structure

```
SimpleWebApi/
├── Program.cs                 # Main application entry point
├── SimpleWebApi.csproj        # Project file
├── appsettings.json          # Application settings
├── appsettings.Development.json # Development settings
├── Properties/
│   └── launchSettings.json   # Launch configuration
└── SimpleWebApi.http         # HTTP test requests
```

## Development

This project uses:
- ASP.NET Core 9.0
- Minimal API pattern
- Built-in dependency injection
- Configuration management
- OpenAPI/Swagger documentation

## Azure DevOps Integration

This project is integrated with Azure DevOps for:
- Source control management
- CI/CD pipelines
- Work item tracking
- Package management

## Contributing

1. Create a feature branch
2. Make your changes
3. Test your changes
4. Submit a pull request