# Filters-as-Templates-for-object-recognition
Using convolution filters to locate objects in images that similar to filters

Filters, when convolved with an image, will fire strongest on locations of an image that look like the filter. This allows us to use filters as object templates in order to identify specific objects within an image. In the case of this assignment, we will be finding cars within an image by convolving a car template onto that image. Although this is not a very good way to do object detection ;p
## Detection Error
Given a ground truth bounding box (g) and a predicted bounding box (p), a commonly used measurement for bounding box quality is p∩g/pUg
