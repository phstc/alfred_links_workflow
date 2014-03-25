# Alfred Links Workflow

It is an [Alfred Workflow](http://www.alfredapp.com/powerpack/) to list/search links.


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

###Using the "links " keyword:
* Click in the link name to open it in your default browser.
* Hold CMD and click to copy the link to Clipboard.
* Press fn key to delete a link
* Type a new name and it will show it as a new link name. Press Enter and it will ask for the address with the "http:/" already in place. Press enter and it will add the new link to the list and show the link name and address. If Enter is pressed again, it will open that new link.

###Using the "links:seteditor" keyword:
* Start typing the name of your editor. When it is display in the list, select it and press Enter. You can now use the keyword to directly edit your link list.

###Using the "links:edit" keyword:
* After setting your editor, this keyword will open the list of links into the editor you selected.


![links workflow](https://raw.github.com/phstc/alfred_links_workflow/master/usage1.png)



