# Alfred Links Workflow

It is a basic [Alfred Workflow](http://www.alfredapp.com/powerpack/) to list/search links. 

Although there are some workflows to integrate with Browser Bookmarks, I find them over complicated for my basic needs.

In all the companies I've worked, we had some "Company Links" which I needed to access on a daily basis. So now I use this workflow to quickly access them.


## Installation instructions

1. Download & Intall [alfred_links_workflow.alfredworkflow](https://github.com/phstc/alfred_links_workflow/raw/master/alfred_links_workflow.alfredworkflow)
2. Open Alfred Preferences `CMD+Space` then `CMD+,`.
3. Open Workflows.
4. Right click on "Links by Pablo Cantero".
5. Show in Finder.
6. Open `links.json` in your favorite editor then add your links.

## links.json

```json
{
  "links": [
    { "name": "Pablo",   "href": "http://pablocantero.com" },
    { "name": "GitHub",  "href": "http://github.com/phstc" }
  ]
}
```

## Usage

* Click in the link name to open it in your default browser.
* Hold CMD and click to copy the link to Clipboard.


![links workflow](https://raw.github.com/phstc/alfred_links_workflow/master/usage1.png)



