# Tag metadata

`tags.json` makes the tag structure from game-icons.net available to anything building from
this repository. It answers the request in
[#1149](https://github.com/game-icons/icons/issues/1149).

## Shape

```json
{
  "tags": {
    "animal": { "label": "Animal", "parent": null },
    "bird":   { "label": "Bird",   "parent": "animal" }
  },
  "icons": {
    "lorc/dragon-head": ["creature", "medieval-fantasy", "reptile"]
  }
}
```

- `tags` is the vocabulary: 134 tags, 37 of them roots, the rest nested one level under the
  group they are shown in on `/tags.html`.
- `icons` is keyed `{author}/{icon-name}`, matching this repository's directory layout, so a
  consumer can join it against the SVG files without parsing anything.

134 tags, 4178 icons, 8379 assignments. Every key joins against an SVG in this repository.

Not in `icons`: the 59 files under `badges/`, which are not tagged on the site, and two icons
that carry no tag upstream, `delapouite/matter-states` and `delapouite/sandstorm`.

## Where it came from, and the caveat that matters

Extracted from the tag pages on game-icons.net on **2026-09-02**, one request per second with
an identifying User-Agent, because the tags are not otherwise reachable from a local build:
they are not in this repository, the RSS feed carries no categories, and Iconify's
redistribution lists all 4133 icons as uncategorised.

**It is a snapshot and it will go stale.** Nothing here regenerates it, so every icon added
after that date is missing from `icons`, and the file quietly drifts from the site.

That is a real maintenance cost, and worth weighing against the alternative of everyone who
needs tags scraping the site separately. If whatever generates game-icons.net can emit this
file instead, that would be strictly better than this snapshot, and this file should be
replaced by that output rather than hand-updated.

## Licence

Unchanged. The icons remain CC BY 3.0 (or CC0 where `license.txt` says so), and this file is
a description of them rather than a new work.
