# InclusiveFit (CSIT321) --- Team Setup & Workflow

This repository contains the Flutter project for **InclusiveFit**.

Follow this guide to clone, set up, run, and work safely in branches.

------------------------------------------------------------------------

## 1. What You Need Installed (Windows)

### A) Install Git

Download: https://git-scm.com/downloads\
Check:

    git --version

### B) Install Android Studio

Install: - Android SDK\
- Android SDK Platform-Tools\
- Android Emulator

### C) Install Flutter SDK

1.  Download Flutter (stable)
2.  Extract to: `C:\flutter`
3.  Add `C:\flutter\bin` to PATH
4.  Check:

```{=html}
<!-- -->
```
    flutter doctor

### D) Accept Android Licenses

    flutter doctor --android-licenses

------------------------------------------------------------------------

## 2. Clone the Repository

### Option A (Terminal)

    git clone https://github.com/<OWNER>/<REPO>.git
    cd <REPO>

### Option B (Android Studio)

-   Click **Get from VCS**
-   Paste repo URL
-   Click **Clone**

------------------------------------------------------------------------

## 3. Open & Run

1.  Open project in Android Studio\
2.  Run:

```{=html}
<!-- -->
```
    flutter clean
    flutter pub get

3.  Start emulator (Device Manager)\
4.  Run:

```{=html}
<!-- -->
```
    flutter run

------------------------------------------------------------------------

## 4. Team Work Split

### UI Team (Ayisha + Dua)

-   Screens layout
-   Match Figma design
-   UI improvements

### AR Team (Ashfina + Razeen)

-   AR integration
-   Camera + ARCore setup

### Features Team (Bilal + Sam)

-   Exercise database
-   Chatbot logic
-   Nutrition features

------------------------------------------------------------------------

## 5. Branch Rules

❌ Do NOT push directly to `main`\
✅ Always create your own branch

### Create Branch

    git checkout -b ui-ayisha-dua
    git checkout -b ar-ashfina-razeen
    git checkout -b features-bilal-sam

### Push Branch

    git push -u origin <branch-name>

------------------------------------------------------------------------

## 6. Daily Workflow

    git checkout <your-branch>
    git pull
    git add .
    git commit -m "Describe changes"
    git push

------------------------------------------------------------------------

## 7. Pull Request Process

1.  Go to GitHub\
2.  Click **Compare & pull request**\
3.  Target branch must be `main`\
4.  Submit for review

------------------------------------------------------------------------

## 8. Common Fix

If build fails:

    flutter clean
    flutter pub get
    flutter run

------------------------------------------------------------------------

