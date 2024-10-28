# CropSense Mobile App

## Project Overview

CropSense is a mobile application built using Flutter for farmers and agricultural laborers. It provides a comprehensive solution for managing and monitoring various aspects of farm operations, including sensor data visualization, task management, and farm oversight.

## Technologies Used

- **Framework**: Flutter
- **State Management**: Riverpod
- **Authentication**: Custom Laravel authentication system
- **API Integration**: HTTP package for RESTful API calls

## Key Features

1. Sensor Data Visualization
   - Real-time monitoring of various sensors (TDS, humidity, light, soil moisture, temperature)
   - Historical data analysis and graphical representations

2. Farm Management
   - View farm details and associated sensors
   - Monitor crop health and growth

3. Task Management
   - Create, update, and track farm-related tasks
   - Task status updates and assignment to team members

4. User Authentication
   - Secure login system for farmers and laborers
   - Profile management and password updates

5. Weather Information
   - Integration with weather API for local forecasts
   - Alerts for extreme weather conditions

## App Structure

The app is structured with the following main components:

1. Authentication Screens:
   - Login screen with email and password fields
   - Registration for new users (if applicable)

2. Home Screen:
   - Dashboard with overview of farm status
   - Quick access to key features

3. Sensor Data Screen:
   - Real-time sensor readings
   - Historical data in graph format

4. Task Management Screen:
   - List of current tasks
   - Task creation and assignment functionality

5. Farm Details Screen:
   - Detailed information about the farm
   - List of associated sensors and their status

6. Settings Screen:
   - User profile management
   - App preferences and notifications settings

## Getting Started

1. Ensure you have Flutter installed on your development machine
2. Clone the repository
3. Install dependencies:
   ```
   flutter pub get
   ```
4. Run the app:
   ```
   flutter run
   ```

## API Integration

The app integrates with a backend API for data management and synchronization. Key API endpoints include:

- User authentication
- Sensor data retrieval
- Task management operations
- Farm information updates

## Contributing

Contributions to improve the CropSense mobile app are welcome. Please submit pull requests for any enhancements or bug fixes.

## License

This project is proprietary software. All rights reserved.
# cropsense