# **clusteR**  
![cluster banner](https://github.com/JimColl/clusteR/blob/master/data/cluster.png)  
See the github: https://github.com/JimColl/clusteR or it's companion on my website: https://jimcoll.github.io/courses/random/

**About:**  

A tool to add points to a map from csv or shapefile, and interactively cluster them as you see fit, this GUI driven, geographic database display and clustering application built is built on R.  Is also a _nearly_ minimal example of how to tie map and database together, how reactive shiny elements work, and how to print dashboards.  A project that grew out of a request to see a database from a geographic prospective, here is a FOSS implementation of GIS for people who don't know or have the time to learn it.

**Features**  

* GUI driven interface to select csv or shapefile database.  
* Use drop downs how to cluster (_currently broken_), color, and label the points.  
* Edit the table view of the database and optionally save the database back out.  
  * Click on a table entry to zoom to the location  
* Fully reactive map and editing  
![cluster view](https://github.com/JimColl/clusteR/blob/master/data/clusterView.png) 

**How to run:**  

The "installation" of this is program is trivially easy by design and requires no permissions.
To start the process:  

1) Download and unzip this repository using the green "Clone or download" button.  
2) Select a csv or a shapefile, enter the LAT LON and EPSG fields as necessary.  Replace spaces with .   
3) and hit run!

A test dataset is included in the data folder.  To "uninstall", just delete the folder.  Pandoc and PhantomJS are also installed, and may be removed through the _add or remove programs_ system dialog and the user/AppData/Roaming folder respectively.

**Known bugs:**  

* Selecting fields which are too long or numeric will currently [kill the crab](http://i.imgur.com/gMmnR5p.jpg).  To recover, close the window and re run the HTA.  
* Map and data don't wrap smoothly.  
  * Fly to (when you click on a row) will sometimes cause the server to lock up.  To fix, zoom in a bit before attempting to fly.  
* Legends can be too large for the window.  
* Print button works but output is gross.
  * Map legends are also not printed.
  * Pandoc needs to restart after being installed, so attempting to print after the installation will break the server.  To recover, close the window and re run the HTA.  
* Editing the table is not fully tested.  
  * Shapefile editing broken.  
