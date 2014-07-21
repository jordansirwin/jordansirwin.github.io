---
title: Setting up this blog, Part 4
---

Full Series: [Part 1][p1], [Part 2][p2], [Part 3][p3], [Part 4][p4]

Deploying and hosting the blog to GitHub Pages turned out to be a larger task than I anticipated. Not because it's a complicated matter, but because I was initially confused and stuborn about how I wanted to handle it.

#### Deploying ####

[As I mentioned before][p2], I'm using GitHub Pages _User Pages_ instead the _Project Pages_ since this will be a personal website instead of a product/project specific site. This means that the _master_ branch represents the internet facing website (instead of a branch named _gh_pages_). I created a second branch called _source_ that I use for writing and development.

Considering these facts:

* I'm using _source_ for writing and _master_ for hosting.
* I have a custom bootstrap theme and compiling my own LESS.
* I'm compiling the website with Jekyll myself.


This is the workflow:

1. Write in _source_
2. Commit _source_
3. Compile LESS into CSS
4. Compile into website via Jekyll
5. Checkout _master_
6. Remove previous files from _master_ 
7. Copy compiled website from _source_ to _master_
8. Commit _master_
9. Push _master_ to GitHub

That's alot of steps. Also, if something wasn't right I would need to return to the _source_ branch and start again at Step 1. Bleh.

I've addressed this complexity in two ways: Each branch is checked out into their own folders simultaniously and I've written a shell script to handle the vast majority of the steps.

Here's my current workflow:

1. Write in _source_
2. Commit _source_
3. Execute deploy.sh


##### Folder Per Branch #####

To remove the "hassle" of switching between _source_ and _master_ during deployments, I've chosen to keep them both checked out into their own folders. I did this by having two clones of my blog, one stays in _master_ and the other stays in _source_.

![Branch Folders][folders]

This also solved another problem I was struggling with: Cleaning up the _master_ branch of old files. I couldn't find a satisfying way to remove existing files from the _master_ branch without removing important things like .git, .gitignore, etc... While likely not the best solution, here's the command I came up with for cleaning up (it's executed from the _source_ branch folder, hence the pathing): 

    find ../../master -regex ".*/master/[^.].*" -exec rm -rf {} \;

Why clean it up at all? Since _source_ and _master_ will never merge, I wanted be certain that _master_ always reflected the current state of the Jekyll compiled website. Older, deleted files shouldn't be left around. I simply just wipe out the files, copy in the new ones, and deploy (Git amazingly calculates neccessary deletes, adds, and edits correctly).


##### Shell Script #####

The most significant optimization was to wrap most steps into a shell script. Here's the current version of that script, although I expect it will evolve over time. [You can find the latest version of the script here][script].

    echo "Compiling less"
    lessc ../content/self/self.less \
      > ../content/self/self.css

    echo "Building _site"
    jekyll build -s .. -d ../_site

    echo "Deleting master"
    find ../../master \
      -regex ".*/master/[^.].*" \
      -exec rm -rf {} \;

    echo "Copying to master"
    cp -r ../_site/ ../../master/

    echo "Adding to git:master"
    git --git-dir=../../master/.git \
      --work-tree=../../master/ \
      add --all

    echo "Committing to git:master"
    git --git-dir=../../master/.git \
      --work-tree=../../master/ \
      commit -am "Deploying"

    echo "Pushing to github pages:master"
    git --git-dir=../../master/.git \
      --work-tree=../../master/ \
      push origin master
      
    echo "Done!"

The script labels the various steps, but it's important to remember that I execute it via the _source_ branch inside the source/_build folder. Because I'm in another branch and another folder, there's two things to note in this script:

1. Bash commands are given relative paths from source/_build to master.
2. Git commands are using --git-dir and --work-tree to indicate operations are for the _master_ branch.

Because of this script I can write and commit as needed, then run a single shell command to compile, synchronize with _master_, and deploy.


#### Previewing ####

Now that I can write and deploy, I realized the need to preview all of my changes (new content or website changes). Since my deploy script did everything I needed, I simply copied it and removed the steps relevant to deployment only. Here's my test.sh shell script in current form:

    echo "Compiling less"
    lessc ../content/self/self.less \
      > ../content/self/self.css

    echo "Building and Hosting _site"
    jekyll serve \
      --config ../_config.yml,../_config-dev.yml \
      -w -s .. \
      -d ../_site

Main differences from deploy.sh:

* Jekyll is called with the _serve_ argument instead of _build_
* Does not copy to master, commit, or push to GitHub Pages

One I run this script, I can preview my blog just as it would look on GitHub Pages by visiting http://localhost:4000 in my browser.


Next Part: Custom DNS via Hover


[p1]: {{ site.url }}{% post_url 2014-07-09-setting-up-this-blog-part-1 %}
[p2]: {{ site.url }}{% post_url 2014-07-09-setting-up-this-blog-part-2 %}
[p3]: {{ site.url }}{% post_url 2014-07-11-setting-up-this-blog-part-3 %}
[p4]: {{ site.url }}{% post_url 2014-07-20-setting-up-this-blog-part-4 %}
[folders]: {{ site.url }}/content/posts/2014-07-20-setting-up-this-blog-part-4/branch_folders.jpg
[ghpages]: https://pages.github.com
[script]: https://github.com/jordansirwin/jordansirwin.github.io/blob/source/_build/deploy.sh