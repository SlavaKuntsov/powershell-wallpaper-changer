# Wallpaper Changer

This project allows you to change your desktop wallpaper randomly from a specified folder of images (JPG and PNG). It works on Windows and can be executed silently without displaying the PowerShell console.
## Files
##### `run_hidden.vbs`
This VBScript runs the PowerShell script `change_wallpaper.ps1` in the background without opening a console window. 
##### `change_wallpaper.ps1`
This PowerShell script randomly selects an image file (JPG or PNG) from the `wallpapers` folder and sets it as the desktop wallpaper.

## Requirements
- PowerShell (typically pre-installed on Windows).
- Windows operating system.
- Image files in `.jpg` or `.png` format placed in the `wallpapers` folder.
## Setup
1. Clone this repository:
    ```bash
    git clone https://github.com/SlavaKuntsov/powershell-wallpaper-changer.git
    cd wallpaper-changer
    ```
2. Add your image files (JPG or PNG) to the `wallpapers` folder.
3. To run the wallpaper changer, execute the `run_hidden.vbs` script using `wscript`:
    ```bash
    wscript run_hidden.vbs
    ```
   This will silently change the wallpaper to a random image from the `wallpapers` folder.
## Automating Wallpaper Change
To automate wallpaper changes at regular intervals, use the **Task Scheduler** in Windows. Here’s how you can set it up:
1. Open **Task Scheduler** (search for it in the Start menu).
2. Click on **Create Task**.
3. Under the **General** tab, name your task and set it to **Run with highest privileges**.
4. Under the **Actions** tab, click **New**, and set the action to **Start a program**.
   - In the **Program/script** field, enter:
     ```bash
     wscript.exe
     ```
   - In the **Add arguments (optional)** field, enter:
     ```bash
     "C:\path\to\your\run_hidden.vbs"
     ```
5. Under the **Triggers** tab, set the task to repeat at your desired interval (e.g., every 30 minutes).
Now, the wallpaper will automatically change at the specified interval without opening a console window.