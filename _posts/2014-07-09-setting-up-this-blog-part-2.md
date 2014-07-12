---
title: Setting up this blog, Part 2
---

Full Series: [Part 1][p1], [Part 2][p2], [Part 3][p3]

A great deal of time was spent getting my environment configured reasonably sane. By _environment_, I mean:

* Directory structure.
* Git.
* Writing.
* Previewing.


#### Directory Structure ####

[My directory structure can be viewed on GitHub][2] (this blog and its source is wide-open for your review). I went through a few iterations, and may still go through more, but it's a fairly standard structure for GitHub Pages + Jekyll.


#### Git ####

[GitHub Pages has great documentation available][7], but it wasn't a silver bullet. GitHub Pages requires at least two branches: One to host the blog itself and one to store the source code for generating the blog. GitHub Pages respects a magical branch called _gh-pages_ or the _master_ branch. I chose to go with _master_ for hosting and _source_ for the source code. Admittedly, I didn't get this right at first (or second, third, or tenth). 

Since I already had some source code in the _master_ branch, I needed to change things around. I created a new branch for the source code:

    git branch source --orphan

Then, I needed to cleanup my _master_ branch of everything but the _.git_ folder (well, anything that doesn't start with a period (.):

    find . -regex "\./[^.].*" -exec rm -rf {} \;
    git commit -m "insert kewl comment here"

Now I have a clean _master_ and a fully loaded _source_. I'll never do anything directly in the _master_ branch. Everything will be done in _source_, then deployed (**NOT** merged!) to _master_. These two branches will never merge together again. 


#### Writing ####

Deciding what to write with was easy, [Sublime][3]. Cross-platform, settings configured via JSON files, great plugin support, and sports a minimal UI- I love it. I currently use [pretty basic settings][6] and only two plugins: [Package Control][4] for installing packages (plugins) and [Markdown Preview][5] for lovely Markdown syntax highlights.


#### Previewing ####

As mentioned above, Markdown Preview offers some nice Markdown enhancements- including previewing via your browser. While I do use this feature when writing notes or other Markdown based documents, this blog is previewed via Jekyll for an identical match to the final product. 

To setup a local copy of the blog at _http://localhost:4000_ and automatically update modified files for real-time previewing, I use this command line from my _source_ branch:

    jekyll serve -w

I use Safari to browse the URL and refresh as I want to preview changes.


Next Part: [Jekyll and building the blog's HTML][p3].



[p1]: {% post_url 2014-07-09-setting-up-this-blog-part-1 %}
[p2]: {% post_url 2014-07-09-setting-up-this-blog-part-2 %}
[p3]: {% post_url 2014-07-11-setting-up-this-blog-part-3 %}
[2]: https://github.com/jordansirwin/jordansirwin.github.io
[3]: http://www.sublimetext.com
[4]: https://sublime.wbond.net
[5]: https://sublime.wbond.net/packages/Markdown%20Preview
[6]: https://github.com/jordansirwin/dotfiles/tree/master/sublime
[7]: https://pages.github.com
