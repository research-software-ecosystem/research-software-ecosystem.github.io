---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
title: Documentation
---

## Introduction
The RSEc version-controlled repository federates metadata for research software, predominantly within the life sciences domain. These metadata cover a wide spectrum of use cases, spanning software discovery, evaluation, deployment, and execution.

Centralised in an open and version-controlled repository, the metadata enable cross-linking between services, facilitate curation, and provide insights through aggregation and analysis. This page collects key links to access and understand the software metadata provided by the Research Software Ecosystem, plus contribution guidelines and support channels.

## What the RSEc provides

The RSEc is a federated metadata commons rather than a replacement for the registries, package repositories, container infrastructure, workflow platforms, or benchmarking services that contribute to it. Each community remains responsible for its own source of truth; the RSEc aligns and links those sources so that they can be used together.

This approach is deliberately format-agnostic. Source metadata can be preserved in its native JSON, YAML, or other representation while the RSEc builds tool-centred bundles and interoperable views for downstream use. Persistent identifiers and cross-links connect software with versions, packages, containers, workflows, publications, authors, licences, usage information, and scientific concepts such as EDAM topics and operations.

The repository is useful to three audiences:

- Researchers can find tools, compare available ways to run them, and follow links to documentation, publications, training, workflows, Galaxy instances, Bioconda packages, or containers.
- Developers and curators can improve one metadata record and make that improvement available to several consuming services, subject to source-specific validation and synchronisation rules.
- Service developers can reuse versioned metadata programmatically instead of building and maintaining a separate catalogue of overlapping tool descriptions.

## Browse the RSEc Atlas

The [RSEc Atlas](https://research-software-ecosystem.github.io/RSEc-Atlas/) is the interactive entry point for exploring the aggregated metadata. Search by tool name, description, tags, EDAM topic, or bio.tools collection, then filter by options such as Galaxy or Bioconda availability, licence, or favourites. Tool pages can expose installation strings, container commands, Galaxy launch links, DOI references, usage statistics, related workflows, and training materials.

The Atlas is a presentation layer over the metadata commons: use it for human-friendly discovery, and use the [content repository](https://github.com/research-software-ecosystem/content) or the [RSEc utilities](https://github.com/research-software-ecosystem/utils) when you need reproducible or programmatic access.

<div class="mt-3 mb-4">
  <a
    class="btn btn-primary"
    href="{{ '/research-software-ecosystem-metadata-commons-datasets-latest.tar.gz' | relative_url }}"
    download
  >
    Download the latest metadata archive
  </a>
</div>

## Quick start

<div class="row gy-3">
  <div class="col-12 col-md-6 col-lg-3">
    <div class="card h-100 shadow-sm">
      <div class="card-body">
        <div class="fw-bold mb-1">1) Browse</div>
        <p class="mb-2">Open the <a href="https://github.com/research-software-ecosystem/content">content repository</a> and explore `data/` (by tool) or `imports/` (by source).</p>
      </div>
    </div>
  </div>
  <div class="col-12 col-md-6 col-lg-3">
    <div class="card h-100 shadow-sm">
      <div class="card-body">
        <div class="fw-bold mb-1">2) Check freshness</div>
        <p class="mb-2">See when imports run in the <a href="https://github.com/research-software-ecosystem/content/tree/master/.github/workflows/import.yaml">GitHub Actions workflow</a>.</p>
      </div>
    </div>
  </div>
  <div class="col-12 col-md-6 col-lg-3">
    <div class="card h-100 shadow-sm">
      <div class="card-body">
        <div class="fw-bold mb-1">3) Cross-link</div>
        <p class="mb-2">Use identifiers in the cross-link table below (e.g. bio.tools IDs, Bioconda packages, Galaxy tool IDs).</p>
      </div>
    </div>
  </div>
  <div class="col-12 col-md-6 col-lg-3">
    <div class="card h-100 shadow-sm">
      <div class="card-body">
        <div class="fw-bold mb-1">4) Report</div>
        <p class="mb-2">Open an issue in the <a href="https://github.com/research-software-ecosystem/content/issues">content repo tracker</a> if you spot a problem.</p>
      </div>
    </div>
  </div>
</div>

## How to use the metadata

<div class="row gy-3">
  <div class="col-12 col-md-4">
    <div class="card h-100 border-0">
      <div class="card-body">
        <div class="fw-bold mb-1">Discover tools</div>
        <p class="mb-2">Search `data/tool-id` folders to see aggregated metadata across registries.</p>
      </div>
    </div>
  </div>
  <div class="col-12 col-md-4">
    <div class="card h-100 border-0">
      <div class="card-body">
        <div class="fw-bold mb-1">Validate metadata</div>
        <p class="mb-2">Compare entries across sources (e.g. bio.tools vs OpenEBench) and file PRs to fix discrepancies.</p>
      </div>
    </div>
  </div>
  <div class="col-12 col-md-4">
    <div class="card h-100 border-0">
      <div class="card-body">
        <div class="fw-bold mb-1">Integrate programmatically</div>
        <p class="mb-2">Consume raw JSON/YAML from the repository, mirror it, or automate updates with the weekly imports.</p>
      </div>
    </div>
  </div>
</div>

<div class="alert alert-info mt-3" role="alert">
  Need a starting point? Browse the <a href="https://github.com/research-software-ecosystem/content/tree/master/data">`data/` folder</a> to download a sample tool folder and experiment locally.
</div>

## Metadata Repository contents

The RSEc metadata can be accessed on [the GitHub dedicated repository](https://github.com/research-software-ecosystem/content). The main folders to access metadata are: the `imports` folder, which contains one subfolder per metadata source, and the `data` folder, which contains one subfolder for each of the bio.tools entries, combining bio.tools tools and metadata files which are directly linked to it. An example of this organisation is illustrated in <a href="#metadata-files-organisation">Figure 1</a>. 

Each software entry is organised as a tool-centred metadata bundle. This makes it possible to inspect the native source files alongside the cross-linked files contributed by other providers. A bundle may include descriptions, versions, dependencies, identifiers, publications, packaging or container information, workflow relationships, monitoring metrics, and semantic annotations. The `imports/` tree is source-oriented; the `data/` tree is designed for following one tool across sources.

<details id="metadata-files-organisation" open="true">
  <summary>Fig. 1: Example organisation of the metadata files imported in the RSEc metadata repository</summary>
  {% mermaid %}
    graph LR
       root[https://github.com/research-software-ecosystem/content];
       root--> /imports[imports];
       /imports--> /imports/biotools[biotools];
       /imports/biotools--> /imports/biotools/software1[software1.biotools.json];
       /imports/biotools--> /imports/biotools/software2[software2.biotools.json];
       /imports/biotools--> /imports/biotools/software3[software3.biotools.json];
       /imports--> /imports/bioconda[bioconda];
       /imports/bioconda--> /imports/bioconda/software1[bioconda_software1.yaml];
       /imports/bioconda--> /imports/bioconda/software2[bioconda_software2.yaml];
       /imports/bioconda--> /imports/bioconda/software4[bioconda_software4.yaml];
       root--> /data[data];
       /data--> /data/software1[software1];
       /data/software1--> /data/software1/software1biotoolsjson[software1.biotools.json];
       /data/software1--> /data/software1/software1biocondayaml[bioconda_software1.yaml];
       /data--> /data/software2[software2];
       /data/software2--> /data/software2/software2biotoolsjson[software2.biotools.json];
       /data/software2--> /data/software2/software2biocondayaml[bioconda_software2.yaml];
       /data--> /data/software3[software3];
       /data/software3--> /data/software3/software3biotoolsjson[software3.biotools.json];
  {% endmermaid %}
</details>

## Supported Formats

Details about the specific formats for each of the federated resources can be found in the following places:

| Resource  Description                                      | Link |
|------------------------------------------------------------|------|
| Bio.tools API Reference                                    | [Bio.tools API Reference](https://biotools.readthedocs.io/en/latest/api_reference.html#) |
| OpenEBench      | [OpenEBench Technical metrics and endpoints description](https://openebench.bsc.es/monitor/) <br> [Tool JSON Schema](https://openebench.bsc.es/monitor/tool/tool.json) <br> [Metrics JSON Schema](https://openebench.bsc.es/monitor/metrics/metrics.json) |
| Bioconda        | [Bioconda contribution guidelines](https://bioconda.github.io/contributor/index.html) |
| Biocontainers   | _WIP_ |
| Galaxy Codex    | [Documentation work-in-progress](https://github.com/galaxyproject/galaxy_codex/issues/170) |
| Debian Med      | The YAML files describing the packages are based on information extracted from the [Ultimate Debian Database](https://udd.debian.org/) using a [custom import script](https://github.com/research-software-ecosystem/utils/blob/main/debian-med-import/import.py) |
| BIII            | The metadata describing the software are serialized as [Bioschemas](https://bioschemas.org/profiles/ComputationalTool/1.0-RELEASE)-based JSON-LD files, using a [custom import script](https://github.com/research-software-ecosystem/utils/blob/main/biii-import/biseEU_LD_export.py)  |
| Bioconductor            | Release metadata are collected from the [Bioconductor package release API](https://bioconductor.org/packages/release/BiocViews.html) and citation records, then merged with RSEc metadata while preserving curated annotations such as EDAM terms. |

The RSEc also generates linked-data representations using [schema.org](https://schema.org/), [Bioschemas](https://bioschemas.org/) profiles such as [ComputationalTool](https://bioschemas.org/profiles/ComputationalTool/1.0-RELEASE), JSON-LD, and RDF Turtle. These exports are useful when a catalogue, search service, semantic-web application, or other automated agent needs a standardised view without discarding the original source metadata.

Most metadata formats for a given source include cross-links to other sources:

|   Destination / **Source**   | bio.tools | OpenEBench | Bioconda | Biocontainers | Galaxy Codex | Debian Med | BIII      | Bioconductor |
|--------------|-----------|------------|----------|---------------|--------------|------------|-----------|------------|
| **bio.tools**    | n/a |            | url entries of the `download` key where `url` starts with `"https://anaconda.org/bioconda/"`, the remainder of the url being the Bioconda package name |               |              | url entries of the `download` key where `url` starts with `"https://tracker.debian.org/pkg/"`, the remainder of the url being the Debian package name |           |  |
| **OpenEBench**   | List elements that have and `@id` key starting with `"https://openebench.bsc.es/monitor/metrics/biotools"` |n/a  | List elements that have and `@id` key starting with `"https://openebench.bsc.es/monitor/metrics/bioconda"` |               | List elements that have and `@id` key starting with `"https://openebench.bsc.es/monitor/metrics/galaxy"` |            |           |  |
| **Bioconda**     | YAML list `extra.identifiers`, CURIEs starting with `"biotools:"`          |            | n/a|               |              | For _usegalaxy.eu_, YAML list `extra.identifiers`, CURIEs starting with `"usegalaxy-eu:"`           |           |  |
| **Biocontainers** |           |            |          | n/a     |              |            |           |  |
| **Galaxy Codex** | 'bio.tool_id' key in the JSON file |            | 'Conda_id' key in the JSON file |               | n/a    |            |           |  |
| **Debian Med**   | YAML list registries, CURIES are in `entry` key when `name` is `"bio.tools"` |            | YAML list registries, CURIES are in `entry` key when `name` is `"conda:bioconda"` |               |              | n/a  |           |  |
| **BIII**         |           |            |          |               |              |            | n/a |  |
| **Bioconductor**         |           |            |          |               |              |            |  | n/a |

## Metadata Import Workflow

The metadata is imported and updated using a [GitHub actions workflow](https://github.com/research-software-ecosystem/content/blob/master/.github/workflows/import.yaml) which runs weekly, importing the updated metadata from all sources. Each import task (listed in the table below) is an independent Github action that queries a specific source and updates the metadata in the git repository. It is usually running a python script that:
- cleans all the data from the source from the existing repository checkout
- retrieves the latest version of the metadata, using e.g. an HTTP API, a git repository checkout, or a database access.
- formats these metadata in a format which is as close as possible to the source format, yet compatible with git (e.g. YAML or JSON reformatting is sometimes required).
- commits this version of the metadata.
The outline of this workflow is illustrated in <a href="#ci-import-workflow-diagram">Fig. 2</a>.

<div class="d-flex flex-wrap gap-3 my-3">
  <div class="border rounded p-3 shadow-sm">
    <div class="fw-bold">Weekly cadence</div>
    <div class="text-muted small">All sources refreshed via GitHub Actions</div>
  </div>
  <div class="border rounded p-3 shadow-sm">
    <div class="fw-bold">Source-specific jobs</div>
    <div class="text-muted small">Isolated workflows per source for traceability</div>
  </div>
  <div class="border rounded p-3 shadow-sm">
    <div class="fw-bold">Version controlled</div>
    <div class="text-muted small">Every import is committed for full history</div>
  </div>
</div>


<details id="ci-import-workflow-diagram" open="true">
  <summary>CI Import workflows in the repository</summary>
  {% mermaid %}
  graph TB
     A[bio.tools] --> Y(metadata import) 
     B[OpenEBench] --> Y(metadata import)
     C[BioConda] --> Y(metadata import)
     D[BIII] --> Y(metadata import)
     E[BioContainers] --> Y(metadata import)
     F[Galaxy CoDeX] --> Y(metadata import)
     G[Debian Med] --> Y(metadata import)
     Y(metadata import) --> Z[RSEc]
  {% endmermaid %}
</details>

## Integration model

RSEc integrations fall into two broad categories. The distinction is about how closely the RSEc participates in a source's metadata lifecycle, not simply how much data a source contributes.

### Lightweight integrations

Lightweight integrations retrieve source metadata with minimal transformation, preserve its native structure, and place it in the appropriate tool bundle. Examples include scheduled imports from [Bioconda](https://bioconda.github.io/), [BioContainers](https://biocontainers.pro/), [Debian Med](https://www.debian.org/devel/debian-med/), and [Galaxy Codex](https://github.com/galaxyproject/galaxy_codex). These jobs keep the commons current while leaving source-specific semantics and governance with the originating community.

### Deep integrations

Deep integrations add validation, schema transformation, semantic export, cross-resource matching, or synchronisation back to an upstream service. The [bio.tools](https://bio.tools/) integration, for example, supports a bidirectional bridge with protected-field checks. [Bioconductor](https://bioconductor.org/) metadata can be merged with RSEc records while preserving curated annotations such as EDAM terms. [OpenEBench](https://openebench.bsc.es/) contributes monitoring and quality indicators that extend the metadata commons from findability and access towards evidence-based comparison and sustainability.

## Quality, validation, and provenance

Every import is associated with a source, an automated workflow, and a commit in the repository history. Continuous-integration jobs validate source files, generate repository reports, and export downstream formats. This gives users a reproducible way to see what changed and why a particular version of a record is present.

Validation happens at several levels:

- Syntactic checks detect malformed JSON/YAML and schema violations.
- Semantic checks verify controlled terms where a source provides them, including EDAM concepts.
- Cross-resource checks identify possible links between records, such as a Galaxy tool and its bio.tools entry.
- Community review remains important for equivalence mappings and other cases where automated matching cannot be trusted on its own.

The RSEc therefore combines automation with human curation. Upstream quality, availability, and identifier stability still affect the quality of the resulting commons; when you find a mismatch, report it with the relevant source record and tool identifier.

## Reuse in other services

The RSEc is intended to be consumed by services that add their own context rather than duplicate the underlying curation. Examples described in the manuscript include:

- [ToolFinder](https://toolfinder.biocommons.org.au/) combines RSEc descriptions, EDAM topics, publications, and licences with local installation and availability information across Australian infrastructures.
- [WorkflowHub](https://workflowhub.eu/) uses bio.tools identifiers and EDAM terms when workflows are registered and can annotate Galaxy workflows with the tools they use.
- [Galaxy](https://galaxyproject.org/) uses shared tool identifiers and EDAM annotations to improve discovery and interoperability, while RSEc-linked metadata can add packaging, container, documentation, and usage context.

For machine-readable reuse, start with the repository's raw JSON/YAML files and commit history. For maintained import and conversion logic, see the [utils repository](https://github.com/research-software-ecosystem/utils). For a human-facing catalogue, use the [RSEc Atlas](https://research-software-ecosystem.github.io/RSEc-Atlas/).

## Contributing guidelines

We welcome any contribution to the project. Please refer to the [governance document](https://github.com/research-software-ecosystem/content/blob/master/GOVERNANCE.md), and get in contact with us (see the [Contacts page](/contacts)).
