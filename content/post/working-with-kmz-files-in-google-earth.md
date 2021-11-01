---
title: "Working With KMZ Files in Google Earth"
description: Using Google Earth to view my location points.
date: 2019-12-29T16:16:09+10:00
draft: false
categories:
  - "Mapping"
tags:
  - "Maps-Me"
---

I use **Google Earth** to show all of the location points that I have created. The reason for this is that it doesn't have the limitation of maximum number of points that Google maps has. I can drag a **.kmz** file onto the desktop in Google Earth and it will load the points and show them on the maps.

Initially when I did this it showed me nice icons and there were no placemark names appearing on the screen. Lately it hasn't been showing the correct icons and it lists all of the placemark names making for some ugly viewing.

I have been able to change the map to show a much less cluttered view of my location data.

#### Remove the placemark names

This is what my screen looks like.

![Cluttered view](/images/cluttered-view.jpg "Cluttered view")

To remove the placemark names I can go to the properties view in my bookmark set.

![Properties](/images/properties.jpg "Properties")

In the dialog box I need to change the **Label** in the *Style, Color* tab to a scale of **0.0**. This shrinks the name to nothing.

![Style, Color tab](/images/style-color-tab.jpg "Style, Color tab")

Now it looks much better with the names removed so next we will change the icons.

#### Location icons

I have to modify my **.kml** file to show Google icons as the original Maps.me icons don't show anymore.

The original style for a red placemark is shown below:

{{< highlight xml >}}
    <Style id="placemark-red">
      <IconStyle>
        <Icon>
          <href>http://mapswith.me/placemarks/placemark-red.png</href>                
        </Icon>
      </IconStyle>
    </Style>
{{< / highlight >}}

This doesn't work anymore so I have changed this to:

{{< highlight xml >}}
    <Style id="placemark-red">
      <IconStyle>
        <Icon>
          <href>https://maps.gstatic.com/mapfiles/ridefinder-images/mm_20_red.png</href>
        </Icon>
      </IconStyle>
    </Style>
{{< / highlight >}}

This image shows the final results:

![Red icons](/images/red-icons.jpg "Red icons")
