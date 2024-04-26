# Steps
## init
```shell
mkdir ports
mkdir versions
vim versions/baseline.json
# input:
{
  "default": {}
}
```

## add port
```shell
cp -r /path/to/overlay-ports/{port} ports/
```

## commit port
```shell
git add ports
git commit -m 'add {port}'
```

## update version
```shell
vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version --all --verbose

# format-manifest may be needed, just run command as tipped, and rerun x-add-version
vcpkg format-manifest /home/wii/code/vcpkg-example-registry/ports/port-example/vcpkg.json
```