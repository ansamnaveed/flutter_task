**1. Dependencies used**
   - **cupertino_icons**: This is an asset repo containing the default set of icon assets used by Flutter's Cupertino widgets.
   - **get**: Used for state management.
   - **google_fonts**: Used for fonts used in the app.
   - **flutter_svg**: Used for rendering the Svgs in the app.
   - **intl**:  Used for date formatting.

**2. Project Structure**
	   lib/
		├── controllers/                # Contains controllers for managing state and view updates.
		│
		├── models/                     # Contains data models used throughout the app.
		│
		├── utils/                      # Contains shared utilities, constants, and widgets (colors, icons, images, text widgets, etc.)
		│
		├── views/                      # Contains all screens and UI components.
		│   ├── dashboard/              # Root widget containing the main dashboard and navigation.
		│   │   └── views/              # Subviews rendered inside the dashboard (bottom navigation screens).
		│   │       ├── mood/           # Main mood view and its related components.
		│   │       │   └── components/ # Custom widgets used in the mood tab.
		│   │       │
		│   │       ├── nutrition/      # Main nutrition view and its related components.
		│   │       │   └── components/ # Custom widgets used in the nutrition tab.
		│   │       │
		│   │       ├── plan/           # Main weekly plan view and its related components.
		│   │           └── components/ # Custom widgets used in the plan tab.
		│   │
		│   └── ...                     # Other app views (e.g., onboarding, login, etc.)
		│
		└── main.dart                   # App entry point.


**3. App Screenshots**
**4. App Video**
**5. App APK**
