---
title: Unity + Apple TV Remote
---

While working on tvOS support for my upcoming kids game, **Learning Runner**, I discovered mapping commands to the Apple TV Remote isn't as easy as it could be. Ultimately, I purchased [Rewired][rewired] from the Unity Asset Store to help, but I still struggled with a few things that drove me crazy. 


Once deployed to an Apple TV, using the Apple TV Remote for UI Navigation was rampant and unpredictable. It simply didn't make any sense where the selections would go based on my touches, or nothing would happen at all.

The following actions corrected the eradic navigation behaviors:

* I took time to [learn how the Unity UI Navigation works][navigation] and [see what other's have learned too][tricks]. In many cases, I setup *Explicit* navigation routes. Understanding this is paramount for controller support.

* Related to above, in some cases I simplified how my UI elements were organized in the scene. Less panels, less Layout Groups, less complexity.

* I stopped trying to map the *DPad* values from the Apple TV Remote in favor of the *Touchpad X* and *Touchpad Y* elements (these are the Rewired names, but this applies even if you're implementing your native mappings.)


Even after these changes, the Apple TV Remote still seemed to "click" UI elements unexpectantly. Toggles would check/uncheck and buttons were clicked just by navigating through them. It was always the same toggles and buttons though, so it wasn't _random_, just very odd and unexplainable.

After trial and error and frustration, I finally corrected this behavior by naming my controller *Actions* and *EventSystem* triggers exactly as [recommended in the documentation][recommended]: UIVertical, UIHorizontal, UISubmit, and UICancel. I had been reusing the non-UI actions since the mappings would be the same- thinking it would be simplier and save time. NOPE! It caused hours of frustration and debugging instead. I don't believe there's anything magical about these names, but I do think there's some overlap and mis-firing when sharing UI actions with non-UI actions.

So, after hours of debugging and trial and error and reading and frustration and thinking and WTFing... my iOS game officially also works on tvOS with controllers- including the Apple TV Remote. All that annoyance, mostly because I didn't follow directions...


*P.S. Rewired is a very valuable tool for managing controller support for Unity projects. [Check it out][rewired].*


[rewired]: https://guavaman.com/projects/rewired/
[navigation]: https://docs.unity3d.com/Manual/script-SelectableNavigation.html
[tricks]: https://www.gamasutra.com/blogs/DylanWolf/20190128/335228/Stupid_Unity_UI_Navigation_Tricks.php
[recommended]: https://guavaman.com/projects/rewired/docs/RewiredStandaloneInputModule.html


