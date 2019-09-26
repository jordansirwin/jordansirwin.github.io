

build:

	docker run --rm --volume="${PWD}:/srv/jekyll" -it jekyll/jekyll:builder jekyll build


shell:
	docker run \
		--rm --volume="${PWD}:/srv/jekyll" -it -p 4000:4000 \
		jekyll/jekyll:builder /bin/bash

run:

	docker run \
		--rm --volume="${PWD}:/srv/jekyll" -it -p 4000:4000 \
		jekyll/jekyll:builder /bin/bash -c \
		"npm install -g less \
			&& bundle update \
			&& ./_build/compile_css.sh \
			&& ./_build/run_jekyll.sh"

update:
	docker run --rm --volume="${PWD}:/srv/jekyll" -it jekyll/jekyll:builder bundle update

