---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
title: Applications
page_id: applications
---

RSEc metadata supports a variety of downstream applications, from workflow catalogues to benchmarking dashboards. Browse the examples below to see how the ecosystem is reused and get inspiration for your own integrations.

<div class="alert alert-primary mt-3" role="alert">
  Want to build on RSEc? Start with the <a href="/docs">documentation</a>, explore the <a href="https://github.com/research-software-ecosystem/content/tree/master/data">sample metadata folders</a>, and open an <a href="https://github.com/research-software-ecosystem/content/issues">issue</a> if you need guidance.
</div>

{% assign application_items = site.data.tool_and_resource_list | where_exp:"item","item.related_pages contains 'applications'" | sort:"name" %}

<div class="row gy-3">
  {% for resource in application_items %}
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
            <a class="btn btn-sm btn-outline-primary" href="{{ resource.url }}">Visit application</a>
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
