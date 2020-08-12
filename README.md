# Nextflow wrapper for `prokka` process.

## Pre-requisites

- Nextflow
- Docker 

**NOTE** If you plan to setup a basic server, then you can refer [minimal-nextflow-setup](https://github.com/nextflow-hub/minimal-nextflow-setup)

## Usage

```
nextflow run https://github.com/nextflow-hub/prokka
```

## Options

- `spadesResults`

By default, the pattern for `spades` results is assumed to be `results/spades/*_scaffolds.fasta`

```
nextflow run https://github.com/nextflow-hub/prokka --spadesResults /path/to/custom/spadesResults/*pattern
```

- `resultsDir`

By default, it stores the result files locally inside the `results` directory.

```
nextflow run https://github.com/nextflow-hub/prokka --resultsDir /path/to/custom/resultsDir
```

- `saveMode`

By default, the pipeline publishes the results in the `resultsDir` by copying the relevant output.

You can update this behavior by simply specifying the alternative such as `move` or `link` etc. 

```
nextflow run https://github.com/nextflow-hub/prokka --saveMode move
```

For more information please refer [Nextflow documentation](https://www.nextflow.io/docs/latest/process.html#publishdir)

## Customizing the script

The sole purpose of process wrappers in `nextflow-hub` is to keep the code small, clean and hackable with some basic knowledge of `nextflow` scripting.

If you have specific requirements, you are encouraged to fork/clone and update your version to accomodate your needs. 


## Contribution

Contribution, in all forms, is most welcome!
