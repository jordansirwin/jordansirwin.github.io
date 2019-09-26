---
title: Lost Mine of Phandelver
part_number: 0
tags:
- d&d
- lost-mine-of-phadelver-campaign
---

>
For centuries, rumors of buried riches have attracted treasure seekers and opportunists to the area around Phandalin, but no one has ever succeeded in locating the lost mine. In recent years, people have resettled the area. Phandalin is now a rough-and-tumble frontier town. More important, the Rockseeker brothers- a trio of dwarves- have discovered the entrance to Wave Echo Cave, and they intend to reopen the mines.
>


![Lost Mines][img_lost_mines]


_Here lies actual accounts of fictional events. Spoilers exists if you haven't yet played this adventure._

{% assign posts = site.tags['lost-mine-of-phadelver-campaign'] | sort: 'part_number' %}

{% for post in posts %}* Part {{ post.part_number }}: [{{ post.title }}]({{ post.url }})
{% endfor %}



[img_lost_mines]: \content\posts\2014-08-17-lost-mine-of-phandelver\lost-mines.jpg
