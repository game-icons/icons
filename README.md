# Game Icons

All SVG icons available on https://game-icons.net

Also, this repository is used to [track](https://github.com/game-icons/icons/issues) requests made on Twitter or by email.
You can add your own suggestions.

## Contribution

Contributions are welcomed! Have a look at this [document](https://github.com/game-icons/icons/blob/master/CONTRIBUTING.md) for help.

## Scripts

A few shell-scripts are at your disposal for various batch tasks.

### colorize-svgs.sh

By default, all the provided icons in this repository have a white foreground on a black background.
You may need them in other color combinations.

The `colorize-svgs.sh` script takes two optional arguments, the first one for the foreground color in hexadecimal,
the second one for the background color also in hexadecimal or with the special value `transparent`.

```sh
# red on green
./colorize-svgs.sh '#f00' '#0f0'

# blue on transparent
./colorize-svgs.sh '#0011da' 'transparent'
```

The generated SVG files are created in the gitignored `_out` directory.

### rasterize-svgs.sh

This script walks through the whole content of the `_out` directory and generates an optimized PNG file for every SVG file it encounters.
So it means, that if you want to rasterize the default collection of white on black icons:

```sh
# first copy the default SVG file to "_out" directory
./colorize-svgs.sh

# then generate one PNG file for each SVG file
./rasterize-svgs.sh
```

Depending on the power of your machine, the execution of the script may take a while. (no parallel executions yet).

## License

CC-BY
