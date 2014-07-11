echo "Compiling less"
lessc ../content/self/self.less > ../content/self/self.css
echo "Building _site"
jekyll build -s .. -d ../_site
echo "Deleting master"
find ../../master -regex ".*/master/[^.].*" -exec rm -rf {} \;
echo "Copying to master"
cp -r ../_site/ ../../master/
echo "Adding to git:master"
git --git-dir=../../master/.git --work-tree=../../master/ add --all
echo "Committing to git:master"
git --git-dir=../../master/.git --work-tree=../../master/ commit -am "Deploying"
echo "Pushing to github pages:master"
git --git-dir=../../master/.git --work-tree=../../master/ push origin master
echo "Done!"