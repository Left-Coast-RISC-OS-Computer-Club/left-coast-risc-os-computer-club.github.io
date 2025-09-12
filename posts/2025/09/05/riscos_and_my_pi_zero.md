---
title: RISC OS and my Pi Zero 2W
description: |
  This post covers installing RISC OS 5.31v3 from RISC OS Direct. It features RISC OS with
  the a new network stack and with the Iris web browser.

postPath: "posts/2025/09/05/riscos_and_my_pi_zero.md"
author: Rabbit in my backyard
dateCreated: "2025-02-05"
dateModified: "2025-09-09"
datePublished: "2025-09-05"
publication: LCROCC
---

# RISC OS and my Pi Zero 2W

By Rabbit in my backyard, 2025-09-05

I'm "Rabbit in my backyard". I'm a computer enthusiast. One of my fun computers is a Raspberry Pi Zero 2W.  On my trusty Zero I have been running RISC OS 5.30 with an upgrade to Pinboard 2. I previously installed RISC OS Open 5.30 that included the WiFi support for Raspberry Pi. That allowed me to connect to my network storage and to do a minimal amount of browsing using NetSurf. I have been happy with NetSurf. It is a "distraction free" browser. Recently I've run across some research sites that require JavaScript. That's a problem with NetSurf. Iris is a RISC OS web browser that seeks to solve that problem and be able to work on the web of 2025. Iris ships in the RISC OS Direct's 5.31 image for the Pi. I figured it is time to give it a try.

My plan.

1. Download
  - RISC OS Direct Page, <https://www.riscosdev.com/direct/>
  - Download Link, <https://drive.google.com/file/d/1d-3ooaDu1Ztq0QxMGTLhEc4MXmmheYN2/view?usp=drive_link>
2. Use Pi Imager to write it to a fresh SD Card from another computer
3. Swap out old SD Card for New one and boot
4. Connect to my home network and give Iris a spin

That's a basic recipe. It is possible to upgrade a 5.30 system in place but I wanted to maintain a running system I could fall back to if this install turned out to be a problem (spoiler alert, it didn't). 

The main difference between the stable RISC OS 5.30 I installed from RISC OS Open websites and the RISC OS Direct website seems to be the version and the bells and whistles that come pre-install. This is much like the differences found in distributions of Linux. Both are RISC OS but collections of apps that are installed out of the box are differ slightly. RISC OS 5.30 came out last year and the RISC OS Direct 5.31v3 came out after the Iris Browsers will ready to ship and includes the new network stack.

My download have the 5.31v3 Image has completed as I was typing this up. Time to "flash" it to the SD Card using the Pi Imager.

Steps

1. Confirm the download was successful to my "Downloads" folder
2. Unzip the "RISCOS_DIRECT_351_Dec_24.zip" file and save the ".img" file to the downloads folder 
3. Launch the Raspberry Pi Imager
4. With the new Pi Imager running I select the Pi Zero 2W from the "Choose Pi Device" button
5. I click on the "Operating System" button, then scroll down the list and choosing "Use Custom"
6. I navigate the file dialog and find the downloaded file "RISCOS_DIRECT_351_Dec_24.img" and click on it.
7. Insert my micro SD card (I use a 32G one) into my computer via a USB micro SD Card reader
8. I click the "Choose Storage" Button and select my blank Micro SD Card
9. Click the "Next" button" and I answer "No" to the question about using the stored custom settings
10. I click through the dialog about all the data being erased from the SD Card then sit back and wait

When this completes you're I have a new SD card with the RISC OR Direct distribution on it. I plug it into the micro SD card slot of my Raspberry Pi Zero 2W. I connect up my monitor, mouse and keyboard. Finally connect up the power supply and wait for RISC OS to boot up.

When RISC OS is booting it tries to find the network. Nothing has been setup so it just waits for a timeout. I press the escape key. That brings up a dialog that indicates that the boot up process wasn't complete and give my a choice of "cancel" or "retry". Unintuitively I know I want to "cancel" as it means "cancel" out of trying to boot up with a network. RISC OS then continues to finish booting.

The first time I boot RISC OS Direct's version of RISC OS it presents me with a configuration application. The dialog box has various choices. One is the choice of network stack. I to pick "Network manager" and NOT the classic option. Making this choice causes RISC OS to restart. It comes up and I see that I have a WiFi adapter built in (WiFi symbol on the icon bar). I middle click it. Then I am presented with the dialog to setup my WiFi connection and WiFi password. I check the "remember checkbox" so it saves my WiFi password in the profile. 

At this stage I see a very busy graphic that proclaims RISC OS Direct. I see lots of icons on the Pinboard (desktop for new RISC OS users). RISC OS Direct's 5.31v3 has the Pinboard 2 preinstalled. Aside from the RISC OS Direct's description of the function keys I found the image a little overwhelming. I used !Omni to connect to the my file server and retrieve my preferred desktop image. I copied it (dragged it from the File Server) to a local folder in my Documents folder I created called Wallpaper. I then used the middle button on the Pinboard to pull up the Pinboard 2 configuration panel and set the desktop to my image. 

The icons on the Pinboard are helpful if you are new to RISC OS. They point to programs you can find in the "Apps" folder or are on icon bar. Since I like a clean desktop I'll probably remove the icons later but since I wanted to try something of the programs I've left them there for the time being.

The Iris web browser is a JavaScript friendly web browser that shipped with 5.31 in addition to NetSurf.  I gave it a try and liked it. It's not 100% there (PageFind WASM indexes didn't work on my website's search page) but it is an improvement over having no JavaScript capability. I'll be doing more experimenting with it to better understand its feature set. Right now it feels nice. I had worried it might be horribly slow on a Pi Zero 2W but I find it very usable.

I have run into one limitation with my Pi Zero 2W approach to RISC OS 5.31. It's very easy to pick a large image for the desktop image. The initial version I picked was pretty high-res and resulted it taking up most of the Pi's memory. Iris needs memory too. When I had the large desktop file installed and started browsing using Iris it wasn't long before the webpages simply appeared blank. I couldn't figure it out initially. I tried NetSurf and it had problems too. Eventually I thought about the image I had picked for the desktop. That's what lead me to suspect the memory constraints imposed by the background image's size.

I changed the desktop to a solid color background and then relaunch Iris. The pages rendered OK. It appears to be an issue with available memory. I loaded a smaller size version of the image and it looked fine on the desktop and Iris as well as NetSurf were happy rendering the web pages. Problem solved.

I still have things to explore but so far after de cluttering RISC OS Direct's 5.31 feeds pretty good. The Network manager works better than my 5.30 setup. I also found Omni was less finicky connecting to my home network's file server. I assume that is the results in improvements in the stack.

RISC OS has infrequent stable releases and I've not now been eager to try the nightly but given that that I have additional spare SD Cards I might consider that in the future. In the meantime things are improving in RISC OS in spite of some of the challenges. I will find a means of assembling additional Raspberry Pi Zero 2W RISC Machines and giving them away when I have a chance. Perhaps a core user group will emerge on the West Coast of North America.

