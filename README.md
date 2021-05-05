# component_tools
A staging directory for any tools needed to open and view the component data images or the corresponding component_data_w_seg label matrices.

## Functions
### ```show_tissue_regions```: Opens a select *component_data_w_seg.tif* image from the *Lung_TMAs*, does the color transformation, displays the full color image, then the color image with the different segmentation masks one at a time.
### ```myimread```: Opens an 8 color component image in the *AstroPath* directory format and converts it to an 8 color vector to save memory and improve processing speed
  - Input:
    - ```wd[string]```: the ```<base>``` folder for a directory
      - E.g. *\\bki03\Lung_TMAs*
    - ```folder[string]```: the ```<slideID>``` to use
      - E.g. *TMA_1314*
    - ```imname[string]```: the full image name to use, should be located in the ```<wd>\<folder>\inform_data\Component_Tiffs``` directory
      - E.g. *TMA_1314_Core[1,1,10]_[52191,21041]_component_data_w_seg.tif*
### ```def_colors```: define the color vectors to use for different variations of images
### ```add_color```: add the colors to the 8 column image with *sinh* scaling to help  distinguish background from foreground. Returns an RGB image
  - Input: 
    - ```im[array]```: The image in vector column format [(mxn), l] 
      - l: layer of orginial image (3-dim)
      - m: rows of orginial image (1-dim)
      - n: columns of orginial image (2-dim)
    - ```mycol[struct]```: an array with different color vectors to add to the image, the full color should be in a field labeled "all"
    - ```h[int]```: image height
    - ```w[int]```: image width
