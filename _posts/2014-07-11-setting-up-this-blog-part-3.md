---
title: Setting up this blog, Part 3
---

Full Series: [Part 1][p1], [Part 2][p2], [Part 3][p3]

Once I had my environment ready, I needed to actually create the blog. While blogs _can_ be a complex CMS, I didn't want mine to be. I'm a fan of recent trends for _statically compiled websites_ and GitHub Pages natively supports [Jekyll][jekyll]- it was an easy match.

#### Jekyll ####

I initially used GitHub Pages' automatic Jekyll compilation, but quickly switched to local compilation to take advantage of newer features (at the time of writing, GitHub runs Jekyll v1.5.1 while v2.1.1 is available). The features I wanted to use were: [Frontmatter Defaults][fmd] and [Plugins][plugins] (although I don't actually use any plugins yet). I disabled GitHub's by adding an empty _.nojekyll_ file to the root of my _source_ branch. 

To get started on the blog, I created a single HTML page representing the landing page. I wanted a minimal look, drawing focus directly to the content. To help visualize, I hacked in some fake posts to have content to work with. I grabbed [Bootstrap][bootstrap] to for grid layout and theming. Of course, creating a webpage layout and styling didn't _just happen_, I spent hours across days fine tuning it into something I was happy with.

With a structure in place, I needed to get posts to dynamically show instead of being hardcoded. Jekyll uses Liquid Templates to handle dynamic behavior. Here's a snippet of the loop I used:

{% raw %}
    {% for post in site.posts limit: 10 %}
    <div class="post well">
      <small>{{ post.date | date: "%B %-d, %Y"}}</small>
      <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
      {{ post.content }}
    </div>
    {% endfor %}
{% endraw %}

With the above block, I now had a webpage that could dynamically load the latest 10 posts. Jekyll expects posts to be in a folder named __posts_ and [named in a specific way][posts]. I then migrated a few posts from the old blog system using [Markdown][markdown] for content layout ([see my __posts_ folder on GitHub][ghposts]).

Now I had a website and some content, but I since I was now using Liquid to dynamically load posts I needed to _compile_ the website into a static page. Jekyll makes it easy!

    jekyll build

Boom. This created a __site_ folder with the compiled HTML ready to go. Wait, go where?

Next Part: Deploying to GitHub Pages.


[p1]: {% post_url 2014-07-09-setting-up-this-blog-part-1 %}
[p2]: {% post_url 2014-07-09-setting-up-this-blog-part-2 %}
[p3]: {% post_url 2014-07-11-setting-up-this-blog-part-3 %}
[jekyll]: http://jekyllrb.com
[fmd]: http://jekyllrb.com/docs/configuration/#frontmatter-defaults
[plugins]: http://jekyllrb.com/docs/plugins/
[source]: https://github.com/jordansirwin/jordansirwin.github.io/tree/source
[markdown]: http://daringfireball.net/projects/markdown/
[bootstrap]: http://getbootstrap.com
[posts]: http://jekyllrb.com/docs/posts/
[ghposts]: https://github.com/jordansirwin/jordansirwin.github.io/tree/source/_posts