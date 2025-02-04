Hiba Lahbib 
Matricola: 338930


                                            Digital Health Record Mangement
This project consists of a mobile application designed for patients and doctors to digitize and manage medical records.

MedConnect Doctor (Mobile Application)

It allows doctors to scan patients' QR codes to access their digital records, add new records, convert them to PDF format, download them, or send them via email.
MedConnect Patient (Mobile Application)

It enables patients to create an account, generate a QR code for doctors, view their medical records filled in by doctors, and convert them to PDF for downloading or sharing via email.
                                                       MedConnect
Med :  Abbrevation for Médical
Connect : Abbrevation  Refers the connection between patients  and doctors through the application

1. Technologies Used
The project is developed using Flutter, a cross-platform framework based on Dart, allowing the creation of mobile applications that run on both Android and iOS from a single codebase.
2. Used Packages
Below is the list of main packages used and their functions:
Package	Role
cupertino_icons	: Provides iOS-style icons
flutter_svg	:Displays SVG images
google_fonts:Uses Google Fonts
flutter_launcher_icons:Customizes the app icon
animated_splash_screen:Adds animation to the splash screen
google_nav_bar:Custom navigation bar
mobile_scanner :QR Code scanner
qr_flutter: QR Code generation
qr_scanner_overlay:QR Code scanner interface
pdf	: Generates PDF files
printing : Prints and exports documents
open_file:Opens files on the device
flutter_email_sender:Sends emails via the app
path_provider :Accesses device files
form_field_validator:Validates input fields
http :Communicates with remote APIs
get	: Manages state and navigation
shared_preferences:Lightweight local storage for user preferences and data
intl:Manages date and time formats

3. Reason for Choosing These Packages
Mobile Scanner & QR Code Packages: Implements a key feature of the app (scanning and generating QR codes for medical data exchange).
PDF & Printing: Ensures medical documents can be accessed in PDF format for download or sharing.
Flutter Email Sender: Allows easy sending of medical documents via email.
GetX: Provides simple and efficient state management, reducing complexity compared to alternatives like Bloc.
4. Key Decisions Made During Development
QR Code Management: QR codes were chosen to allow doctors to directly scan patient records.
PDF Conversion: Ensures medical records are portable outside the application.
Email Sending: Integrates functionality to send medical records as PDFs via email.
5. Specific Approaches to Solve Technical Challenges
Problem: State management for smooth navigation
→ Solution: GetX was used to minimize rebuilds and improve performance.
6. Method for Storing and Retrieving Data
Storage: Patient information is stored locally using Shared Preferences for persistent data.
Retrieval: The app loads locally stored data on startup, ensuring quick access without relying on a remote server.
File Storage: PDF files are generated and saved locally on the user’s device, allowing offline access.
7. Interaction with a Remote Server
The app does not communicate with a remote server and operates entirely offline.
PDF files are sent via email using flutter_email_sender, enabling users to share their medical records directly from the app.
8. Problems Encountered During Development
Problem: Remote service communication works on mobile but not on the web
Some APIs used for server communication are not well-supported on Flutter Web, causing issues when running in a browser.
Problem: QR Code scanning does not work on the web version
The mobile_scanner package relies on camera access, which is restricted or poorly supported in some configurations on Flutter Web.


















































