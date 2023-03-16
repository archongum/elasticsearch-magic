#!/bin/bash
v=( ${VERSION//./ } )
branch="${v[0]}.${v[1]}"
version="${v[0]}.${v[1]}.${v[2]}"

echo "Runtime environment"
echo -e "branch: \t\t$branch"
echo -e "version: \t\t$version"
echo -e "http_proxy: \t\t$HTTP_PROXY"
echo -e "https_proxy: \t\t$HTTPS_PROXY"

# Download source code
curl -o License.java -s https://raw.githubusercontent.com/elastic/elasticsearch/$branch/x-pack/plugin/core/src/main/java/org/elasticsearch/license/License.java

sed -i 's#this.type = type;#this.type = "platinum";#g' License.java
sed -i 's#this.expiryDate = expiryDate;#this.expiryDate = 11462254413333L;#g' License.java
sed -i 's#validate();#// validate();#g' License.java

# Build calss file
javac -cp "/usr/share/elasticsearch/lib/*:/usr/share/elasticsearch/modules/x-pack-core/*" License.java

# Build jar file
cp /usr/share/elasticsearch/modules/x-pack-core/x-pack-core-$version.jar x-pack-core-$version.jar
unzip -q x-pack-core-$version.jar -d ./x-pack-core-$version
cp -r License*.class ./x-pack-core-$version/org/elasticsearch/license/
jar -cf x-pack-core-$version.magic.jar -C x-pack-core-$version/ .
rm -rf x-pack-core-$version

# Copy output
cp License* ./output
cp x-pack-core* ./output
