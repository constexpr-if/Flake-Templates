projectPath=$1
projectName=$2

cp -r ./template $projectPath/$projectName
cd $projectPath
dune init project $projectName
