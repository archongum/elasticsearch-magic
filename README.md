# elasticsearch-magic

## Build

The use of a remote development platform such as Codespaces, Gitpod, etc. is RECOMMENDED.

```shell
version=7.17.8
sudo rm -rf output/ && bash run.sh $version

# Magic jar
cp output/x-pack-core-$version.magic.jar x-pack-core-$version.jar
```
