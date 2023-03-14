# What is the recommended OS to run the assignement?
The assignment has tested on the following:
- in Linux OS (Ubuntu version 22.04 LTS)
- window with docker Desktop install
## OS Linux
Recommend: download a ready-configured Ubuntu vdi file from https://www.osboxes.org/ubuntu/

## Virtualzation tool
If you are not running on Linux OS, you may use VirturalBox from https://www.virtualbox.org/wiki/Downloads and download the vdi, mentioned above.

### steps to add vdi to virturalbox
1. copy your .vdi file to a directory where VirtualBox will be able to access it
2. run VirtualBox and create a new virtual machine
3. choose Ubuntu Linux as the operating system and click "Next"
4. under the "Virtual Hard Disk" option, choose "Use existing hard disk". This will open the "Virtual Media Manager".
5. in the Virtual Media Manager, click the "Add" button and select the .vdi file that you copied, then click "Next"
6. configure the rest of the virtual machine as you would like it to be
7. start the virtual machine
So long as the .vdi file has not been corrupted, it will work just fine.

References: https://askubuntu.com/questions/1334269/how-to-make-a-virtual-machine-with-vdi-file

## Docker
To install docker in linux. Please follows the steps from:https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04
NOTE: follows and complete Step1 only.

After completing the above, you should able to follow the remaining steps, mentioned in the assignment.

# OS Window
To those who wish to run on OS Window, you are required to install the following:
- Docker Desktop
- Openjdk version "20" 2023-03-21  
From ReadME.md file, follow Step 1 and Step 2.

Step 3, please follow here:
- ensure the dockerfile (from the repo) is the same location as the jar file.

- run the following command:
```
# you are building an image named: portal
docker build -t portal .

# deploy with image "portal" with port 9997 to 9997
# must use port 9997
docker run -p 9997:9997 portal
```
Refer back ReadME.md for the remaining steps.