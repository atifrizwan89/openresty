# openresty Cookbook

This will install openresty on RHEL and Debian based distros


## Requirements

TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
### Platforms

- RHEL
- Debian

### Chef

- Chef 12.0 or later

### Cookbooks

- openresty

## Attributes

node[:openresty_version]  default ==> 'openresty-1.11.2.2'
node[:openresty_prefix] default ==> '/usr/local/openresty'
node[:pcre_jit] default ==> 'true'
node[:luajit] default ==> 'true'
node[:http_ssl] default ==> 'true'

## Usage

### openresty::default

TODO: Write usage instructions for each cookbook.

e.g.
Just include `openresty` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[openresty]"
  ]
}
```

## Contributing

TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors: Atif Rizwan

