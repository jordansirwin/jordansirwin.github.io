echo "Building..."
jekyll build -s .. -d ../_site
echo "Copying..."
cp -r ../_site/ ../../master/
git --git-dir=../../master/.git add --all
git --git-dir=../../master/.git status
echo git --git-dir=../../master/.git commit -am "Deploying"
echo git --git-dir=../../master/.git push origin master