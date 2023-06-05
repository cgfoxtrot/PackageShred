# SCRUB

**Package Uninstall and Secure Scrub Script**

This script is designed to help users securely uninstall and scrub sensitive data associated with a package from a Linux system. It ensures that the package and its dependencies are thoroughly removed and any remaining data is securely deleted.

**What does this script do?**

Checks if the script is being executed with root privileges.

Prompts the user to choose whether they want to uninstall and purge a package.

If the user chooses to uninstall and purge a package:

Prompts the user to enter the name of the package to uninstall and securely scrub.

Executes the apt-get remove --purge command to uninstall and purge the specified package.

Executes the apt-get autoremove --purge command to find and securely delete any remaining data associated with the package and its dependencies.

Provides feedback to the user indicating that the package and its dependencies have been uninstalled and purged.

Prompts the user to enter the name of the package they want to securely scrub.

Executes the find command to locate any remaining data associated with the package and its dependencies.

Executes the shred command to securely delete the located files 24 times, overwriting their content.

Executes the rm command with the -P flag to physically remove the located files.

Provides feedback to the user indicating that all remaining data associated with the package and its dependencies have been securely deleted 24 times.

**Usage**

Ensure that you have root privileges to execute the script.

Download the script file to your Linux system.

Open a terminal and navigate to the directory where the script is located.

Run the following command to make the script executable:

<pre>
chmod +x script_name.sh
</pre>

Replace script_name.sh with the actual name of the script file.

Execute the script using the following command:
<pre>
sudo ./scrub.sh
</pre>
Follow the prompts to choose whether to uninstall and purge a package and provide the package name to uninstall and scrub securely.

The script will perform the necessary actions and provide feedback on the process.

**Forensics and Security**

This script aims to provide a secure method for uninstalling and scrubbing sensitive data associated with a package. Here are some considerations related to forensics and security:

Root Privileges: The script checks if it is being run with root privileges to ensure that only authorized users can perform these actions.

Package Uninstallation and Purging: 
The script utilizes the apt-get remove --purge command to completely uninstall and purge the specified package and its dependencies. 

This helps ensure that all files and configurations related to the package are removed from the system.

Secure Data Deletion: 
The script employs the shred command to securely delete any remaining data associated with the package and its dependencies. It overwrites the content of the located files 24 times, making it extremely difficult to recover any sensitive information.

Physical File Removal: 
After securely deleting the located files, the script uses the rm command with the -P flag to physically remove the files from the system. This helps prevent any potential recovery of the files through forensic techniques.

Prompted User Input: 
The script prompts the user for input to ensure that the correct package is uninstalled and scrubbed. This prevents accidental deletion of unrelated files and enhances user control.

Feedback and Confirmation: 
The script provides feedback to the user, indicating the actions performed and confirming the successful uninstallation and secure scrubbing of the package and its associated data.

It is important to note that this script is provided as-is, without any warranty or guarantee. Users should
