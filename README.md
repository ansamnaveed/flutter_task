**1. Dependencies used**
   - **cupertino_icons**: This is an asset repo containing the default set of icon assets used by Flutter's Cupertino widgets.
   - **get**: Used for state management.
   - **google_fonts**: Used for fonts used in the app.
   - **flutter_svg**: Used for rendering the Svgs in the app.
   - **intl**:  Used for date formatting.

**2. Project Structure**\n
	   lib/
       ├── models/ (Contains models of data used to show in the app.)
       ├── views/ (Contains screens/views of the app.)
             ├── dashbooard/ (Contains the main/root widget of the app like the main view where the subviews are rendered (Bottom Bar).)
                     ├── views/ (Contains the subviews of the main dashooard wiew.)
                           ├── mood/ (Contains the main mood view and its components.)
                                 ├── components/ (Contains the components and custom widgets used un the mood tab.)
                           ├── nutrition/ (Contains the main nutrition view and its components.)
                                 ├── components/ (Contains the components and custom widgets used un the nutrition tab.)
                           ├── plan/ (Contains the main weekly plan view and its components.)
                                 ├── components/ (Contains the components and custom widgets used un the plan tab.)
       ├── controllers/ (Contains controllers for managing the views and updation.)
 	     ├── utils/ (Contains publicly used components and widgets in the app. Like colors, images, icons, images and common text widget.)

**3. App Screenshots**
**4. App Video**
**5. App APK**
