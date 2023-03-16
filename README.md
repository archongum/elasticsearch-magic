# elasticsearch-magic

## Build

```shell
version=7.17.8
sudo rm -rf output/ && bash run.sh $version

# Magic jar
cp output/x-pack-core-$version.magic.jar x-pack-core-$version.jar
```
