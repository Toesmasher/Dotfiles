function i4m-git
  set -l TRACKAFFIXES "*.cpp" "*.hpp" "*.h" "*.java" "*.xsd" "*.sh" "*.xml"

  if test -z "$WORKSPACE"
    echo "No workspace"
    exit 1
  end

  pushd $WORKSPACE
  rm -fr .git
  git init

  for a in $TRACKAFFIXES
    find ./ -name $a -type f -print0 | xargs -0 git add
  end
  
  git commit -m 'Init'

  echo "CVS" >> .gitignore
  echo "*.jar" >> .gitignore

  popd
end
