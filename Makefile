
# Build everything, but doesn't serve
build:
	docker run --rm --volume="${PWD}:/srv/jekyll" -it \
			jekyll/jekyll:builder /bin/bash -c \
			"npm install -g less \
			&& bundle update \
			&& ./_build/compile_css.sh \
			&& jekyll build"


# Launches a shell into the jekyll container
shell:
	docker run \
		--rm --volume="${PWD}:/srv/jekyll" -it -p 4000:4000 \
		jekyll/jekyll:builder /bin/bash

# Builds everything and serves the site on localhost:4000
run:
	docker run \
		--rm --volume="${PWD}:/srv/jekyll" -it -p 4000:4000 \
		jekyll/jekyll:builder /bin/bash -c \
		"npm install -g less \
			&& bundle update \
			&& ./_build/compile_css.sh \
			&& ./_build/run_jekyll.sh"

# Builds everything, including Drafts, and serves the site on localhost:4000
drafts:
	docker run \
		--rm --volume="${PWD}:/srv/jekyll" -it -p 4000:4000 \
		jekyll/jekyll:builder /bin/bash -c \
			"npm install -g less \
			&& bundle update \
			&& ./_build/compile_css.sh \
			&& ./_build/run_jekyll.sh --drafts"

# Echos instructions to publish. Might actually do it in future, though
publish:
	echo "To publish:"
	echo "1. git add -u"
	echo "2. git commit -m\"New Post: <Post Title>\""
	echo "3. git push"

