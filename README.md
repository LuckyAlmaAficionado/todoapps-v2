# Todo App V2

A modern and efficient Todo application powered by Flutter and Sqflite. Manage your tasks seamlessly with a sleek interface and powerful features.

## Features

- **Add Title to Tasks**: Organize your tasks with customizable titles for better categorization.
- **Add Task**: Quickly add new tasks with just a few taps.
- **Check Task**: Mark tasks as completed to keep track of your progress.
- **Remove Task**: Easily delete tasks you no longer need.
- **Task Status Indicator**: Instantly identify incomplete and completed projects with a visual indicator.

## Technologies Used

- Flutter: Build expressive and flexible user interfaces.
- Sqflite: A SQLite plugin for Flutter, providing a local database for task storage.

## Getting Started

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/todo-app-v2.git
   ```

2. **Navigate to the Project:**
   ```bash
   cd todo-app-v2
   ```

3. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the App:**
   ```bash
   flutter run
   ```

## Screenshots

![Screenshot 1](https://private-user-images.githubusercontent.com/79635999/294077691-4ecfffa1-a25f-48f8-b644-8f0cc6d6af28.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDQzMzkwODQsIm5iZiI6MTcwNDMzODc4NCwicGF0aCI6Ii83OTYzNTk5OS8yOTQwNzc2OTEtNGVjZmZmYTEtYTI1Zi00OGY4LWI2NDQtOGYwY2M2ZDZhZjI4LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDAxMDQlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwMTA0VDAzMjYyNFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTc3YmU0ZWRiOWI1ZjIwZWM2MjVkNDY3MzFlN2FkODNhNDY0ZGQ4YjY1MWMwZmE0MzAwMDAyOGMyN2I1NzhkZjImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.eVKBnOCaGBxF8aSUdjf5na3fiRe5NOE8Rzb6O-jL_Xg)
*Add a title to your tasks for better organization.*

![Screenshot 2]([screenshots/screenshot2.png](https://private-user-images.githubusercontent.com/79635999/294077700-c424a75a-aee6-4dd1-a735-e21682562e77.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDQzMzkwMTYsIm5iZiI6MTcwNDMzODcxNiwicGF0aCI6Ii83OTYzNTk5OS8yOTQwNzc3MDAtYzQyNGE3NWEtYWVlNi00ZGQxLWE3MzUtZTIxNjgyNTYyZTc3LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDAxMDQlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwMTA0VDAzMjUxNlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTQ3YThkYTMwNzUwOGQyNDVlYmJlYzdjNTAyZDE0MGZjODc4OGNiMTNjMzMzZjYyYjNhM2M4OTYwNDFjNWVjNTgmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.-g-Q8DSnuheO4_BuPoOJ-giX8_I0uks1uD7fPWvTc04))
*Effortlessly add, check, and remove tasks with a modern and intuitive interface.*

![Screenshot 3]([screenshots/screenshot3.png](https://private-user-images.githubusercontent.com/79635999/294077702-7b814b16-ff96-467a-bd1e-82aa9c4861a0.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDQzMzkwMTYsIm5iZiI6MTcwNDMzODcxNiwicGF0aCI6Ii83OTYzNTk5OS8yOTQwNzc3MDItN2I4MTRiMTYtZmY5Ni00NjdhLWJkMWUtODJhYTljNDg2MWEwLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDAxMDQlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwMTA0VDAzMjUxNlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTRmNTg0NTcwZjliOTJlYjZjMGM1NmE1OWM1NTk1M2Y2MTU5MWNiMDI2MmVkNGE1YWI4NDZhMjM0Mzg0MDU4OTgmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.Uxsm_eaPPhKAObK47Hgk5Dd2GL-dp-dJ6WVhnhngfAk)https://private-user-images.githubusercontent.com/79635999/294077702-7b814b16-ff96-467a-bd1e-82aa9c4861a0.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDQzMzkwMTYsIm5iZiI6MTcwNDMzODcxNiwicGF0aCI6Ii83OTYzNTk5OS8yOTQwNzc3MDItN2I4MTRiMTYtZmY5Ni00NjdhLWJkMWUtODJhYTljNDg2MWEwLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDAxMDQlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwMTA0VDAzMjUxNlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTRmNTg0NTcwZjliOTJlYjZjMGM1NmE1OWM1NTk1M2Y2MTU5MWNiMDI2MmVkNGE1YWI4NDZhMjM0Mzg0MDU4OTgmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.Uxsm_eaPPhKAObK47Hgk5Dd2GL-dp-dJ6WVhnhngfAk)
*Visual indicators help you differentiate between completed and incomplete projects.*

## Contributing

Feel free to contribute to make this Todo app even better! Whether it's fixing bugs, improving UI, or adding new features, your contributions are welcome.

1. Fork the project.
2. Create your feature branch: `git checkout -b feature/new-feature`.
3. Commit your changes: `git commit -m 'Add a new feature'`.
4. Push to the branch: `git push origin feature/new-feature`.
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
