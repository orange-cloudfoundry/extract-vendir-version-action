# extract-vendir-version-action
Github Action to extract a version from vendir file

## Params
`vendir_file` : "Vendir file name, to look for version"
- required: false
- default: ./vendir.yml
    
`library` : "Package to look for version"
- required: true
    
`type`: "type of library to extract version from. Supported type: githubRelease"
- default: "githubRelease"
    
`debug`: "Set to 1 to enable debug mode"
- default: "0"

## Output
`version` : "version of the library extracted"

## Usage
```yaml
 - name: Extract k9s version
   id: extract_version
   uses: orange-cloudfoundry/extract-vendir-version-action@4e0e9300b0a7fe81a02536f631073c2accab9680 # v0.2.0
   with:
    library: "derailed/k9s"
```
