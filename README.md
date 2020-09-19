# Real-time image-based parking occupancy detection using deep learning (CPU Friendly implementation)
This is the MATLAB implementation of our pulished paper using CNN + SVM classifier for the parking occupancy detection that runs without GPU for training and trains under 10 minutes with CPU providing ~99% accuracy. 

The tutorial is intended to run on MATLAB 2020a, although the code can run in MATLAB versions higher than 2018a. Additional toolboxes might be required to run the experiments that include computer vision toolbox, statistics and machine learning toolbox, deep learning toolbox, signal processing toolbox and automated driving toolbox. For running the live script smoothly, please ensure to increase the java heap memory of MATLAB, as demonstrated at the start of the live script.

The [Live Script](https://github.com/debaditya-unimelb/real-time-car-parking-occupancy/blob/master/CNNSVMTutorial.mlx) is pre-compiled MATLAB file containing all the results, and all the supporting data files (including pre-trained ResNet50) is present in [Figshare](https://melbourne.figshare.com/articles/dataset/MATLABCodeCNNSVM_zip/12978932).

# Watch the demo

[![Watch the video](https://img.youtube.com/vi/Ft94ypd4HxE/maxresdefault.jpg)](https://youtu.be/Ft94ypd4HxE)

# Pipeline

[![Watch the video](https://github.com/debaditya-unimelb/real-time-car-parking-occupancy/blob/master/pipeline.png)](https://github.com/debaditya-unimelb/real-time-car-parking-occupancy/blob/master/pipeline.png)

The detailed document explaining all the steps are present [here]().

[![Watch the video](https://github.com/debaditya-unimelb/real-time-car-parking-occupancy/blob/master/benchmarks.png)](https://github.com/debaditya-unimelb/real-time-car-parking-occupancy/blob/master/benchmarks.png)

# Access the tutorial PDF
<p align="center">
  <img src="https://github.com/debaditya-unimelb/real-time-car-parking-occupancy/blob/master/TutorialThumbnail.png">
</p>

[![Watch the video](https://github.com/debaditya-unimelb/real-time-car-parking-occupancy/blob/master/TutorialThumbnail.png)](https://github.com/debaditya-unimelb/real-time-car-parking-occupancy/blob/master/CNNSVMTutorial.pdf)

Please cite our work if you use any part of the code:
```
Acharya, D., Yan, W., Khoshelham, K., 2018. Real-time image-based parking occupancy detection using deep learning.
In: Proceedings of the 5th Annual Conference of Research@Locate, Adelaide, Australia, CEUR Workshop Proceedings, 
vol. 2087, pp. 33–40. 

```
```
@inproceedings{Deb:acharya2018real,
	title={Real-time image-based parking occupancy detection using deep learning},
	author={Acharya, Debaditya and Yan, Weilin and Khoshelham, Kourosh},
	booktitle={Proceedings of the 5th Annual Conference of Research@Locate}, 
	year={2018},
	month = {April},
	pages={33-40},
	volume={2087}
}
```
