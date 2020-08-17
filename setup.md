---
title: Setup
---

> ## To do
> To prepare for this course, the following tasks need to be carried out:
> - Installation of Visual Studio Code (VSCode)
> - Link VSCode to `taz.cs.wcupa.edu`.
> - Setup GitHub account
{: .checklist}

## Installation of VSCode

- Go to [VSCode's download page][vscode] and download the correct package for your computer (Windows, Mac OS, or Linux). 
- For Windows, you can download `User Installer 64-bit` version if you only want to install VSCode into your user account.  


## Link VSCode to taz.cs.wcupa.edu

- Launch VSCode. 
- On the left bar, select the `Extension` button (the button with blocks). 

<img src="fig/setup/vscode_1.png" alt="Extension lists" style="height:400px">

- Type **remote** in the search box.
- Select the **Remote - SSH**, then click `Install`. 

<img src="fig/setup/vscode_2.png" alt="Remote SSH extension" style="height:400px">

- Once the installation finish, click on the bottom left green button. If you mouse over the button, it shows **Open a remote windows**. 
- Select **Remote-SSH: Connect to Host...**.

<img src="fig/setup/vscode_3.png" alt="Connect via remote SSH" style="height:400px">

- Select **Add New SSH Host...**

<img src="fig/setup/vscode_4.png" alt="List of possible hosts (currently empty)" style="height:400px">

- Enter the following into the **Enter SSH Connection Command** box:
- Remember to replace **USERNAME** with your `taz` account name. 

```
ssh USERNAME@taz.cs.wcupa.edu
```

<img src="fig/setup/vscode_5.png" alt="Provide SSH command to host" style="height:100px">

- Select the top option for the **SSH configuration file to update**. 

<img src="fig/setup/vscode_6.png" alt="Select destination to save configuration files" style="height:100px">

- Next, repeat the step where you clicked the **Open a remote windows** option. 
- This time, the `taz.cs.wcupa.edu` host will show up. 
- Click on this host. 

<img src="fig/setup/vscode_7.png" alt="Updated list of possible hosts" style="height:150px">

- Select `Linux` as the platform for `taz.cs.wcupa.edu`. 

<img src="fig/setup/vscode_8.png" alt="Remote host platform selection" style="height:400px">

- Enter the password for your `taz` account. 

<img src="fig/setup/vscode_9.png" alt="SSH password" style="height:100px">

- You should see the bottom left green bar now show the `taz.cs.wcupa.edu` connection. 

<img src="fig/setup/vscode_10.png" alt="Connected VSCode" style="height:50px">

- Click the top left Explorer button. 
- Click `OK`, as we want to open and view the files in `/home/YOUR_USER_NAME`. 
- You will be asked to enter the password again. 

<img src="fig/setup/vscode_11.png" alt="Remote file explorers" style="height:400px">

- You will see the files and directories in `/home/YOUR_USER_NAME` in the left windows. 
- Click `Terminal` and select `New Terminal`. 
- A `bash` shell into the VM will be opened. 

<img src="fig/setup/vscode_12.png" alt="Bash terminals" style="height:400px">

## Setup GitHub account
- If you don't already have a GitHub account, go to [GitHub web page][github] to sign up for an account. 
- It should be noted that you can link multiple email addresses to a GitHub account. Even if you
 already have a GitHub account, you might want to link the account to your WCUPA email. 

{% include links.md %}
