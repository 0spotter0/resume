# Typst Resume

Render resume from a yaml file with Typst. Also includes a watcher to recompile on changes.

## Overview

- `data.yaml`: Resume data in yaml.
- `resume.typ`: Loads data and renders the top level component
- `sections.typ`: **Defines section order**, and inserts yaml data into typst components.
- `templates.typ`: Defines style and layout for each typst component.
- `start.sh`: Bash script to setup the Python environment and start the watcher.
- `watcher.py`: Python script to watch a list of files and run a command on changes.

## Watcher Quick Start

1. Run `start.sh`
2. Open `resume.pdf` in a program that reloads on file changes (Skim for macOS)

