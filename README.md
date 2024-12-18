# Headless

This CLI tool creates a header for a given .c file.

## Installation

```bash
git submodule update --init --recursive # this will clone the submodules
make # this will create the binary, which you can then add to your path
```

## API

1. It will not overwrite non-generated headers
2. It will skip files with the comment "// Headless skip"
3. To avoid type definitions having duplicate symbols, use the following pattern in the .c file:

```c

#ifndef __HEADLESS__

struct {} // your struct definition

typedef struct {} // your typedef definition

#endif
```

## Watch mode

This tool does not have a watch mode. In OSX I use the following in my make files:

```make
headless:
	@fswatch -e ".*" -i "\\.c$$" . | xargs -n1 -I {} sh -c 'headless "{}"'
```
