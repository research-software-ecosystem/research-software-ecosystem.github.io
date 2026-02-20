---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
title: Sources
page_id: sources
---

The RSEc aggregates metadata from the registries and services below. Each source is refreshed regularly through the automated import workflows described in the documentation. Pick a source to see what is covered and where to dive into example records.

{% assign source_items = site.data.tool_and_resource_list | where_exp:"item","item.related_pages contains 'sources'" | sort:"name" %}

<div class="row gy-3">
  {% for resource in source_items %}
    {% assign import_slug = resource.id %}
    {% assign view_url = resource.url %}
    {% if import_slug %}
      {% assign view_url = "https://github.com/research-software-ecosystem/content/tree/master/imports/" | append: import_slug %}
      {% assign workflow_url = "https://github.com/research-software-ecosystem/utils/tree/main/" | append: import_slug | append: "-import" %}
    {% endif %}

    <div class="col-12 col-md-6 col-lg-4">
      <div class="card h-100 shadow-sm">
        <div class="card-body d-flex flex-column h-100">
          <div class="d-flex justify-content-between align-items-start">
            <div>
              <div class="fw-bold">{{ resource.name }}</div>
              {% assign display_url = resource.url | remove: "https://" | remove: "http://" | remove: "www." %}
              <div class="text-muted small mb-2">
                <a class="text-muted text-decoration-none" href="{{ resource.url }}">{{ display_url }}</a>
              </div>
          </div>
            <div class="d-flex gap-1">
              {% if resource.registry.fairsharing %}
                <a class="badge bg-warning hover-primary" data-bs-toggle="tooltip" title="FAIRsharing" href="https://fairsharing.org/FAIRsharing.{{ resource.registry.fairsharing }}">
                  Standards/Databases
                </a>
              {% endif %}
              {% if resource.registry.biotools %}
                <a class="badge bg-success hover-primary" data-bs-toggle="tooltip" title="bio.tools" href="https://bio.tools/{{ resource.registry.biotools }}">
                  Tool info
                </a>
              {% endif %}
              {% if resource.registry.tess %}
                <a class="badge bg-primary hover-primary" data-bs-toggle="tooltip" title="TeSS" href="https://tess.elixir-europe.org/search?q={{ resource.registry.tess }}">
                  Training
                </a>
              {% endif %}
            </div>
          </div>
          <p class="mb-2">{{ resource.description | strip_newlines | replace: "  ", " " }}</p>
          <div class="d-flex gap-2 mt-auto flex-wrap">
            <a class="btn btn-sm btn-outline-primary" href="{{ view_url }}">View metadata</a>
            {% if import_slug %}
              <a class="btn btn-sm btn-secondary" href="{{ workflow_url }}">Import workflow</a>
            {% endif %}
          </div>
        </div>
      </div>
    </div>
  {% endfor %}
</div>

<style>
  /* Hide legacy tool table rendered by the theme beneath the cards */
  #content a[href='#skip-tool-table'],
  #content #skip-tool-table,
  #content .table-responsive {
    display: none !important;
  }
  #content h2.h2-like.fs-2 {
    display: none !important;
  }
</style>
