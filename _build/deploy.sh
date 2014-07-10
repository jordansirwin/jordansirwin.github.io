echo "Building..."
jekyll build -s .. -d ../_site
echo "Deleting..."
find ../../master -regex ".*/master/[^.].*" -exec rm -rf {} \;
echo "Copying..."
cp -r ../_site/ ../../master/
echo "Adding..."
git --git-dir=../../master/.git --work-tree=../../master/ add --all
echo "Committing..."
echo git --git-dir=../../master/.git --work-tree=../../master/ status
git --git-dir=../../master/.git --work-tree=../../master/ commit -am "Deploying"
echo "Pushing..."
git --git-dir=../../master/.git --work-tree=../../master/ push origin master
echo "Done!"