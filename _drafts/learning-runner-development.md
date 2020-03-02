

# Build Warnings

https://stackoverflow.com/questions/57084407/xcode-11-uilaunchimages-has-been-deprecated-use-launch-storyboards-instead-warn


NOTE: Specifically for the Unity-iPhone Target. Otherwise it's empty and you may be confused.



# Rejection #1

    From Apple
    Guideline 2.1 - Information Needed


    Before we can proceed with the review of your app, we need additional information about how it complies with Guideline 1.3.

    Next Steps

    To help us proceed with the review of your app, please provide complete and detailed responses to the following questions.

    • Does your app include third-party analytics? If so, please provide details about what data is collected for this purpose.
    • Does your app include third-party advertising? If so, please provide a link to the ad network's publicly-documented practices and policies for kids apps.
    • Will the data be shared with any third parties? If so, for what purposes and where will this information be stored?
    • Is your app collecting any user or device data for purposes beyond third-party analytics or third-party advertising? If so, please provide a complete and clear explanation of all planned uses of this data.

    Once you reply to this message in Resolution Center with the requested information, we can proceed with your app's review.



Here was my response:


    • Does your app include third-party analytics? If so, please provide details about what data is collected for this purpose.
    This app does not include any third-party analytics.

    • Does your app include third-party advertising? If so, please provide a link to the ad network's publicly-documented practices and policies for kids apps.
    This app does not include third-party (or any) advertising.

    • Will the data be shared with any third parties? If so, for what purposes and where will this information be stored?
    Data is not collected nor shared with any third-parties.

    • Is your app collecting any user or device data for purposes beyond third-party analytics or third-party advertising? If so, please provide a complete and clear explanation of all planned uses of this data.
    The app is not collecting any user or device data.

    Additionally note, per 1.3 Guidelines: "These apps must not include links out of the app..."
    In the Credits of this app, there are text links to the creators being credited- but they are NOT active/hyperlinks. There's no way to navigate to these URLs without manually opening a browser and typing in the links found in credits.



# Rejection #2

    Hello,

    Thank you for providing this information. However, upon further review we found your app appears to use IDFA.


    Guideline 1.3 - Safety - Kids Category


    We noticed that your kids app includes third-party analytics, third-party advertising or collects, transmits, or has the ability to share personal information or device information.

    Specifically, your app includes the following feature(s), contrary to guideline 1.3 of the App Store Review Guidelines:

    Third-party analytics and Third-party advertising with the ability to collect, transmit or share identifiable information (such as name, address, date of birth, email, location, photos, videos, drawing or the ability to chat), device information, or the IDFA.

    Next Steps

    To resolve this issue, please remove this functionality or revise your app so that no personally identifiable information or device information is sent to third parties.


    Best regards,

    App Store Review



https://forum.unity.com/threads/ios-advertising-identifier-rejection-faq.226187/page-5

https://forum.unity.com/threads/unityads-folder-in-ios-build-without-having-the-advertisement-package.828423/


What I did:

* Disabled HW Statistics
  * Seemed like a reasonable thing to do since I don't want any "tracking"
  * https://forum.unity.com/threads/does-disable-hw-statistics-option-also-disable-analytics.627274/
* Uninstalled UnityAds plugin via Plugin Manager
  * Per this thread: https://forum.unity.com/threads/solved-disabling-removing-unity-ads-to-comply-with-idfa-requirements.606835/
  * Didn't seem to change anything
* Manually updated `DeviceManager.mm` to eliminate unneeded methods or have them return `NULL`, `nil`, or `false` instead of doing any work regarding IDFA
  * Per this thread: https://forum.unity.com/threads/ios-advertising-identifier-rejection-faq.226187/page-5
  * And this: https://answers.unity.com/questions/1692559/ios-app-rejected-due-to-use-of-idfa-ads-identifier.html
* Deleted the UnityAds folder from XCode Project
  * Per this thread: https://forum.unity.com/threads/unityads-folder-in-ios-build-without-having-the-advertisement-package.828423/


# Rejection #3


    From Apple
    Guideline 2.3.4 - Performance - Accurate Metadata


    Your app previews include content that does not sufficiently reflect the app in use. 

    Specifically, your previews include framing around the video screen capture of the app.

    Next Steps

    To resolve this issue, please revise your app previews to only use video screen captures of the app, narration, and textual and design overlays.

So, turns out upscaling my video and screenshots wasn't going to cut it. Apple demands quality, and honestly I should have too.

What I did:

* Recorded new gameplay from my iPad Pro 11"
* Took new screenshots as well
* Created a new iMovie project using new footage and made a new App Preview
  * Same storyboard, just differnt footage
  * Now I have a native 1600x1200 video
* Published the native resolution video and screenshots to App Store Connect


But, I don't have a device that can give me native 1920x1080 and my MacBook Pro is to old to run simulators well enough to run the game (late 2013 model). So, I exported the iPad Pro's App Preview (1600x1200) as a High Resolution 4k file and used FFMPEG to rescale it to 1920x1080. This ended up cropped a bit off the sides, but fortunately it wasn't cutting into anything noticeable so it still looked "good enough".

For the curious, here's the command I used for ffmpeg:

    ffmpeg -i input.mp4 -acodec copy -crf 12 -vf scale=1920:1080,setsar=1:1 output.mp4

This was good enough for Apple too, as I got approval to release the next morning!

And, here it is:

https://apps.apple.com/us/app/learning-runner/id1481153169


Thanks for reading :D