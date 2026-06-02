[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Perl](https://img.shields.io/badge/Perl-5-blue)](https://www.perl.org/)
[![Python](https://img.shields.io/badge/Python-3-blue)](https://www.python.org/)
[![Bash](https://img.shields.io/badge/Bash-5-green)](https://www.gnu.org/software/bash/)
[![Last Updated](https://img.shields.io/github/last-commit/kehrlinger/AppliedProgrammingBioinfo)](https://github.com/kehrlinger/AppliedProgrammingBioinfo)

# Applied Programming for Bioinformatics

Solutions and final project for the APBI course at the University of Vienna (SS17).

This repository contains exercises from the course *2017S 300353-1 Applied Programming for Bioinformatics* — a practical introduction to programming for solving biological problems, with a focus on text processing and automation of external tools — as well as the final project: an orthologous group analysis using the eggNOG v4 database.

> **Note:** This repo was updated in 2025 as part of a collaboration with [Hermes Agent](https://hermes-agent.nousresearch.com/) to test AI-assisted repository maintenance. The original content and structure have been preserved.

---

## Repository Structure

```
AppliedProgrammingBioinfo/
├── weekly_exercises/
│   ├── 01_Basics/            Perl — basic syntax, file I/O, sequence handling
│   ├── 02_Subroutines/       Perl — string manipulation, pattern matching
│   ├── 03_FileIO/            Perl — subroutines, arrays, hash tables
│   ├── 04_CommandLine/       Perl — command-line arguments
│   ├── 05_Modules/           Perl — restriction enzyme analysis (Pattern.pm, Restrictions.pm)
│   ├── 06_Databases/         Perl — SQL database queries via DBI
│   ├── 07_Python_Basics/     Python — sequence analysis, file parsing
│   ├── 08_Python_Patterns/   Python — pattern search, restriction site analysis
│   └── 09_Bash/              Bash — shell scripting, automation
├── final_project/            ← Final project (eggNOG orthology analysis)
│   ├── orthologe_comparison.pl
│   ├── taxonomic_distribution.pl
│   ├── rodent_gene_isolation.pl
│   ├── runscript.sh
│   ├── lib/
│   │   └── FinalProject.pm   ← Shared Perl module (taxon lookup, counting, descriptions)
│   └── data/
│       ├── eggnog4.functional_categories.txt
│       └── eggnog4.species_list.txt
├── python_rewrite/           ← Partial Python port of the Perl exercises (unfinished)
│   ├── Exercise01_01.py .. 03_04.py
│   └── ABANDONED.md
├── example_data/             ← Shared datasets used by multiple exercises
│   ├── gene_positions1.txt
│   ├── gene_positions2.txt
│   ├── names.txt
│   ├── sequence.fasta
│   └── swissprot_list.txt
├── perl_cheat_sheet.txt      ← Common Perl pitfalls reference
├── README.md
├── LICENSE
└── .gitignore
```

---

## Weekly Exercises

9 weekly assignments progressing from Perl basics through Python to Bash scripting.

| Exercise | Language | Topic |
|----------|----------|-------|
| 01 | Perl | Basic syntax, file I/O, sequence handling |
| 02 | Perl | String manipulation, pattern matching |
| 03 | Perl | Subroutines, arrays, hash tables |
| 04 | Perl | Regular expressions (contributed by a friend — not uploaded) |
| 05 | Perl | Restriction enzyme analysis |
| 06 | Perl | SQL database queries |
| 07 | Python | Sequence analysis, file parsing |
| 08 | Python | Pattern search, restriction site analysis |
| 09 | Bash | Shell scripting, automation |

---

## Final Project — eggNOG Orthology Analysis

The `final_project/` directory contains the capstone project for the course (originally in a separate repository). It analyses orthologous groups from the eggNOG v4 database across multiple species.

### Pipeline

The project consists of three Perl scripts orchestrated by a Bash wrapper:

1. **`orthologe_comparison.pl`** — given two species, counts orthologous groups they share and genes from species 1 that have a homolog in species 2

2. **`taxonomic_distribution.pl`** — given three species, identifies genes from species 1 that have a homolog in species 3 but not in species 2 (lineage-specific gene loss)

3. **`rodent_gene_isolation.pl`** — given one species, identifies orthologous groups that only contain genes from that species (species-specific orthogroups)

4. **`runscript.sh`** — interactive orchestrator that chains all three scripts, prompts for species names, and warns about output file conflicts

### Shared Module

**`lib/FinalProject.pm`** provides four subroutines used across all scripts:
- `get_taxon_ID()` — looks up a species name → NCBI taxon ID
- `gene_count_members()` — counts gene occurrences for a taxon across orthologous groups
- `get_protein_ID()` — extracts protein IDs from eggNOG members files
- `get_desc()` — cross-references COG functional category codes (e.g. J → "Translation") with eggNOG descriptions

### Data Dependencies

The pipeline uses eggNOG v4 data files:
- `meNOG.members.tsv` — the orthologous group membership file (not shipped due to size — must be downloaded from [eggNOG](http://eggnog5.embl.de/))
- `eggnog4.functional_categories.txt` — COG functional category descriptions
- `eggnog4.species_list.txt` — species-to-taxon-ID mapping

### How to Run

```bash
cd final_project

# Interactive mode (prompts for species names)
bash runscript.sh

# Direct mode (pass species as command-line arguments)
perl orthologe_comparison.pl "Homo sapiens" "Mus musculus"
perl taxonomic_distribution.pl "Homo sapiens" "Mus musculus" "Pan troglodytes"
perl rodent_gene_isolation.pl "Mus musculus"
```

---

## Structure Notes

- The first six exercises are written in Perl (developed with Eclipse + EPIC plugin on Windows/Linux).
- Exercises 7–8 are written in Python (developed with PyCharm).
- Exercise 09 covers Bash scripting (developed on Fedora/KDE and Windows Subsystem for Linux).
- Exercise 04 (regex) was contributed by a friend and is not included here.
- A cheat sheet with common Perl pitfalls is included as `perl_cheat_sheet.txt`.

---

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
