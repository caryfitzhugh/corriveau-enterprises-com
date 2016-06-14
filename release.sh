if [[ -n $(git status --porcelain) ]]; then echo "repo is not checked in fully. Try again."; exit 1; fi

echo "<div style='display:none'>Deployed " `date` "</div>" >> index.html
echo "<div style='display:none'>" `git log -1` "</div>" >> index.html
git add -f index.html
git commit -m "Releasing"
echo "Pushing to gh-pages"
git push -f origin `git rev-parse --symbolic-full-name --abbrev-ref HEAD`:gh-pages
echo "Going backward one revision"
git reset --hard HEAD~1
