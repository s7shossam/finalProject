# 🩺 Patient Appointment App (Offline-First)

A Flutter app that allows patients to browse doctors, book/reschedule/cancel appointments, and doctors/admins to manage their schedules.  
All data is stored locally using **Hive** (offline-first, no backend).

---

## 🚀 Requirements
- Flutter SDK: 3.22.x (or higher)
- Dart: 3.x
- Android Studio / VS Code with Flutter plugin
- Android Emulator or iOS Simulator (or real device)

---

## ⚙️ Setup & Run

Clone the repo:
```bash
git clone https://github.com/s7shossam/finalProject.git
cd patient_appointment
```

Install dependencies:
```bash
flutter pub get
```

Run on emulator or device:
```bash
flutter run
```

Build release APK:
```bash
flutter build apk --release
```

---

## 💾 Local Data (Hive)
- Doctors are seeded from `assets/seed/seed_doctors.json` on **first launch**.  
- Appointments, users, and session flags are stored in Hive boxes (persist across restarts).  

---

## 🔔 Notifications
- Local notifications are scheduled **1 hour before appointment time**.  
- Cancel/reschedule automatically updates the reminder.  
- On Android: notification permission is requested automatically.  
- On iOS: user must allow notifications in the prompt.

---

## 🧩 State Management
- Using **Provider** (`ChangeNotifierProvider`) for app state.  
- `PatientProvider` manages patient data and appointments.  
- Admin/Doctor provider can be added to manage schedules.

---

## 📱 Screenshots

| Splash | Onboarding | Sign-in |
|--------|------------|---------|
| ![Splash](screenshots/splash.png) | ![Onboarding1](screenshots/onboarding1.png) | ![SignIn](screenshots/signin.png) |

| OTP | Home Tabs | Search |
|----|-----------|--------|
| ![OTP](screenshots/otp.png) | ![patient](screenshots/patient.png) | ![doctor](doctor/search.png) |

---

## ✅ Features
- Mock login with phone & OTP (accepts any 6 digits).
- Doctors list with search & filters (specialty, availability).
- Book, reschedule, cancel appointments.
- Appointment status lifecycle: pending → approved/declined → completed/canceled.
- Tabs for Upcoming / Missed / Completed appointments.
- Admin/Doctor view: approve/decline/reschedule.
- Local notifications (1 hour before appointment).
- Data persists across app restarts.

---

## 🧪 Tests
- **2–3 unit tests** for core use-cases:
  - No double-booking
  - No past bookings
  - Reschedule keeps original `createdAt`
- **1 widget test** for booking screen.

Run tests:
```bash
flutter test
```

---

## 🎥 Demo Video
➡️ Record a **2–4 min demo video** showing the flow:  
Splash → Onboarding → Login → Doctors list → Booking → Notifications → Reschedule/Cancel → Admin.  

(https://drive.google.com/drive/folders/15Rs1LaeLVqRNJwNS2jcGzT4f65gzD6JG) 

---

## 🎨 UI/UX
Based on Figma community file:  
[Patient Appointment App UX/UI Case Study](https://www.figma.com/community/file/1345271545206228664/patient-appointment-app-ux-ui-case-study)


## 🧩 Layered Architecture

The app follows a **layered clean architecture** approach:

### 1️⃣ Data Layer
- Responsible for repositories, Hive persistence, and any API integrations (if added in the future).  
- Converts raw data (e.g., JSON, database rows) into Dart models.  
- Example: `PatientRepositoryImpl`, `DoctorRepositoryImpl`.

### 2️⃣ Domain Layer
- Contains the **business logic** (entities, use cases, and abstract repository contracts).  
- Framework-independent → pure Dart.  
- Example: appointment validation rules (no double booking, no past dates).

### 3️⃣ Presentation Layer
- UI widgets + state management (Provider in this project).  
- Handles user input, reacts to state changes, and displays data from the domain layer.  
- Example: `PatientProvider`, booking screens, appointment tabs.

---

## ✅ Why This Structure?

| Approach | Advantages | Trade-offs |
|----------|------------|------------|
| **Clean Architecture** | Strong separation of concerns, scalable | Requires extra boilerplate |
| **Feature-based modules** | Each feature (auth, patient, doctor) is isolated and maintainable | Needs discipline to keep consistency |
| **Testability** | Domain and data layers are easy to test in isolation | Slightly more setup for unit tests |
| **Reusable core** | Shared utilities, themes, services live in `core/` | Core folder can become bloated if not organized |
