# espanso_gui

Espanso GUI is a graphical user interface for the text expander Espanso. It works by reading files in Espanso's matches directory and rendering them as tables where you can edit and save the file it was loaded from. It currently only has limited functionality meaning it WILL mess up your files so do not run it unless you have a backup of your matches directory. Depends on Espanso being installed in default directory (using the official installer is tested and works, package managers will most likely not).

Installation
---

To be able to run it and compile it you need the flutter SDK. The easiest way to install flutter and use it is through VS Code:
1. Install VS Code, Git, and the Flutter extension for VS Code.
2. Open VS Code and type Flutter in the command palette.
3. Select new project, VS Code will prmopt you to install the Flutter SDK.
4. Choose download SDK, when prompted "which Flutter template" press Esc.
5. Follow the instructions choosing install location and adding it to PATH. The path to the directory can't have any special characters and the directory can't require elevated priviliges. Stick with the default if unsure.
6. Once installed you can either open the directory containing this repo i VS Code, run flutter pub get, and then use the "Run debug" button. Or navigate to your the directory in you terminal and use "flutter run" to launch it.

The official getting started guide can be found here: https://docs.flutter.dev/get-started/install

Project state
---

### Functionality
| Feature                | state | Progress                                             |
| ---------------------- | ----- | ---------------------------------------------------- |
| Load configuration     | ✅    |                                                      |
| Save configuration     | ✅*   | Limited functionality for testing, backup before use |
| Works on Windows       | ✅    |                                                      |
| Works on Linux         | ❌    | Can't read/write config                              |
| Works on Mac           | ❌    | Can't read/write config                              |
| Selectable config path | ❌    | Currently only default directory                     |
|                        |       |                                                      |

### User interface
| Feature                    | State | Progress                                  |
| -------------------------- | ----- | ----------------------------------------- |
| Tabs for categories        | ✅    |                                           |
| List of matches            | ✅    |                                           |
| Label Field                | ✅    | Will use trigger if no label exists       |
| Trigger Field              | ✅    |                                           |
| Replace Field              | ✅    | Field works but fullscreen editor is WIP  |
| Replace Editor             | ❌    | WIP, to be ported from before rewrite     |
| Propagate Case Field       | ✅    |                                           |
| Uppercase Style Field      | ✅    |                                           |
| Trigger Only On Word Field | ✅    |                                           |
| Variables Field            | ❌    | WIP, complex to implement, will take time |
| Form Fields Field          | ❌    | WIP, complex to implement, will take time |




