# Contributing

You want to help and give some of the great icons you made to the community? Thanks!

There are two ways to do it, depending of your tech skills:

- You're already a GitHub user ⇒ open a **Pull Request** on this repo.
- You have no idea of what `git` is all about => send your icons by email to **delapouite@gmail.com**

Whatever options you choose, please consider the following guidelines to facilitate the process.

## Guidelines

Table of content

- Author and License
- File format / Directories tree
- Art consideration

### Author and License

Game-Icons.net provides icons for free. Most of them are released under the [Creative Commons BY 3.0](http://creativecommons.org/licenses/by/3.0/), others as [Public Domain](http://creativecommons.org/publicdomain/zero/1.0/) resources.

All the icons you decide to share with us will also be released under the aforementioned CC-BY license (or CC0 if you explicitly mention it).

In both cases, we will obviously promote your authorship on each page displaying your creations and in each zip files downloaded.

To do so, we need a few info minor info about you :
- Your name or your nickname. This will be public.
- Your website / artist page address. Optional.

### Version Control

Assuming you are already a GitHub user, make a clone of this repository.
When starting a task, be sure to create a specific branch for it. Naming conventions are left to your discretion. However, if it respond to a need expressed by an issue, a good practice is to use the formalism "featureNNN" with NNN being the number of the concerned issue.

Then, you can peacefully make a pull request to the main repo (delapouite's one).

When the pull request has been accepted, you can merge your branch to the master branch (and it should be conflict-free most of the time).

### Creating new icon

New icons must be started over the template found at the root directory (template.svg), i.e a 512x512px canvas with a 512x512px frame that acts as a background.

### File format / Directories tree

Your files must be sent as individual [SVG](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics), a popular vector format that can be exported from Inkscape or Illustrator. We will take care of the automatic PNG generation for you.

Filenames must be in **lowercase**, words separated by a **dash** and in English with no weird characters:

Bad
```
Super Dragon.SVG
magnetic_field.svg
céréales.svg
```

Good
```
super-dragon.svg
magnetic-field.svg
cereals.svg
```

They are already thousands of icons available. Sometimes, different artist want to depict the same thing. To avoid name collisions, icons are organised like this:

/ artist / deck / icon

For example :

```
/ lorc / originals / wolf.svg
/ delapouite / far-west / gun.svg
/ delapouite / sci-fi / gun.svg
```

By following this hierarchical structure, we assure that each artist is free to name their icons the way they want and group them in meaningful categories if needed.

### Design / art rules

Try to keep the original look'n'feel of the collection.

Please follow Lorc's advices on the topic : http://lorcblog.blogspot.com.au/2009/05/talking-about-icons.html
