## Reproduction Instructions

docker build -t moon_demo .
rocker --nvidia --x11 moon_demo


### Wait for gazebo to come up 
Then click the following


* Collapse and expand the view. 

* Adjust the view height to be 10000 m high
* Adjust the far clip to be 100000 m 

* If wanted click the top down angle to point the camera straight down.


### Notes
The sdf file can be tuned to adjust the 4k texture overlay by chaning the patch size. It starts at 4960x4960. bigger will be visible from further away but be lower resoloution. 

An example fo tweaking this is in the sed line of Dockerfile


