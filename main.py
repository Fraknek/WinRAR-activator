import os
import sys
asci_art = """
 __          ___                            
 \ \        / (_)                           
  \ \  /\  / / _ _ __  _ __ __ _ _ __       
   \ \/  \/ / | | '_ \| '__/ _` | '__|      
    \  /\  /  | | | | | | | (_| | |         
     \/  \/   |_|_| |_|_|  \__,_|_|         
             _   _            _             
            | | (_)          | |            
   __ _  ___| |_ ___   ____ _| |_ ___  _ __ 
  / _` |/ __| __| \ \ / / _` | __/ _ \| '__|
 | (_| | (__| |_| |\ V / (_| | || (_) | |   
  \__,_|\___|\__|_| \_/ \__,_|\__\___/|_|   by Fraknek
                                            
                                            """


print(asci_art)
input1 = str(input("Enter the Winrar path (if left empty it will be default): "))
if input1 == "":
    folder_path = r"C:\Program Files\WinRAR"
else:
    folder_path = input1


exe_path = os.path.join(folder_path, "WinRAR.exe")
key_path = os.path.join(folder_path, "rarreg.key")

# Treść pliku klucza
key_content = """RAR registration data
WinRAR
Unlimited Company License
UID=4b914fb772c8376bf571
6412212250f5711ad072cf351cfa39e2851192daf8a362681bbb1d
cd48da1d14d995f0bbf960fce6cb5ffde62890079861be57638717
7131ced835ed65cc743d9777f2ea71a8e32c7e593cf66794343565
b41bcf56929486b8bcdac33d50ecf773996052598f1f556defffbd
982fbe71e93df6b6346c37a3890f3c7edc65d7f5455470d13d1190
6e6fb824bcf25f155547b5fc41901ad58c0992f570be1cf5608ba9
aef69d48c864bcd72d15163897773d314187f6a9af350808719796"""

try:

    if os.path.exists(exe_path) and os.path.isfile(exe_path):

        if os.path.exists(key_path):
            askregister = input("WinRAR is already registered, do you want to unregister it? (y/n)")
            if askregister == "y":
                os.remove(key_path)
                print("WinRAR has been unregistered")
                print("Press Enter to exit...")
        else:

            with open(key_path, "w") as f:
                f.write(key_content)
            print(f"rarreg.key is created in: {key_path}")
            print("Press Enter to exit...")
    else:
        print(f"WinRAR.exe was not found in specified path: {exe_path}")
        print("Check path and try again")
        print("Press Enter to exit...")
except PermissionError:
    print("No permission to do anything. Run This script as Administrator.")
    print("Press Enter to exit...")
except Exception as e:
    print(f"Error occured: {e}")
    print("Press Enter to exit...")
finally:
    input()