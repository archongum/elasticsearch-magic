# elasticsearch-magic

## Build

```shell
git clone https://github.com/archongum/elasticsearch-magic.git
cd elasticsearch-magic

version=7.17.8
sudo rm -rf output/ && bash run.sh $version

# Magic jar
cp output/x-pack-core-$version.magic.jar x-pack-core-$version.jar
```
