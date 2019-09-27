Blog
====

Uses Github Pages + Jekyll for the blog.

http://www.jordanirwin.net

http://www.jordansirwin.com


Drafts
------

Any posts added to the `_drafts` directory will not be published.

You can test what drafts look like locally:

    make drafts


Publishing Posts
----------------

1. Write new post in `_posts` folder
2. Execute `make run`
3. Load `localhost:4000` in browser to verify the new post looks good
4. Execute the following steps to publish to github:
      
        git add -u
        git commit -m"New Post: <POST NAME>"
        git push

5. Verify on live site post works (may take a minute for cache)


Add Images, etc
---------------

1. Add directory in `content/posts/<full slug of post>`
2. Add any images, etc the post will need
3. Link to the content using Reference-Style

        Inside post where content is rendered:
        ![alt text][reference name]

        At bottom of post:
        [reference name]: /content/posts/<slug of post>/<name of asset> "title text"