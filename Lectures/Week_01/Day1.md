# Day 1- Getting Setup

## Goals
* Setup an RSA key for sshing into the class server
* Clone the class git repository to both your server account
* Test out terminal functionality in RStudio

### Logging into the class server

Due to security reasons this will be a live demo in class.

### Setting up an RSA key

#### OS X
First, check to make sure you don't already have one
`ls -a ~/.ssh`

Make sure that there is nothing that looks like: `id_rsa` or `id_rsa.pub`

##### If you do already have one
* Run the command `cat ~/.ssh/id_rsa.pub` and copy the contents.  
* Once the key is copied, log into the server using your password and navigate to: `~/.ssh`
* Then, enter `nano authorized_keys`
* Copy the contents into the window
* Hit CTL+X to exit and save.  Press Y to confirm. Then hit enter.

##### If you do NOT already have one
If there is not, then generate a new key:

`ssh-keygen -t rsa`

Just hit enter when it asks for a passphrase:

`Enter passphrase (empty for no passphrase):`

Hit enter again to confirm.

Now, you can copy your key to the server.  Let's pretend the user name on the server is ged.

`ssh-copy-id ged@kitt.uri.edu -p 22`

You should see somthing like this:
```
The authenticity of host '131.XXX.XXX.X' can't be established.
RSA key fingerprint is XXXXXXXXXX.
Are you sure you want to continue connecting (yes/no)?
```
Enter yes, and you should see the following:


```
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
*******************************************
      ______ _______________________      *
      ___  //_/___  _/__  __/__  __/      *
      __  ,<   __  / __  /  __  /         *
      _  /| | __/ /  _  /   _  /          *
      /_/ |_| /___/  /_/    /_/           *
                                          *
The population genomics workstation of the*
Puritz Lab of Marine Evolutionary Ecology *
*******************************************


You're begining a shadowy flight into the dangerous
world of loci that might not exist.

You're a young loner on a crusade to champion the
cause of the innocent, the helpless, the powerless
in a world of bioinformatics that operates above the law.

Please be responisble using this shared resource.  Do not use
more than 20 processors or threads, total, per user.

Contact Jon Puritz (jpuritz@uri.edu) with any issues.

ged@kitt.uri.edu's password: 
```
Enter the password that's on the board and you should be set.

### Windows 

Using OpenSSH [LINK](https://phoenixnap.com/kb/generate-ssh-key-windows-10)

>1. Verify if OpenSSH Client is Installed
>      * Open the Settings panel, then click Apps.
>      * Under the Apps and Features heading, click **Optional Features**.
>      * Scroll down the list to see if **OpenSSH Client** is listed.
>            * If it’s not, click the plus-sign next to **Add a feature**.
>            * Scroll through the list to find and select **OpenSSH Client**.
>            * Finally, click **Install**.
>2. Open Command Prompt
>      * Press the **Windows key**.
>      * Type `cmd`.
>      * Under Best Match, right-click **Command Prompt**.
>      * Click **Run as Administrator**.
>      * If prompted, click **Yes** in the Do you want to allow this app to make changes to your device? pop-up.
>3. Use OpenSSH to Generate an SSH Key Pair
>      * In the command prompt, type the following:
>            * `ssh-keygen`
>      * By default, the system will save the keys to `C:\Users\your_username/.ssh/id_rsa`. You can use the default name, or you can choose more descriptive names. This can help distinguish between keys, if you are using multiple key pairs. To stick to the default option, press **Enter**.
>      * You’ll be asked to **enter a passphrase**. Hit **Enter** to skip this step.
>      * The system will generate the key pair, and display the **key fingerprint** and a **randomart image**.
>      * Open your file browser.
>      * Navigate to `C:\Users\your_username/.ssh`.
>      * You should see two files. The identification is saved in the `id_rsa` file and the public key is labeled `id_rsa.pub`. This is your SSH key pair.

To copy your key to KITT follow the instructions [here](https://www.chrisjhart.com/Windows-10-ssh-copy-id/)

Essentially run this command with your username in PowerShell: `type $env:USERPROFILE\.ssh\id_rsa.pub | ssh {IP-ADDRESS-OR-FQDN} "cat >> .ssh/authorized_keys"`


#### I no longer recommend using PuTTYgen to do this, but it will work

I reccomend following the steps in this [LINK](https://docs.joyent.com/public-cloud/getting-started/ssh-keys/generating-an-ssh-key-manually/manually-generating-your-ssh-key-in-windows) through step 8.

>To generate an SSH key with PuTTYgen, follow these steps:

> 1. Open the PuTTYgen program.
> 2. For Type of key to generate, select SSH-2 RSA.
> 3. Click the Generate button.
> 4. Move your mouse in the area below the progress bar. When the progress bar is full, PuTTYgen generates your key pair.
> 5. Type a passphrase in the Key passphrase field. Type the same passphrase in the Confirm passphrase field. You can use a key >without a passphrase, but this is not recommended.
> 6. Click the Save private key button to save the private key. Warning! You must save the private key. You will need it to connect to your machine.
> 7. Right-click in the text field labeled Public key for pasting into OpenSSH authorized_keys file and choose Select All.
> 8. Right-click again in the same text field and choose Copy.

* Once the key is copied, log into the server using your password and navigate to: `~/.ssh`
* Then, enter `nano authorized_keys`
* Copy the contents into the window
* Hit CTL+X to exit and save.  Press Y to confirm. Then hit enter.

## Using git to clone class repository

If you haven't signed up for a [github](https://github.com) account, please do so now.  Once you have a username and email address associated with you account. Log onto the class server-

Run this command:
`git config --global user.email "you@example.com"`
then
`git config --global user.name "Your Name"`

Next make a directory called `repos`
`mkdir ~/repos`

Change into that directory: `cd repos`

Now, you can clone (copy) the whole repository: `git clone https://github.com/jpuritz/BIO_594_2023.git`

You should have a directory called `BIO_594_2023` that will have all the current class materials.
We'll get into this more next week, but you can always update this repo with these two commands:
```
cd ~/repos/BIO_594_2023
git pull
```

### I also highly recommend cloning the class repository to your own laptop for reference.  
All class materials and exercises will be posted to the repository, so it will be useful to have access to it in multiple places.

I find it easiest to manage local repositories with the [Desktop Client](https://desktop.github.com)

## Other handy software 

### Text Editor
A good text editor can make a huge difference in Bioinformatics.  There are built editors (nano) on the class server that we will explore, but having one on your laptop will be useful.  Below are a few examples:

#### OS X
* [Text Wrangler](http://www.barebones.com/products/textwrangler/)

#### Windows
* [Notepad++](http://notepad-plus-plus.org/)

#### Linux
* [Gedit](https://wiki.gnome.org/Apps/Gedit)

#### Cross-Platform
* [Sublime Text](http://www.sublimetext.com/)

### Markdown Editor
All work in this class will be documented on the github repository which uses markdown formatting.  You can certainly work with a basic text editor to do this or using the web interface, but a stand alone app helps as well.

#### OS X
* [Quiver](http://happenapps.com)

#### Windows
* [MarkdownPad](http://markdownpad.com/)

#### Cross-Platform
* [Haroopad](http://pad.haroopress.com/)

## Rstudio
* Class demo

## Visual Studio Code
* [Visual Studio Code](https://code.visualstudio.com/)
* Class demo

## Further Reading (Highly Recommended)
* [Github Guide](https://guides.github.com/activities/hello-world/)
* [Markdown Guide](https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/)
* [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
