ShinobiCharts (iOS) - Individual Point Styling
=====================

This project demos the individual point styling feature introduced in ShinobiCharts (iOS) 2.7.0. There's an accompanying blog post [here](http://www.shinobicontrols.com/blog/posts/2014/07/14/individual-point-styling-discontinuous-line-series-in-shinobicharts-27).

![Screenshot](screenshot.png?raw=true)

Building the project
------------------

In order to build this project you'll need a copy of ShinobiCharts v2.7.0. If you don't have it yet, you can download a free trial from the [ShinobiCharts website](http://www.shinobicontrols.com/ios/shinobicharts).

If you've used the installer to install ShinobiCharts, the project should just work. If you haven't, then once you've downloaded and unzipped ShinobiCharts, open up the project in Xcode, and drag ShinobiCharts.framework from the finder into Xcode's 'frameworks' group, and Xcode will sort out all the header and linker paths for you.

If you're using the trial version you'll need to add your license key. To do so, open up ViewController.m and add the following line after the chart is initialised:

    chart.licenseKey=@"your license key";

Contributing
------------

We'd love to see your contributions to this project - please go ahead and fork it and send us a pull request when you're done! Or if you have a new project you think we should include here, email info@shinobicontrols.com to tell us about it.

License
-------

The [Apache License, Version 2.0](license.txt) applies to everything in this repository, and will apply to any user contributions.
