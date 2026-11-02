# Flyway Ecology – Week 3, Day 1: Introduction to tracking data analyses

Quarto tutorial for day 1 of week 3 of the Flyway Ecology course (BirdEyes Centre for
Global Ecological Change, University of Groningen), 2 November 2026, room 5173.0165.
Case study: 10 GPS-tracked Eurasian spoonbills (5 adults, 5 juveniles) from the Dutch Wadden Sea,
1 August – 31 December 2023, from the Movebank study SPOONBILL_WAAKVOGELS (ID 2788432319).

## Getting started

1. Click **Use this template > Create a new repository** to make your own copy of this repository.
2. In **Positron**, clone your copy (Command Palette `Ctrl/Cmd + Shift + P` > *Git: Clone*) and open the cloned folder.
3. Download the two workshop data files from the [course Google Drive](https://drive.google.com/drive/folders/1ijXcZ5Htpthri6gpWZAaoprk31PzBblI) into `data - tracking/`.
4. Open `Day1_Intro-tracking-data.qmd` and run it chunk by chunk.
5. Commit and push your work regularly (*Source Control* view, `Ctrl/Cmd + Shift + G`).

See `docs/Day1_Workshop-outline.pdf` for the full instructions.

## Contents

| File / folder | What it is |
|---|---|
| `Day1_Intro-tracking-data.qmd` | The tutorial, with empty chunks for the exercises (intermezzos) |
| `styles.css` | BirdEyes layout of the rendered tutorial (keep it next to the `.qmd`) |
| `R/movement_functions.R` | Helper functions: distance, direction and speed between consecutive fixes |
| `data - tracking/` | Empty in the repository: download the two workshop files from the course Google Drive into this folder |
| `data - environmental/` | CORINE Land Cover 2018 crop of the Dutch Wadden Sea (EPSG:3035, 100 m) + legend; Natural Earth layers are downloaded here at run time |
| `output/` | Created by the tutorial: `maps/`, `graphs/`, `tables/` (not pushed to GitHub; set `dir.out` to the Drive folder later) |
| `docs/` | Workshop outline (PDF) |

## Requirements

R ≥ 4.3, Positron (includes Quarto) and Git. Packages (installed automatically by the first chunk):
`knitr`, `rmarkdown`, `sf`, `terra`, `tidyterra`, `suntools`, `rnaturalearth`, `rnaturalearthdata`, `maptiles`, `tidyverse`
(for the rest of the week: `move2`).

## Data

Tracking data: BirdEyes Centre for Global Ecological Change, Project Waakvogels (www.waakvogels.nl);
Movebank study SPOONBILL_WAAKVOGELS (ID 2788432319). Shared with students for this
course only, via the course Google Drive; not part of this repository.
CORINE Land Cover 2018: © European Union, Copernicus Land Monitoring Service, European Environment Agency.
Natural Earth: public domain.
