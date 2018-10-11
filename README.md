# nmap-mac-prefixes

Explore Nmap MAC prefixes

## Synopsis

Init:

```sh
# copy nmap-mac-prefixes from upstream into resources
bin/nmap-mac-prefixes-init /path/to/nmap-mac-prefixes
```

Explore:

```sh
export PERL6LIB='lib'
# output json
bin/nmap-mac-prefixes --json ls apple
# output perl
bin/nmap-mac-prefixes ls
```

## Dependencies

- Rakudo Perl 6
- Bash
- Nmap

## Licensing

This is free and unencumbered public domain software. For more
information, see http://unlicense.org/ or the accompanying UNLICENSE file.
