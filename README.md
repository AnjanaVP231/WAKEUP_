# WAKEUP_ Drowsiness Detection System

## 🧠 Project Overview
**WakeUp** is an intelligent **Driver Drowsiness Detection System** developed to improve road safety by detecting driver fatigue in real time.

The system detects drowsiness using **EAR (Eye Aspect Ratio)** — a computer vision technique that measures eye openness using facial landmarks. When the EAR value drops below a defined threshold for a certain time, the system triggers an alert indicating possible driver drowsiness.

The project consists of:

- 🌐 **Web Module (Admin Panel)** — Monitoring, reports, and user management  
- 📱 **Mobile App (User Module)** — Real-time drowsiness detection and alerts  

---

## ✨ Features
✅ Real-time face and eye detection  
✅ EAR-based drowsiness detection  
✅ Alert system for driver safety  
✅ Admin dashboard for monitoring  
✅ Mobile app integration  
✅ Data storage using MySQL  
✅ Machine Learning & Computer Vision based processing  

---

## 🔬 Detection Method — EAR (Eye Aspect Ratio)

### 📌 What is EAR?
EAR is a mathematical formula used to measure eye openness using facial landmark points.

If EAR value:
- **High → Eyes Open**
- **Low → Eyes Closed**

If eyes remain closed for a continuous duration → Drowsiness detected.

---

### 📐 EAR Formula
EAR = (||p2 - p6|| + ||p3 - p5||) / (2 * ||p1 - p4||)

Where p1 to p6 are eye landmark points.

---

### ⚙ How It Works
1. Detect face using OpenCV  
2. Extract facial landmarks  
3. Detect eye region  
4. Calculate EAR value  
5. Compare with threshold  
6. Trigger alert if EAR remains low  

---

## 🏗 System Architecture

User → Mobile App → Camera → EAR Detection Model → Alert System
→
MySQL Database
→
Admin Web Dashboard

---

## 🛠 Tech Stack

### 👨‍💻 Programming Languages
- Python  
- Java  
- JavaScript  

---

### 🌐 Web Technologies
- HTML5  
- CSS3  
- JavaScript  
- Django  

---

### 📱 Mobile Development
- Android Studio  
- Java (Android)

---

### 🧠 Machine Learning / Computer Vision
- OpenCV  
- NumPy  
- Pandas  
- Matplotlib  

---

### 🗄 Database
- MySQL  

---
### 💻 Development Tools
- PyCharm  
- Android Studio  
- VS Code  
- Git & GitHub  

---
## 📸 Screenshots
<img width="1920" height="794" alt="AdminHome" src="https://github.com/user-attachments/assets/1c8ecf47-20a6-4800-b31e-cc587e4878c6" />

![Ulogin](https://github.com/user-attachments/assets/55a37940-5601-4b0f-a3ae-6913544bf3e9)

---

### 📊 Future Enhancements

- Driver Behaviour Analysis
- Cloud Storage Integration
- Deep Learning Model Upgrade
- Smart Wearable Integration

---

## 🤝 Contributors
👩‍💻 **Anjana V P [AnjanaVP231](https://github.com/AnjanaVP231)**  

👩‍💻 **Vandana TTK [VandanaTTK](https://github.com/VandanaTTK)**  
